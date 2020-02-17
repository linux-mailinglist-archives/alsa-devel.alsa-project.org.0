Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B254916196B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 19:08:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C74167B;
	Mon, 17 Feb 2020 19:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C74167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581962901;
	bh=qYBOxYcHIiS1efKt2TyETIE6WoIaoGjWKXFvtgsvnBw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gO22vw4DpX7sBBXMIY635L/h3KLQNpcgZqxNATr1C7WRjvvLt/ImovSOQT9HMo0N5
	 R7crkkLitBUucST60VGSEuDNm80f/WadNGvOuHZX6PkRpoz9AgFnxa7hUXc7NzaqMr
	 yYZla+SXfcmE9gc2y2umOxORugB+vk5rRMxp25MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78132F8015E;
	Mon, 17 Feb 2020 19:06:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 462E4F80172; Mon, 17 Feb 2020 19:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E84F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 19:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E84F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="FOth/oyb"
Received: by mail-wr1-x444.google.com with SMTP id r11so20816996wrq.10
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nIGgpR6dxPbUKvKu1GNRxbB1TO6afrCiGpP741rVUc=;
 b=FOth/oybwE6qAHw51eAfFYXowWJRP1oRU/FExfez93psv5Gj5qjfSN6kJfOSkyjz4V
 NVNb81QmvBTEFdlF29ucdGdDwgVnxRO0yXZD95TOIkMhnvkJNe8tG1rXjG+sAD75BCW2
 qwp0GQUrwiNg9YFERbyCbBi7ozKTd6DlUxquL96omY2Bjb2SjJFajgm+LzhL6FI8SxTE
 17wbUIuezRS5Wr99jkcYZwkNa51UY9c8CoIqFxeJccxr3QtNvmzryk/GD+Pe9FskEoMk
 1nGyeBFn19MZ/d0KecUtTsuqEuL820uKbYGtM6fzGegr2a8Gg5+Fpqp9sisr/UGzFTbW
 CvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nIGgpR6dxPbUKvKu1GNRxbB1TO6afrCiGpP741rVUc=;
 b=sP7qaGKnQbpIa8vKWBm913yt5cvNq9IjgfZ05Wnt+TAqDmOAggQIf4wwJkhtUPDxza
 b4WS4etQB7uFIbbo4D42NTLDwNJuiuQ1tLTIx701DrtwFIoowuaTWQk162YKYRmlIkym
 WCybNmOCFsNOzsah9fA1LuRaofQdRYbgv+71AQs7iFG87cgx4FLOKxAUNeDBb3H/PfHZ
 sdVUxmWNsgRUAgrmW2jM8pAOyUPHdF5I8E/vVgAQsMtzo19LBU9m/laeQ3fbe2o3cYTR
 OhdluvQUrsOJ8WnYH+Yf0zEtRBO+S3otVKfy5zavXL6vVOHNHad63RCVd5acsYmA5sPk
 NAMQ==
X-Gm-Message-State: APjAAAXFRQhDkZMK7ujY26vLjG9GfrnjrrFr1yBvdV2g7/wcLMxiR+jd
 uBe0G6izQikVx+1IVzdsxxt5+Q==
X-Google-Smtp-Source: APXvYqyBEo4ZFXC6CR3RHyHS3MGnk6ZzfhtbpwNrhWU7GWupMw65B4+Li8NoPZ09CArtzdmLc4ueXw==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr23671245wrj.68.1581962794494; 
 Mon, 17 Feb 2020 10:06:34 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d204sm254850wmd.30.2020.02.17.10.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 10:06:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>
Subject: [RFT/DONTMERGE] ASoC: devm_snd_soc_register_component fixup
Date: Mon, 17 Feb 2020 19:06:26 +0100
Message-Id: <20200217180626.593909-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20557448-d6d2-7584-e2ac-c46d337e1778@samsung.com>
References: <20557448-d6d2-7584-e2ac-c46d337e1778@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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

Hi Marek, would you mind trying the following patch. It should target the
component removal intead of removing them all. I'd like to comfirm this is
your problem before pushing in this direction. Thanks

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h                   |  1 +
 sound/soc/soc-core.c                  |  8 +++++++
 sound/soc/soc-devres.c                | 32 ++++++++++++++++++---------
 sound/soc/soc-generic-dmaengine-pcm.c |  2 +-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f0e4f36f83bf..e5bfe2609110 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -442,6 +442,7 @@ int snd_soc_add_component(struct device *dev,
 		const struct snd_soc_component_driver *component_driver,
 		struct snd_soc_dai_driver *dai_drv,
 		int num_dai);
+void snd_soc_del_component(struct snd_soc_component *component);
 int snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6a58a8f6e3c4..bf6a64fbfa52 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2599,6 +2599,14 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
+void snd_soc_del_component(struct snd_soc_component *component)
+{
+	mutex_lock(&client_mutex);
+	snd_soc_del_component_unlocked(component);
+	mutex_unlock(&client_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_del_component);
+
 int snd_soc_add_component(struct device *dev,
 			struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index a9ea172a66a7..d5e9e2bed2ce 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -11,7 +11,7 @@
 
 static void devm_component_release(struct device *dev, void *res)
 {
-	snd_soc_unregister_component(*(struct device **)res);
+	snd_soc_del_component(*(struct snd_soc_component **)res);
 }
 
 /**
@@ -28,21 +28,31 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	struct device **ptr;
-	int ret;
+	struct snd_soc_component *component;
+	struct snd_soc_component **ptr;
+	int ret = -ENOMEM;
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
 
 	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return -ENOMEM;
+	        goto err_devres;
 
-	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
-	if (ret == 0) {
-		*ptr = dev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	ret = snd_soc_add_component(dev, component, cmpnt_drv, dai_drv,
+				    num_dai);
+	if (ret)
+		goto err_add;
+
+	*ptr = component;
+	devres_add(dev, ptr);
+	return 0;
 
+err_add:
+	devres_free(ptr);
+err_devres:
+	devm_kfree(dev, component);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 2cc25651661c..a33f21ce2d7a 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -474,7 +474,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 
 	pcm = soc_component_to_pcm(component);
 
-	snd_soc_unregister_component(dev);
+	snd_soc_del_component(component);
 	dmaengine_pcm_release_chan(pcm);
 	kfree(pcm);
 }
-- 
2.24.1

