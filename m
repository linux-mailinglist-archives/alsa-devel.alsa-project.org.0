Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CA7658A26
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 09:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214E1948B;
	Thu, 29 Dec 2022 09:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214E1948B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672301106;
	bh=pCGVHBfe1EhrOsCbongF5TLMWm45N4YH/7WU6J/v7K8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TnvasNV6L2LrqnXM4HdTqPOaxsvIzRzJYrJj2zSbOUMDb19vDk1x8KReuKCz+GEwz
	 HtD6wnlRXRXd6g9WNF5uVN8kfmFJiRN9wcvJAuTsO8NPYVnCompe7W0j+AsMp1adpq
	 p66jBmhWwEJCDOuuoh1GDloaYbrehFqSAR7xbKW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB30F804E7;
	Thu, 29 Dec 2022 09:04:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A34BF804E4; Thu, 29 Dec 2022 09:04:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 626CDF804D0
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 09:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626CDF804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fxENY/Wx
Received: by mail-pj1-x102d.google.com with SMTP id
 j8-20020a17090a3e0800b00225fdd5007fso8651306pjc.2
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 00:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KIiQNFKqzc7opQJ8ok0FfP39sLd9x5gpUsGJ8JTvp0=;
 b=fxENY/WxTKg7eKS46UKKzjcaEgaZMSAIt+Ys0flXSHONKVVDibA7JqN54SUBJLdBQW
 V5RCs11JLQz/M4GNr81/8s4fRvLBIgQeIpHfXHNMUgRAcRp4Kj8Nwg5n32JP41kTCk+p
 unFP7fkQA797WjqhRok4wwHbqejpy7xzm/4f0MjXR3S8jHGaM1CFnEbnckhDr4ULyBb7
 pN4RzdniMZXFgDM3+XED28/fKuvdn7Vg2gHlygbmglLe4Ro9h822/ACLAKlHH+tX8vTX
 lg+83a9cQpOE/nc+t3tcbnhTQ/S8ZOJ+5XMqVZ4XPR1+Gw0+6gxmVrNMxrTRhgPb6a2k
 CuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KIiQNFKqzc7opQJ8ok0FfP39sLd9x5gpUsGJ8JTvp0=;
 b=ZtLg1QmM2+IC27HE2UOhaHGqtEFtrIBwVrsCZg4o+CCUSrt36f1OeVoD4ZL/4EjcRc
 PAmbBLIfwdAJA3uDZeIr55t5sEckyOJLURx031O/Nt8S0hkBJYMR2Qx3jtHUKSfN8rTl
 3npGoEFnz//zKBV+YDcjptcXyZ3CJ8lVHbL/cTW7OztMHPlHWS9OEwwa0bV6zqXRWXky
 KsttTaAmVrL0482mrAZDcjaLYpqqAcU9cTNruilZM8yhjqujrh6u0TVsja4xMHZtsa6b
 l40p52MUH/xvfhPpnHXTZuYpQRsQ34YlvgGDml+y3O+UN4G+KUu6/8UTXlHJ9A3rSVaC
 KbJg==
X-Gm-Message-State: AFqh2kqKJCUCZWLhARFWhqOvCbxAnXVYd4wF5km+Zx4keMRB45DzdDyj
 Ng4gbpfrFKDdmEeqWfqxRHQ=
X-Google-Smtp-Source: AMrXdXs3S5oDblrRByIPHLBud9vtobVm0v+3RvFHKnj/1tUpoKvkA+II3DVZ10IefiUKE71/a55T0g==
X-Received: by 2002:a17:902:edc3:b0:189:5ef4:6ae9 with SMTP id
 q3-20020a170902edc300b001895ef46ae9mr26746572plk.45.1672301040510; 
 Thu, 29 Dec 2022 00:04:00 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:587:a2f0:9dda:bb2d:720c:85e8])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902784900b001895b2c4cf6sm12146987pln.297.2022.12.29.00.03.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Dec 2022 00:04:00 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: rt9120: Make dev PM runtime bind AsoC component PM
Date: Thu, 29 Dec 2022 16:03:53 +0800
Message-Id: <1672301033-3675-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, cy_huang@richtek.com,
 jeff_chang@richtek.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

RT9120 uses PM runtime autosuspend to decrease the frequently on/off
spent time. This exists one case, when pcm is closed and dev PM is
waiting for autosuspend time expired to enter runtime suspend state.
At the mean time, system is going to enter suspend, dev PM runtime
suspend won't be called. It makes the rt9120 suspend consumption
current not as expected.

This patch can fix the rt9120 dev PM issue during runtime autosuspend
and system suspend by binding dev PM runtime and ASoC component PM.

Fixes: 80b949f332e3 ("ASoC: rt9120: Use pm_runtime and regcache to optimize 'pwdnn' logic")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 644300e..fcf4fba 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -177,8 +177,20 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 	return 0;
 }
 
+static int rt9120_codec_suspend(struct snd_soc_component *comp)
+{
+	return pm_runtime_force_suspend(comp->dev);
+}
+
+static int rt9120_codec_resume(struct snd_soc_component *comp)
+{
+	return pm_runtime_force_resume(comp->dev);
+}
+
 static const struct snd_soc_component_driver rt9120_component_driver = {
 	.probe = rt9120_codec_probe,
+	.suspend = rt9120_codec_suspend,
+	.resume = rt9120_codec_resume,
 	.controls = rt9120_snd_controls,
 	.num_controls = ARRAY_SIZE(rt9120_snd_controls),
 	.dapm_widgets = rt9120_dapm_widgets,
-- 
2.7.4

