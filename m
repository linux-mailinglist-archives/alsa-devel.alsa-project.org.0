Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA92D9D88
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 18:23:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B431750;
	Mon, 14 Dec 2020 18:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B431750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607966611;
	bh=eG9/GMTvJchdw+pXrydGe4pAJDbWOeBG/laqdsUTnT8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZNvo8xL8LGhp57Vf4EL3b6jjJyvIYnhKWA7w+f0Y29PKlFNxCNa8+Wp8r6cG8PCL9
	 Px3zfuUOOp0htEmclF3VXVGMiIcQwG06NjsxuJC4AKS2r2ak83fRyWse38EusNiOoB
	 U0bdww2jYgTgnGuw6RXZcoiRUAIOouSSAqyfJF8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0483F80240;
	Mon, 14 Dec 2020 18:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8BAF801F7; Mon, 14 Dec 2020 18:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE69CF80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 18:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE69CF80121
IronPort-SDR: x4V1C8Eyn7+b7MEsn4aYDcGHQkXjKdbKXHa9pbtkMblIedb4QErETQBWtrWvBDllYbareukSit
 C45yFlLBWeWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="154551702"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="154551702"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:21:42 -0800
IronPort-SDR: fuu9EzpOAj2MVMV7K1/JsMvQA8DXwjesD3XdafTjU0TGrF1CbKVVftZnhTBlOh3TcQR5nx1MvW
 o+gJrlPNQjXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="378195395"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 14 Dec 2020 09:21:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B606814A; Mon, 14 Dec 2020 19:21:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] catpt: Switch to use list_entry_is_head() helper
Date: Mon, 14 Dec 2020 19:21:38 +0200
Message-Id: <20201214172138.44267-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
v2: left the structure definition at its initial location (Cezary)
 sound/soc/intel/catpt/pcm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index e5d54bb1c42a..9d304b3a817f 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -331,7 +331,7 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct snd_soc_component *component = dai->component;
-	struct snd_kcontrol *pos, *kctl = NULL;
+	struct snd_kcontrol *pos;
 	const char *name;
 	int ret;
 	u32 id = stream->info.stream_hw_id;
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

