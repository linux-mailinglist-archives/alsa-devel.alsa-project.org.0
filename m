Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F161D879
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768111732;
	Sat,  5 Nov 2022 08:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768111732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667633149;
	bh=heA8aIGKnJusGG5KyheWks0zVN/Rvw9O0VN6zhPfBuo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ULOt6tWLrjMea4ZnrHUU8g9/imyM+QfdApTYcbOQc6vLshq47WxmY2sB7Ct+lNwgz
	 t7wUKdg6p4+esrL/mZUe+GeWxLZeOnSLo1a/ldZz/B92uC2An9IcBgxA4g2IbJJLaO
	 AAaEwqr79nCC8n9XrB5UWHm2oEKxgb5TriF8Q/v8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BA4F8087B;
	Sat,  5 Nov 2022 08:04:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A24AEF80448; Fri,  4 Nov 2022 21:29:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867DDF801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 21:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867DDF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=xianwang.io header.i=@xianwang.io
 header.b="Wz6o3Ssb"
Received: by mail-pf1-x434.google.com with SMTP id m6so5506918pfb.0
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xianwang.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dNuOKOg5TSGR3sEFnpto1NusoWdDGSQBWKpGFE9UhI8=;
 b=Wz6o3Ssb6qoQQb4wDttx51bVElUbeXinkynJ9AE/ddy1Aob9geCC7eWuA/BbexLl2C
 VozOESQYheDe8Uqx97e8NHSVy07RRsHPoJ25VBi0cRLnFTbH9UcknIws3N0klm+FmXCM
 olD8RIzsAkJS6SdEWbtbnvrD91GzJSwG5Z2LHI1+wtF2uyLoc7i03a254R/zMbj0+jsc
 pYaKo2awRcVHZOzaikb7OH0p/3jqnyQbeux6oIV2JQUPzLQlt8R67R3bNTAOr744CVLS
 ZZX+dypVpy4bKOEKwwKqJk6k9ank0qZKedIOM9QkET0C40aonV9ap4s9I5AdnY84DftN
 mmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNuOKOg5TSGR3sEFnpto1NusoWdDGSQBWKpGFE9UhI8=;
 b=Nu+ee3nuUavZ5DgPWlB8ryBXwkLtsT9mW3outRfdN6ieshP1gAMj1IYH3ff+A7L5Wq
 tHqX9BUCmrW7kogcsmB3duWkdZmFRorYxXFqpo9cy/2JieTAwMW9rEjZvy6xNcSUGBPQ
 BgAoePMZuWzMrKEVrDHSQu8M5I1LdJxBvINECUTpsQuEgoHX67YkWkQ5WVgXIK12X6yV
 rPJQcgNZKbJ7D7HcYpLX/CKXJ6nKv2PlMMs0AXLkISEUrnCqTVpfov6uijGKPy4R09Zm
 J7iVDKwjwc1yqboHXt407rZXbZuuz+ccfEbhIPcQCMhbpX+dUA6feAqqpeinXd7pJtzo
 NLXw==
X-Gm-Message-State: ACrzQf3SYkVEYJCYFoOYveraCGvkg/nCllqNc+oXHiXHtHilBjISd73u
 cCxF6g+N43jGlRiAa8gwyobyiw==
X-Google-Smtp-Source: AMsMyM6pF1IEuLJpCOWhcd/9mFu2k77dwgeQT5Ij3OZfPSun43ThrToOxj/+2bNwCeSyh1diar3UNA==
X-Received: by 2002:a63:5123:0:b0:46f:f329:c013 with SMTP id
 f35-20020a635123000000b0046ff329c013mr16440935pgb.428.1667593769432; 
 Fri, 04 Nov 2022 13:29:29 -0700 (PDT)
Received: from aurora.xw.lan (75-172-80-208.tukw.qwest.net. [75.172.80.208])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0017bb38e4588sm161464plk.135.2022.11.04.13.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 13:29:28 -0700 (PDT)
From: Xian Wang <dev@xianwang.io>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] patch_ca0132: add quirk for EVGA Z390 DARK
Date: Fri,  4 Nov 2022 13:29:13 -0700
Message-Id: <20221104202913.13904-1-dev@xianwang.io>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:30 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Xian Wang <dev@xianwang.io>
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

The Z390 DARK mainboard uses a CA0132 audio controller. The quirk is
needed to enable surround sound and 3.5mm headphone jack handling in
the front audio connector as well as in the rear of the board when in
stereo mode.

Page 97 of the linked manual contains instructions to setup the
controller.

Link: https://www.evga.com/support/manuals/files/131-CS-E399.pdf

Cc: stable@vger.kernel.org

Signed-off-by: Xian Wang <dev@xianwang.io>
---
 sound/pci/hda/patch_ca0132.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 9580fe00cbd9..0a292bf271f2 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1306,6 +1306,7 @@ static const struct snd_pci_quirk ca0132_quirks[] = {
 	SND_PCI_QUIRK(0x1458, 0xA026, "Gigabyte G1.Sniper Z97", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1458, 0xA036, "Gigabyte GA-Z170X-Gaming 7", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x3842, 0x1038, "EVGA X99 Classified", QUIRK_R3DI),
+	SND_PCI_QUIRK(0x3842, 0x1055, "EVGA Z390 DARK", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1102, 0x0013, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0018, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0051, "Sound Blaster AE-5", QUIRK_AE5),
-- 
2.38.1

