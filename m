Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800A2559A1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339AF1764;
	Fri, 28 Aug 2020 13:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339AF1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615385;
	bh=hEhWN/Mth+TljUICm1cl+qNgSY1s5ERQ9N74Kw27hNE=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHkJuy+wYwURq1rkA5z9dp/ojy/yInn63yhv52xUVLzGCfsILmdhF78pwYKnGd8CA
	 weQgdR98hZlpsl2t6d5S7U8EHmvr3KA6Xmv/krUR2JUPepT/5koOZ8kR1nynGKuZg1
	 XfP32G3X8Enei+PNKjMxqONEaOuyIc0p4pnqjTbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A1EAF802F7;
	Fri, 28 Aug 2020 13:44:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC02CF8020C; Fri, 28 Aug 2020 13:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD2DF801D9
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 13:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD2DF801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DivqJbxo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF4A220848
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 11:41:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DivqJbxo"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Fri, 28 Aug 2020 12:41:18 +0100
Resent-Message-ID: <20200828114118.GF5566@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Thu, 27 Aug 2020 21:51:09 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92)
 (envelope-from <SRS0=yIPE=CF=linaro.org=dmitry.baryshkov@kernel.org>)
 id 1kBOrT-0007Bw-2r
 for broonie@sirena.co.uk; Thu, 27 Aug 2020 21:51:09 +0100
Received: by mail.kernel.org (Postfix)
 id 7C55F20848; Thu, 27 Aug 2020 20:51:05 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPS id 138EF20737
 for <broonie@kernel.org>; Thu, 27 Aug 2020 20:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138EF20737
Authentication-Results: mail.kernel.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-lf1-f68.google.com with SMTP id 12so3653702lfb.11
 for <broonie@kernel.org>; Thu, 27 Aug 2020 13:51:04 -0700 (PDT)
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
 b=ag9KfqZmhl6FVOuq4k+nChaFzRM7sB2KIJAuT7nbB2eI7V3bNoT3i0f/WrLgVAOJZX
 a4p1b5up7xA3T3IfwpdnLEFeOptmWv/PPijFcxnQhE9XVqO9yPI2p1N6kJS4wIBk2yQK
 0wiHJMGzfZ70n4w4TKIZNANNZLM7CG3ssxBKtEz2E1IXkFYRAfkxZZ1Ftm2Jo+cVLMfL
 HZqdDHShAYS5zPCxgXaopmYfMmwHqHr/M6YVU2xa22wB7/BmeYj45PxmjfPkS2HLG2AO
 gDBPC0isWFsQWcMv2/Zv11Ci7kttvPbITtiiPz4qFf5ISrZggeRWYsad5ft0DBs8uwa1
 z8iA==
X-Gm-Message-State: AOAM533doVjz7nnHM7KRPsGUS11K0vaeRKFgEx/Qw1TFSwCcVED0S0mv
 IuYjHmAdze21S8Ov1KvPU8Zgyg==
X-Google-Smtp-Source: ABdhPJxDeBD9RN1ORcZineaXTR5cW9BNmdHQMuVYXFMALGdk/4nAgfSQnpm+30UllaOD5IhWa3KVaQ==
X-Received: by 2002:a19:8856:: with SMTP id k83mr10762956lfd.131.1598561463409; 
 Thu, 27 Aug 2020 13:51:03 -0700 (PDT)
Received: from eriador.lan ([188.162.64.50])
 by smtp.gmail.com with ESMTPSA id t27sm692757ljd.101.2020.08.27.13.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 13:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: alsa-devel@alsa-project.org
Date: Thu, 27 Aug 2020 23:51:00 +0300
Message-Id: <20200827205100.1479331-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=yIPE=CF=linaro.org=dmitry.baryshkov@kernel.org
Subject: [PATCH] ASoC: core: remove artificial component and DAI name
 constraint
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: By9oZcfGKbgy
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

