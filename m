Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD5876A3F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A7EA4A;
	Fri,  8 Mar 2024 18:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A7EA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920433;
	bh=O2CrALeJMZN9i7u3qt4or2kEq0HlxKtNqWa/kAbEuNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgIZx0CQ3SVKkrUFYzqXiTyy/Lx2dPlDgtjCoMJiWZFJtIX2ELv+n261ouGTu7tu1
	 OFwHlNFMHXZJupLZCkkNAdBfbV+qy7G5k0UiVCHD+ay1PjAyGpzJ+LwGIa4i/HpmKV
	 mo5oPBINv29LeE741GpRQoX+LgZmsLfJjgp4qazU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA27FF8065A; Fri,  8 Mar 2024 18:52:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6691AF80601;
	Fri,  8 Mar 2024 18:52:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42834F801F5; Fri,  8 Mar 2024 18:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id CE7C6F802E8
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE7C6F802E8
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000076814.0000000065EB4DF1.0020A5D8;
 Fri, 08 Mar 2024 18:42:08 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 4/5] ALSA: hda/tas2781: do not call pm_runtime_force_* in
 system_resume/suspend
Date: Fri,  8 Mar 2024 18:41:43 +0100
Message-ID: 
 <d0b4cc1248b9d375d59c009563da42d60d69eac3.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 3SP6NRV6NPJZMUDGIAYDZXODUFDLVQW5
X-Message-ID-Hash: 3SP6NRV6NPJZMUDGIAYDZXODUFDLVQW5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SP6NRV6NPJZMUDGIAYDZXODUFDLVQW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The runtime_resume function calls prmg_load and apply_calibration
functions, but system_resume also calls them, so calling
pm_runtime_force_resume before reset is unnecessary.

For consistency, do not call the pm_runtime_force_suspend in
system_suspend, as runtime_suspend does the same.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0e61e872bb71..a99f490c6a23 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -870,14 +870,9 @@ static int tas2781_runtime_resume(struct device *dev)
 static int tas2781_system_suspend(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	int ret;
 
 	dev_dbg(tas_hda->priv->dev, "System Suspend\n");
 
-	ret = pm_runtime_force_suspend(dev);
-	if (ret)
-		return ret;
-
 	mutex_lock(&tas_hda->priv->codec_lock);
 
 	/* Shutdown chip before system suspend */
@@ -895,14 +890,10 @@ static int tas2781_system_suspend(struct device *dev)
 static int tas2781_system_resume(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	int i, ret;
+	int i;
 
 	dev_dbg(tas_hda->priv->dev, "System Resume\n");
 
-	ret = pm_runtime_force_resume(dev);
-	if (ret)
-		return ret;
-
 	mutex_lock(&tas_hda->priv->codec_lock);
 
 	for (i = 0; i < tas_hda->priv->ndev; i++) {
-- 
2.44.0

