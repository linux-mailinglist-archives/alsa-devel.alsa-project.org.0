Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B794D90ACE5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 13:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D96E6850;
	Mon, 17 Jun 2024 13:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D96E6850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718623561;
	bh=bR581glQjXHkPYec71s/eVw3phdSHCmCBAwg1sk/pgo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EO+TjG7Ndd7nBtJ2LS/5wpa2YT1d7caJZY5KukW3eQYqv4KP1vJ++1LPqDeHZdKJ3
	 cwve4LsuoCtbK6ZmwTKkw3gloUAUThC84yVW1v7jcEMefAXCfxye4RP54axbPTAoUg
	 Em8hpqmKBRoHRCzYZ84GjLXkcgjl+lzdK/gaPKs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BCAEF805D5; Mon, 17 Jun 2024 13:25:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEBEF805AF;
	Mon, 17 Jun 2024 13:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 533CBF8023A; Mon, 17 Jun 2024 13:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EF79F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 13:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF79F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QDplKBFv
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72119C0006;
	Mon, 17 Jun 2024 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718623469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gZT0G+O5PtiEYzBiPzB63SOi74GXoYY4dJqIHMC1dc=;
	b=QDplKBFvkY9iblnw1quq8clsRo6aVhuUGZCvK2NwbhoGK7kJTmpNG233YDv2ZjkpjB7oQP
	RVXdFCg9oUfIgHWDvUNVPVBfV3Pk0m16WHdOxMxcEEj3CLRG+LuX762tDNiXx/+1JynIUs
	9ml8zTprshRig2qz20BGPR1z1EANG9lxk+0rWiW0Rg073svZTmqZRB4QdikeiRukfyV5Hz
	hz/o+adT2SNVWZ+fVDCC02kHRX8EhDYKBW9iRV33X1mCvOP++FSkqoSUJt89rtTXkqVNVU
	P0weiIw0T0ojzfMM7LOVLw911w2Tt2MBQNZD9mD5ERiCroniMsoiAClzdws/iA==
Date: Mon, 17 Jun 2024 13:24:27 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Support
 Opensource <support.opensource@diasemi.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: soc-dai.h: Constify DAI ops
 auto_selectable_formats
Message-ID: <20240617132427.6b4a1cb0@bootlin.com>
In-Reply-To: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
References: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZFTX5Q4PGOWCM3K7A6BTQSMOUHFT2XUD
X-Message-ID-Hash: ZFTX5Q4PGOWCM3K7A6BTQSMOUHFT2XUD
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFTX5Q4PGOWCM3K7A6BTQSMOUHFT2XUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Mon, 17 Jun 2024 11:21:51 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The core ASoC code does not modify contents of the
> 'auto_selectable_formats' array passed in 'struct snd_soc_dai_ops', so
> make it const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
