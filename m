Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FA7C93E7
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E455EA0;
	Sat, 14 Oct 2023 11:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E455EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275889;
	bh=iDgh8+hqjDp0pvxkmAn2oqaqQsfwik7NEJggNhN/9lg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D3IuEfztKWPvrwZt1ALMhxAeLiiBl6e857a1912v/Cmw+jCcx2J9O3RnImIFKse43
	 lcl5LOCObMhZCb2711flqEHxppe+KO/NqZH2JRPkf36YkLpZp2vzrK1GT9x2Az/XVT
	 k7dNsntyRlD8pumqKm6/38hiZOFRwqCY1VMnREnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC5EF805FA; Sat, 14 Oct 2023 11:27:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B3FF805F9;
	Sat, 14 Oct 2023 11:27:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D116EF802BE; Fri, 13 Oct 2023 13:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from vps19.webwerkers.nl (vps19.webwerkers.nl [136.144.231.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3615F8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 13:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3615F8019B
Received: from [89.255.59.226] (helo=server.mep)
	by vps19.webwerkers.nl with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <roy.chateau@mep-info.com>)
	id 1qrFwM-0005kS-DX; Fri, 13 Oct 2023 13:02:46 +0200
From: Roy Chateau <roy.chateau@mep-info.com>
To: 
Cc: roy.chateau@mep-info.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: tas2780: Fix log of failed reset via I2C.
Date: Fri, 13 Oct 2023 13:02:39 +0200
Message-Id: <20231013110239.473123-1-roy.chateau@mep-info.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: meptelco
X-MailFrom: roy.chateau@mep-info.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L2BEIRUVXZEZCSR6Q4YVLGHZZUJI3XK7
X-Message-ID-Hash: L2BEIRUVXZEZCSR6Q4YVLGHZZUJI3XK7
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:27:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2BEIRUVXZEZCSR6Q4YVLGHZZUJI3XK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correctly log failures of reset via I2C.

Signed-off-by: Roy Chateau <roy.chateau@mep-info.com>
---
 sound/soc/codecs/tas2780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 86bd6c18a944..41076be23854 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -39,7 +39,7 @@ static void tas2780_reset(struct tas2780_priv *tas2780)
 		usleep_range(2000, 2050);
 	}
 
-	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
+	ret = snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
 				TAS2780_RST);
 	if (ret)
 		dev_err(tas2780->dev, "%s:errCode:0x%x Reset error!\n",
-- 
2.39.2

