Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B06DD8EF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0C0F14;
	Tue, 11 Apr 2023 13:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0C0F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681211383;
	bh=Ml2TwKm1sxiaYv5rDrFKE7nIlC6VhqcbM3Qh//9bsc0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XFhxwNnCEYsiMPzj02JIL/aW4dWXghogV551m+jaCBe/uyKANM+cl0lTU8RVb8szt
	 EnFQdaNQCB+ELSbsIzraRMo13RosmW080oAW3juxvGfv+MBQ2DCCdJpi+oIH24yKig
	 VvsUf+wUDNYzy/kpUAITV5UDC4eYwxZ5a4CtMrog=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6F8F8025E;
	Tue, 11 Apr 2023 13:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71085F8032B; Tue, 11 Apr 2023 13:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B117F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B117F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wg+0sAEt
Received: by mail-wm1-x32d.google.com with SMTP id he13so9286812wmb.2
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681211319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/ulLRRaOTMlKM2fPLAgU/c7cE1SCIWwAyoxBGX8u7o=;
        b=wg+0sAEtsMuiVoa4tsE7w3YEDYFC3KeYcJxS04nkURzr8KSPhhUYG9ls8FoIldLKSr
         Fu0quq51STGr8UxZRZa6Oe8Wyy3dnOC73Fuhif8C8s7E4nMTdOEYGz56nqmGqMy7/hq1
         HAqcFieCk7fp9C84F92KHsI6syktBCUyZ1TnXYY+W4VrT6ZZDvSxVcc/WwH5H9K6cDbw
         O6sdEIAsdfeMHq50nHsRTTDcaZcxzIO8/Iv+ufcDcf6GUwMixVBp1UPYcwELM+TlYQSF
         UNbKWpPvBqs2PF3dxj5AgcV9KMDwRvZybYgltOkhWqpd0dQBTbfA+6KKgRwXQCxx90DN
         CxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/ulLRRaOTMlKM2fPLAgU/c7cE1SCIWwAyoxBGX8u7o=;
        b=ObKSqpUwGamOp/53VsMzhsorzyKnOQqENRtivxtClDeTFkTqUEd978bD1iOa8g0940
         38l9ehrC0GiL/qPCn/IfaGULtqEglFcxlNR6VEeJqergGYWcsqt603qpYWU7PgViuA4/
         4hj9i0YHz6RIubvhOGXSi+DIn/KSji9P4GYUVAU0JEqRLlGSxZie6DAmY6XS2UwI8XY8
         jU5sZf5Z2xadPT8gkyy36EE1kx81KHNHhjdYa4BMTdF+gkBl1Rhnps50RTwKxo8XucGI
         hoNYXSZKU7oQ09RKMGJ+KMUMlIzu0OYlrKVuwCXVL85oZnt2z0TNs69J8+hifIaQzJpa
         +J4w==
X-Gm-Message-State: AAQBX9dICZtzTNHuUNPFyWOE4vmgI4Oo4sT18CPz8mYcP+Dr/pPFdw13
	fTRZN/O4YN4LX0wf8rOFoAUslg==
X-Google-Smtp-Source: 
 AKy350bnhiC44ZvjBP5VkUOAxrTV8xOky580Spgj1yerM7yOGxAvg2z2PKl9RnyaNIOItNgVQcQdsQ==
X-Received: by 2002:a1c:4b06:0:b0:3ee:6cdf:c357 with SMTP id
 y6-20020a1c4b06000000b003ee6cdfc357mr8605975wma.20.1681211319641;
        Tue, 11 Apr 2023 04:08:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003eae73f0fc1sm16650750wme.18.2023.04.11.04.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 04:08:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: soc-compress: set pcm nonatomic flag from dai_link
Date: Tue, 11 Apr 2023 12:08:31 +0100
Message-Id: <20230411110831.813-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FUYOTKPEZFCWN5Z3LRBLMUECOPLMQIYD
X-Message-ID-Hash: FUYOTKPEZFCWN5Z3LRBLMUECOPLMQIYD
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUYOTKPEZFCWN5Z3LRBLMUECOPLMQIYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In compress offload case we never set nonatomic flag on a new pcm. This triggers
below configuration error with DPCM on Qualcomm setup where dai_links are marked
as nonatomic.

"FE is atomic but BE is nonatomic, invalid configuration"

Fix this by Updating the pcm nonatomic flag correcly from the respective dai_link.

CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-compress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 554c329ec87f..a8d70274cab8 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -615,6 +615,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 			return ret;
 		}
 
+		be_pcm->nonatomic = rtd->dai_link->nonatomic;
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
 		if (rtd->dai_link->dpcm_playback)
-- 
2.21.0

