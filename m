Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36204EC04F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A4B17B5;
	Wed, 30 Mar 2022 13:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A4B17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648640930;
	bh=a+hYV3dWe1oVsX+cvNgh7RLaS51GSRre3hs0wbTB+k0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmW1cG3+IDwB/1qRrw6MiRVRhLcxb5VN7C0N9QWQneCz5CCrKyJ6ZDllKVWx1Rz/p
	 avJ7c2dq2H8cvGkfccqoChLW4rjdv07Y7gq8pxLx2mApXFRbaG8/VRjaOc89GIseer
	 P0BDrvlDrLiFwwIFAM8358lzE/Tkzzrfalczuw7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D614F80517;
	Wed, 30 Mar 2022 13:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEFA8F80253; Wed, 30 Mar 2022 13:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C0B0F80253
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0B0F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X2uP9fqI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 424236137A;
 Wed, 30 Mar 2022 11:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24E8C340EE;
 Wed, 30 Mar 2022 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640820;
 bh=a+hYV3dWe1oVsX+cvNgh7RLaS51GSRre3hs0wbTB+k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X2uP9fqI7ApUQ0nAdxfB5YEJN6Zh8mEKqA6lJar2pdp6t9KEPaVPrMMNLGrYhdSFb
 YZKR/jXe3nR+IXZQhpPgnLC/KArLyDGTxIBLWvbEtGRo0Ci7dmLwbBB5//pE1ObnQh
 LfgN/0DKXuc779kNuQYi4ZkkQ/LBj1vVzPydekM/fuVMeKcCr5KNxM+i6+Hz8cAFnd
 3eoK/SuxiIaoPazf1fw7syBdNo30OdYfrvH4ob+tgDOC/exVjIzCIx/LrVgFXnjIAm
 OpyvzM3MqFiCYJyyY71TGepgsre0njcnnQ7TUlnpd+j0Rz9BixfLnd3AfEeW27v1KK
 yK3HfSwAI682w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 08/66] ASoC: SOF: Intel: match sdw version on
 link_slaves_found
Date: Wed, 30 Mar 2022 07:45:47 -0400
Message-Id: <20220330114646.1669334-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Reddy Muralidhar <muralidhar.reddy@intel.com>,
 Rander Wang <rander.wang@intel.com>,
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

[ Upstream commit f67c0c0d3b9048d86ea6ae52e36a2b78c48f265d ]

Codecs with the same part id, manufacturer id and part id, but different
sdw version should be treated as different codecs. For example, rt711 and
rt711-sdca are different. So, we should match sdw version as well.

Reported-by: Reddy Muralidhar <muralidhar.reddy@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220120232157.199919-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1385695d7745..848d1d563170 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1188,7 +1188,7 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sdw_intel_slave_id *ids = sdw->ids;
 	int num_slaves = sdw->num_slaves;
-	unsigned int part_id, link_id, unique_id, mfg_id;
+	unsigned int part_id, link_id, unique_id, mfg_id, version;
 	int i, j, k;
 
 	for (i = 0; i < link->num_adr; i++) {
@@ -1198,12 +1198,14 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
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
 
@@ -1212,21 +1214,24 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 
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
2.34.1

