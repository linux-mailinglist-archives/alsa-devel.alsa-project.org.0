Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD9DCFC7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837C71672;
	Fri, 18 Oct 2019 22:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837C71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429456;
	bh=r3PY1T7oor1QDIah8EaeW2LTfK9DxhZS8GfzHiB3AAc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPFJaXQCFmMZSyhTCWUOWl/Nkuh6aGeDHmu92ojidSCBEQT0RB+A2WeHapYOeYl2p
	 v/mVBkvhETaOSNkuq1OeJHTtflM9ryjU3k7UwSeO5vpVogJnsk0xomQglq/h/Q7EsL
	 Xj+wimUVo785hNbxHh3wvl5mfW+qYyP5JKJnhHVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A5FF80672;
	Fri, 18 Oct 2019 22:05:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEA0BF80649; Fri, 18 Oct 2019 22:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B4DF80635
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B4DF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Vk3XU5X3"
Received: by mail-pg1-x542.google.com with SMTP id p12so3934957pgn.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aD+M4i5vP3wawO11rqq4jX4oqnbSNUf/P52hQ4zNkkE=;
 b=Vk3XU5X3JrH606B5k9R7che422KKOm4GGXRKshzpkcyDkPrS1iHZ7q/hE5Z7qkPvuE
 43V6xfLbsFhHUGJx1rAlSfVqX0b7FX9GktIHHgVYsJ7hzhWtPQUVcPBxkqDOjGUx5LT6
 Pej16datVEdFQ9VaIO5LF0YpG5hhHTTdHmspo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aD+M4i5vP3wawO11rqq4jX4oqnbSNUf/P52hQ4zNkkE=;
 b=IMGhX6iWzHMjtJwNzbPNrAi47e2k1iAkzdync/c25N+od2QquSfdqI9WpnwE9+VnK1
 oSGv/WUa49/f8ZfBnL+1o3wdh77sMibKwcWC2R47TBguN5rZOkty78k83JcrVn/lQuD2
 o3hOKcTrb0+qBDMm9voiKH3SCq5FUFhxtZALiFkyET2s94KKelseywce8PcnWWgUfnyS
 Rn7yM9Oe7DD4YvVUtp3asOvwb+WyWv3mWjyfvED1M4Thdq540ebfqsQAmY4W+WNSu2AH
 a+n88EV/mlHYg/Wp6r8vNSolrCg3dUXEeI8VRcRdowOA9MUSpGXB0zbdb0sD5BaseVp6
 axCQ==
X-Gm-Message-State: APjAAAUR6x0hUSZwx3ZKI1rERSWCi505TR/ffS+fZ2RWW7DA42kDM+DD
 JxBRXdhwRtSoM++K2pN+xG4V3MAWrXgx
X-Google-Smtp-Source: APXvYqyh2hgSv54xbiKgDEWjr15LFmJHYqWxjzANY12YkCisozQCtV33tTo2dN4w81KrPquVF5Duog==
X-Received: by 2002:a63:ee48:: with SMTP id n8mr12457385pgk.374.1571429112192; 
 Fri, 18 Oct 2019 13:05:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id a8sm7937952pfa.182.2019.10.18.13.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:11 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:43 -0700
Message-Id: <20191018200449.141123-7-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 06/12] ASoC: rt5677: Mark reg
	RT5677_PWR_ANLG2 as volatile
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

From: Ben Zhang <benzh@chromium.org>

The codec dies when RT5677_PWR_ANLG2(MX-64h) is set to 0xACE1
while it's streaming audio over SPI. The DSP firmware turns
on PLL2 (MX-64 bit 8) when SPI streaming starts.  However regmap
does not believe that register can change by itself. When
BST1 (bit 15) is turned on with regmap_update_bits(), it doesn't
read the register first before write, so PLL2 power bit is
cleared by accident.

Marking MX-64h as volatile in regmap solved the issue.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index abb83f2e9974f..7bf8d9fb88a5f 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -302,6 +302,7 @@ static bool rt5677_volatile_register(struct device *dev, unsigned int reg)
 	case RT5677_I2C_MASTER_CTRL7:
 	case RT5677_I2C_MASTER_CTRL8:
 	case RT5677_HAP_GENE_CTRL2:
+	case RT5677_PWR_ANLG2: /* Modified by DSP firmware */
 	case RT5677_PWR_DSP_ST:
 	case RT5677_PRIV_DATA:
 	case RT5677_ASRC_22:
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
