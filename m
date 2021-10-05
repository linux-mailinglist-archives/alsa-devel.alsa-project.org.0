Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF394228AC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C80B1684;
	Tue,  5 Oct 2021 15:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C80B1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633441918;
	bh=6okTawUyTOxI3B3Z4YalRMWEYkJW/0Z3oG7uqjvHnbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXMimEZFwttdMguSXFh4MRMW/gPACAZNvx5T+sNxj33O4v8wNdFzc5+8Bf1xKNH+c
	 baGmhoLpNmU3Qp24uFbxwuJboR7WBbyIvgtdVuc9XgOPrDuSMen40sYmP8YIly8F+Z
	 4lmGSkNBusGjZbv3JbVR7Flhgc/mYueh245aFHVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E07F8010B;
	Tue,  5 Oct 2021 15:50:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6EE3F8027D; Tue,  5 Oct 2021 15:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54159F80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54159F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMxO7PnE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05654613D5;
 Tue,  5 Oct 2021 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633441827;
 bh=6okTawUyTOxI3B3Z4YalRMWEYkJW/0Z3oG7uqjvHnbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMxO7PnEjk5kvkUFYWQtpvk4pt0KNjT/ywawHG/OTf+DPZw39z+8fiHwJVg+r2sX1
 UQYXWsO7XRM2NvdG0FdXmiMV37fwWK8ea1CacmUeqpEj1Q/MQW7EdRvdCSBMZle85W
 eY5C2wsPT+N4KA/+1RFs07xshgkEK8qPcNICryWNcVAoVO2FzJScZnxkI40Em20uvE
 xo14Dc1ZuzdOY3klY12rp7epxNPZhShaUxIvbxBctGmmRY4hnG5JBTIdzlWBz8g411
 3PxjYZExYAKkYwcu+1Lo9bgpkkQch06YIwfbfaf9J3Ruf8crzZaLCSOq4SEsdTIK7u
 ob8nd48kus4zQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 03/40] ASoC: Intel: sof_sdw: tag SoundWire BEs as
 non-atomic
Date: Tue,  5 Oct 2021 09:49:42 -0400
Message-Id: <20211005135020.214291-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005135020.214291-1-sashal@kernel.org>
References: <20211005135020.214291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, libin.yang@intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, yang.jie@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, vamshi.krishna.gopal@intel.com,
 Rander Wang <rander.wang@intel.com>, yung-chuan.liao@linux.intel.com,
 Bard Liao <bard.liao@intel.com>, yong.zhi@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 58eafe1ff52ee1ce255759fc15729519af180cbb ]

The SoundWire BEs make use of 'stream' functions for .prepare and
.trigger. These functions will in turn force a Bank Switch, which
implies a wait operation.

Mark SoundWire BEs as nonatomic for consistency, but keep all other
types of BEs as is. The initialization of .nonatomic is done outside
of the create_sdw_dailink helper to avoid adding more parameters to
deal with a single exception to the rule that BEs are atomic.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Link: https://lore.kernel.org/r/20210907184436.33152-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1a867c73a48e..cb3afc4519cf 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -860,6 +860,11 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
 			      NULL, &sdw_ops);
+		/*
+		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
+		 * based on wait_for_completion(), tag them as 'nonatomic'.
+		 */
+		dai_links[*be_index].nonatomic = true;
 
 		ret = set_codec_init_func(link, dai_links + (*be_index)++,
 					  playback, group_id);
-- 
2.33.0

