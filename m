Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B329807CAE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E417C83E;
	Thu,  7 Dec 2023 01:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E417C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907314;
	bh=bcRUY1YH7EBXOVng9EInExdJFJX7iChJlcvSKH98q9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCnRI+gCQFK+nnWW0vZj4G8dJiJMQiOgMdKeWjgN36KfrQ7QRrydtNfBbnUhxYlus
	 +vpe2kHkT9YdYCaDCtmdcq/cvcy4ZLHULjs01G8xM8u6RQVjBbhCQXoSgpf6xAkOzm
	 r0oVdKoimPPWZOQ26psnI+rM06pduZUMenFqedm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0A3CF80608; Thu,  7 Dec 2023 01:00:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A41A4F805E7;
	Thu,  7 Dec 2023 01:00:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5B73F8025F; Thu,  7 Dec 2023 01:00:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 17E9EF802E8
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E9EF802E8
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716E1.0000000065710B05.00119062;
 Thu, 07 Dec 2023 01:00:05 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 08/16] ASoC: tas2781: add configurable global_addr
Date: Thu,  7 Dec 2023 00:59:49 +0100
Message-ID: 
 <80d655881e1ef744a680f617b2b1105c44b62bad.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: LCMEQDABKVO6WLPXUG7VMVHR5SXA5PZI
X-Message-ID-Hash: LCMEQDABKVO6WLPXUG7VMVHR5SXA5PZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCMEQDABKVO6WLPXUG7VMVHR5SXA5PZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ability to handle global_addr of different
chip versions.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h         | 2 ++
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 1d3c71d7e68d..5f364e4d8995 100644
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
index c82ed2413fcb..7ebf5d7e4aac 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -72,7 +72,7 @@ static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
 
 	if (i2c_acpi_get_i2c_resource(ares, &sb)) {
 		if (tas_priv->ndev < TASDEVICE_MAX_CHANNELS &&
-			sb->slave_address != TAS2781_GLOBAL_ADDR) {
+			sb->slave_address != tas_priv->global_addr) {
 			tas_priv->tasdevice[tas_priv->ndev].dev_addr =
 				(unsigned int)sb->slave_address;
 			tas_priv->ndev++;
-- 
2.43.0

