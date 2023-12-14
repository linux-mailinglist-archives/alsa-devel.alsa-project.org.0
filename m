Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B6813E4E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 00:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA60583E;
	Fri, 15 Dec 2023 00:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA60583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702596866;
	bh=xZznPeS9nklPnUe6Ss4fVrIMNyGCTI0RTL+SSBrcYMs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qNGXvfch2UQl03KDFpksy3aF5t2OQESUZaxuKTnF5szdXOL5FwsPJY27SIp2vng/K
	 Gop1fmCFI8PdJsceYbm8b2UJyFZzzkPXVx8ayncd+p4IEvoNgde76bmV4TrouqjfT0
	 eRVB9rwDgh6ZHRkLNzkjQnwbx8Bzvas8YsbVTDF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC3FF80579; Fri, 15 Dec 2023 00:33:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D962CF80571;
	Fri, 15 Dec 2023 00:33:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E50B5F8016A; Fri, 15 Dec 2023 00:33:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 71BB6F80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 00:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BB6F80114
Received: from fedori.lan (51b687c3.dsl.pool.telekom.hu
 [::ffff:81.182.135.195])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000710F7.00000000657B90D2.0012CE04;
 Fri, 15 Dec 2023 00:33:38 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: select program 0, conf 0 by default
Date: Fri, 15 Dec 2023 00:33:27 +0100
Message-ID: 
 <038add0bdca1f979cc7abcce8f24cbcd3544084b.1702596646.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: WXMG4IEHWXHLPYY6S77DKAW6CF5LCFS5
X-Message-ID-Hash: WXMG4IEHWXHLPYY6S77DKAW6CF5LCFS5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXMG4IEHWXHLPYY6S77DKAW6CF5LCFS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, cur_prog/cur_conf remains at the default value (-1), while
program 0 has been loaded into the amplifiers.

In the playback hook, tasdevice_tuning_switch tries to restore the
cur_prog/cur_conf. In the runtime_resume/system_resume,
tasdevice_prmg_load tries to load the cur_prog as well.

Set cur_prog and cur_conf to 0 if available in the firmware.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..e974510367e3 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -543,6 +543,10 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 	tasdevice_prmg_load(tas_priv, 0);
+	if (tas_priv->fmw->nr_programs > 0)
+		tas_priv->cur_prog = 0;
+	if (tas_priv->fmw->nr_configurations > 0)
+		tas_priv->cur_conf = 0;
 
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

