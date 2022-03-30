Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A44EC0DA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65FCB18C7;
	Wed, 30 Mar 2022 13:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65FCB18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641321;
	bh=qMSq2ZM7H+t3XIYKOQd73sqX230ds6e20YdaLYU4CE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GsM+TzKMefJvHAh4ees5WBn7vQsBYxMEK4FMl7Pn91kMkZjHyURv6SzS6hFDZqMHk
	 80nvGYBIDvXNwXRwu61x9bczDQnOi8jYR665XqF9aKNUIGCRGaD+mE/oL4OKMbGA0B
	 mdxey62HpR5mIxWoSh8IwQR+SLctkB2nj48sOhvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D11FF8050F;
	Wed, 30 Mar 2022 13:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABC17F805DA; Wed, 30 Mar 2022 13:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FED1F805C9
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FED1F805C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X+Pc8kSf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8DB5B81C29;
 Wed, 30 Mar 2022 11:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06922C36AE3;
 Wed, 30 Mar 2022 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640925;
 bh=qMSq2ZM7H+t3XIYKOQd73sqX230ds6e20YdaLYU4CE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+Pc8kSfrsdtamEMikiNN2EfvAQ84TM2JNc+39J28G1kzot6loz236yEm+bKiGy/n
 I3GyZJIyqXkjzjUkMOcOcT4RhPiJS3+OdZDn50tjW7zKqSQ7nTrqf0edMMi/TlJK/u
 PMy8TQm9qWsSD9xMBAL5U8thzJnXM8vZU6d4bjD8IrwnjsI2o1zR+cVMKv+8a8iNNR
 6V+rtMvRW9BrlDYUb5dlGu5lls5BBDZmJEx2vAm5W4ec9gUhoLFtq7S6HNeBvdorT7
 91oc7GG+UsMhIMgRfhEvF1SOAF9HKhadcxAzetbBkH6MVt1HvdRZHdaI1dfsyqpRQH
 OtWpR2v03x0LQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 08/59] ASoC: SOF: Intel: match sdw version on
 link_slaves_found
Date: Wed, 30 Mar 2022 07:47:40 -0400
Message-Id: <20220330114831.1670235-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
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
index 25200a0e1dc9..fc88296ab898 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1200,7 +1200,7 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sdw_intel_slave_id *ids = sdw->ids;
 	int num_slaves = sdw->num_slaves;
-	unsigned int part_id, link_id, unique_id, mfg_id;
+	unsigned int part_id, link_id, unique_id, mfg_id, version;
 	int i, j, k;
 
 	for (i = 0; i < link->num_adr; i++) {
@@ -1210,12 +1210,14 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
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
 
@@ -1224,21 +1226,24 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 
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

