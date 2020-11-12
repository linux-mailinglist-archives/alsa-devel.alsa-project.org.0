Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF0E2B0A0F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBB11829;
	Thu, 12 Nov 2020 17:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBB11829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198870;
	bh=Jq9yep9SjtQ6NsP9eT3sZ+o0MSOP+zUSFeFaoLF6DfI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJq/f/Wgp2MtvwMwfE/ZsO4IkpHlRl+OziDye0KoOiXTLEkji9uyH7YK5OLl/kqf6
	 FEw+tN2GrkkCyOOD9xgKECnZACYPoW8ioi8e70btKq62P2alvJA6rgj0r8uNGAV+Rt
	 1WpDiiANuHFGQQPBsZyzmM3w5xyFQJoRnlKXPsKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D525F804F2;
	Thu, 12 Nov 2020 17:31:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04E12F804F3; Thu, 12 Nov 2020 17:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86960F80290
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86960F80290
IronPort-SDR: pbS2O/0IJMOOew1iMGVaaQxWQKL+vWrt1SABlTFVy091VJpUi3zD6gGvU45FqId404/qCMLMvz
 l0u/UQvdRs2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="231956990"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="231956990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:14 -0800
IronPort-SDR: /KzILCccjLA3MQF/ZMnhhfyjzJBfCYLMilvBB/R5kvTrMkjBNURyomm7qzDMQNSua1Hs9NzUQD
 CwQUe+VGYqAQ==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="532228320"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: Intel: atom: use inclusive language for SSP
 bclk/fsync
Date: Thu, 12 Nov 2020 10:30:59 -0600
Message-Id: <20201112163100.5081-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
References: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Use 'provider' and 'consumer' terms.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 12 ++++++------
 sound/soc/intel/atom/sst-atom-controls.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 6b5a34a15acb..335c32732994 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -827,14 +827,14 @@ static int sst_get_ssp_mode(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	int format;
 
-	format = (fmt & SND_SOC_DAIFMT_MASTER_MASK);
+	format = (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 	dev_dbg(dai->dev, "Enter:%s, format=%x\n", __func__, format);
 
 	switch (format) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		return SSP_MODE_MASTER;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		return SSP_MODE_SLAVE;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		return SSP_MODE_PROVIDER;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		return SSP_MODE_CONSUMER;
 	default:
 		dev_err(dai->dev, "Invalid ssp protocol: %d\n", format);
 	}
@@ -905,7 +905,7 @@ static const struct sst_ssp_config sst_ssp_configs = {
 	.ssp_id = SSP_CODEC,
 	.bits_per_slot = 24,
 	.slots = 4,
-	.ssp_mode = SSP_MODE_MASTER,
+	.ssp_mode = SSP_MODE_PROVIDER,
 	.pcm_mode = SSP_PCM_MODE_NETWORK,
 	.duplex = SSP_DUPLEX,
 	.ssp_protocol = SSP_MODE_PCM,
diff --git a/sound/soc/intel/atom/sst-atom-controls.h b/sound/soc/intel/atom/sst-atom-controls.h
index 620b48d2a064..23bf37544a8d 100644
--- a/sound/soc/intel/atom/sst-atom-controls.h
+++ b/sound/soc/intel/atom/sst-atom-controls.h
@@ -439,8 +439,8 @@ struct sst_cmd_tone_stop {
 } __packed;
 
 enum sst_ssp_mode {
-	SSP_MODE_MASTER = 0,
-	SSP_MODE_SLAVE = 1,
+	SSP_MODE_PROVIDER = 0,
+	SSP_MODE_CONSUMER = 1,
 };
 
 enum sst_ssp_pcm_mode {
-- 
2.25.1

