Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456AF7D95D7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 12:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E395BE0D;
	Fri, 27 Oct 2023 12:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E395BE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698404396;
	bh=sF9D0JCTLYXdS4i8IZaSR3Q2EKQCyuGcuEHmOF/AsQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lDkC1U1uy97TiXdMGVI8/STRUbzywLJZ905w3NDl4Y9GWpDo4cfFBwKSVOV9fF8iM
	 8WoAXVoXiQOr/8A2Nzyq+jG57S3aOnz2ywM+j028u1Gzi82C1WndLH+YnQ+C3LkNE5
	 7l/IlXzegZegdGWoruELZAL5xo2WcORWT/IowT6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF97BF8056F; Fri, 27 Oct 2023 12:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F82F8055A;
	Fri, 27 Oct 2023 12:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70503F8020D; Fri, 27 Oct 2023 12:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C465AF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 12:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C465AF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fjb+XeaS
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083cd39188so14030965e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 03:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698404288; x=1699009088;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnRkBO9T7mpu/9qbQ4qd8eFU+MMR5Opxp/fD1o8ihl0=;
        b=Fjb+XeaSn9gK203xRTnFPj5LfaWDZzkbkYoxPAsV9SuvbQpP0x7emy/E6VZ7VMcHoM
         Tw++/2yiLenI+VWmQyzW63F1U7gP2eN+AgIITso45xsBeQSDtvvrAko12nLbxbe/K9Zw
         kySCmvz+mAMPyVMGYWw1fxQnIKj+AP8N/M2z0S5nUZ/MYD2Yiacu/5kpYHimtMVWMPbR
         flYQpXNQ6cSFJymEUwHux/dZwGlCb+gmc+sKpVA11FkTQnTmem+WHwVVpYAbxfNR1eYR
         gJYGxSVGNcXu4Kkc9K1c1WPC1dSqdygN48E4zft1AMNCHqc6WQiAi40d6mnI+7SwFFe5
         m94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698404288; x=1699009088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnRkBO9T7mpu/9qbQ4qd8eFU+MMR5Opxp/fD1o8ihl0=;
        b=KUUzUAdy08ebGvHxeSwH6pW5+Wcc2jy6cEVcmAD98RZWznXNwpmzT6B8YhrgL+9SFN
         PVTxR46gnJSgiAPLDRFgETimIFVkvYUjjPqBw8//uOBBM9onQ/cbqqySLS4D/h3pQWCI
         b1kfAAY8CLjLDPV1WiHuBqF/40YM2TQ7yUGXuDkf9g3S2FDGQ1FDix8LAds1nIu0cP19
         Tz1chuB08R4qQBsmOgWpu5NsMzAj3SVTMZm7K21FQuXiMOT6WD1mHBqtMXiQrErzwpFU
         yWOvS4cITElAbeNPYjeqMihhhYl9oyEIV4SiEY40Qs/9lid7v7cOjmjjV1krExvIuVAp
         3W6A==
X-Gm-Message-State: AOJu0Yzzf7mgZopSis9i+Nzrb0KTIL6iS0A6Odg4dUXWax74IAiEmDqR
	tFN7ybzLpOGAQGm90UMYnDkbzg==
X-Google-Smtp-Source: 
 AGHT+IGebDNbdDKX/IZobIxUnkODGsr9PdTVtrGQ1bCRfn1/ZgdLC1oMrxdvfJdXxEp3U1pvkCGVew==
X-Received: by 2002:a05:600c:19d1:b0:405:3955:5881 with SMTP id
 u17-20020a05600c19d100b0040539555881mr1831887wmq.36.1698404287889;
        Fri, 27 Oct 2023 03:58:07 -0700 (PDT)
Received: from srini-hackbox.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ay32-20020a05600c1e2000b004065daba6casm4819626wmb.46.2023.10.27.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:58:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: johan@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 2/2] ASoC: codecs: wsa883x: make use of new
 mute_unmute_on_trigger flag
Date: Fri, 27 Oct 2023 11:57:47 +0100
Message-Id: <20231027105747.32450-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EONBUGGW4MJHNR5ZLU7R73HAGEXOBQXK
X-Message-ID-Hash: EONBUGGW4MJHNR5ZLU7R73HAGEXOBQXK
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EONBUGGW4MJHNR5ZLU7R73HAGEXOBQXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the current setup the PA is left unmuted even when the
Soundwire ports are not started streaming. This can lead to click
and pop sounds during start.
There is a same issue in the reverse order where in the PA is
left unmute even after the data stream is stopped, the time
between data stream stopping and port closing is long enough
to accumulate DC on the line resulting in Click/Pop noise
during end of stream.

making use of new mute_unmute_on_trigger flag is helping a
lot with this Click/Pop issues reported on this Codec

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index e40d583a1ce6..4ea550b0601b 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1203,9 +1203,6 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 			break;
 		}
 
-		snd_soc_component_write_field(component, WSA883X_DRE_CTL_1,
-					      WSA883X_DRE_GAIN_EN_MASK,
-					      WSA883X_DRE_GAIN_FROM_CSR);
 		if (wsa883x->port_enable[WSA883X_PORT_COMP])
 			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
 						      WSA883X_DRE_OFFSET_MASK,
@@ -1218,9 +1215,6 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK,
 					      WSA883X_PDM_ENABLE);
-		snd_soc_component_write_field(component, WSA883X_PA_FSM_CTL,
-					      WSA883X_GLOBAL_PA_EN_MASK,
-					      WSA883X_GLOBAL_PA_ENABLE);
 
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
@@ -1346,6 +1340,7 @@ static const struct snd_soc_dai_ops wsa883x_dai_ops = {
 	.hw_free = wsa883x_hw_free,
 	.mute_stream = wsa883x_digital_mute,
 	.set_stream = wsa883x_set_sdw_stream,
+	.mute_unmute_on_trigger = true,
 };
 
 static struct snd_soc_dai_driver wsa883x_dais[] = {
-- 
2.21.0

