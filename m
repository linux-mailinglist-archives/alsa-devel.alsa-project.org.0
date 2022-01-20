Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071A4956F1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1315E2DF7;
	Fri, 21 Jan 2022 00:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1315E2DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642721035;
	bh=xvB+7rqhEVX0DmbenZ2BGHsDCkqgzkoHzfUlr/KRcWc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kChgPi3SB20PMjQK0YePK0Zxazz7wtvpX+4HNms2eVuH0txZaD1zqDmGmP2ERdPBX
	 502MjIAF9N8GUt86EO+O8JWMo1J0r7kXCORo5tKXJjila6ojYytWXofBui5qXN03fi
	 HzKDmZyHpS70ddooJ+/KapTB/uo0bMo4JJpUo2GA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31055F804BB;
	Fri, 21 Jan 2022 00:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209B9F800F2; Fri, 21 Jan 2022 00:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C1EDF800F2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1EDF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M4JniDK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720932; x=1674256932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xvB+7rqhEVX0DmbenZ2BGHsDCkqgzkoHzfUlr/KRcWc=;
 b=M4JniDK9f3Boflj8pEqA8eDb1jCW0B2O7XJKG/GQbkIfzjCPn5EXyqNR
 V5wWDc+FQrR3aNIP4oO4k3MgQKYyd6PTaYDHcONsNmPCQsbjfiHv4R/PZ
 j6Fo302K6FTSMpW1XOV4ZbsGPaHDB0zAVmOItdJ7hS+lO88Fz7Zx9rZic
 8f0gg5sEM8IVsmN1DonnqzES++1BG/hT2WMS2nroONn25Z9n2uIrVGwuK
 iY/JCZ/DstnGxacSKcW6WILwAPwJZ73xQ/nieludVBcN4DEuZskIhdUOC
 NCj0POblVS+Rmy95ABjaCw0YEZGwDoTvP1M+geAAvvVMrW9LISOZ3o180 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="269926951"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="269926951"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="493637718"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:22:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: match sdw version on link_slaves_found
Date: Thu, 20 Jan 2022 17:21:56 -0600
Message-Id: <20220120232157.199919-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
References: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Reddy Muralidhar <muralidhar.reddy@intel.com>,
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

Codecs with the same part id, manufacturer id and part id, but different
sdw version should be treated as different codecs. For example, rt711 and
rt711-sdca are different. So, we should match sdw version as well.

Reported-by: Reddy Muralidhar <muralidhar.reddy@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c8fb082209ce..67936be54ef7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1187,7 +1187,7 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sdw_intel_slave_id *ids = sdw->ids;
 	int num_slaves = sdw->num_slaves;
-	unsigned int part_id, link_id, unique_id, mfg_id;
+	unsigned int part_id, link_id, unique_id, mfg_id, version;
 	int i, j, k;
 
 	for (i = 0; i < link->num_adr; i++) {
@@ -1197,12 +1197,14 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 		mfg_id = SDW_MFG_ID(adr);
 		part_id = SDW_PART_ID(adr);
 		link_id = SDW_DISCO_LINK_ID(adr);
+		version = SDW_VERSION(adr);
 
 		for (j = 0; j < num_slaves; j++) {
 			/* find out how many identical parts were reported on that link */
 			if (ids[j].link_id == link_id &&
 			    ids[j].id.part_id == part_id &&
-			    ids[j].id.mfg_id == mfg_id)
+			    ids[j].id.mfg_id == mfg_id &&
+			    ids[j].id.sdw_version == version)
 				reported_part_count++;
 		}
 
@@ -1211,21 +1213,24 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 
 			if (ids[j].link_id != link_id ||
 			    ids[j].id.part_id != part_id ||
-			    ids[j].id.mfg_id != mfg_id)
+			    ids[j].id.mfg_id != mfg_id ||
+			    ids[j].id.sdw_version != version)
 				continue;
 
 			/* find out how many identical parts are expected */
 			for (k = 0; k < link->num_adr; k++) {
 				u64 adr2 = link->adr_d[k].adr;
-				unsigned int part_id2, link_id2, mfg_id2;
+				unsigned int part_id2, link_id2, mfg_id2, version2;
 
 				mfg_id2 = SDW_MFG_ID(adr2);
 				part_id2 = SDW_PART_ID(adr2);
 				link_id2 = SDW_DISCO_LINK_ID(adr2);
+				version2 = SDW_VERSION(adr2);
 
 				if (link_id2 == link_id &&
 				    part_id2 == part_id &&
-				    mfg_id2 == mfg_id)
+				    mfg_id2 == mfg_id &&
+				    version2 == version)
 					expected_part_count++;
 			}
 
-- 
2.25.1

