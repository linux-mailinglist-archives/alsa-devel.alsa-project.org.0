Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F988392314
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 01:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394391719;
	Thu, 27 May 2021 01:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394391719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622070808;
	bh=kUDqrDfSw2Wiy4wmESWkHEGUdbUnarENncp++OVXoec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dF6qVJGTlwHpzxUUWYWmg9VPlHdHthJSBUrvBZdLsIKU3Fscg3IkkSV9z8mim0c7t
	 pP8r1NdXiyTCnlui3oWAMGKfaaOyqXgHYUbLIKsp4sEi33GEIZva8Vg9qO8537+ZcN
	 BrHbig07sYOlIVuKZym84np0U+lWDOEj2FQ5AMTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0825AF804AB;
	Thu, 27 May 2021 01:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA16F80274; Thu, 27 May 2021 01:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3F9F80212;
 Thu, 27 May 2021 01:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3F9F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E+voA5DP"
Received: by mail-lf1-x12e.google.com with SMTP id f30so5066283lfj.1;
 Wed, 26 May 2021 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cqfoBUBIBZBnXHCZDwrElhf2ir+Bt3tbcHnECyy/1M=;
 b=E+voA5DP9ip8MLWp4XLYG2OuwruYbMDCfDQ7oqaYWWtBxhM1nVixvjfaZarsFImE8L
 jZSs9N5GHZAcZgPk02QqXnPp+DbpQYO6La58ZSvPQLgef3kUGJRZbg7tPAzdq85zandR
 TpLI073zWBA1AMn8+au6kN2xpDK9d5IjhoHaC4W0cFuJbuRTY1bqBLPYcdXxDEbX90Gl
 bJUFosbC9IZcA2z0sRIpbTOzgElAlwHIeIEPhcxVOql1FpnGoRwler0SuQXSUo2gdvF+
 kEODqbiFdu3NtYNw7222pT73eCeBif2xgzuFr5kLnHyI5IHShJ4la9kgECaWQD+4JRsp
 hRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cqfoBUBIBZBnXHCZDwrElhf2ir+Bt3tbcHnECyy/1M=;
 b=b+kVjlLTY9UmuyN9E11xu34HVBTykn0mPgGFQNUz13J5FZyCFzTYFwfeGE2gmyfiMF
 cMI6Mdo8W1mMA3ZQql2+inrbPoAWVJfvlsQF143N6EL5vJ5yMJHNAUoaKh0lDmDlUm4T
 Nvgm5dHcOgvnOa74OY3IRVdxtwrlj9GQlcyhpHBmt3QXqnTdSYhTconCE29LlMSH3I9L
 L2votRoXej/n8/s7VUwMQssnGer84d4bPXSPqpGxiaim9X30Py2DQxQ53AfaFIyA+U6j
 GgQzFiazzQwFTMDfI73RbOvdhP46xQ9QIlNBE9LCcyo2F7MKkR81Xx1VNJ/LUSTZC7yd
 rvIw==
X-Gm-Message-State: AOAM532kwuGbyKkvRYkMG2WT6qbaZtzLxR5Vi5yOMjnk75wjlf1HHLui
 xWQcWuZwo6TyjreEHHeK6oQ=
X-Google-Smtp-Source: ABdhPJx80KNIisL1p6ZVTMU6a/aB8NzELevSRe5WFSORcB66wyOizl7X18sXKzNGPD0naO6eoIuKQg==
X-Received: by 2002:a19:4085:: with SMTP id n127mr308460lfa.415.1622070626866; 
 Wed, 26 May 2021 16:10:26 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id d5sm35802lfi.144.2021.05.26.16.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:10:26 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: SOF: Intel: Constify sof_probe_compressed_ops
Date: Thu, 27 May 2021 01:10:13 +0200
Message-Id: <20210526231013.46530-6-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
References: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The only usage of sof_probe_compressed_ops is to assign its address to
the compress_ops field in the snd_soc_component_driver struct, which is
a pointer to const. The assignment is done in sound/soc/sof/pcm.c. Make
it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/sof/compress.c | 2 +-
 sound/soc/sof/compress.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 2d4969c705a4..57d5bf0a171e 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -13,7 +13,7 @@
 #include "ops.h"
 #include "probe.h"
 
-struct snd_compress_ops sof_probe_compressed_ops = {
+const struct snd_compress_ops sof_probe_compressed_ops = {
 	.copy		= sof_probe_compr_copy,
 };
 EXPORT_SYMBOL(sof_probe_compressed_ops);
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
index ca8790bd4b13..4448c799e14b 100644
--- a/sound/soc/sof/compress.h
+++ b/sound/soc/sof/compress.h
@@ -13,7 +13,7 @@
 
 #include <sound/compress_driver.h>
 
-extern struct snd_compress_ops sof_probe_compressed_ops;
+extern const struct snd_compress_ops sof_probe_compressed_ops;
 
 int sof_probe_compr_open(struct snd_compr_stream *cstream,
 		struct snd_soc_dai *dai);
-- 
2.31.1

