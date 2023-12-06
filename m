Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD65807CB3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D06BC0;
	Thu,  7 Dec 2023 01:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D06BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907525;
	bh=D8IDousXVKtntjsIYx+Z9hInitLINSkrl3UjBkroVfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=chxOEIj3Z/Q2HKCNLY6qX8pCFb9Yce1Xw99ND4/N6rUsP/ip88p4sw2291TjchnNZ
	 9RDHeuUorEi/0UYYtlzDZmk2tdnOOO5YWfKeLLTn6Xn1pQz/gpR9IMC8eAKq2HQCOe
	 cNSLxxox0zwcjmbjqSCJwMcJSDE4HCKw2BK1oLdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0D71F805E2; Thu,  7 Dec 2023 01:04:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF207F805E7;
	Thu,  7 Dec 2023 01:04:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7CBCF80557; Thu,  7 Dec 2023 01:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 99525F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99525F800AC
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716DF.0000000065710B02.00119017;
 Thu, 07 Dec 2023 01:00:02 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 02/16] ALSA: hda/tas2781: leave hda_component in usable state
Date: Thu,  7 Dec 2023 00:59:43 +0100
Message-ID: 
 <1be369f5a007c9f77bce7a33748ef428152894d7.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: B4NFEE62THEBY6QSNCFPY4GGYWW7YLLH
X-Message-ID-Hash: B4NFEE62THEBY6QSNCFPY4GGYWW7YLLH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4NFEE62THEBY6QSNCFPY4GGYWW7YLLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unloading then loading the module causes a panic.
Set only previously modified fields to null.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..077a01521eef 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -613,8 +613,11 @@ static void tas2781_hda_unbind(struct device *dev,
 	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
 
-	if (comps[tas_priv->index].dev == dev)
-		memset(&comps[tas_priv->index], 0, sizeof(*comps));
+	if (comps[tas_priv->index].dev == dev) {
+		comps[tas_priv->index].dev = NULL;
+		strscpy(comps->name, "", sizeof(comps->name));
+		comps[tas_priv->index].playback_hook = NULL;
+	}
 
 	tasdevice_config_info_remove(tas_priv);
 	tasdevice_dsp_remove(tas_priv);
-- 
2.43.0

