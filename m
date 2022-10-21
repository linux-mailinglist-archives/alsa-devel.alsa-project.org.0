Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629060771C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 14:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373228BD4;
	Fri, 21 Oct 2022 14:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373228BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666356069;
	bh=mPBLyPQJ5yYfcbCnFI0Kh40ilIY6OQ6ISl+slnB6lVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bobOLE532iNeNtHajynxzWi2cqp6SRGOoPub7o2U1YfPJi3ub5vHltGDjQI30cdeY
	 WKw58eeu1GHylEz1ML8DngWlbKfyzlif+oNx9CiD4tUZM+y1dYvRIaYVACWsT4HdAA
	 KEjwqGbxBPY4eQrG160iK6UJMmjqXW9zfUYmNFEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9569F804FF;
	Fri, 21 Oct 2022 14:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31C6BF80134; Fri, 21 Oct 2022 14:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB47FF80134
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 14:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB47FF80134
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mv3v636VLzHv6Y;
 Fri, 21 Oct 2022 20:39:30 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:39:39 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 20:39:35 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v3 1/2] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
Date: Fri, 21 Oct 2022 20:38:48 +0800
Message-ID: <20221021123849.456857-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

If snd_hdac_device_register() fails, 'codec' and name allocated in
dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
and kobject_cleanup().

Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
Fixes: dfe66a18780d ("ALSA: hdac_ext: add extended HDA bus")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2 -> v3:
  add suggest tag

v1 -> v2:
  remove skl_codec_device_exit() and use snd_hda_codec_dev_release() to fix leak
---
 sound/soc/intel/skylake/skl.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index bbba2df33aaf..3312b57e3c0c 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -689,11 +689,6 @@ static void load_codec_module(struct hda_codec *codec)
 
 #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
 
-static void skl_codec_device_exit(struct device *dev)
-{
-	snd_hdac_device_exit(dev_to_hdac_dev(dev));
-}
-
 static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
 {
 	struct hda_codec *codec;
@@ -706,12 +701,11 @@ static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
 	}
 
 	codec->core.type = HDA_DEV_ASOC;
-	codec->core.dev.release = skl_codec_device_exit;
 
 	ret = snd_hdac_device_register(&codec->core);
 	if (ret) {
 		dev_err(bus->dev, "failed to register hdac device\n");
-		snd_hdac_device_exit(&codec->core);
+		put_device(&codec->core.dev);
 		return ERR_PTR(ret);
 	}
 
-- 
2.25.1

