Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156DA6CEF00
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8B6E79;
	Wed, 29 Mar 2023 18:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8B6E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106531;
	bh=2LQtTTa/mu9cgZ0zt5gihw0wU4hZiT1hP5ebSA7aYQk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MRNYkqZH267LtZK28AXC3AehUJS5hL2c2r5GIUgtQiQliKMjXHYtL6n5IkGIJ7LZX
	 fhQf6d+h1vGg4P0BWpXmcMmrPGRwrlRSvAV0b2L64qhFmtNr/Hchdw21B6mGIi3sln
	 uM1PWVehpDaWmVCKXpItxKwAc/QP8i+mwNM5ILzU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA51EF80534;
	Wed, 29 Mar 2023 18:13:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F4C4F80272; Wed, 29 Mar 2023 15:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AA77F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 15:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA77F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kKA3vi+S
Received: by mail-pg1-x530.google.com with SMTP id y19so9224926pgk.5
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Mar 2023 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680095134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsSpCWEsDfnGoaRyyeTFl4Yy+RKBES/VujFMn4D6v78=;
        b=kKA3vi+Sbovo5u5+fyCFosu5eQC2C3KVSABeLsujBVqtX/x+zMpbybujpO2IuBQOIT
         DwJezqf2BIOT+pceWSbiFODF3jKmQxDorL/UKHXwkWd6522a+jrQzsPUwJJqFmnR22Uq
         X+F7pPYDbnQcZXz30N3YxO2pYYf+YyoLBYU2RCKW+/f/WFkJ0+dLbFryTcGOkakK6aJ3
         mYwSN4LjEzbHIJhEe6LBCj8jltVwVrHjEoaaktandxKKUk6gWoPnBSP0W0yMU5nzeFHb
         hJdUEgAiVWG8V0nKMEgQ7to2Y7eEZRGxd04WpQn034AmPcee4Rpy7G3Fu+XuzmP+QP6m
         S2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsSpCWEsDfnGoaRyyeTFl4Yy+RKBES/VujFMn4D6v78=;
        b=E6pfWiADuAcigXR1e5v00C8PM99cKGAX24R6LUidT4KC7UsJ+wA3A5MDqTPK/THW4x
         2WyROnpb5SqfKIJLPWU9s2oEaPuv5z7f7ximFFqBHedb2DCiYtfqBnoHnUZYj+ZekIz7
         kfxRxOk8Pf8djjag3iqP2yslDwf3ToEeb2dnyWbMdYG6xxr5vPK8AVvcZZvwYoOFAlED
         o1dQQFPLEvcQNkE8/iTd5Estd3OiR8YP6FP8czQ4qMbfoCfqZr9qucfZ2Kcw5tFQpQYz
         xpc6kbycd5PMFSE2pDzXK0FUdfyL3YAbaJSzjvf2T3gYxDgvEIC3Bqtbvxdgi2vs09WA
         r3QQ==
X-Gm-Message-State: AAQBX9fu8b/WF2L4vTNMbFsaOquIbjnCED0qcWptOfF7L0emndvTqy00
	NKkqBoQ22R7HR5zwnO8zjko=
X-Google-Smtp-Source: 
 AKy350YHQ81/8HFFe4IFQNlTZHAgL9aVJ2OJjYSUJfpDcFXzmy0V7n5+Ir+YF95SPcnj0RdBdqvElg==
X-Received: by 2002:a62:84c4:0:b0:628:134b:6b1c with SMTP id
 k187-20020a6284c4000000b00628134b6b1cmr21327044pfd.2.1680095134256;
        Wed, 29 Mar 2023 06:05:34 -0700 (PDT)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id
 n6-20020aa79046000000b005ae02dc5b94sm22790452pfo.219.2023.03.29.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:05:33 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH] Asoc: wm_adsp: Add support for loading firmware with prefix
 name
Date: Wed, 29 Mar 2023 21:05:25 +0800
Message-Id: <20230329130525.15830-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DMSGGYQCT34KAE5VLP2UYYRI5SI5LF4K
X-Message-ID-Hash: DMSGGYQCT34KAE5VLP2UYYRI5SI5LF4K
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:49 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMSGGYQCT34KAE5VLP2UYYRI5SI5LF4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For platform using fdt, system_name is NULL, it doesn't provide
a way to load firmware with prefix name, so add it.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 sound/soc/codecs/wm_adsp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 216120b68b64..17481e42d440 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -760,6 +760,10 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
 				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, system_name,
 				      filetype);
+	else if (asoc_component_prefix)
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
+				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, asoc_component_prefix,
+				      filetype);
 	else
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, dsp->fwf_name,
 				      wm_adsp_fw[dsp->fw].file, filetype);
@@ -831,6 +835,16 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 							      NULL, "bin");
 			return 0;
 		}
+	} else if (asoc_component_prefix) {
+		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+						   cirrus_dir, NULL,
+						   asoc_component_prefix, "wmfw")) {
+			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							      cirrus_dir, NULL,
+							      asoc_component_prefix, "bin");
+			return 0;
+		}
 	}
 
 	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
-- 
2.39.2

