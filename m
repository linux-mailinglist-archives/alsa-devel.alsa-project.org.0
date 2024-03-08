Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C550C876A3D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:53:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE0B84D;
	Fri,  8 Mar 2024 18:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE0B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920396;
	bh=Jw6H/X0CX/61elARNUFXKlsTxT779kTCRm/xhTeM5I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMSPkLlxL9+dSBKpd8MbSlM0ygY8TBMPc6hFE3zKlvCc54dM8MRbFPTil0aZw53DA
	 yltDAQr0MoTyQK4Eh17j7z44PlsD//9kGm3xbm3iUw/U95NyU06+7/De/ccLGpe11X
	 8UOFp9I/gTYjAHIFSG9yEDKCNOPVeorBFxfmWM7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E56DFF805E6; Fri,  8 Mar 2024 18:52:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5FDF805EC;
	Fri,  8 Mar 2024 18:51:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47AF4F8024E; Fri,  8 Mar 2024 18:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E534FF80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E534FF80093
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007680E.0000000065EB4DEF.0020A5B8;
 Fri, 08 Mar 2024 18:42:07 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 2/5] ALSA: hda/tas2781: add lock to system_suspend
Date: Fri,  8 Mar 2024 18:41:41 +0100
Message-ID: 
 <c666da13d4bc48cd1ab1357479e0c6096541372c.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: PXSSCIQM2DRVR2ESUL4MTARZ7XN2GXPC
X-Message-ID-Hash: PXSSCIQM2DRVR2ESUL4MTARZ7XN2GXPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXSSCIQM2DRVR2ESUL4MTARZ7XN2GXPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing lock around tasdevice_tuning_switch().

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index ee3e0afc9b31..750e49fbb91e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -885,9 +885,13 @@ static int tas2781_system_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	mutex_lock(&tas_hda->priv->codec_lock);
+
 	/* Shutdown chip before system suspend */
 	tasdevice_tuning_switch(tas_hda->priv, 1);
 
+	mutex_unlock(&tas_hda->priv->codec_lock);
+
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
 	 * However beyond this point, amps may be powered down.
-- 
2.44.0

