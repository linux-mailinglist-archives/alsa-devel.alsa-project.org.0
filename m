Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405120A589
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1596716E3;
	Thu, 25 Jun 2020 21:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1596716E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112594;
	bh=7UBUz8dsjP5698j26YtV2kUqLfyP0w56nlG3j4kCdjc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWti0cgBbdWEbrdDqrqdGds6hwSKk25Ejv/+ErZ+uG7lcTDog0l184Y7NisIq2fgn
	 qHc8FfQVzdT338wbKnYeiESFJOEFtKtO+MQECWyw2vS1+Adg4QIowLpv3V8lyWVLvf
	 IphxT22uLz9DfNOp8sbXx3mRwKrF1xHFOzUHxYBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA7AF802A1;
	Thu, 25 Jun 2020 21:13:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3309CF80277; Thu, 25 Jun 2020 21:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDDAF80137
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDDAF80137
IronPort-SDR: 1gKju1J3d2h+grzuac5DO7HqCpkbJw+mYUz0WZmPyrFcZl6gaQOGdYZqrH/vuAhcgZtolyVd4m
 eZ3NHlaylWoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120818"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:33 -0700
IronPort-SDR: uzRBCB+iqfdMZ6j7InY4IJXdzDXSufWYleGW2Y7jXu+TmMUi1UN9wx45v+c3f9iPaVeGtZFK3q
 vmadGQSIyB8A==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559473"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/17] ASoC: Intel: sof_sdw: add missing .owner field
Date: Thu, 25 Jun 2020 14:12:54 -0500
Message-Id: <20200625191308.3322-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

This field is required for ASoC cards. Not setting it will result in a
module->name pointer being NULL and generate problems such as

cat /proc/asound/modules
 0 (efault)

Reported-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: 52db12d193d4 ('ASoC: Intel: boards: add sof_sdw machine driver')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e1c1a8ba78e6..1bfd9613449e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -893,6 +893,7 @@ static const char sdw_card_long_name[] = "Intel Soundwire SOF";
 
 static struct snd_soc_card card_sof_sdw = {
 	.name = "soundwire",
+	.owner = THIS_MODULE,
 	.late_probe = sof_sdw_hdmi_card_late_probe,
 	.codec_conf = codec_conf,
 	.num_configs = ARRAY_SIZE(codec_conf),
-- 
2.20.1

