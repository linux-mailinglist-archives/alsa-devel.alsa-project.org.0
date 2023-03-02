Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB716A81E0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 13:04:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92961F6;
	Thu,  2 Mar 2023 13:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92961F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677758680;
	bh=3byWzyurPXEYR4RfyHktCOisOGO3wgw4mCo4r3lDIXs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MxzaMc+lWqgILdHGCRIYK1TbPGfzDRC3UuwRZ7PHqVok7T++dkMFVUfCIJqgL0kjY
	 MGNxo4ATdUfo+3rfPH9Ng9r0TRCCS77BBNM87vMp5kuWTXt0XLtkkSKAYIsfzFKG6F
	 g9z/dba64QZuSbjnCxRPGJfO6wvqMOJ1ZcPGk778=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D48F80310;
	Thu,  2 Mar 2023 13:03:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14C25F8049C; Thu,  2 Mar 2023 13:03:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2C12F80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 13:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C12F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xC3lGcWe
Received: by mail-wr1-x434.google.com with SMTP id r18so16302024wrx.1
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677758619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//nTMjC91UXahku8+Tdgj1LSFzE35LjlMWcyU1qZ1CQ=;
        b=xC3lGcWemHgD69Qa6SjC7iLvsWcoyMqrRP2tbnso0lWItT3NJRh97pgog8qb12RHPd
         vcYzmy4CqHGya/xFYdqheKBrfkkMNCDsdpfECVxn/sOr07JdI+bN8RQzQipunChja1SW
         THeCPlrarcDbbQ2ghM3lMuli9UboDI5yFER6FuoxnqVQw52CGhvNSzPB74o1RZ2iY5VC
         55EBjwBlSKzE2/5qIwbkbSHrG3Q7Ty+Qb5kT+CRJ7LM3Z9PBmoQfFtyh3zkZU1IOHzNh
         P3Gxz9Vvvbga2/CjT2Y+BjNSO2yfAAgbnrKzt6vKAAL4EXJq0dEBNHqH2lbiEN+ivuMl
         bfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677758619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//nTMjC91UXahku8+Tdgj1LSFzE35LjlMWcyU1qZ1CQ=;
        b=E06opeKN4YEIh5/mWYSmYXzULNRdd+LBdJ3+Meoe7eTAByP0jR9kQBjLH0/qVjO2ry
         3Va0/1UDA8nlqN0o3brPyCX9z1fgV/AXarbYnP4PUD2Ifm8xzjDL2Ydjg3KojYGQvJdf
         OmAPL2JHOPqQrZCV5J1HYfLG0QDgM5KdtxcpGkdtA7UOn4hIaudvegvn3Dh8MdTo6HH0
         T0x85y5ZMmkciqWFRg8Nx5/CiqRZllXfktnjw4S3zfjRwTl2L1jI5U2+FoGy9jne3O48
         mWpvZ6gjroho2ZJLQ/zD7lD4foGvr/2XHQbVCMNNnQoxptAhvtrOkcn15y7sn7QTNuHo
         Yt8Q==
X-Gm-Message-State: AO0yUKUN0ATgHyieMlTWNlj1BIJlc0+2N2VjrffPOGdMLfe1qNP9RuJi
	dZVsk1yMgZ7nel0tQEKJe+NVXQ==
X-Google-Smtp-Source: 
 AK7set/cuxTBk2fSWYhYU5b2FKv5Yqgg6rOXfNsTT+RpLAGnq0BSBmhWdoPN6utwXYOimmwl91XfaA==
X-Received: by 2002:adf:f6c5:0:b0:2c7:148c:b04f with SMTP id
 y5-20020adff6c5000000b002c7148cb04fmr7122753wrp.37.1677758619031;
        Thu, 02 Mar 2023 04:03:39 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm15293422wrv.10.2023.03.02.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:03:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: common: add default jack dapm pins
Date: Thu,  2 Mar 2023 12:03:27 +0000
Message-Id: <20230302120327.10823-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GH55MTQ3SY5VGJPMS6QXHBNOWVLZXCCY
X-Message-ID-Hash: GH55MTQ3SY5VGJPMS6QXHBNOWVLZXCCY
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GH55MTQ3SY5VGJPMS6QXHBNOWVLZXCCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the soundcard does not specify the dapm pins, let the common
code add these pins for jack.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c1f24af17506..555feb845c41 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -8,6 +8,11 @@
 #include "qdsp6/q6afe.h"
 #include "common.h"
 
+static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device_node *np;
@@ -169,6 +174,11 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		of_node_put(platform);
 	}
 
+	if (!card->dapm_widgets) {
+		card->dapm_widgets = qcom_jack_snd_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(qcom_jack_snd_widgets);
+	}
+
 	return 0;
 err:
 	of_node_put(cpu);
-- 
2.21.0

