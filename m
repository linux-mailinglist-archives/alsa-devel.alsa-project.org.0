Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA728243FBA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714DD16BA;
	Thu, 13 Aug 2020 22:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714DD16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349720;
	bh=dz+U657feQ9gPqzRTJdxVipedjmlNcoU+ln4zlO4m6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTG1QJ8lYp9neYTcQWtlcLakVMRAMRDOeFP0AQnxa+4kyqurRN7ewdj6Br3egjf8s
	 fbX3fCVzo6h4yd66aEUXc52yxguKabj4NjsTP/13KVgn61IhQEAeyWM51DJQSMZtEU
	 16y13WprUou3t/Mg4g2+OKXymVVj1BjzVK81Cg5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C329F80371;
	Thu, 13 Aug 2020 22:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 147BCF80344; Thu, 13 Aug 2020 22:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4A35F802F8
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4A35F802F8
IronPort-SDR: jYQebbthZPPh24n2fH51wCBAolZ2Eiqgm7I7sKLXHicB6W1BgIc/UhGTLYdOwDmaDfCVvSjfQi
 Cm9mNj+0r3tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374682"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:11 -0700
IronPort-SDR: tfxV5a0FolKVR6dOypdUuV0RCLoh5XCTbc33IE9kTX6g1/AKl307rKEqmB5pqMGP6koCXFTxsS
 XXLDmy4c5+/g==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506331"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/21] ASoC: Intel: Skylake: skl-topology: remove redundant
 assignment
Date: Thu, 13 Aug 2020 15:01:46 -0500
Message-Id: <20200813200147.61990-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Fix cppcheck warning:

sound/soc/intel/skylake/skl-topology.c:2879:29: style: Variable
'block_size' is assigned a value that is never used. [unreadVariable]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 3928a1645820..40bee10b0c65 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -2876,7 +2876,7 @@ static int skl_tplg_get_pvt_data(struct snd_soc_tplg_dapm_widget *tplg_w,
 				struct skl_module_cfg *mconfig)
 {
 	struct snd_soc_tplg_vendor_array *array;
-	int num_blocks, block_size = 0, block_type, off = 0;
+	int num_blocks, block_size, block_type, off = 0;
 	char *data;
 	int ret;
 
-- 
2.25.1

