Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F86510552
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE4618F5;
	Tue, 26 Apr 2022 19:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE4618F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993786;
	bh=Xz0gUl4Bx5u4Y+l9HHNVcc6d0AlKgK/y89n3CH1QWWI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SH5KXY2osXzC+r/aeWCf8FJsex/Za8hrDqKTEGQ3VgyLI80a3D60jiz0HJErQjPDW
	 NcoJg38YZKFVWJM8/syEZYCDEZ+54hi/IrSjusoVh0lEE31uhTUUrNEUSVXz8I4Exv
	 8+XXMBdS5+XPzl79eRWZrvVBulccHH6gBfQpbov4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29394F8055A;
	Tue, 26 Apr 2022 19:18:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5989DF80534; Tue, 26 Apr 2022 19:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E387FF80527
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E387FF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SGOMp5hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993481; x=1682529481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xz0gUl4Bx5u4Y+l9HHNVcc6d0AlKgK/y89n3CH1QWWI=;
 b=SGOMp5hgk+ERMEWc/iifOatWj9XlQb5stn12VENAS/5JBBy10hbfTcdP
 9jhTuD6YM5QLHb3sD/0chNuZAUFkiR+fMpyG0Jd7225QdcrwHXzRhf5qS
 uo/FtzgvAyjXYMwXNke2BjPg2MpLD2bfuX2ULyxYihvbp47UNu3fiKzpF
 hrmDwNQKJFigqrKo3mKe+/eLu3O7danIg/u0c0YFfM9hG/vCdDFhYQ8sD
 EjulXQZQ75J4AnKiwfAb/i6SLugug3eDV0VQPqnRZiyEE807V7NuGlgjq
 Glro0fVKAn11qqi0wvrkJFVl2LPhVcw7nf6py/hzESFOz+zHqi1ikz58l Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807976"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431216"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/11] ASoC: SOF: pcm: remove unnecessary function declaration
Date: Tue, 26 Apr 2022 10:17:40 -0700
Message-Id: <20220426171743.171061-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

sof_pcm_setup_connected_widgets() can be a static function in pcm.c. No
need to declare it in the header.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 5 +++--
 sound/soc/sof/sof-audio.h | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 2d21e531ac4f..095ca0d9d5ae 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -82,8 +82,9 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
-				    struct snd_sof_pcm *spcm, int dir)
+static int
+sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
+				struct snd_sof_pcm *spcm, int dir)
 {
 	struct snd_soc_dai *dai;
 	int ret, j;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4deab3ded8a5..5967d034188a 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -502,7 +502,5 @@ int get_token_uuid(void *elem, void *object, u32 offset);
 int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum sof_tokens token_id,
 			  struct snd_sof_tuple *tuples, int num_tuples,
 			  size_t object_size, int token_instance_num);
-int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
-				    struct snd_sof_pcm *spcm, int dir);
 u32 vol_compute_gain(u32 value, int *tlv);
 #endif
-- 
2.25.1

