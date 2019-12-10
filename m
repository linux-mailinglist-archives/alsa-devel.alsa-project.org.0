Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9D118BDA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C49116DF;
	Tue, 10 Dec 2019 16:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C49116DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990081;
	bh=4UZXgs/23W5IiHXMn4fy9kPtB6cT0sRLWTk2JOCr0d4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cODlpUTYZbxgHaFbtw8PSCy/vm3Wwu1pina+2QV+W7E039OqlJBT9IP3NhTghcSrv
	 kzTlyfuHyl1yqJWLR5lQSiDeupikNGpKY0gtAoXu//zemlrKWifYdKxGKCsaxYTJ4v
	 c5tHKPd3t4B00TRTRZgItdVTYKjD6Ak0R8yIQt40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EFBF80264;
	Tue, 10 Dec 2019 15:54:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 028B0F80254; Tue, 10 Dec 2019 15:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78DDAF80248
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DDAF80248
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CEE6AE09;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:50 +0100
Message-Id: <20191210145406.21419-8-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH for-5.6 07/23] ASoC: intel: Drop superfluous
	ioctl PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 1 -
 sound/soc/intel/baytrail/sst-baytrail-pcm.c  | 1 -
 sound/soc/intel/haswell/sst-haswell-pcm.c    | 1 -
 sound/soc/intel/skylake/skl-pcm.c            | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 08aa46ba5b07..340bd2be39a7 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -682,7 +682,6 @@ static const struct snd_soc_component_driver sst_soc_platform_drv  = {
 	.probe		= sst_soc_probe,
 	.remove		= sst_soc_remove,
 	.open		= sst_soc_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.trigger	= sst_soc_trigger,
 	.pointer	= sst_soc_pointer,
 	.compr_ops	= &sst_platform_compr_ops,
diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
index a4435306325a..53383055c8dc 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
@@ -359,7 +359,6 @@ static const struct snd_soc_component_driver byt_dai_component = {
 	.probe		= sst_byt_pcm_probe,
 	.open		= sst_byt_pcm_open,
 	.close		= sst_byt_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= sst_byt_pcm_hw_params,
 	.trigger	= sst_byt_pcm_trigger,
 	.pointer	= sst_byt_pcm_pointer,
diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index 59c63ccc7bb3..033d7c05d7fb 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -1102,7 +1102,6 @@ static const struct snd_soc_component_driver hsw_dai_component = {
 	.hw_params	= hsw_pcm_hw_params,
 	.trigger	= hsw_pcm_trigger,
 	.pointer	= hsw_pcm_pointer,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pcm_construct	= hsw_pcm_new,
 	.controls	= hsw_volume_controls,
 	.num_controls	= ARRAY_SIZE(hsw_volume_controls),
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ce14fa735d73..355165fd6b6a 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1464,7 +1464,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.probe		= skl_platform_soc_probe,
 	.remove		= skl_platform_soc_remove,
 	.open		= skl_platform_soc_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.trigger	= skl_platform_soc_trigger,
 	.pointer	= skl_platform_soc_pointer,
 	.get_time_info	= skl_platform_soc_get_time_info,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
