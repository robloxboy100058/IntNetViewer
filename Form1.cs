﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IntNetViewer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            webBrowser1.GoBack();
            ;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            webBrowser1.GoForward();
            ;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            webBrowser1.Refresh();
            ;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string WebPage = textBox1.Text.Trim();
            webBrowser1.Navigate(WebPage);
            ;
        }
    }
}
