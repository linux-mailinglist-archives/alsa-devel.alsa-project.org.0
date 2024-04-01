Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131D893A30
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D9122A9;
	Mon,  1 Apr 2024 12:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D9122A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711967560;
	bh=jGijS/JBJy/Sa44mTYpm6nm5jqpTXWTjeIlgigpBYvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TXW+b60WDLXTTK1fZUQXXUns1OeFzCSVmUmSPTA515smh+sz2xK6ev4d9ywTGT3E0
	 H2jJ2WzZ7a46XoVtsWxGPmFiHhgo2RAbooqeYz1WJknan8rE4HJAEPsRBNUGQMGPJt
	 07bDidiIW39o1y8VPCgjRoomhdRUB4MCIlENIW3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BEAEF805AD; Mon,  1 Apr 2024 12:32:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A9B6F805A8;
	Mon,  1 Apr 2024 12:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F277F80236; Mon,  1 Apr 2024 12:32:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE83CF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE83CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=CR1ELQT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tMtugUVjoCf0uKYGacfjHKbLpR+8fn1gKQSp2XV3nUc=; b=CR1ELQT3+2m90LK9VKC77igCyC
	Y8OPHbbrnrblO3eg+juESKwi7/4XoF5lRmTGPtd1Ub/it9D/D9rVHU1bQeWErJbjA4xK/6Iw17SP7
	u95XQbmwIEwlrNCm4/iXxR6kv+l2WA8QTvrcQoUu41v91PxV30+lFvN1ZJSl2hrLrcgBAaUaCcVmt
	uf4pOdj5TXLp8afxKs9sniMUajXD3wGTixBPCUB6wanqSBwrOz2ulAxbb2v2h9ksNhA+qp47ttljS
	YQXhNshDsV8b8vsBAKiLQtE4fOxK/LN36s2wZ9F072twny4V2PjuS7h8r/rpTDaJKzqZnYg2jc/A7
	VFltjFmQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48210)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrExC-0004ps-2b;
	Mon, 01 Apr 2024 11:31:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrExC-0005Vk-8B; Mon, 01 Apr 2024 11:31:50 +0100
Date: Mon, 1 Apr 2024 11:31:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Message-ID-Hash: V4CQWPJUEEK5SQTZJSLFZ3RSQWD7FZJC
X-Message-ID-Hash: V4CQWPJUEEK5SQTZJSLFZ3RSQWD7FZJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4CQWPJUEEK5SQTZJSLFZ3RSQWD7FZJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 12:13:39PM +0200, Oswald Buddenhagen wrote:
> We already have frames, so don't convert them to bytes - the mid-layer
> would convert them to frames again anyway.
...
> -	/*
> -	 * ALSA wants the byte-size of the FIFOs.  As we only support
> -	 * 16-bit samples, this is twice the FIFO depth irrespective
> -	 * of whether it's in compact mode or not.
> -	 */
> -	runtime->hw.fifo_size = aaci->fifo_depth * 2;
> +	runtime->hw.fifo_size = aaci->fifo_depth;

When did ALSA change to wanting frames in "fifo_size" rather than bytes?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
