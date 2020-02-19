Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F116420E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 11:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB85168D;
	Wed, 19 Feb 2020 11:26:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB85168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582108051;
	bh=i8MHgOtKfnPd1ZvEWRlYdEaZALD2vEbh/Kg0xT2+j70=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ddt3bufTH0RAvTljWneZ16mV08+DqgjU50x/pndZi0HX4kQ0tpOjWJWiZ/rqpIsTm
	 OKl4tm8uU5KNRYYNohNBMqVRId+1wXDHZnIajVXERYjcLyYPMixUCeuL9prPiaTl0p
	 HXB76PLECwdh2EcZdrPD5EYl8gE4o9u4bIgU3BHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868B4F80142;
	Wed, 19 Feb 2020 11:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E84BAF80172; Wed, 19 Feb 2020 11:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6919BF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 11:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6919BF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="pxiG/15f"
Received: by mail-wm1-x341.google.com with SMTP id p9so5883659wmc.2
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RejVam6fDIBD/171nva4YA9frryDk02n9j0DCZJ4htM=;
 b=pxiG/15fBub6+F881mK1MfCTN7rUOq+Hm4jea2zZdHSx0shyFznlZv0NXH31Bw/H0M
 /rT0ZsZbEnUTjIxyopaVx0iiXOGuKnCwfOPjHMY3md42nvjdpgPNR6qEsSbGP97BnDNK
 UPLZgYuWV0bk3aR8UPujgHOoxo2hXsJKOltOi2FwTqRfqDIXQuqSUAMRR6PV/awINDLb
 hB8hRkr75zSIVf6CWuQaJQ3MHBsJCvpqdJbvamXjRuFbo6q4VRvjweZu/0+0/8ACzOxI
 FHfT9tphxZTayrfS6uk2/B6ICtsxaO0t/FwZJD8weSuqkT1cTGjBsu+Fs12EBaF/6DPe
 uQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RejVam6fDIBD/171nva4YA9frryDk02n9j0DCZJ4htM=;
 b=Wy7K8Dy/Kn+76q0xRgjU/YU3e6YGQM/QXhuHgvl7aNSmKgSED8iQlfVR8AgwTAyAjR
 +t/2y/DDXCE8eMMZQp1wAksyS16K8gZNAk4ViVwXBJawGad57Q8sUZ/RPuTzlrYTd2z3
 KHoAerbyGOobpm3P0iFM+v/L7+7l9zEMm4WOjN0LL1/EqCxEz51+3VXkj24w1gtddfJE
 OOiHaXaTChJpwBiVFEhvQipVQfdeDvS9DO4n6NmjykEbeLsrE/QgL5Fdf6lrVVLP8Nz0
 fP7gXci+fkJvltw6vkFk7Y5acxnAUD1TUTotmFd3GqnQ8S6zR317xdWxh560lgK+TTeO
 pNCQ==
X-Gm-Message-State: APjAAAVy8kxAWyjNO4IIoWqfRVz1ax5z16OcW99kA0gzCd0pKo8bbh5C
 uV9oaUJdbDL1Ej/BM0kT+n6ERQ==
X-Google-Smtp-Source: APXvYqw7/FkSHHxus/ih0u10TbKNOBGCz51zlpX/Ia7XtXiPnjDJYWOyfUo95tzExyHbfRKjRVF68Q==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr9323161wmb.150.1582107943441; 
 Wed, 19 Feb 2020 02:25:43 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 133sm2678562wmd.5.2020.02.19.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:25:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: fix card registration regression.
Date: Wed, 19 Feb 2020 11:25:26 +0100
Message-Id: <20200219102526.692126-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

This reverts commit b2354e4009a773c00054b964d937e1b81cb92078.

This change might have been desirable to ensure the uniqueness of
the component name. It would have helped to better support linux
devices which register multiple components, something is which more
common than initially thought.

However, some card driver are directly using dev_name() to fill the
component names of the dai_link which is a problem if want to change
the way ASoC generates the component names.

Until we figure out the appropriate way to deal with this, revert the
change and keep the names as they were. There might be a couple of warning
related to debugfs (which were already present before the change) but it
is still better than breaking working audio cards.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 30c17fde14ca..518b652cf872 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2442,33 +2442,6 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 	return ret;
 }
 
-static char *snd_soc_component_unique_name(struct device *dev,
-					   struct snd_soc_component *component)
-{
-	struct snd_soc_component *pos;
-	int count = 0;
-	char *name, *unique;
-
-	name = fmt_single_name(dev, &component->id);
-	if (!name)
-		return name;
-
-	/* Count the number of components registred by the device */
-	for_each_component(pos) {
-		if (dev == pos->dev)
-			count++;
-	}
-
-	/* Keep naming as it is for the 1st component */
-	if (!count)
-		return name;
-
-	unique = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", name, count);
-	devm_kfree(dev, name);
-
-	return unique;
-}
-
 static int snd_soc_component_initialize(struct snd_soc_component *component,
 	const struct snd_soc_component_driver *driver, struct device *dev)
 {
@@ -2477,7 +2450,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name = snd_soc_component_unique_name(dev, component);
+	component->name = fmt_single_name(dev, &component->id);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.24.1

