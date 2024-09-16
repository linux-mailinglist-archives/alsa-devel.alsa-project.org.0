Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2C979C01
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 09:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81AF1EB1;
	Mon, 16 Sep 2024 09:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81AF1EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726471527;
	bh=47xPVJrzm6Sz8Ky0GorJhQI2r9rwb/mpjHTKV1Qxpjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K/N0SXgNNqR72xCfRn3GGGGGKD6ZV+TStR/5sXfbVX57Q4wP4NB0AHqJlDamrP9mr
	 tqcHKCENhPBJb8LANVLJ6FvYAp6l6X3KVkWVNjxQQK6IRqSRhd4Ey8XT7leEh2G+LG
	 QKu91AUIJVuCXfIOcuwLaJkD+J77VtrNuhiGwnB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BABBF805BD; Mon, 16 Sep 2024 09:24:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BE4F80236;
	Mon, 16 Sep 2024 09:24:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62E05F8020D; Mon, 16 Sep 2024 09:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F0A4F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 09:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0A4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pn9FC1x6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=htINtMKW1HHHTz6jXf4cYaZiT3xsT/nN0J8Q13owBXQ=; b=Pn9FC1x6nnL0y9Cn7Z9N7H7ytU
	cnlXuztesp1Ehje2r9n2mP9UmGrD44lQT6tOQ5ADkWRaKwb8R6I7Tpqg887T3I6M3vWHX2gjKeLVr
	McgOkSWOVNM5zTI6182gNcaJM+eN5U60ysxN4vYhN5f3PPW8dnRw5KHtlOPllrR5ATMEtcKXXsiPw
	rmvmNKdTTSWRBPx/3MJtoWxl9S6n8T32ttqeufOQlPfRXQu85xrXE/oT5jQU4tj3N79sBYNkOEtZo
	FO/40oEM+s/FyGzhKQOq4mHmISg54wN862PYFIhB9dC6ZkjnvzA22QGKPt1pnf4CNL02uqk5DNzB0
	mK4aPqfg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux))
	id 1sq66E-00000003Iyc-1rAO;
	Mon, 16 Sep 2024 07:24:42 +0000
Date: Mon, 16 Sep 2024 00:24:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZufdOjFCdqQQX7tz@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <ZuK6xcmAE4sngFqk@infradead.org>
 <874j6g9ifp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j6g9ifp.wl-tiwai@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Message-ID-Hash: IK6YW6DPN2UNXYQFXX6KUNIKWSFR3OTT
X-Message-ID-Hash: IK6YW6DPN2UNXYQFXX6KUNIKWSFR3OTT
X-MailFrom: 
 BATV+500305f64adcbfb43b9e+7694+infradead.org+hch@bombadil.srs.infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK6YW6DPN2UNXYQFXX6KUNIKWSFR3OTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> Yes, all those are really ugly hacks and have been already removed for
> 6.12.  Let's hope everything works as expected with it.

The code currently in linux-next will not work as explained in my
previous mail, because it tries to side step the DMA API and abuses
get_dma_ops in an unsupported way.

