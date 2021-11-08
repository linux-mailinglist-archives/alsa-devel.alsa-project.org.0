Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6F44A71C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 07:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E362B1658;
	Tue,  9 Nov 2021 07:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E362B1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636441170;
	bh=xhuYX1YCA5ZLcobHqaWWFyygwIj2ek3/HSiOCNu1TsQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgunt+cfxMF+ak+g2Gi5lApJYcCqlKPQ0RDc35CLRok8C0/7myUAZeKFGNACLTTaS
	 G/NRG3s8w1TKUFUuvxjn2u21MtRXFI+6Hx91V8uKtZbO4jGEBkuDhnB6djiFXidqLE
	 JfE3DAHlBKhv+3+vOE9iZ1XXnUFHfLtDIDB7wi3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A99D9F804F2;
	Tue,  9 Nov 2021 07:57:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14CBF8049E; Mon,  8 Nov 2021 17:23:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2536F80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 17:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2536F80107
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E868D61284;
 Mon,  8 Nov 2021 16:23:14 +0000 (UTC)
Date: Mon, 8 Nov 2021 11:23:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <20211108112313.73d0727e@gandalf.local.home>
In-Reply-To: <YYk1xi3eJdMJdjHC@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic> <YYk1xi3eJdMJdjHC@zn.tnic>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 09 Nov 2021 07:57:02 +0100
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um@lists.infradead.org, rcu@vger.kernel.org, linux-fbdev@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 8 Nov 2021 15:35:50 +0100
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Nov 08, 2021 at 03:24:39PM +0100, Borislav Petkov wrote:
> > I guess I can add another indirection to notifier_chain_register() and
> > avoid touching all the call sites.  
> 
> IOW, something like this below.
> 
> This way I won't have to touch all the callsites and the registration
> routines would still return a proper value instead of returning 0
> unconditionally.

I prefer this method.

Question, how often does this warning trigger? Is it common to see in
development?

-- Steve
