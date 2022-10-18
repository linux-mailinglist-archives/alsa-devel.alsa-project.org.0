Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C005602FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 17:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDED99F98;
	Tue, 18 Oct 2022 17:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDED99F98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666107029;
	bh=kqnkuzfD31G+sOGKQ1CN0ouN3pxkMCulp5C2J/kRlGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kDY0QNIvTvK8AeycI/suvAwmiHhx4GS+THJHnIEoAQkwf4ESd82enY87QMN+NeH9F
	 Ixrud9g7LRGUDlGBLmU+CSdw8v7v6dUk6mja2735Df5PiKuYdVkrhwppyqXxfZIH1C
	 Ef8gZbfYy1Bl0bEtSkkxG4jPv/deT5Q7e0+0RoMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5440CF800AA;
	Tue, 18 Oct 2022 17:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E24F8024C; Tue, 18 Oct 2022 17:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0114CF800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 17:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0114CF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EIqT9tBy"
Received: by mail-wr1-x434.google.com with SMTP id bv10so24131368wrb.4
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OcUgEYWsogjtXYmjJAjt9KOoJyA65cec5okYPWW3wOI=;
 b=EIqT9tBypYZiETkmd/KQhtgcdgf36aQXJriK/p4+mskN6WYba67CXLYKnXPkn7qaiW
 wZWEe6qt5/H/NfL0eTY6FEHeq8g06oTKMpehMKMkUHBrm/YTOkA1xmofn2wyR5nWkjv2
 hzhlmYqYOcHKM5+QxiVgGzjo/cdQUVv53geXwRgJTpxE4r7nwggD4pdzB5EM3G+7DkvA
 oqT3sUGzfdkonHCWtZ+DuH5cFCFGxMsfBrq167jelkmbEvrD16dXTQvtj//LtfcW3lVu
 foeJoeB7s9mGxfXO1FxOPGoT2ElhRfUae0le/PIihAZZnYXnpVzaSaM0ffDtnRuujYJ3
 63JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OcUgEYWsogjtXYmjJAjt9KOoJyA65cec5okYPWW3wOI=;
 b=KQbr+BXWjC0IN4cLk6BOKbH1i77Wql5Q8PZNUMUG8aujeZXwyfvSl7lxkLfhw7C7u+
 r5LN9qGKRv463XNne68Gmcc6jS7n+S/x8bvaiqXcnu4EVufomMaqm0OCc46oKjCytBIj
 VF92NzslEK1J0xrMmNeGqAAhh4JDWTQjKtSlZZlcVi9ipm/a+uUHYZoSU5HG+rF94pVy
 usDeP0EknKq8xkfoAcFE49C/OKj9XWirzBCJ2v/kOsfReGRJlsMMZuJqH7MSYBnu+etD
 v3Fm12Emi+vincVMS61R0anNIglalpYjHJG1ioewZud3+DnkQ1/jvVCiNtuzjRr7pHS3
 04ZA==
X-Gm-Message-State: ACrzQf3g1oHTZMfU8NBZA3avO9ehEElpbR6Gl8VRyWLxxKv3Nra0M79f
 iKGuX/Gf8xS5TmddEliPiAI=
X-Google-Smtp-Source: AMsMyM7io7Q5lPf+K/noqHzklRH19otd294uVn3Z0/nAt187zLdS6NOS9BxV2da82p3UsfzvVP54ZQ==
X-Received: by 2002:a5d:5a11:0:b0:22e:3ed1:e426 with SMTP id
 bq17-20020a5d5a11000000b0022e3ed1e426mr2254890wrb.642.1666106969765; 
 Tue, 18 Oct 2022 08:29:29 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 x6-20020a5d54c6000000b0022e2c38f8basm11194074wrv.14.2022.10.18.08.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:29:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: twl4030: make read-only array ramp_base static const
Date: Tue, 18 Oct 2022 16:29:28 +0100
Message-Id: <20221018152928.942186-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only array ramp_base on the stack but
instead make it static const. Also makes the object code a
little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/twl4030.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index e48768233e20..9c50ac356c89 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -700,8 +700,10 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
 	struct twl4030_board_params *board_params = twl4030->board_params;
 	/* Base values for ramp delay calculation: 2^19 - 2^26 */
-	unsigned int ramp_base[] = {524288, 1048576, 2097152, 4194304,
-				    8388608, 16777216, 33554432, 67108864};
+	static const unsigned int ramp_base[] = {
+		524288, 1048576, 2097152, 4194304,
+		8388608, 16777216, 33554432, 67108864
+	};
 	unsigned int delay;
 
 	hs_gain = twl4030_read(component, TWL4030_REG_HS_GAIN_SET);
-- 
2.37.3

