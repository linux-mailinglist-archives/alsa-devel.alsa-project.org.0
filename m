Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB85807CBC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95EA4DEE;
	Thu,  7 Dec 2023 01:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95EA4DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907592;
	bh=IORLyZHuQUUJEJrrgT0D5n2c1eIPRz0/S4XkUb2/NT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHuO0YJ/0KRsZ/l0KNgUPxsduyYfTa9D/kMJxYwbJh+Rp6+IAsZb+9UklcP7YftmY
	 XVdRNiPklWUtrW3tZ/gR9LgukQ+tm3q6qNbSprT/QNuzsA6lXNqV+8wotiH7Uemq/c
	 /FZnh0D4Y/0nD6nhWmkIr88G/UX3sgCJkpJ2FlxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A76E0F80688; Thu,  7 Dec 2023 01:05:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAABAF80651;
	Thu,  7 Dec 2023 01:04:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA01F8057B; Thu,  7 Dec 2023 01:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E19F6F8061B
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19F6F8061B
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071702.0000000065710C16.001190F6;
 Thu, 07 Dec 2023 01:04:38 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 14/16] ALSA: hda/tas2781: call cleaner functions only once
Date: Thu,  7 Dec 2023 01:04:30 +0100
Message-ID: 
 <a4ad1ddc5ba63c3304df294b92b3ce2455aa8e74.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: IDDKQQYCMNP2DETWAQ5XPRJSW7NFGIQW
X-Message-ID-Hash: IDDKQQYCMNP2DETWAQ5XPRJSW7NFGIQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDDKQQYCMNP2DETWAQ5XPRJSW7NFGIQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prevent double free if only the DSP firmware is missing

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0972345c15e5..cb8872e15bb0 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -660,11 +660,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tasdevice_apply_calibration(tas_priv);
 
 out:
-	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-		/*If DSP FW fail, kcontrol won't be created */
-		tasdevice_config_info_remove(tas_priv);
-		tasdevice_dsp_remove(tas_priv);
-	}
 	mutex_unlock(&tas_hda->priv->codec_lock);
 	if (fmw)
 		release_firmware(fmw);
-- 
2.43.0

