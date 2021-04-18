Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85713635BA
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 15:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A9B316AF;
	Sun, 18 Apr 2021 15:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A9B316AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618753823;
	bh=1PgFdV9G2QWDdVY4MaKTvreupi1RSiujyPWDLI79ZAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpKYIsrg1Yjbg1u+tgrVNaF3vZp1C2SJowf+z5cSM8omt21UKpq9cCE2r+8Z8rgv9
	 mfTY/kh5NMrYwdZbtniSIi/Cq5S8pDkt4G4+tBRJT9/mQkEAyeKiXPq9s9eO2kiul6
	 sjDH7UIkyYXWALXhcuz8aiBX/wRLUovIWt+mE4vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4DEF80168;
	Sun, 18 Apr 2021 15:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BFBF80273; Sun, 18 Apr 2021 15:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2F2DF80273
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 15:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F2DF80273
Received: by mail-qv1-f54.google.com with SMTP id dp18so11048969qvb.5
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 06:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2s1yyziAApLNMk5wHeYSLF57BtVllGzKRDg9f231Go=;
 b=iGOXBLoIdnzz9AxW3HEMihKIS2HSfX9imEuV3387pFI5+Xwu9skAMLxDOJ20L8QTMv
 pdK9FeXJB52gkUpYC/TdleeylFsF9mBAuiYP8r4yEtsZJBgIX0DKaEftrFBZjfToWiL8
 8aANghNYf51u3YUBS9C/FQcgsPX3a3MILMY9Ew1+Yjdyl59fI5Xv3mpb3BPz9AWFIxY1
 rU6XK7WT0e/LCKv9KRIgnQn4mIsfV3Jfxt3IBXfUuZ5ZSoM45likl4B9JyREIE9uo0TW
 asDYaTRuAzN3sWg3UOOgJDiswSaBBFt/ztkNSiyAgH572kZiWo/tQqT3+UQzYZ5IXxvV
 3E2Q==
X-Gm-Message-State: AOAM533xL0DTmo2H3r1lM2fgURu2Plq00ph0l1eECyPkv2IjbqNuFmhd
 z4lAX3colwquG4YWuQ+R/jc=
X-Google-Smtp-Source: ABdhPJyvY/4h1w1CFLpq3liDdP2Gm0Lr8cQNt5IW11+QoBDJ121UBaGRz2k3quHDp/fzjATFWNz0Ow==
X-Received: by 2002:a0c:f452:: with SMTP id h18mr12447612qvm.27.1618753622528; 
 Sun, 18 Apr 2021 06:47:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:184:417f:5b5f::f3be:e978])
 by smtp.gmail.com with ESMTPSA id p23sm3927937qtl.8.2021.04.18.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 06:47:02 -0700 (PDT)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: rt298: Configure combo jack for headphones
Date: Sun, 18 Apr 2021 09:46:56 -0400
Message-Id: <20210418134658.4333-4-david.ward@gatech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418134658.4333-1-david.ward@gatech.edu>
References: <20210418134658.4333-1-david.ward@gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Shuming Fan <shumingf@realtek.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario Limonciello <mario_limonciello@dell.com>
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

During jack detection, the combo jack is configured for a CTIA headset, and
then for an OMTP headset, while sensing the mic connection. If a mic is not
found in either case, the combo jack should be re-configured for headphones
only. This is consistent with the HDA driver behavior.

Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt298.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 32cc9b6287d2..c592c40a7ab3 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -267,11 +267,16 @@ static int rt298_jack_detect(struct rt298_priv *rt298, bool *hp, bool *mic)
 				msleep(300);
 				regmap_read(rt298->regmap,
 					RT298_CBJ_CTRL2, &val);
-				if (0x0070 == (val & 0x0070))
+				if (0x0070 == (val & 0x0070)) {
 					*mic = true;
-				else
+				} else {
 					*mic = false;
+					regmap_update_bits(rt298->regmap,
+						RT298_CBJ_CTRL1,
+						0xfcc0, 0xc400);
+				}
 			}
+
 			regmap_update_bits(rt298->regmap,
 				RT298_DC_GAIN, 0x200, 0x0);
 
-- 
2.31.1

