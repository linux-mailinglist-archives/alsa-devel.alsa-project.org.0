Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23F25599C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F211860;
	Fri, 28 Aug 2020 13:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F211860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615288;
	bh=hEhWN/Mth+TljUICm1cl+qNgSY1s5ERQ9N74Kw27hNE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C2u0EpUfhOC4TuzK3f6am17Ir1+wQQpxaAoC3sWyb7QwemHol2aZ96AhxLbcDdxQU
	 tHc0MM59ZDJz29O/suszHngfIqLHnwpGmUGWq2Mv/lEcWnLPvdUcR7wMXTrZulHkUQ
	 5IRzqoU5uLd2WnoZly7wgCPQvKWz0NQoKDc3R0BE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5048F802DC;
	Fri, 28 Aug 2020 13:44:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF52F8016F; Thu, 27 Aug 2020 22:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C03C8F80085
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 22:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C03C8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DivqJbxo"
Received: by mail-lf1-x144.google.com with SMTP id y17so2625979lfa.8
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aSTmsdIDGY9gxXUX1jUT7zqgkm38xmlnjN59ofbys/M=;
 b=DivqJbxoh/7auW+d3qIModqVR1GcitnIZzelyADXkkBmxwWPT6RetbxJKOAGIq828M
 Gq7ndphceGTkgGrCyVYguZdjkz8QqpEpIjh6+oY9qjM7f5HOHUK6zyZh80BuY0r7rqCi
 jKLas8EhExgqLiDoDV4YB1zTnq6S0HCcJBsGq+WEHr9SQ984+Kc2Lb4/7Kdnpf5ccK31
 i7UK3DVHaJihKCQVxZx/oalDDqIXjsnNUNSdoRDtsMsN7EcZ+Tahw5qN832CM8EhAd/B
 vuLxW0mlSfv/ofwAg2TFc1Av8aIK+CsjyF6/HRV/xV/GwZsyWpesMYIJGjGBqbyVsvoY
 cHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aSTmsdIDGY9gxXUX1jUT7zqgkm38xmlnjN59ofbys/M=;
 b=kHHWcNX7LfV2U3S9Yg/bph3xBFAZzYON8VPZ9en87v7026y9PGbst4SroX8AiMFTB8
 95nR8cX1ltFIqAPHWNbWJtCnr+YVxHN6ryMow+jaf2glKvHLQFJTYH/Qj9f27Rg5vrfF
 7/IwLHBSc6Ue1wlsCpwfOJybwMeZGoaxOsG66tjJal4F7wGIpu3pzdwMUWjbbGsqWArV
 E3TzJ5bnVz3I+H1Edx95/PE+30q4M0nqaWjItfzw1jb5b1HHRzxDBOPTbNJ/pjYZpX7P
 DkkLTjZNkBatX/tHY7rQQr3HbJT1LihRzEOXrl6OE6zInchIRRHD2XT/l5Ei6R80WHps
 Fbhw==
X-Gm-Message-State: AOAM5330vyabVLfq4JOWAUtBkG3IjQjhmDB7oii4F6ZY8GCxB6DT+2Zr
 P14238YLpY9jVJwz8rVnA3XWslky+iTRuw==
X-Google-Smtp-Source: ABdhPJxDeBD9RN1ORcZineaXTR5cW9BNmdHQMuVYXFMALGdk/4nAgfSQnpm+30UllaOD5IhWa3KVaQ==
X-Received: by 2002:a19:8856:: with SMTP id k83mr10762956lfd.131.1598561463409; 
 Thu, 27 Aug 2020 13:51:03 -0700 (PDT)
Received: from eriador.lan ([188.162.64.50])
 by smtp.gmail.com with ESMTPSA id t27sm692757ljd.101.2020.08.27.13.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 13:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: core: remove artificial component and DAI name
 constraint
Date: Thu, 27 Aug 2020 23:51:00 +0300
Message-Id: <20200827205100.1479331-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Aug 2020 13:44:03 +0200
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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

Current fmt_single_name code limits maximum name of a DAI or component
to 32 bytes. On some systems corresponding device names might be longer
than that (e.g.
17300000.remoteproc:glink-edge:apr:apr-service@8:routing). This will
result in duplicate DAI/component names. Rewrite fmt_single_name() to
remove such length limitations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/soc-core.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2fe1b2ec7c8f..4f2e2270a0d3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -44,8 +44,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
 
-#define NAME_SIZE	32
-
 static DEFINE_MUTEX(client_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
@@ -2218,13 +2216,14 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  */
 static char *fmt_single_name(struct device *dev, int *id)
 {
-	char *found, name[NAME_SIZE];
+	const char *devname = dev_name(dev);
+	char *found, *name;
 	int id1, id2;
 
-	if (dev_name(dev) == NULL)
+	if (devname == NULL)
 		return NULL;
 
-	strlcpy(name, dev_name(dev), NAME_SIZE);
+	name = devm_kstrdup(dev, devname, GFP_KERNEL);
 
 	/* are we a "%s.%d" name (platform and SPI components) */
 	found = strstr(name, dev->driver->name);
@@ -2237,23 +2236,21 @@ static char *fmt_single_name(struct device *dev, int *id)
 				found[strlen(dev->driver->name)] = '\0';
 		}
 
-	} else {
-		/* I2C component devices are named "bus-addr" */
-		if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
-			char tmp[NAME_SIZE];
+	/* I2C component devices are named "bus-addr" */
+	} else if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
 
-			/* create unique ID number from I2C addr and bus */
-			*id = ((id1 & 0xffff) << 16) + id2;
+		/* create unique ID number from I2C addr and bus */
+		*id = ((id1 & 0xffff) << 16) + id2;
 
-			/* sanitize component name for DAI link creation */
-			snprintf(tmp, NAME_SIZE, "%s.%s", dev->driver->name,
-				 name);
-			strlcpy(name, tmp, NAME_SIZE);
-		} else
-			*id = 0;
+		devm_kfree(dev, name);
+
+		/* sanitize component name for DAI link creation */
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", dev->driver->name, devname);
+	} else {
+		*id = 0;
 	}
 
-	return devm_kstrdup(dev, name, GFP_KERNEL);
+	return name;
 }
 
 /*
-- 
2.28.0

