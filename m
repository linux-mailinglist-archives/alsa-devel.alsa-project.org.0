Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B51404C3383
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 18:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418D218FE;
	Thu, 24 Feb 2022 18:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418D218FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645723481;
	bh=IsQghNTebLBLQDA2JdQj97jszH/Ayd/vnb0QfJ+1QSM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ghIGjopAEiNx9lGS5e3uxZmbWA5kTz7mcmxqPdZSqHhKFmkTQruokDpbUNOfOcEI9
	 epcByHm3MogEYnP4TzMYh0ipqDyt+61p7dAw6twFfKewXBPvsfbWuv2GEuCTVO2gir
	 uzV2ArQGoGYAElYkwkaBSZ5m6UgsDjOWNWWHdNIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A21BDF800B6;
	Thu, 24 Feb 2022 18:23:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ECE0F800B6; Thu, 24 Feb 2022 18:23:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E81BBF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 18:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E81BBF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V/Fvwcz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645723409; x=1677259409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IsQghNTebLBLQDA2JdQj97jszH/Ayd/vnb0QfJ+1QSM=;
 b=V/Fvwcz2fmSWc5aWnHdchSg6dXoUOtuRkj3QlEAiH+XMwQjYs42fwyon
 qTBTAfBzI/jToLiq7VQiHdUSeM6+8Xx+PtwywqWQ7AaZPJKJ1+oP9h4fc
 et71gxAcMSGWzapbtzbZvAJE6Fb1NpMQjNQ40WQEoDGeqrulWDNhNRxfT
 GY7NQ8HB+p+cJylTHd1YUB4CyLevmFySXkrpnEqttEZ02Ozx0LAxp+Y4x
 r1mV4Q8/dbwiiZ0g6LC+ebII7NKiAZsltt8QH6vxSacy8b43Up3yr8Xab
 L8xcSADASbIKoZTdzpViVM0kdhY4exZ5lvl0i+tGaiC2RTEMWakQEmgkT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232918921"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="232918921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 09:23:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="548845503"
Received: from mmendonp-mobl.gar.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.43.7])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 09:23:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: Declare sof_compress_ops in sof-priv.h
Date: Thu, 24 Feb 2022 19:23:24 +0200
Message-Id: <20220224172324.17976-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

Fix the following sparse error:
sound/soc/sof/compress.c:310:25: error: symbol 'sof_compressed_ops' was not declared. Should it be static?

Do not enable set the pd->compress_ops yet as it is not a valid assumption
that real compress support really works when CONFIG_SND_SOC_SOF_COMPRESS
is set as the HDA Probes support also selects it, but compressed audio
is not supported (yet) on Intel platforms.

Fixes: 6324cf901e14c ("ASoC: SOF: compr: Add compress ops implementation")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2c8e556cd5cc..2e19ac619ad5 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -497,6 +497,11 @@ void snd_sof_complete(struct device *dev);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
+/*
+ * Compress support
+ */
+extern struct snd_compress_ops sof_compressed_ops;
+
 /*
  * Firmware loading.
  */
-- 
2.35.1

