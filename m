Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97C63AEE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 20:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353E4165D;
	Tue,  9 Jul 2019 20:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353E4165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562696863;
	bh=bhV++ctckW0gjg49ZhrxPpv5gXUSqgxQ1lXgCcsxErU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bD+KXtqEKUU6zZ3szVrTHVy5Q/5vKssm2kVmcNBDLN3DkSRJgR60RXuap7IAgOHK+
	 vFqRYYPP8kY9r1KAIEuH20UikvFKIIhG5yBpKmw5Ok+I8u1BzsCGcL+pNJgr+1/R1W
	 1lbxgicGU6zS94TYh5bARy9O/G1vo+5pD49zyX2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A73D3F80276;
	Tue,  9 Jul 2019 20:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30935F80274; Tue,  9 Jul 2019 20:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58A7BF800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 20:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58A7BF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dY0SKwLV"
Received: by mail-pf1-x442.google.com with SMTP id p184so9691494pfp.7
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=F53dI+T31MQO7QsmvZEQqUD+Bsf7Au5f6Ym6GihKyBU=;
 b=dY0SKwLV9k80CMp0A2x+iTnnhV5A92BoDgH5N8dKXZsQJo/haO6q4csQICb21yuckh
 UoHQx1dad/dqKIH5no1Q0PzDgicSMi7Y5RCJHrokKzaFn1A0jUIaCZEyYPEx/1O50Qqj
 EaVisjg4hQjAn7fvBEoThlflmA8uYcC+eluRgi0rKci9zKgK9q9hW49KSneUgU1uZFTX
 qUfI+GJsUpt2ojpAt1tD1dNxRyHN3xUFdvEW9T1s38tIAtBJ2Leab/lwjLq9eZWs75TB
 yMg2KLtL3F4aaIrioY7PRjrarbnUbrJMOcIs4N1wN6MtlaB47ttLlWxH++h7D2shfR+O
 b55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=F53dI+T31MQO7QsmvZEQqUD+Bsf7Au5f6Ym6GihKyBU=;
 b=S/DusJNjRRTkG6RDmhrjSk9uZdm3ZnP3WxSTifIQRbOM36fcU6PN9/RMqUdEVCmhJy
 FT1phAibpBfPeZ4sGjhbC4g1+4ygKLyPhQGw70qqPGSbhecSTrcokeVKrzR4kH0EMqAr
 gJv15QSsWTzPO+koM9351x6iZ3xJ12gZ/As4yCaPQDCMg78aS+JN/WCVEpueEAq/xeNu
 PJWCjiqRW5iseZDD0OUwrZ4qHoazbFuXWNVPf5l3txe9FIqao1914FxvWaZNg79c7NM9
 +p0iBKxKkG1BkVbKknohOIvTqJCVMVwEkDndmGwlunq8nW329r/WmJjB5uCFeVHMN/6N
 13Vg==
X-Gm-Message-State: APjAAAUAjfJFtdhqPZ5JFkk/WfU+lOrUYUjB7lrMKn089GmvXgQr86J+
 Uq1XeKAnZtdGAFv0xAG8hn0=
X-Google-Smtp-Source: APXvYqxPF2ZglfLFUEIjNK+xpEPSth8BelId/59gN0t4fpsSCcw0Ul22LI6xyEHQdp/Z7aYDfK8lIw==
X-Received: by 2002:a65:5888:: with SMTP id d8mr31623341pgu.124.1562696750983; 
 Tue, 09 Jul 2019 11:25:50 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id x13sm13084575pfn.6.2019.07.09.11.25.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 11:25:50 -0700 (PDT)
Date: Tue, 9 Jul 2019 23:55:43 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Shunli Wang <shunli.wang@mediatek.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20190709182543.GA6611@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: soc: codecs: mt6358: change return type
 of mt6358_codec_init_reg
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As mt6358_codec_init_reg function always returns 0 , change return type
from int to void.

fixes below issue reported by coccicheck
sound/soc/codecs/mt6358.c:2260:5-8: Unneeded variable: "ret". Return "0"
on line 2289

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/soc/codecs/mt6358.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 50b3fc5..c17250a 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -2255,10 +2255,8 @@ static struct snd_soc_dai_driver mt6358_dai_driver[] = {
 	},
 };
 
-static int mt6358_codec_init_reg(struct mt6358_priv *priv)
+static void mt6358_codec_init_reg(struct mt6358_priv *priv)
 {
-	int ret = 0;
-
 	/* Disable HeadphoneL/HeadphoneR short circuit protection */
 	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON0,
 			   RG_AUDHPLSCDISABLE_VAUDP15_MASK_SFT,
@@ -2285,8 +2283,6 @@ static int mt6358_codec_init_reg(struct mt6358_priv *priv)
 	/* set gpio */
 	playback_gpio_reset(priv);
 	capture_gpio_reset(priv);
-
-	return ret;
 }
 
 static int mt6358_codec_probe(struct snd_soc_component *cmpnt)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
