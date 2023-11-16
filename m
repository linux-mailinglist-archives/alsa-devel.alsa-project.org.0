Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B47EF2A6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89ACDE5;
	Fri, 17 Nov 2023 13:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89ACDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700224348;
	bh=h512ECdKjdD8PYjyL5Q6gaq1Xc0fbXYgzvwoF9nAaLU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eDsegYDrrioLkdoM48WsfQcBeZoOPOvz87psdyX/qloBbbQdtpqyDmmYkLyoozS2l
	 c6RcmysQKC5ZJ3DIpctngeN57k4rUO3/k11LKmMlQ6WyhQsFO3WlyO5b6fRbZc9O54
	 OQ9rogYlrFcgDhzHz5wbx8dseNTeUakC+Qsi1pFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 928F3F80152; Fri, 17 Nov 2023 13:31:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7EAF80152;
	Fri, 17 Nov 2023 13:31:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54C44F801D5; Thu, 16 Nov 2023 22:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DFADF80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 22:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DFADF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cJ7VngSD
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9e623356d5dso188459766b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 13:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700170801; x=1700775601;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3icMdxmKgmrF875Es9NP4wIAe3Sv8Ur+LUuEGA7jjU=;
        b=cJ7VngSDr2JjgXo1ac40AOXxaB7U5ozq4NO208IUGM0aOMsZLWnv03QI9jmY9k9hs2
         GynIof04xVe2ymuqP1+WlNJL78k0ugo/ZbWkr56b34aoeT+WwNeKZXxxoFYEBae/352L
         Tq6UfukCGKKkCl8u31vwuGGvRyRdh+ZBFhymby4g2IdyOf39AxKR/uGQoR1+OactDwS7
         KhuO5vU70pKLOe02VOd8R5iQzbAyc8KNnC89wk16pgZXrRvB0A8PQ/X3ArSEJSPuhLoF
         ybnuWlNF1D9oFFO7UzqJdBY6pagHxlYHIxwPcwJEmh/btghTQZxFC/xsHpT3PaxVhp3H
         y9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700170801; x=1700775601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3icMdxmKgmrF875Es9NP4wIAe3Sv8Ur+LUuEGA7jjU=;
        b=kFa7hnPY63rLWM9VAZn6cuR1FJXmpXfBPFED7oszFAVoCMc5T0GrTgkL2KnARUPINW
         1tMJN7OWTLlEnOYrKXgqeTORwGXHVQWvmvfMuxEWIVi2D6MnEY1+SgPkkY7NLLk+2NDe
         0UurNuvP3D+pauVWdpcAmKG37koNpMjCejE3ODr51CZ0jOdbKWD+NABKPAjj/BA2Iw39
         1fjucFiQoo15tPyqaed+uOWePS34BVVnoP1iqv9W+TxvxsbF9Diy7DWyGl6qamaA3MVP
         zyzbCE2f3k76dgh4rNRFECZgHD6BAhLoEEAfBpfZmTYH5InmGuESXtDu0letDYsd0jjw
         +U9g==
X-Gm-Message-State: AOJu0Yx93DZp9AHs2ljK1n1NNL36FgacWNr0H3X2F2MflMAjaRTJllcT
	olbsmGQ1ub+ul3nM0jMs4As=
X-Google-Smtp-Source: 
 AGHT+IEv/WqgQp0fzs3MYmKZlvrz9LqfpDN/sWUJ82CoKn8qve9khl8T6oZD8pXPjY0kcnjKRrW8qA==
X-Received: by 2002:a17:907:b9c3:b0:9f3:18f8:475b with SMTP id
 xa3-20020a170907b9c300b009f318f8475bmr5915340ejc.62.1700170801550;
        Thu, 16 Nov 2023 13:40:01 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl.
 [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id
 ka13-20020a170907990d00b009a9fbeb15f2sm79312ejc.62.2023.11.16.13.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:40:01 -0800 (PST)
From: Kamil Duljas <kamil.duljas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Date: Thu, 16 Nov 2023 22:39:17 +0100
Message-ID: <20231116213926.2034-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 343ANHULEVQL6GB5FEJHHANWTBLIJIWC
X-Message-ID-Hash: 343ANHULEVQL6GB5FEJHHANWTBLIJIWC
X-Mailman-Approved-At: Fri, 17 Nov 2023 12:31:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/343ANHULEVQL6GB5FEJHHANWTBLIJIWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The function has multiple return points at which it is not released
previously allocated memory.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
Changes in v2: removed wrong usages of kfree
---
 sound/soc/sof/topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a3a3af252259..37ec671a2d76 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	/* perform pcm set op */
 	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
 		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
-		if (ret < 0)
+		if (ret < 0) {
+			kfree(spcm);
 			return ret;
+		}
 	}
 
 	dai_drv->dobj.private = spcm;
-- 
2.42.0.windows.2

