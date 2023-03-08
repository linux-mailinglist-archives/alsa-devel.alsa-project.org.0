Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9A6B05BC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:21:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 266FA17E6;
	Wed,  8 Mar 2023 12:20:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 266FA17E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274495;
	bh=cbD6sP98BkvLpBv9f+MdHr1rhVT3Dt947QD92LRboQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pLnV8bWlfTh560g6wkhBPtGErSC5vM208cYJmO+hK72DPZC1F9iqevFGVf79U9Xck
	 k4SqABrMuhh4n0bu5aqKzm7QV1pVgiF/sJLAOupFblHJX2dLfIkMs4cIwTO/9HAz3w
	 RAcAo1STLlGXgIIH7n7LoeMYRyrP0e+Ll/HDQ0dQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7EA7F80527;
	Wed,  8 Mar 2023 12:19:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55344F80520; Wed,  8 Mar 2023 08:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCA84F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA84F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gZlq2Kku
Received: by mail-ed1-x52d.google.com with SMTP id j11so42496266edq.4
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydV0x0rwcG3ZlgXY+mzQMZLrMJgGqY0Ocp8WqRfbhXI=;
        b=gZlq2Kkuk9VLf2wxgDlvBqUxwWF3QUw0OTvuvL7dyaApcUu6d9KZd+JG8HMT8ap3JW
         Vx0G32zrjk7Qq6UIsYqSLg7fAPNk3ZBBI4Zw+vKtZUNAQELBG8jT55lEvaLIaBFC/4Uw
         9RrR5NmXkShLV4u+rXiFjbujReIG/tUArH2pXfQczAe3ObVR6ijZXXziCIXvfCB8ANS4
         umNWknNKdgS3mcr1PMkYI0jgoVJCpQx+/HfpsLmCv76fHxfuEShXpo6469Y8iCq/VY8T
         AE5lBlFm4Luuy/Wu/Mt/aPjTrFrjUP+10XLRw7GfR3/IDq8xLSWJGWlClXgZaqHrQ8vK
         VofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydV0x0rwcG3ZlgXY+mzQMZLrMJgGqY0Ocp8WqRfbhXI=;
        b=2//70J28NsteWEiReDmpouqXGiUeMtQeT3XKTEJPDCiFouiQs7ZVbNoH0Jhg6NCEeW
         noC/bbp3nehpktS0XlaAwo33K9N1x04DJY+5X/lqk37Lmq+1GRuVADeNVt0N0MZfL21t
         cONP4oWfA0VUtYqX7yqhERB0FybFNPHTPAw24G/MGEre/CPu0/bdbj0TvJIz9km1jS/M
         XoJJlcMamy9vt/EO+H/dF97kW8GHmIUeapxY77sphM+zE22XWAE0PT4M5ICmFYpCm4e+
         Ght2zV4r4sXx2kgdZwt+C1yKLp2pQOnbYHKkvzLwrHYLr+uggaF3jf0vh8ex7kslAoK6
         EWuQ==
X-Gm-Message-State: AO0yUKUHUzsgbRgpTm7FbvN9Q5463hPs4KHO2A1rTYsOKlP4LOaOocBa
	WIzY/DEDYUKItQgAWUWIrKQ=
X-Google-Smtp-Source: 
 AK7set+MqghAbh20u08oxbKMjKhLU7Z9/418ZjJYV3F5ElaxH2EboSHQ2QntlQLxgJ4yVw5eng/I3w==
X-Received: by 2002:a17:907:7e82:b0:8f4:6efd:833f with SMTP id
 qb2-20020a1709077e8200b008f46efd833fmr21620650ejc.3.1678260924049;
        Tue, 07 Mar 2023 23:35:24 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/8] dt-bindings: sound: nvidia,tegra-audio-common: add
 coupled-mic-hp-detect property
Date: Wed,  8 Mar 2023 09:34:55 +0200
Message-Id: <20230308073502.5421-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QMV4VV7WJXAP67XMFW5V3TTCGLFH6DTC
X-Message-ID-Hash: QMV4VV7WJXAP67XMFW5V3TTCGLFH6DTC
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:19:40 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMV4VV7WJXAP67XMFW5V3TTCGLFH6DTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
if HP GPIO is in active state.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
index 82801b4f46dd..7c1e9895ce85 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
@@ -80,4 +80,8 @@ properties:
     type: boolean
     description: The Mic Jack represents state of the headset microphone pin
 
+  nvidia,coupled-mic-hp-det:
+    type: boolean
+    description: The Mic detect GPIO is viable only if HP detect GPIO is active
+
 additionalProperties: true
-- 
2.37.2

