Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C5B1FDC1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Aug 2025 04:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C12601F9;
	Mon, 11 Aug 2025 04:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C12601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754879088;
	bh=1uxyidhdfJ+bIsWil/noGUPH2CFS5GISLdngkglzveg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FkLEYjvyJNe2rK0GqZrFWrb1Ch7lH7bcSI6VtOQhyXmBcfUIjYP2LuA121xauqSC9
	 FS8p3Ebc82eula80kTrSyUy1dNkBiCWkGNe5JzFz3xFUrxSp4Kz5IQioU2TqajMzr6
	 8AAY6rqKZbyd3+oj3DxnMAP5TA8+OO6J/2S4RoXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9686AF805BF; Mon, 11 Aug 2025 04:24:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDF8F805BF;
	Mon, 11 Aug 2025 04:24:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 926FBF80518; Mon, 11 Aug 2025 04:24:06 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FDE1F8010B
	for <alsa-devel@alsa-project.org>; Mon, 11 Aug 2025 04:24:06 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [alsa-devel] Applied "ASoC: tlv320aic32x4: Model CODEC_CLKIN in
 CCF" to
 the asoc tree
From: rinfo4080@gmail.com
To: alsa-devel@alsa-project.org
Date: Mon, 11 Aug 2025 02:24:06 -0000
Message-ID: <175487904645.22.8008274890369284321@mailman-web.alsa-project.org>
In-Reply-To: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
References: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: GY2Z4RZKACVC4TZLLWNSHLLPOOQE33VC
X-Message-ID-Hash: GY2Z4RZKACVC4TZLLWNSHLLPOOQE33VC
X-MailFrom: rinfo4080@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GY2Z4RZKACVC4TZLLWNSHLLPOOQE33VC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If you want to turn text or images into videos fast, <a href="https://veo3.im/">Veo3 Video</a>  is the way to go — super simple and really powerful. Perfect for anyone looking to create videos in minutes

https://veo3.im/
