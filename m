Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E92D28CF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 11:28:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B948616E4;
	Tue,  8 Dec 2020 11:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B948616E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607423312;
	bh=nrE3ht7jRWXUJw7R1Ubycb7xBcr/h5q9KOWsKWfYMbo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RKe6LIupsBEVnVGnR8yd2iS3//QzFPcuIp10zr3jcVYapNkjteu+qY15zYOnxxbNc
	 YHCk5L5qJ2aRBlKyaQbQEaPYOabTsxTY4lRD/TrnNAUJolfD4IfGTIcBT2AAlyRzqq
	 Cn0DRQY3BM+mEgnMAM5j7iLG1E3WZVbwoQPDiRwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE5BDF80218;
	Tue,  8 Dec 2020 11:26:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BD0F8019D; Tue,  8 Dec 2020 11:26:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E17BF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 11:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E17BF800E1
IronPort-SDR: lHQa1dILTOx7TbVjRa8gSP7NmurLPwhDQVodU4k0dU/WPs7VLM/x8qYjnowCmUCv5rqxifRlbK
 FemceDTWwS6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="237971614"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="237971614"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:26:42 -0800
IronPort-SDR: Je5ThcFifQbHKcNjdF2lN9nE4KF2fcTzHUaZLA/vNAxz9fzYB5+2/PeZIdxD6HegCmdCeRGDyU
 8VtUM2JzXTUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="375877442"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2020 02:26:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9194716E; Tue,  8 Dec 2020 12:26:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Date: Tue,  8 Dec 2020 12:26:37 +0200
Message-Id: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Since we got list_entry_is_head() helper in the generic header,
we may switch catpt to use it. It removes the need in additional variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/catpt/pcm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index e5d54bb1c42a..1c7260db3238 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -331,10 +331,10 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct snd_soc_component *component = dai->component;
-	struct snd_kcontrol *pos, *kctl = NULL;
 	const char *name;
 	int ret;
 	u32 id = stream->info.stream_hw_id;
+	struct snd_kcontrol *pos;
 
 	/* only selected streams have individual controls */
 	switch (id) {
@@ -356,17 +356,15 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 
 	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
 		if (pos->private_data == component &&
-		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
-			kctl = pos;
+		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
 			break;
-		}
 	}
-	if (!kctl)
+	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
 		return -ENOENT;
 
 	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
-		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
-	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value);
+		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
+	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
 	return 0;
-- 
2.29.2

