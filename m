Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A153893A7E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 13:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E672A21DD;
	Mon,  1 Apr 2024 13:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E672A21DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711969536;
	bh=p2x6GIK8qFSLC0sx8PEamgceRrw8t+Kw1VAXqLgkdOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kt2MTX/6aTJGOsfjUz/DZHvm7j4PpK3iZSjlrMbnhS+UG+LsattQvjK3vmDPYpBBy
	 xq8tv3OMhHPW0WFOavwJW03mFSJPXDE+0zaVRttRpxmGCtQGUQcU1JSqCgmp9Cl5vD
	 MN6o+oY2YG8AKTe1Jhm8Xb5/NRpz130Vh6NSJ9sk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9559BF80571; Mon,  1 Apr 2024 13:05:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB6FF805A8;
	Mon,  1 Apr 2024 13:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68322F80236; Mon,  1 Apr 2024 13:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D93F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 13:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D93F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=gDzCOQ86
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vg0s/d04JLnUR+zmow+IWqG8FKOhPtid0sfML3eBCfc=; b=gDzCOQ868o8hFu1M/ykn7IOrj1
	Epmf4Rxv6UMH72NFqFsQgnMOwIsj6d+7tWZmbXhL1yiuQUKDXseWqwWHbsxa0mD97dKgCtlnzZrYB
	LlSAKO0uehY1HbD3OW0QxcmvDQww4PLVahEdVvBY2ZzgbiiXY7bQggoZA/aDnhRvL0sR19qTyHUOQ
	yyFl3bdz5+1flFTvBrK7jxf9yaYcZtKgt27C+qZnNCHAUTXxNvP9cGIYTXombxE9UL+nkpLeG8uxG
	CPMRgy1R3KhNH+PoLk2TIGgJDtOYzWlM/UWSQq3aYAcToeCL0Y1m6GautRuBKq9TKabrqqunfqp4P
	uoU4Toaw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44594)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrFT9-0004rM-2e;
	Mon, 01 Apr 2024 12:04:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrFT9-0005X0-Fh; Mon, 01 Apr 2024 12:04:51 +0100
Date: Mon, 1 Apr 2024 12:04:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgqSHq6obzwRDfXs@ugly>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Message-ID-Hash: E5LBHO7QWFU2KL2JBNHBBIG5UGIYXENJ
X-Message-ID-Hash: E5LBHO7QWFU2KL2JBNHBBIG5UGIYXENJ
X-MailFrom: linux+alsa-devel=alsa-project.org@armlinux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5LBHO7QWFU2KL2JBNHBBIG5UGIYXENJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 12:53:18PM +0200, Oswald Buddenhagen wrote:
> On Mon, Apr 01, 2024 at 11:37:27AM +0100, Russell King (Oracle) wrote:
> > runtime->hw.fifo_size is only measured in _frames_ if
> > SNDRV_PCM_INFO_FIFO_IN_FRAMES is set.
> > 
> yes, which is exactly why the other hunk in the patch sets it.
> 
> > So now I have to ask what caused you to generate this patch. I don't
> > think you've actually run this driver, so presumably it's by []
> > code inspection...
> > 
> yes, it was a random find while trying to make sense of this parameter.

The driver worked when I wrote it. The fifo_size contents was correct
when I wrote it. The choice for using bytes here and not setting
SNDRV_PCM_INFO_FIFO_IN_FRAMES means that ALSA correctly takes the
real FIFO size (which is in bytes) and correctly translates that
itself into frames.

I fail to see how this is any better - in fact, I think it's a lot
worse because, as you've pointed out, it doesn't deal with stereo.
In fact, it only supports 16-bit mono, whereas the driver supports
lots more than that.

I think where the confusion comes from is that fifo_depth is the
depth of the hardware FIFO in units of 16-bit quantities, which is
why we multiply by two to get to bytes. 16-bit quantities does not
necessarily equate to ALSA frames - it can be in specific cases but
not always.

As far as I'm concerned, the code is correct as it stands and your
patch will introduce regressions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
