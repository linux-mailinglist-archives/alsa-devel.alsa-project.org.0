Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34855807CB5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:05:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04407F4;
	Thu,  7 Dec 2023 01:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04407F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907557;
	bh=7agwyfrV2/tGpeGABB7E96pR7l1zH5oZLdFLLUk+e3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kTGZBnuQYlDtyoaNOn3igTqT+uF63pz6nXhNLG+62Vq9ZNY8o5zlnXXrm1CdrQ33Z
	 Brd8Ft+ABai4sXmmRlDkVcdgOGv/oC9zunRqEDlbH4CzPwhzdDhgWnudzMwKaFffCk
	 ZjpEB67tLnrb5mtP+VVUG3Lr5ADcDbYRiKHJogEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB2FF80494; Thu,  7 Dec 2023 01:04:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DEF5F80587;
	Thu,  7 Dec 2023 01:04:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06014F80563; Thu,  7 Dec 2023 01:04:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 3FE45F80617
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE45F80617
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716F4.0000000065710C14.001190BB;
 Thu, 07 Dec 2023 01:04:36 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 11/16] ASoC: tas2781: use 0 as default prog/conf index
Date: Thu,  7 Dec 2023 01:04:27 +0100
Message-ID: 
 <88229933b7aaf0777cbe611979712e4e144b1ca1.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: ARKFXYBIXDER74YVUCYCDV463FHRZCPT
X-Message-ID-Hash: ARKFXYBIXDER74YVUCYCDV463FHRZCPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARKFXYBIXDER74YVUCYCDV463FHRZCPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Invalid indexes are not the best default values.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/soc/codecs/tas2781-comlib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index f914123c7284..635f97db033b 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -307,8 +307,8 @@ int tasdevice_init(struct tasdevice_priv *tas_priv)
 		goto out;
 	}
 
-	tas_priv->cur_prog = -1;
-	tas_priv->cur_conf = -1;
+	tas_priv->cur_prog = 0;
+	tas_priv->cur_conf = 0;
 
 	for (i = 0; i < tas_priv->ndev; i++) {
 		tas_priv->tasdevice[i].cur_book = -1;
-- 
2.43.0

