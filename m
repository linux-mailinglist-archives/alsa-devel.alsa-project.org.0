Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC369F052
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A38E9F;
	Wed, 22 Feb 2023 09:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A38E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054899;
	bh=Ftm253v4TmPIRxgPW+wWmN17ppsRqHxRzTnYUw6VAP4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EjX5X6yTgqcZdxrIdJBp7e80ZgiZj4zjRW8CoAcpNAMQajqqD3vmdTcpB2CEu+wOe
	 Y5fI2X5H0HDJ4eEnGW797tkNd//jcjg0/4jrJlEemCvE1wXUJEsSU/54ka8ofmopGI
	 t83yYszv3s93YI2eYvKNHgstSHX+f811viVAuBTU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B61BFF804B0;
	Wed, 22 Feb 2023 09:33:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B88EF802DB; Wed, 22 Feb 2023 09:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5F7DF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5F7DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DvlQdk8H
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C5F7424000C;
	Wed, 22 Feb 2023 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677054787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDE/BWKPpbi7naSnpEy52iXA2Q0Af4JEQcVomPlwwZU=;
	b=DvlQdk8HPLbfmm9jbmwikEJa9eR7qqMPpXNbN0XO3XcCLwq/00ZetbU/VRqz3Nb439t4C1
	EVIBrhHy0eq1A86VHhSue/9hYp41qxASWyjQMH03r0au3metRF+xMJ5OGDD7sHq2s5yRFI
	02KpsCng/uwcD+QfOBUB0AVZTcjGjZDZ2YSVWZVMpUTXE473cxr2AsbVPEIqtlpDEZsXR3
	aUW+kMr7QWyizEDsPTPl2D3kGk6rgdioBmXPXw9VjZtBReTSOWZz7Of4rfO/aFpIuq/x2f
	G2QZ83aAfmHI/yjNszl/SK1rnAWrziasT3JTlNm4ZyEYi2fOMlDNGrJEvjx3TA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Cernekee <cernekee@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Crt Mori <cmo@melexis.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: tas571x: add tas5733 compatible
Date: Wed, 22 Feb 2023 09:32:59 +0100
Message-Id: <20230222083300.218523-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
References: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: THWMZM4CMNX2C33DQIDCABT2EOVM55NI
X-Message-ID-Hash: THWMZM4CMNX2C33DQIDCABT2EOVM55NI
X-MailFrom: kamel.bouhara@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kamel Bouhara <kamel.bouhara@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THWMZM4CMNX2C33DQIDCABT2EOVM55NI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds the tas5733 to the TAS571X binding.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 Documentation/devicetree/bindings/sound/tas571x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/tas571x.txt b/Documentation/devicetree/bindings/sound/tas571x.txt
index 7c8fd37c2f9e..1addc75989d5 100644
--- a/Documentation/devicetree/bindings/sound/tas571x.txt
+++ b/Documentation/devicetree/bindings/sound/tas571x.txt
@@ -12,6 +12,7 @@ Required properties:
   - "ti,tas5717",
   - "ti,tas5719",
   - "ti,tas5721"
+  - "ti,tas5733"
 - reg: The I2C address of the device
 - #sound-dai-cells: must be equal to 0
 
-- 
2.35.1

