Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B1559830
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B71818BD;
	Fri, 24 Jun 2022 12:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B71818BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656067885;
	bh=0bsT6+zl7D9tYSewyoYhG2yQHV7TkzKfgZdf20MGWxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nulS5upCUT8inn5CKQ2CJzQGx43L2oWtAhDNOChRjSkS1D+V+Iun/cUIBe5mMJ42t
	 y7ryqdinW5M3j4gew7isp1M5TZQ6AKqCvRlmz6WCGb/JTKM6HATRxa284eJqrTHH7k
	 U7Ge1fusaq28SSqS0STK7JLPV08MNdYSEXZ8AWS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD63F80570;
	Fri, 24 Jun 2022 12:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B552F80567; Fri, 24 Jun 2022 12:48:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EF78F80567
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF78F80567
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 7E57F50457B;
 Fri, 24 Jun 2022 10:47:25 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 7/8] ASoC: max98396: Implement DSP speaker monitor
Date: Fri, 24 Jun 2022 12:47:11 +0200
Message-Id: <20220624104712.1934484-8-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624104712.1934484-1-daniel@zonque.org>
References: <20220624104712.1934484-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Allow the selection of the TDM slot that is used to send back speaker
monitor data. The DT property adi,spkfb-slot-no can be used to configure
this setting which defaults to 2.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 sound/soc/codecs/max98396.c | 8 ++++++++
 sound/soc/codecs/max98396.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 0a1d98279a3e..f28831f4e74b 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1377,6 +1377,9 @@ static int max98396_probe(struct snd_soc_component *component)
 	regmap_write(max98396->regmap,
 		     MAX98396_R2045_PCM_TX_CTRL_2,
 		     max98396->i_slot);
+	regmap_write(max98396->regmap,
+		     MAX98396_R204A_PCM_TX_CTRL_7,
+		     max98396->spkfb_slot);
 
 	if (max98396->v_slot < 8)
 		if (max98396->device_id == CODEC_TYPE_MAX98396)
@@ -1552,6 +1555,11 @@ static void max98396_read_device_property(struct device *dev,
 	else
 		max98396->i_slot = 1;
 
+	if (!device_property_read_u32(dev, "adi,spkfb-slot-no", &value))
+		max98396->spkfb_slot = value & 0xF;
+	else
+		max98396->spkfb_slot = 2;
+
 	if (!device_property_read_u32(dev, "adi,bypass-slot-no", &value))
 		max98396->bypass_slot = value & 0xF;
 	else
diff --git a/sound/soc/codecs/max98396.h b/sound/soc/codecs/max98396.h
index 8fa081f5d2d3..ff330ef61568 100644
--- a/sound/soc/codecs/max98396.h
+++ b/sound/soc/codecs/max98396.h
@@ -303,6 +303,7 @@ struct max98396_priv {
 	struct regulator *pvdd, *vbat;
 	unsigned int v_slot;
 	unsigned int i_slot;
+	unsigned int spkfb_slot;
 	unsigned int bypass_slot;
 	bool interleave_mode;
 	unsigned int ch_size;
-- 
2.36.1

