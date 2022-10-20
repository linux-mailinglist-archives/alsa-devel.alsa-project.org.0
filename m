Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17FB605615
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 05:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE78170F;
	Thu, 20 Oct 2022 05:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE78170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666237685;
	bh=Zovbq6RArDvTYo13yNx4wHwI6RBu1bHFysBnN6skDI4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kjg5ounT+bpmJmio8LwxTJD/ocfO+/FJeVFeW3cxPO6KNPC5RkuFgRPeQhE2pEQn9
	 tz3XQ2ahy1APKn8cuJR5et3wMHxCJnlTy+RduO3RGK4pryNn9vR9/uAUWuGOIu0HqL
	 nXRckJ4enNrPPaBJujT+19sAKze1dOTrdY6xvjDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD8FFF804E5;
	Thu, 20 Oct 2022 05:47:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADA9BF804D8; Thu, 20 Oct 2022 05:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55FE8F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 05:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55FE8F800B5
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtD1m3PsBzVhpW;
 Thu, 20 Oct 2022 11:42:20 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 11:46:32 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 11:46:31 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
Date: Thu, 20 Oct 2022 11:45:48 +0800
Message-ID: <20221020034548.2391293-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 yangyingliang@huawei.com
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

If snd_hdac_device_register() fails, 'codec' is leaked, free it
in snd_hdac_device_exit(). And device_initialize() is called in
snd_hdac_device_init(), it should call put_device() to give up
reference or the name allocated in dev_set_name() is leaked.
The snd_hdac_device_exit() will be called in dev->release().

Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/intel/skylake/skl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index bbba2df33aaf..f0048e3fa619 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -691,7 +691,11 @@ static void load_codec_module(struct hda_codec *codec)
 
 static void skl_codec_device_exit(struct device *dev)
 {
-	snd_hdac_device_exit(dev_to_hdac_dev(dev));
+	struct hdac_device *hdac_dev = dev_to_hdac_dev(dev);
+	struct hda_codec *codec = container_of(hdac_dev, struct hda_codec, core);
+
+	snd_hdac_device_exit(hdac_dev);
+	kfree(codec);
 }
 
 static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
@@ -711,7 +715,7 @@ static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
 	ret = snd_hdac_device_register(&codec->core);
 	if (ret) {
 		dev_err(bus->dev, "failed to register hdac device\n");
-		snd_hdac_device_exit(&codec->core);
+		put_device(&codec->core.dev);
 		return ERR_PTR(ret);
 	}
 
-- 
2.25.1

