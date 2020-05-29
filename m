Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A011E8887
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 22:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CF4178D;
	Fri, 29 May 2020 22:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CF4178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590782806;
	bh=rshrMWFxhctd2BrBBIppSogAD3BxbyiW8l8TgwQEE2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=noZMgXCjSTDUI44W/0augCXA+2j4yiDm0le5TDQwu1EzLYMg9Oy7dx5La2gHPTi2J
	 lv6ZH1SsMCJIV3y8mcT0m/DDQXRFgs7Xpz0vYp76lDCJL9tnV43N7PhGvLYKadprZD
	 hznaGid+IDZcFS/2vLeCnVfEUY4ApfON0Y0EXkOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF2FF80149;
	Fri, 29 May 2020 22:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C25AF8014E; Fri, 29 May 2020 22:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AEEEF800FF;
 Fri, 29 May 2020 22:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEEEF800FF
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M2w0K-1ji3Z20ocG-003PJQ; Fri, 29 May 2020 22:04:36 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: SOF: Intel: byt: fix unused-function warnings
Date: Fri, 29 May 2020 22:04:17 +0200
Message-Id: <20200529200433.19068-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jUReMJwwaY6kcLP8d5WAviKG5ZhIsqMuAyesMGtOt6TbqQ87Iry
 /dlkch7Ztvq4+lIzXoPe+JZcvA4RWdudO1zp4JkU3ktEl47OROaHsjby1O7osP4W4PFHPg0
 Z0wHJj852iT/cckPWhvLM0sJcrMjOw6OdjS/mCzFJ+l5Ad7dFZaFxRey7r23PGqXKd2Fvvf
 zjRuHhYDVoYTm4Sxc29ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y2JjzO58DcQ=:CcBshmwd0gDiOaTjoTIVio
 cYoDJ7AS356b9uCyDbDo/LhroWRbaz1A/aztPCHPKDvUhXmg6P4GxWvZ9ELfEqknGp2+sqtDP
 BEFqX3p2qu69HU0KWGbP67ycwwFYd4vPVf6iryxNhnIThfGosFWHBRHyCoZ9Tx3kCCtMKOeLu
 G2pSWz4b/j73vk7hsWOVRMX8Ejm/2GEyuhQQrmKN7XGvVEw0Ep0UTPzs2triyvUN/JUts90Dm
 GAkaWYdg+lbouIWCrxyN9BLnpJH4RQtd8Y24MsepID1Bmc+ownmXx0oC60bj6rJ2IyzdvWss8
 BXgnd1h+elHw2259j/BusKGWwIaFBXeBHVupmQ7P0rMDQJSRLa2ZPBVWhFu9yhnV6q+MMjgeR
 cRfoSSAK0deHw6Z9XuS2AwBjhTmc0lFJ/udBcqMkgVjwfvVUHVS1HK6KUQc1CMKZqmWdBWHKi
 hfjCz5ghmk93tkMhhBUlVzV1A5T4rliw1ot81PXtk3TKxqqtYrjW0cCEJwyU5uupKLJqD2qYM
 pkndx+Ym7skK6TRA/1krKSzlACmXeNpJ7nYifGEdWzCDJQoG/geJTD6ez1UZgKO/MoegriaR6
 NGNnh5xmQ03ySybtGGbKJn6tGxYonmgD3SNQ/XhwjRuGhHRtmm4zHUFssoh9MA6/E1MO93N56
 zRznCHbcYzoOmE8gQNWZYbYlaBEUr6I+Qf4HxU2XxvPic8lq035+sKpwmYL+c9HFCd7pFLQsf
 RDBt68PnJAEr36AEbPcO+PHbefSXwX+7cRqz07OuJQR9jL8A24E+P2nIe0bftostOjzlTEd3m
 PvZahy2dEOq46iv0CxnWJ3ktYHlXllBM/yQh1RqAfIKmWTN9cg=
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Keyon Jie <yang.jie@linux.intel.com>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Several functions in this driver are only referenced for baytrail-class
configurations and building configurations with only merrifield enabled
causes a warning:

sound/soc/sof/intel/byt.c:447:12: error: unused function 'byt_suspend' [-Werror,-Wunused-function]
static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
           ^
sound/soc/sof/intel/byt.c:454:12: error: unused function 'byt_resume' [-Werror,-Wunused-function]
static int byt_resume(struct snd_sof_dev *sdev)
           ^
sound/soc/sof/intel/byt.c:464:12: error: unused function 'byt_remove' [-Werror,-Wunused-function]
static int byt_remove(struct snd_sof_dev *sdev)

Move these into a corresponding #ifdef section.

Fixes: c691f0c6e267 ("ASoC: SOF: Intel: BYT: add .remove op")
Fixes: ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/byt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index e6ba8382b1de..6ae62a8a9daf 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -432,6 +432,7 @@ static void byt_set_mach_params(const struct snd_soc_acpi_mach *mach,
 	mach_params->platform = dev_name(dev);
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
 {
 	/* Disable Interrupt from both sides */
@@ -467,6 +468,7 @@ static int byt_remove(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+#endif
 
 /* Baytrail DAIs */
 static struct snd_soc_dai_driver byt_dai[] = {
-- 
2.26.2

