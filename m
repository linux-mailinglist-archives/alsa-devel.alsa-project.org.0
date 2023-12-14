Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E386A813D0B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 23:05:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E66A4E;
	Thu, 14 Dec 2023 23:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E66A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702591551;
	bh=VcFj4yuuuq0GgL3m44qtOovrR3DpUnSflb6MEzzui7k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TM2OxkBg3xIuIy8jschJWJ1xJO6cL8afbmxT9C2oeoaPjtCd/b/3v/1z7xJecNc5c
	 NKACUmxfFUnoOb4GPz3M8UTbx5ehXR2yWI1O2muCLQrG4Zhkn4cBzFjLWUU92gSI5R
	 bQjko2SZfY5T3nO5UPOiugl1hPbiZJE3uLmE6Jy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A892F8056F; Thu, 14 Dec 2023 23:05:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C216EF80570;
	Thu, 14 Dec 2023 23:05:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87D41F8016A; Thu, 14 Dec 2023 23:05:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id B525BF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 23:05:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B525BF8001F
Received: from fedori.lan (51b687c3.dsl.pool.telekom.hu
 [::ffff:81.182.135.195])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070E5B.00000000657B7C0C.0012CBE8;
 Thu, 14 Dec 2023 23:04:59 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: check the validity of prm_no/cfg_no
Date: Thu, 14 Dec 2023 23:04:44 +0100
Message-ID: 
 <523780155bfdca9bc0acd39efc79ed039454818d.1702591356.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: CZGBYBLFNNOQPMYETWIUTSPTFZLXCAYA
X-Message-ID-Hash: CZGBYBLFNNOQPMYETWIUTSPTFZLXCAYA
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZGBYBLFNNOQPMYETWIUTSPTFZLXCAYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add additional checks for program/config numbers to avoid loading from
invalid addresses.

If prm_no/cfg_no is negative, skip uploading program/config.

The tas2781-hda driver caused a NULL pointer dereference after loading
module, and before first runtime_suspend.

the state was:
tas_priv->cur_conf = -1;
tas_priv->tasdevice[i].cur_conf = 0;
program = &(tas_fmw->programs[-1]);

BUG: kernel NULL pointer dereference, address: 0000000000000010
Call Trace:
 <TASK>
 ? __die+0x23/0x70
 ? page_fault_oops+0x171/0x4e0
 ? vprintk_emit+0x175/0x2b0
 ? exc_page_fault+0x7f/0x180
 ? asm_exc_page_fault+0x26/0x30
 ? tasdevice_load_block_kernel+0x21/0x310 [snd_soc_tas2781_fmwlib]
 tasdevice_select_tuningprm_cfg+0x268/0x3a0 [snd_soc_tas2781_fmwlib]
 tasdevice_tuning_switch+0x69/0x710 [snd_soc_tas2781_fmwlib]
 tas2781_hda_playback_hook+0xd4/0x110 [snd_hda_scodec_tas2781_i2c]

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/soc/codecs/tas2781-fmwlib.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index eb55abae0d7b..1dfac9b2fca2 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2219,11 +2219,11 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 		goto out;
 	}
 
-	conf = &(tas_fmw->configs[cfg_no]);
 	for (i = 0, prog_status = 0; i < tas_priv->ndev; i++) {
 		if (cfg_info[rca_conf_no]->active_dev & (1 << i)) {
-			if (tas_priv->tasdevice[i].cur_prog != prm_no
-				|| tas_priv->force_fwload_status) {
+			if (prm_no >= 0
+				&& (tas_priv->tasdevice[i].cur_prog != prm_no
+				|| tas_priv->force_fwload_status)) {
 				tas_priv->tasdevice[i].cur_conf = -1;
 				tas_priv->tasdevice[i].is_loading = true;
 				prog_status++;
@@ -2258,7 +2258,8 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 	}
 
 	for (i = 0, status = 0; i < tas_priv->ndev; i++) {
-		if (tas_priv->tasdevice[i].cur_conf != cfg_no
+		if (cfg_no >= 0
+			&& tas_priv->tasdevice[i].cur_conf != cfg_no
 			&& (cfg_info[rca_conf_no]->active_dev & (1 << i))
 			&& (tas_priv->tasdevice[i].is_loaderr == false)) {
 			status++;
@@ -2268,6 +2269,7 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 	}
 
 	if (status) {
+		conf = &(tas_fmw->configs[cfg_no]);
 		status = 0;
 		tasdevice_load_data(tas_priv, &(conf->dev_data));
 		for (i = 0; i < tas_priv->ndev; i++) {
@@ -2311,7 +2313,7 @@ int tasdevice_prmg_load(void *context, int prm_no)
 	}
 
 	for (i = 0, prog_status = 0; i < tas_priv->ndev; i++) {
-		if (tas_priv->tasdevice[i].cur_prog != prm_no) {
+		if (prm_no >= 0 && tas_priv->tasdevice[i].cur_prog != prm_no) {
 			tas_priv->tasdevice[i].cur_conf = -1;
 			tas_priv->tasdevice[i].is_loading = true;
 			prog_status++;
@@ -2356,7 +2358,7 @@ int tasdevice_prmg_calibdata_load(void *context, int prm_no)
 	}
 
 	for (i = 0, prog_status = 0; i < tas_priv->ndev; i++) {
-		if (tas_priv->tasdevice[i].cur_prog != prm_no) {
+		if (prm_no >= 0 && tas_priv->tasdevice[i].cur_prog != prm_no) {
 			tas_priv->tasdevice[i].cur_conf = -1;
 			tas_priv->tasdevice[i].is_loading = true;
 			prog_status++;

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

