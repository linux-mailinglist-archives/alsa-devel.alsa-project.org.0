Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B16167A30
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 11:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A237816B6;
	Fri, 21 Feb 2020 11:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A237816B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582279780;
	bh=7iv85r/E6IKQiugwycyCXOqnGFwdFq7etKvQyvCf8NM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/ereT89LcxVveMvy0VzUyIH+TdfK9Rs03iJcws281ConQ1uLpqpshVqSzeytOJNu
	 7W0e0d9C3cU9uNT/tm9l6iyrE0QuXshvMhqwKoTwIN/p9oJlhBw+L+IrG1LvIXVMKc
	 f5miZmN4H0BoZcpcviyjI690eri2iHwREcKDbm0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6928DF80114;
	Fri, 21 Feb 2020 11:07:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2482F8025F; Fri, 21 Feb 2020 11:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DCA4F800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 11:07:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A27FDA003F;
 Fri, 21 Feb 2020 11:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A27FDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582279672; bh=TH4JGpiyxD0qWDgfr66r7GV7RqB6a7jzO3/wgLcwVfQ=;
 h=From:To:Cc:Subject:Date:From;
 b=MNIUzmf2vlKATWsd8rJG/7S2aSFs3OKUau3/KieIL6/kbewV2agJFaLKVsFIRE4IG
 7GCZasutYtNYRj77y+l2ovAkI41ZtwPA2S2rhoBPH7m1m2b3pO6Hcc+ZoNddsSwX39
 Otlx/GvAQHKfaUTVIFaL7TsrsFYqYyvP+shM0JT8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 21 Feb 2020 11:07:47 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: SOF - topology - do not change the link trigger order
 for pre-1.4 firmware
Date: Fri, 21 Feb 2020 11:07:39 +0100
Message-Id: <20200221100739.3883842-1-perex@perex.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This patch is for SOF v1.3 firmware. The DSP firmware will crash (DSP oops)
without this patch. The 1.4.1 firmare has this issue fixed.

The ABI version is used for the comparison, because the firmware version
for the firmware files before 1.4.2 was not set properly (git hash was
used).

BugLink: https://github.com/thesofproject/sof/issues/2102
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9f4f8868b386..58ff4766b47b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3111,6 +3111,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct sof_ipc_dai_config config;
 	struct snd_soc_tplg_hw_config *hw_config;
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	int num_hw_configs;
 	int ret;
 	int i = 0;
@@ -3128,9 +3129,12 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	if (!link->no_pcm) {
 		link->nonatomic = true;
 
-		/* set trigger order */
-		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
-		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+		/* this causes DSP panic on firmware v1.3 */
+		if (v->abi_version > SOF_ABI_VER(3, 7, 0)) {
+			/* set trigger order */
+			link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
+			link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+		}
 
 		/* nothing more to do for FE dai links */
 		return 0;
-- 
2.24.1
