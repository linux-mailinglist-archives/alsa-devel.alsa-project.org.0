Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED95625D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 08:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCBA283B;
	Wed, 26 Jun 2019 08:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCBA283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561530780;
	bh=rYBuE8Av5cnKKK+C58M29GjvddoKZ0HuNdmqaaSZeuI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/sSRlvE6CvVaOUYMdukrjwyWCC78vMab3nPxltgXR5qZBM2PSNpgGWotgspyiP2j
	 emWMJeMOvm0T6ad2igdlpFIjIWCKTxTFjfvOnZz0wGntdnCn1OzoVQccpB510LJzI1
	 JmO6/78xa0yv2l0lfu5jal/Q/5Pj+dpVnJH7MfkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98281F89733;
	Wed, 26 Jun 2019 08:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6176EF896B9; Wed, 26 Jun 2019 08:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FD60F896B7
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 08:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FD60F896B7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 23:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; d="scan'208";a="172623219"
Received: from rlanex-mobl.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.251.157.231])
 by orsmga002.jf.intel.com with ESMTP; 25 Jun 2019 23:29:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 25 Jun 2019 23:29:35 -0700
Message-Id: <20190626062935.5549-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626062935.5549-1-ranjani.sridharan@linux.intel.com>
References: <20190626062935.5549-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: hda: don't free hda_codec for
	HDA_DEV_ASOC type
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the case of ASoC driver, the hdac_hda_priv pointer containing
the hda_codec is device-managed. It will be freed when the
ASoC device is removed during driver unloading. Freeing
the codec in snd_hda_codec_dev_release() leads to kernel
panics while unloading and reloading the ASoC driver.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 6c51b8363f8b..a2e23d7e768f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -846,7 +846,13 @@ static void snd_hda_codec_dev_release(struct device *dev)
 	snd_hda_sysfs_clear(codec);
 	kfree(codec->modelname);
 	kfree(codec->wcaps);
-	kfree(codec);
+
+	/*
+	 * In the case of ASoC HD-audio, hda_codec is device managed.
+	 * It will be freed when the ASoC device is removed.
+	 */
+	if (codec->core.type == HDA_DEV_LEGACY)
+		kfree(codec);
 }
 
 #define DEV_NAME_LEN 31
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
