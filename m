Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C78FF700968
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 15:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11701FE;
	Fri, 12 May 2023 15:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11701FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683899152;
	bh=Xqxbgh+Vub0UE9eyQphC4+CKNJTooJBc+p6679TMRlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J6AxmxQAnZ9T5fF1TmN2PrS39EBPvxTQVGHCf3mVgIy9sAkxyLu2m9AuaXGyHBtZC
	 aO0L1rCUwJtpzVmbmhnnGz7NjKFo/WcfrQiTqd1H7nEK49IcJpp/eY4FgC26E0/P3l
	 u/9ierb/6cVvIJROSobVTKaY9f4S4wcgcuWNB9O8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EACAF80544; Fri, 12 May 2023 15:44:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 214CCF8032D;
	Fri, 12 May 2023 15:44:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E566DF8052E; Fri, 12 May 2023 15:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D6CEF802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 15:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D6CEF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Ma07HyZ/;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Bdu5TsTJ
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 58C605C02CC;
	Fri, 12 May 2023 09:44:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 12 May 2023 09:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1683899060; x=
	1683985460; bh=qkFj2mVhoUMnv8Ir3jUAh/NYj5vyzTkP0+jLwf8Mh4Q=; b=M
	a07HyZ/Nb0GoAjn9/d6NJcOLBLFJoiKfFm3zDCXXcirNfWnVk0zVaSBPu0J1pg2y
	ZvLGFQIp8LygLEaKTctgC3xpiik25e769SZ0vsYwk1jomF2ii09B7cb3rGWz2xgf
	MRptWwo6d0gbRRTlOV46LbJU13I6dFGzf91z9tLIpbxLboqfheqHYBobkYs1rqGv
	d8OJjhwPVByrF9iTr38pEWtJ3IAXXW58KCgzpDjbRPhRV/eW6JLPUYTOMZXsrxsl
	KGW7Q6TrLAv93Rk06e3Rh0KcsJEmJpT4uzOwBMtyT53fqv70/HskI5QEvu5iwdOn
	eYbjzPfW71rsNX9fnrjBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1683899060; x=1683985460; bh=qkFj2mVhoUMnv
	8Ir3jUAh/NYj5vyzTkP0+jLwf8Mh4Q=; b=Bdu5TsTJabJXzIL1PBPnVgZ49G2ew
	MrPFULoq91h821wUTDbY/A+APYZHivmEgDHovR+n03yTvoR0mJHRcBUqRuPJj7QD
	clbaNOK/ihBHUGjeoylm/W0y+xUIkqqF9sM1tIi9nhixTya0c+GQPSOjNPKWeX9G
	wd/4MgErX7McTyQQgryN3JILN9yDpFw2/hGfXcgzTZ576erw2LLvaAeKit6RMxHe
	sPhHDj82//n9GiDbfRJcmyL5s/rsxc5v5YWXQitlxryd2CsKTgs0/1surzLK8Fd5
	9fCEYOjCxXkHsh96AKIhnsIE9HnseSDz9thQqjf4+/inC1wjBTtFmb5xA==
X-ME-Sender: <xms:s0JeZB5-Gs6ZmMUnzpWGo6LCzMDydA9yo4KwQynYf4d6-TUFsWAaNA>
    <xme:s0JeZO7CNB42R-CbXE1zkWFX6v0pzTuwP1nRyxMof3pFDs8CYsd4qRFsyahW1qCd4
    NuGJVq2KUwSPDcBlwY>
X-ME-Received: 
 <xmr:s0JeZIcrYVIrOGemRvix3Yjq674UEOIi6oyPF8SSgV_78D6gRAliiHM7w2OT4QhylivukiMCIYlzFEfMhu9j8SlQzik>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeehtddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:s0JeZKI-0tc6Plxurzt3Y8xXFEGH3Nwbt2RQKRrrO_1Kp1uKNxKKMg>
    <xmx:s0JeZFL7ZT7XJ3hBL50hbUFGNqqRNL7rCzCKdCrjbLlyfNFOhDlnUw>
    <xmx:s0JeZDxKtn0m7RaM7caKPLNgbIkTG_uPs7ypZELvL9DWcFFkoorVvg>
    <xmx:tEJeZDgOKT9lFQuc7JgaBUirlB5bpF_t0KUhbMiHiojzDduScBNvSA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 09:44:17 -0400 (EDT)
Date: Fri, 12 May 2023 22:44:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
Message-ID: <20230512134414.GA913159@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
 <873542aro1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873542aro1.wl-tiwai@suse.de>
Message-ID-Hash: FQXTT4EWEKR6P7LQIAUP65KFMWM4ZZBB
X-Message-ID-Hash: FQXTT4EWEKR6P7LQIAUP65KFMWM4ZZBB
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQXTT4EWEKR6P7LQIAUP65KFMWM4ZZBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, May 12, 2023 at 10:18:54AM +0200, Takashi Iwai wrote:
> On Tue, 09 May 2023 11:07:11 +0200,
> Dan Carpenter wrote:
> > 
> > This code was supposed to return an error code if init_stream()
> > failed, but it instead freed dg00x->rx_stream and returned success.
> > This potentially leads to a use after free.
> > 
> > Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks, applied now.

I overlooked the patch. It looks good to me as well.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
