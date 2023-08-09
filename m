Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E5776C84
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 01:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8D0826;
	Thu, 10 Aug 2023 00:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8D0826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691622014;
	bh=oDiTi6Ux48qR/tQiXben60Nl/MxqBdDbSXTpSnZ8eNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndeueLZZz/CYZWzccOEra0HfjwoAeifySyni4JathM8lAk1y+Y1xME70TVfg391xH
	 Qkd7dARNi+KtsJ8wuWd6CaxNXMuhHOYn0O0HE4J8kMtViurLLaN4rg6IDXEAfx8JM0
	 QQZFuk8VXyn48TBT4qxKxyNhGiFsG/mbnNsSpyZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5985DF80508; Thu, 10 Aug 2023 00:59:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 054F9F80166;
	Thu, 10 Aug 2023 00:59:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BE6F8016E; Thu, 10 Aug 2023 00:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF9C3F800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 00:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF9C3F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=QNJIJLzY;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Wy2ksYs9
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 400055C0180;
	Wed,  9 Aug 2023 18:57:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 09 Aug 2023 18:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1691621848; x=
	1691708248; bh=/etXy+uTZdCkSrEEuEChQJn/K8kkZi+ukVdV5Tn53Eg=; b=Q
	NJIJLzYdWwMroycYGIGPTp5VdemRJI/V59Lzn25i8ScwKcaQJL7b3pNtQy5cHbt1
	n26XLeKGx0S8N/xI0Pg5rVv0BFjRUfVIVKCvVU1/PZjlj16aAiZ1+xEoE0EAZyaf
	cUJKjC9cRxA4Z92ZEaZXwAuLcIKy/3fxrqnXo/mv7yAy4ZB/RirvY2PMdtrEkdXp
	bHe0xNVp08qdSV1ldli2pkMepd8YSU0lSHV9O7w8rgEMjPl7QyC69/QTHbKWUCwk
	yxcwxHmAL4D2AgBCgHJWBIs9QowAH6xDNXTYr8wsDKMcM5FcNeXA9J01W77RdZvY
	CjGpjVqzzygcecYZ+NLmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691621848; x=1691708248; bh=/etXy+uTZdCkS
	rEEuEChQJn/K8kkZi+ukVdV5Tn53Eg=; b=Wy2ksYs9JAmDbZwyzCoMZ7b33IFpy
	HfjCXQvcuNPaDHXnfmFpk8XIp9/Po3BtWdn0qpa5P0qalA1VeyQ4UjblLYt7mJdy
	7SN0mJFuFEBDHhfT6LsNPXYVQxEJcPwfolZ0+bCbgOlpyGjZ64pFj6P/4KulFRLl
	INLEBgJS/wMA5dmLfdpBqnus4mh28+ua74XeZxSP3v5yhEafke5GW9DbKJKrNplg
	sLFtYNTV6cu1xXftXEg9e8RMYGd2I3aBp+jXBVij8RdQf7D3kslEfqpu4ZVOrxla
	DTYwuSXelYhPlBafH8Y5WW3LE/cnTXrIMXEvvRXGSaotKGE86V5Td3fQA==
X-ME-Sender: <xms:1xnUZNVz_RuPViiShb5EBwu6YxQEfKJIace_ic3sbXt5ReDlW-Ie5A>
    <xme:1xnUZNnLTWekmL7VziQeAlEA594I_qJOKghHYkAZydTRkC6awXZ8uZK_gp1XJ2GW5
    QEkLYuixn5lBO77wXY>
X-ME-Received: 
 <xmr:1xnUZJYZsfI7qMeJQUHOCLjygBrcJBedF2mv482_tOfeGLnFFu5if7WUgXc3LaVIEcDlMfmCt4btN5FxmOPn_SIlFab-jUdpF0c>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrleehgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:1xnUZAUVkGG-4REPn4jRCf6Zq_Vw2P28mWF6GBKfUgAjIN_qpiPnVw>
    <xmx:1xnUZHk1G_A3htpoWmWohrLeZER2J6qGGe4Wi-H3E_EgFTIEzBA_Xw>
    <xmx:1xnUZNcWE2jBNns0sedOf1uY4XLbomAWEEu0luts6l_C95iGcNYW3w>
    <xmx:2BnUZMwYAHiO40EJ9PpoWBZoJOxxvpRiSyKK7vGvzE3uPcBQSCcy0A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Aug 2023 18:57:26 -0400 (EDT)
Date: Thu, 10 Aug 2023 07:57:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230809225722.GA895382@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
References: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
 <87msz0e2jv.wl-tiwai@suse.de>
 <20230809141854.GA892647@workstation.local>
 <87bkfge0uc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkfge0uc.wl-tiwai@suse.de>
Message-ID-Hash: XLUM63SIQ3KDYYZYNWR5TFB2M2QNP3L5
X-Message-ID-Hash: XLUM63SIQ3KDYYZYNWR5TFB2M2QNP3L5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLUM63SIQ3KDYYZYNWR5TFB2M2QNP3L5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 09, 2023 at 04:39:55PM +0200, Takashi Iwai wrote:
> On Wed, 09 Aug 2023 16:18:54 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Wed, Aug 09, 2023 at 04:03:00PM +0200, Takashi Iwai wrote:
> > > On Wed, 09 Aug 2023 02:26:31 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > This patch is for kernel prepatch v6.5.
> > > 
> > > Why it must be included in 6.5?  This sounds more like a new
> > > implementation, rather than an urgent but fix that is needed for rc.
> > 
> > Thanks for your notice to the patch. Indeed, it is neither urgent nor
> > bug fix. It is a kind of 'adding support for new device with slight
> > change', like adding new entries in mod device table. The overall change
> > and new lines are quite typical in ALSA dice driver, like TC Electronic
> > devices in 'sound/firewire/dice/dice-tcelectronic.c'. Things are
> > prepared and not brand-new.
> > 
> > Precisely, current ALSA dice driver supports the Weiss models already,
> > while the functionality is limited that the part of sampling transfer
> > frequencies are available as the initial author said (e.g. when 44.1/48.0
> > kHz are available, 88.2/96.0 kHz are not, vise versa). The patch extends
> > the functionality by hard-coding stream formats following to the design
> > of ALSA dice driver.
> > 
> > Of cource, I don't mind postponing the patch to v6.6 kernel, but in my
> > point of view, it is worth to v6.5 since users got benefits from the
> > code which is not so novel.
> 
> OK, then I'd rather put it to 6.6.
> If it were for rc2, I could take it.  But it's already in a second
> half turn, and I'd rather like to limit the changes for later rcs.

It sounds reasonable. So should I post the patch on your for-next branch?


Thanks

Takashi Sakamoto
