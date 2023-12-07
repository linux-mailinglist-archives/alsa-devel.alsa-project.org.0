Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2883807CB6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97123209;
	Thu,  7 Dec 2023 01:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97123209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907573;
	bh=1Y4OCCRvoRKWJS8uddwBtQlRP4WGgp/Ke0j7F0culUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5ygLuTi/v9LG8WOhtxUvEA7WnmZhbPTPtFPZEv31YurWOzKWcfzGwRr6NN3PRXph
	 ta60Xmf0qaL7HhKK5WeEiTfdvsTO0AdTJ/vtj9u6KO2q3pb3uS0GE8PWFa7vN2Sjzm
	 jVMWJr5PgP4xBIO3b98AZJ3RMZiLCEDRoYOyWUMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B7C9F805CB; Thu,  7 Dec 2023 01:04:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EFE2F805B1;
	Thu,  7 Dec 2023 01:04:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D320F80567; Thu,  7 Dec 2023 01:04:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 5B5FBF80587
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5FBF80587
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716E7.0000000065710C14.001190BA;
 Thu, 07 Dec 2023 01:04:36 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 10/16] ASoC: tas2781: check negative indexes
Date: Thu,  7 Dec 2023 01:04:26 +0100
Message-ID: 
 <a9ccb1760c5b525036a33b9528b651b409e727c2.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: XZY57JYCMO6LGYRZK5V7QGJSGBB7T6FZ
X-Message-ID-Hash: XZY57JYCMO6LGYRZK5V7QGJSGBB7T6FZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZY57JYCMO6LGYRZK5V7QGJSGBB7T6FZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Negative indexes are not valid here.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/soc/codecs/tas2781-fmwlib.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 20dc2df034e9..aa5f56f9ad33 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2198,21 +2198,21 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 		goto out;
 	}
 
-	if (cfg_no >= tas_fmw->nr_configurations) {
+	if (cfg_no < 0 || cfg_no >= tas_fmw->nr_configurations) {
 		dev_err(tas_priv->dev,
 			"%s: cfg(%d) is not in range of conf %u\n",
 			__func__, cfg_no, tas_fmw->nr_configurations);
 		goto out;
 	}
 
-	if (prm_no >= tas_fmw->nr_programs) {
+	if (prm_no < 0 || prm_no >= tas_fmw->nr_programs) {
 		dev_err(tas_priv->dev,
 			"%s: prm(%d) is not in range of Programs %u\n",
 			__func__, prm_no, tas_fmw->nr_programs);
 		goto out;
 	}
 
-	if (rca_conf_no >= rca->ncfgs || rca_conf_no < 0 ||
+	if (rca_conf_no < 0 || rca_conf_no >= rca->ncfgs ||
 		!cfg_info) {
 		dev_err(tas_priv->dev,
 			"conf_no:%d should be in range from 0 to %u\n",
@@ -2304,7 +2304,7 @@ int tasdevice_prmg_load(void *context, int prm_no)
 		goto out;
 	}
 
-	if (prm_no >= tas_fmw->nr_programs) {
+	if (prm_no < 0 || prm_no >= tas_fmw->nr_programs) {
 		dev_err(tas_priv->dev,
 			"%s: prm(%d) is not in range of Programs %u\n",
 			__func__, prm_no, tas_fmw->nr_programs);
@@ -2349,7 +2349,7 @@ int tasdevice_prmg_calibdata_load(void *context, int prm_no)
 		goto out;
 	}
 
-	if (prm_no >= tas_fmw->nr_programs) {
+	if (prm_no < 0 || prm_no >= tas_fmw->nr_programs) {
 		dev_err(tas_priv->dev,
 			"%s: prm(%d) is not in range of Programs %u\n",
 			__func__, prm_no, tas_fmw->nr_programs);
-- 
2.43.0

