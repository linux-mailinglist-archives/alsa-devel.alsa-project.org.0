Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36144987A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:34:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72777168C;
	Mon,  8 Nov 2021 16:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72777168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385640;
	bh=CyK50g40MDcTmqVSAT2lbzqT9Pks9maBuVBTSzuZfZ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JB3sgMHAHhIHlJR2sw7mcVHBEGkwRePVeujL+vyUbMrAVIIAZyIJFPj0h0jB7vMCN
	 rW8P4E9daYtgjIRcXZFnguKX6OaD9qWuw0Sv9ZybADYKrd+KVVQsfrATiI7ZpC/gdF
	 9YIbmXf62X7sb8PMDQiZ1w9j9jAPKZ6dr8hlAxiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2768BF80517;
	Mon,  8 Nov 2021 16:30:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0153F804B1; Mon,  8 Nov 2021 15:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EFF9F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 15:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EFF9F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="DvalVyPW"
Received: from zn.tnic (p200300ec2f33110093973d8dfcf40fd9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:9397:3d8d:fcf4:fd9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D08561EC04E4;
 Mon,  8 Nov 2021 15:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636381269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=oWsCJGhsvF17zUFafKKKz1XGvPrCUoTgLb0x72qzY0w=;
 b=DvalVyPWlBMIVGIell7SDhnTX9Q86iHxoTdmXzPxorrW7sqlHpzQzwtFgZEI1KmHXq30Gs
 yOE/y0FWs3djKZaj7cQDtIyWYYD5AKtdhjFE5l3EWLo8DNcP+YE1HL9C5d3kHwZrzRPHP8
 xiS/nYCk2AFbtbv/wLq5RqiIdGlMN38=
Date: Mon, 8 Nov 2021 15:21:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Message-ID: <YYkyUEqcsOwQMb1S@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:18 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Mon, Nov 08, 2021 at 03:07:03PM +0100, Geert Uytterhoeven wrote:
> I think the addition of __must_check is overkill, leading to the
> addition of useless error checks and message printing.

See the WARN in notifier_chain_register() - it will already do "message
printing".

> Many callers call this where it cannot fail, and where nothing can
> be done in the very unlikely event that the call would ever start to
> fail.

This is an attempt to remove this WARN() hack in
notifier_chain_register() and have the function return a proper error
value instead of this "Currently always returns zero." which is bad
design.

Some of the registration functions around the tree check that retval and
some don't. So if "it cannot fail" those registration either should not
return a value or callers should check that return value - what we have
now doesn't make a whole lot of sense.

Oh, and then fixing this should avoid stuff like:

+	if (notifier_registered == false) {
+		mce_register_decode_chain(&amdgpu_bad_page_nb);
+		notifier_registered = true;
+	}

from propagating in the code.

The other idea I have is to add another indirection in
notifier_chain_register() which will check the *proper* return value of
a lower level __notifier_chain_register() and then issue that warning.
That would definitely avoid touch so many call sites.

Bottom line is: what we have now needs cleaning up.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
