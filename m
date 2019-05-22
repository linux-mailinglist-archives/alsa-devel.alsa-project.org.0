Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DCD2684B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A61166B;
	Wed, 22 May 2019 18:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A61166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542698;
	bh=g3rdCNMBnSax2Dc1rmmLtXvr5LNvE8yEcaZx+7KhYlk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOQE2o5XPcMw9SeaXL0JsPnEEyTcacy+1LdsVZmRBkEtJ8lcQ7UtY4F3rjwgOWdl0
	 vULYTx3jqjnHNzHsMfHvBYc7qfHllQAt5EXAVzw0vaEe1DL1ZzHaQKrBxUzg/CIwbT
	 RlyzaYU+pnf6dB80PKjGgaAb8vAFXsEEeQKMFMZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6DFF89762;
	Wed, 22 May 2019 18:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E18A7F8972A; Wed, 22 May 2019 18:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFE5CF8972C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE5CF8972C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:22:00 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:42 -0500
Message-Id: <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
	memory allocation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

Align all users of the hdac library to use devm_kzalloc.

Note for backports/stable: the patch ("ALSA: hdac: fix memory release
for SST and SOF drivers") needs to be applied as well.

Fixes: 5507b8103e26 ("ASoC: SOF: Intel: Add support for HDAudio codecs")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index b8b37f082309..0d8437b080bf 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -62,8 +62,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 		address, resp);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
-	hda_priv = kzalloc(sizeof(*hda_priv), GFP_KERNEL);
+	hda_priv = devm_kzalloc(sdev->dev, sizeof(*hda_priv), GFP_KERNEL);
 	if (!hda_priv)
 		return -ENOMEM;
 
@@ -82,8 +81,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 
 	return 0;
 #else
-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
-	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
+	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
 		return -ENOMEM;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
