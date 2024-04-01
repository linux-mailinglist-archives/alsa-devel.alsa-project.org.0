Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA7893B7D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 15:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A9E2341;
	Mon,  1 Apr 2024 15:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A9E2341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711978508;
	bh=iMrnXvgaqzI5D0/GaINBhNhu8lFIB1u6HBGtSiIJSvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E8rMIy1xFfcc4HM7QNjoN3Xl0ie+z7bgaYQSVie8nhrGlmdkzKus++iw1idLqz4zl
	 JVa7uDAe95V2BH2NtQSIJxfyh5xQFaCp8mH27MMEGo9w3asWNdEFMVmS3CPJE8BPZg
	 +EDPQaZyjmoXQnM1xYibWVTFnhA6yYv+p6BRR4GQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 952D2F805A9; Mon,  1 Apr 2024 15:34:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CA0F80571;
	Mon,  1 Apr 2024 15:34:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45440F80236; Mon,  1 Apr 2024 15:34:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 44782F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 15:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44782F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=Rjp2ahkF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HOi7gshUqta8lbN5LibSFEFebTxSABDwNnm92emy0hQ=; b=Rjp2ahkF0ZHPRNdGXq45rAalFR
	ZlZ+gAmAtlt4iG6wnmt6nZMobNWNeKv0yxyuAn9O2nCPJs7mbQ1uwvdg3kXvv8MlkRK2JKdx+6K0z
	3l2yn5Isspz+BY4Q3t8UVWrRgM0+XxJCm733JUQpAJQo3FipXGYKLYFkUkhAOEpMMqvY+JJk5EUAp
	AkxdnDqfWYQmmApqLKsUN7wLrrNwwatA91TRovjgfeZwxBupR40qCzJnQclYFguf55Zus4CdZQbdd
	9N+QcJJaphy0OxxeQHIg6ZZfYePpQjS9omYzBA/nxTfVfkzMRs+mi5nAh74rMvgL/0BLZJ56ttoyQ
	AkH1vdQQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39766)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrHno-0004yQ-2W;
	Mon, 01 Apr 2024 14:34:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrHno-0005cD-53; Mon, 01 Apr 2024 14:34:20 +0100
Date: Mon, 1 Apr 2024 14:34:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
 <ZgqeV4M8DGpl6KHJ@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgqeV4M8DGpl6KHJ@ugly>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Message-ID-Hash: 27V5VJKPZH3XNMSAZ5OJU6CXASSVVX3J
X-Message-ID-Hash: 27V5VJKPZH3XNMSAZ5OJU6CXASSVVX3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27V5VJKPZH3XNMSAZ5OJU6CXASSVVX3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 01:45:27PM +0200, Oswald Buddenhagen wrote:
> On Mon, Apr 01, 2024 at 12:04:51PM +0100, Russell King (Oracle) wrote:
> > I think where the confusion comes from is that fifo_depth is the
> > depth of the hardware FIFO in units of 16-bit quantities, [...]
> > 
> ... irrespective of mono/stereo?
> well, with that explanation it makes sense.
> i recommend that you adjust the comment to make it more helpful/less
> misleading. maybe something like "We configure ALSA to expect the FIFO
> size in bytes. This works best for us, because [...]".

Oh FFS. So you generated a patch based on the contents of a mere
comment? That is NOT how kernel development should be done. Do not do
this.

Comments are not always correct. I guess you don't even have the
hardware, which makes your approach to "kernel development" even more
absurd.

NAK to this patch. NAK to *all* your patches whether I've seen them or
not if this is how you behave.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
