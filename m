Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8267FE05A6
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 15:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C191166B;
	Tue, 22 Oct 2019 15:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C191166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571752750;
	bh=6KYD/TEPQhN9v+Ui9EW9Dzqi2yqsUZvAxPFOpcb8pG0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jP0t3/y+pR+m47XP7yse+U7sJezDT6H+4KcoR4JQbCFEuKjZsbVs/rRQO/ID6yvYS
	 Qt+45dv6+Efwb0asLJPk9S1IcELUdhYmiOzYJVPR91/C/N9cXYW1vraHvTCoUw8nTx
	 f4RMiblbKOvXhR+UP1hhOeBOFQL/w0o8SD4PvJ6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA18F80112;
	Tue, 22 Oct 2019 15:57:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE6DF8031A; Tue, 22 Oct 2019 15:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B8B9F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 15:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8B9F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="P2X5ueKh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaVWeAv+qriIIqzhQUq7bEGrENM96irBmsdvMfhEllA=; b=P2X5ueKh84wV/oLYo6iW4Mm9T
 2ceOfVnNz3UooqpTS5IUk6v+u+/WF9xDKOdiN2Xq1jH+FAcrYP1PSRuyi908CC21ags9BmjGLYBMe
 CNcnJVhgzKXEaOdfuUOax/eOcjGEre1qbuD/I3z7LhNynyisdmRzDwsdxrkOJuTbF8fUgXlB921Y4
 21Pg8CAmmz3HeV3o0oFb5V34uDYYd0EqITkrv/FCDFh9G4WImSWO4owyrdDsi2erP53EZQEEDIZIg
 MbavVhsi3N7uyF8ry6oQigrr5boLDVkcTnFgsJjz7msFJ4rinZJBBW1T7cOM3g9npro+S48OFBY5D
 ndmWsUQUA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:46004)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iMuen-0007bQ-Tx; Tue, 22 Oct 2019 14:57:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iMuel-0004ck-0d; Tue, 22 Oct 2019 14:57:03 +0100
Date: Tue, 22 Oct 2019 14:57:02 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
Message-ID: <20191022135702.GU25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [REGRESSION 5.3] WARNING: pulseaudio/1297 still has
	locks held!
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When upgrading from 5.2 to 5.3, I now encounter this error after boot:

====================================
WARNING: pulseaudio/1297 still has locks held!
5.3.0+ #1826 Not tainted
------------------------------------
1 lock held by pulseaudio/1297:
 #0: ee815308 (&hcp->lock){....}, at: hdmi_codec_startup+0x20/0x130

stack backtrace:
CPU: 0 PID: 1297 Comm: pulseaudio Not tainted 5.3.0+ #1826
Hardware name: Marvell Dove (Cubox)
[<c0017b4c>] (unwind_backtrace) from [<c0014d10>] (show_stack+0x10/0x14)
[<c0014d10>] (show_stack) from [<c00a2d18>] (futex_wait_queue_me+0x13c/0x19c)
[<c00a2d18>] (futex_wait_queue_me) from [<c00a3630>] (futex_wait+0x184/0x24c)
[<c00a3630>] (futex_wait) from [<c00a5e1c>] (do_futex+0x334/0x598)
[<c00a5e1c>] (do_futex) from [<c00a62e8>] (sys_futex_time32+0x118/0x180)
[<c00a62e8>] (sys_futex_time32) from [<c0009000>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xebd31fa8 to 0xebd31ff0)
1fa0:                   00000000 ffffffff 000c8748 00000189 00000001 00000000
1fc0: 00000000 ffffffff 00000000 000000f0 00000000 00000000 00000000 00056200
1fe0: 000000f0 beac03a8 b6d6c835 b6d6f456

This seems to be caused by:

  eb1ecadb7f67 ("ASoC: hdmi-codec: re-introduce mutex locking")

which holds a mutex and returns to userspace.  Meanwhile, userspace
issues a futex operation, which ends up in futex_wait_queue_me().

futex_wait_queue_me() can wait, and if the system will be hibernating,
is a potential hibernation point.  One of the requirements there is
that no locks shall be held, and the freezer code verifies that by
calling debug_check_no_locks_held().  With lockdep enabled, it reveals
that hdmi-codec is indeed holding a lock.

Reverting this commit solves the problem.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
