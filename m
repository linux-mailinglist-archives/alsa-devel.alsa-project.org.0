Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA52D5B56
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 14:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA331675;
	Thu, 10 Dec 2020 14:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA331675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607605896;
	bh=RloCOZ1mS9qShbBGvPnUerOnMg14SHidcYi1OxvdtE0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BeyHo4Ca2ajnsHDBwnKKd2nLJ7FpxlT4L+5RhxsJrbXw2MIybQfTiDx1XtmHmwCT9
	 oKSNErVG3bQW6/Pk3bJdl/8kgdfVhcdabeLHumSu5c/0mq6Og0F7y7qNDfwGEBcyW1
	 +owI8Nqt2z7uyvFYTpByt5j/mXHLOHcc3Fx6zu7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD2EF80218;
	Thu, 10 Dec 2020 14:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E84F8019D; Thu, 10 Dec 2020 14:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECAFCF800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 14:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAFCF800E1
IronPort-SDR: MhHuyz4oEBOnrbd2S3rK0/Jxezm8FnCCaET3gfIYf8zSu/91auZyV5CQk/ar8biSpWKjGdnHV5
 0CLCLorEMnuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="153483404"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="153483404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:09:45 -0800
IronPort-SDR: GOW0+5szMA3we/r+x2570MbhjMXscVOOIhfUm68W27hXl8Y1NIpoTwk46vklOF7tA2LBAnJiRO
 uGuVagDsMEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="376956654"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2020 05:09:43 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/2] ASoC: topology: Fix wrong size check
Date: Thu, 10 Dec 2020 10:25:40 -0500
Message-Id: <20201210152541.191728-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Dan reported that smatch reports wrong size check and after analysis it
is confirmed that we are comparing wrong value: pointer size instead of
array size. However the check itself is problematic as in UAPI header
there are two fields:

struct snd_soc_tplg_enum_control {
    (...)
    char texts[SND_SOC_TPLG_NUM_TEXTS][SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
    __le32 values[SND_SOC_TPLG_NUM_TEXTS * SNDRV_CTL_ELEM_ID_NAME_MAXLEN / 4];

the texts field is for names and the values one for values assigned to
those named fields, after analysis it becomes clear that there is quite
a lot overhead values than we may possibly name. So instead of changing
check to ARRAY_SIZE(ec->values), as it was first suggested, use
hardcoded value of SND_SOC_TPLG_NUM_TEXTS.

Link: https://lore.kernel.org/alsa-devel/X9B0eDcKy+9B6kZl@mwanda/
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index eb2633dd6454..7fb3a87ab860 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -889,10 +889,16 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 {
 	int i;
 
-	if (le32_to_cpu(ec->items) > sizeof(*ec->values))
+	/*
+	 * Following "if" checks if we have at most SND_SOC_TPLG_NUM_TEXTS
+	 * values instead of using ARRAY_SIZE(ec->values) due to the fact that
+	 * it is oversized for its purpose. Additionally it is done so because
+	 * it is defined in UAPI header where it can't be easily changed.
+	 */
+	if (le32_to_cpu(ec->items) > SND_SOC_TPLG_NUM_TEXTS)
 		return -EINVAL;
 
-	se->dobj.control.dvalues = devm_kzalloc(tplg->dev, le32_to_cpu(ec->items) *
+	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
 					   sizeof(u32),
 					   GFP_KERNEL);
 	if (!se->dobj.control.dvalues)
-- 
2.25.1

