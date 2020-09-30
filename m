Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB827EC89
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 17:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AE51852;
	Wed, 30 Sep 2020 17:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AE51852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601479685;
	bh=lrhTGA06Yu+bY+ST4Bzf6fUqQRIwpBc1roWWnfDk/sw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bMdkEQslHmAGk4gU7COk7E4AJzJzuiuoyBGLRS+F5rZZXHfMONUrcMH+/EB5cyiCV
	 5Vxa2v5ZNvlbNVncJloCBcNRbXUdDm/bZ0ABq41yCPZn/2SlKIx2Uz+zoQ4EkLZoEG
	 i7r/B0egwxI964ZWVxyh7hCHxu4ArRxLGV/e7qk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAB6F802D2;
	Wed, 30 Sep 2020 17:24:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2348EF800AB; Wed, 30 Sep 2020 17:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D17F801D8
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 17:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D17F801D8
IronPort-SDR: SmIzqj3UPt2e2KlVl6aVnfIwjzXmKW3PX6tCUDtR6kdGdXN4Lrgg27WVR40CArG9dqNqHissks
 FPvXAHKkO5Ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150130974"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="150130974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 08:22:18 -0700
IronPort-SDR: QqJFiGkD7o7ep+b86cdSDwhxtKDI2t3SESVbp2dKsSltwzd+Q0wYybO5hgyZIYYUreL/WiuaOa
 5mDaseBZO4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="515114115"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2020 08:22:16 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: loader: handle all SOF_IPC_EXT types
Date: Wed, 30 Sep 2020 18:20:26 +0300
Message-Id: <20200930152026.3902186-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
References: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Do not emit a warning for extended firmware header fields that are
not used by kernel. This creates unnecessary noise to kernel logs like:

sof-audio-pci 0000:00:1f.3: warning: unknown ext header type 3 size 0x1c
sof-audio-pci 0000:00:1f.3: warning: unknown ext header type 4 size 0x10

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/loader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 68ed454f7ddf..ba9ed66f98bc 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -118,6 +118,11 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 		case SOF_IPC_EXT_CC_INFO:
 			ret = get_cc_info(sdev, ext_hdr);
 			break;
+		case SOF_IPC_EXT_UNUSED:
+		case SOF_IPC_EXT_PROBE_INFO:
+		case SOF_IPC_EXT_USER_ABI_INFO:
+			/* They are supported but we don't do anything here */
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown ext header type %d size 0x%x\n",
 				 ext_hdr->type, ext_hdr->hdr.size);
-- 
2.27.0

