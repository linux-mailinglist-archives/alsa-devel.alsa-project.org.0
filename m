Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D87A893A36
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B4A22A7;
	Mon,  1 Apr 2024 12:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B4A22A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711967896;
	bh=zFFFQb0GqIZX0p/sMtvpVmZPnaFnM6q+P0ZbovJZSDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QajZQnYC3vafFHzdWLcIlHDtVY7yNaoIYE3VXSa5quRev/1jOSmpi0LIgWk2tL/fa
	 KTFPieZTZxtQSFo8Iy6Sb8NgRBUDxzLVvWQtIgx3/BDArjnm8eRFZiMOtktigXpdvg
	 qhPYMELlGoUWgIwcWYoar8h/TnyOsgR9o3cTHPWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4529F8057C; Mon,  1 Apr 2024 12:37:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA17F8058C;
	Mon,  1 Apr 2024 12:37:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF988F80236; Mon,  1 Apr 2024 12:37:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BDC3F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BDC3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=JmOJ/CDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nV6zFPLctSIHG0c/OI8tpnbT8EqffHyAMwwGgA334s4=; b=JmOJ/CDt0ijphq3BcXYwUyNN/5
	NVkCatgnfLiX3UJry5CRx8yqOvtYGuDdRM44Sk6NPCYcjmDJkeQ4Ky3vAmWimNSmQKtMKUHRfw9Z5
	bCVuljyYWBBrKFoe9R/gqB8QdwfBmSf67l/tWTSdG5LGXjtULe7v9JURO4KsVbJTKoTWT5mbCZZih
	5oD0kQa8KPAA/wKSWrOkkN6ZZx9nxl3yBI/1knXnOezewkId2VO1RPSXDL76nFlKyHcQWA+hUqH8G
	61EzgvdY/R0gwAQPrO/xWbzj9LSCpudD4kOFO9TIW2MmNEdYUMzhBHszzTU16N8JvI01BRs94ivgn
	z9uToQ/A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrF2d-0004qA-1G;
	Mon, 01 Apr 2024 11:37:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrF2d-0005Vv-LN; Mon, 01 Apr 2024 11:37:27 +0100
Date: Mon, 1 Apr 2024 11:37:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Message-ID-Hash: 5RLHNNZ6BOPWSW3TH7JJMIGUFJFOHPPI
X-Message-ID-Hash: 5RLHNNZ6BOPWSW3TH7JJMIGUFJFOHPPI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RLHNNZ6BOPWSW3TH7JJMIGUFJFOHPPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 11:31:50AM +0100, Russell King (Oracle) wrote:
> On Mon, Apr 01, 2024 at 12:13:39PM +0200, Oswald Buddenhagen wrote:
> > We already have frames, so don't convert them to bytes - the mid-layer
> > would convert them to frames again anyway.
> ...
> > -	/*
> > -	 * ALSA wants the byte-size of the FIFOs.  As we only support
> > -	 * 16-bit samples, this is twice the FIFO depth irrespective
> > -	 * of whether it's in compact mode or not.
> > -	 */
> > -	runtime->hw.fifo_size = aaci->fifo_depth * 2;
> > +	runtime->hw.fifo_size = aaci->fifo_depth;
> 
> When did ALSA change to wanting frames in "fifo_size" rather than bytes?

In fact, I think your patch is wrong. See snd_pcm_lib_ioctl_fifo_size().

runtime->hw.fifo_size is only measured in _frames_ if
SNDRV_PCM_INFO_FIFO_IN_FRAMES is set. AACI doesn't set this flag,
so runtime->hw.fifo_size is in bytes.

So now I have to ask what caused you to generate this patch. I don't
think you've actually run this driver, so presumably it's by flawed
code inspection... if so, and if you've made changes similar to this
to other drivers, that probably means that those changes are also
wrong.

Also, I have to wonder whether this patch is an April Fools joke.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
