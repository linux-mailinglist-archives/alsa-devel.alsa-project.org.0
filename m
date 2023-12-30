Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DC8221BA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:07:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF30EAA;
	Tue,  2 Jan 2024 20:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF30EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222440;
	bh=v3L0Uh3dUWaaZ3RBoiuIPeva6hes+I4da8oBkP1fxEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C2ZFhFvKkUVSPiazOa79wkZ8slftNx+pY+o+hP8cfRWDNAi7n/tqmZghdXcoF/vwY
	 t6+h2uCw42Pk5MA/FU+OA7M50R0MIa87/60OuOmzgdNgV4FrBKm9NH7GZbwamDWDZi
	 6YDrbwI3HXK0DakDZdYb67yqTw0HMs0t8TACPnCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85384F805AA; Tue,  2 Jan 2024 20:06:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14ED0F805B1;
	Tue,  2 Jan 2024 20:06:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A95E2F8065A; Tue,  2 Jan 2024 19:59:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 06383F8067A
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06383F8067A
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EF2.00000000658F5FD0.0014D4A7;
 Sat, 30 Dec 2023 01:09:51 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 2/4] ALSA: hda/tas2781: add configurable global i2c address
Date: Sat, 30 Dec 2023 01:09:43 +0100
Message-ID: 
 <a252f1efeed5049f027f01e699c9e10e1e05bf9e.1703891777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703891777.git.soyer@irl.hu>
References: <cover.1703891777.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: X2PHCMTJH52WZTNALLCZATOHXPECHMUM
X-Message-ID-Hash: X2PHCMTJH52WZTNALLCZATOHXPECHMUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2PHCMTJH52WZTNALLCZATOHXPECHMUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make the global i2c address configurable to support compatible amplifiers
with different global i2c address.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h         | 2 ++
 sound/pci/hda/tas2781_hda_i2c.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index e17ceab4fead..dde9f8120d4c 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -121,6 +121,8 @@ struct tasdevice_priv {
 	bool force_fwload_status;
 	bool playback_started;
 	bool isacpi;
+	unsigned int global_addr;
+
 	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
 		const struct firmware *fmw, int offset);
 	int (*fw_parse_program_data)(struct tasdevice_priv *tas_priv,
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0f8d5f947f54..49477d17b07c 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -81,7 +81,7 @@ static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
 
 	if (i2c_acpi_get_i2c_resource(ares, &sb)) {
 		if (tas_priv->ndev < TASDEVICE_MAX_CHANNELS &&
-			sb->slave_address != TAS2781_GLOBAL_ADDR) {
+			sb->slave_address != tas_priv->global_addr) {
 			tas_priv->tasdevice[tas_priv->ndev].dev_addr =
 				(unsigned int)sb->slave_address;
 			tas_priv->ndev++;
@@ -699,6 +699,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		device_name = "TIAS2781";
 		tas_hda->priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->apply_calibration = tas2781_apply_calib;
+		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	} else
 		return -ENODEV;
 
-- 
2.43.0

