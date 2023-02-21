Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1269E7A8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12F4EA1;
	Tue, 21 Feb 2023 19:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12F4EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004700;
	bh=8QOFPWz4jHeE2H2vjihyNGg18wOuet4foK4GbFqA148=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnApFZ6XdxVYQUOKQ1adhm5getMk7dJVaufa3htDYvwvAIOKBf1ts0lnnwUJCGez0
	 UwPo0QFayixlaeOwcE0tKl+MZSO0YD3ueQ7xWby/3hTgTGqtVrKDCi4YXRfCmvRaHW
	 U5TV41NiFhRV5+5dmX143q4sH31OvJ7HwZlCnDUc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CC8FF80525;
	Tue, 21 Feb 2023 19:36:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45B45F804FC; Tue, 21 Feb 2023 19:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13604F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13604F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XthLSfsJ
Received: by mail-ed1-x536.google.com with SMTP id x10so20184928edd.13
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVgROdQULqVTm5cZsK90w6/mn8hCbHN5YbVIzDSMgeI=;
        b=XthLSfsJ3sDWeedA3vMFgH+nYyTWffN3ykvdKMIgZCII5Lp0jEbv1STD7zYnHiAXsu
         HbvRZ0JONBH3SVuVB+D0CU+OjLkg8WrvZOXAe8YXc7Xs3p4civ1HOb80g6Tv3mnRfP95
         9sDvNh3FXGQz+/yu7FB5/GsOZLhL+JO0XCqNK3uF8VLDnB+TJ8TX/6mn2YAqLu0HIxIX
         vr7d7tzQV75/NlCycYQmnXfYXZPj+dE/8KeQcg69mWpegtRdxTHv4Pr/act1AhAqOqY7
         cgGIryvz4WE5E7Q5hzUSNbz7aYTdhQBOuwDn4qbY+NnweeqjJBM0oFLTCbhT/5SFR52S
         VNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgROdQULqVTm5cZsK90w6/mn8hCbHN5YbVIzDSMgeI=;
        b=O4csalB5oga6VNVEijmLCQHAgaAR2i0femnLTzxImTIQejhpUn4fYps1OMgxqyZY0b
         Bpqpg9b5zKsbKGIsuOwKzjAvMjyKRLrPzRnHwe1VwiUPTPUoVOVysM5TlvrtjvAdQLo8
         ncfbg8MFjhhTXghOxRmqvk0d64vcsmc9gSvAKhr008dbRwMBHD+XPU2bN1wCheHbxi8C
         /S+nu7rO/dXXg62T+zJYlbuwi7wVk6yx+R0K2bIeJKOvACUiRqJ9hQ1Slcn1DO0VnYFE
         GYBM8hT4BFmL7vfUrK9v1A+DgZMaGOvxw+tk2nmNqorYJp64+ZMvmlsiSSnNY+y8FR2T
         QWuQ==
X-Gm-Message-State: AO0yUKW1zIRPYj1/se4x2XI4ZEmAfWjZgrvVotYNWjh6/XmEDmTEC1Ig
	TLlciN25Dl0FkP/1oPmpTpg=
X-Google-Smtp-Source: 
 AK7set+jQ+9BvsQ5gp+9b4ZiiTcgH/+mt6qbyEDN5u7cOiJ5nhFbV8IA7F8K4+TrBiJSTmaG8DqX7Q==
X-Received: by 2002:a05:6402:406:b0:4ac:b8eb:e398 with SMTP id
 q6-20020a056402040600b004acb8ebe398mr4582455edv.6.1677004343982;
        Tue, 21 Feb 2023 10:32:23 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 01/10] dt-bindings: sound: nvidia,tegra-audio-common: add
 new property
Date: Tue, 21 Feb 2023 20:32:02 +0200
Message-Id: <20230221183211.21964-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XVI2EZXW5FHYTUIPBJ5F3USVI5ADQLLI
X-Message-ID-Hash: XVI2EZXW5FHYTUIPBJ5F3USVI5ADQLLI
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVI2EZXW5FHYTUIPBJ5F3USVI5ADQLLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
if HP GPIO is in active state.

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

