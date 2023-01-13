Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD76694F6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:04:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54640A73B;
	Fri, 13 Jan 2023 12:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54640A73B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673607844;
	bh=e1QC78rR4HTKqDhmLcw1pD1GEiCW3kyrm+s9+D5yXBE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EfzoMROc7mLpNR8ZbqMDY2FLm9slLYJH2L9d2R5HE5nytf2Dj20e5DrpASSnRWSFd
	 mYCSwblt6/w0STkD+OkHEHe0J3qDM7xvWNxnSOOayJLrnTSqBgjx6z+OkyGurePMiw
	 HBssE8T/5v29W7DRDwOJAHoWr/QmCapz4VHbaA5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA51CF802E8;
	Fri, 13 Jan 2023 12:02:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1076F80425; Fri, 13 Jan 2023 12:02:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7FE9F802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7FE9F802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N4TINUKG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673607741; x=1705143741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1QC78rR4HTKqDhmLcw1pD1GEiCW3kyrm+s9+D5yXBE=;
 b=N4TINUKGRs41TmMhlZNKKTC4zcDZImgIoDOWVCnWNjLY9K2sQsBY5M5u
 t/LgEJgZLSUUGJl+mbkPyI1w8biAi6FsK2E5QZLMDGOxwnjjvbVXSbKvw
 9bBqa0RpfsRO6674uyYTYIEnEZuRUV2mFhrYuHE5CccRN2atV2A+XJrS6
 Shlj/MZiGmpjDfR66f9zjgGXi6szQJExBs9q9bB38DPvZOchFx8EEAAzr
 OVkGN1s8859LZ90CzVcuSvPxNZjf02vhNghKhx0OSZcrau53CYFiWFLLJ
 2iKhF+hR4DEwmSZW7Dk9FDP3Qg1ZnQ43Im0L8J2yJnz1b/o4U/5JiVaGk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325228490"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="325228490"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="832039928"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="832039928"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2023 03:02:16 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: Intel: avs: Correctly access topology fiels
Date: Fri, 13 Jan 2023 20:03:09 +0100
Message-Id: <20230113190310.1451693-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
References: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fixes following warning:
sound/soc/intel/avs/topology.c:1636:20: sparse: sparse: restricted __le32 degrades to integer

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 5fee7a8ec06a..cdb4ec500261 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1633,7 +1633,7 @@ avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_
 	size_t block_size;
 	int ret;
 
-	switch (hdr->type) {
+	switch (le32_to_cpu(hdr->type)) {
 	case SND_SOC_TPLG_TYPE_MIXER:
 		tmc = container_of(hdr, typeof(*tmc), hdr);
 		tuples = tmc->priv.array;
-- 
2.25.1

