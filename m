Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F642521EB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C262B16E5;
	Tue, 25 Aug 2020 22:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C262B16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598387019;
	bh=NZjtElEDPwjormWxbVgLvHnoYuiGSE1P7e5v5/4PDLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQxiH1M5c84UttnFMcZhjLJvDSMe7ncg35Jr0uT+WYUpdnRiaFTZsBd1aQhOP2N/c
	 9Dmg6ZUprctpViDdRdTS6ETtJ/2c0lPgeU0oeRpl0Dnsg30qg8g0emD8t8GKW2RVGz
	 eX9X0XPUmJHG7JdttAEp7Zti4WZ39VkTfgsq4P1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F5FF80372;
	Tue, 25 Aug 2020 22:11:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43689F80338; Tue, 25 Aug 2020 22:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1997F802FD
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1997F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dAMO1U+R"
Received: by mail-qv1-xf43.google.com with SMTP id dd12so104779qvb.0
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/+cwVyjZiU4lXoMXrR09xnU2c7BRFNH9q0stX6k3GcY=;
 b=dAMO1U+RevIO7rh5rOP9d3DmIrKRIYbMXoicQvkuxYjBSssIN91V63VzUq8v+ElC+J
 kEFSsOQeSsEE+MRgem6spXGSpf39HhkO3zZiAA/aa7J/QrVI2oIXadp57dY/HnHnYnyT
 ZqY+xCLsWwOxsfZqUCllIvLNJQQsJrsgci3GJXQG9YdaOhXYdMkAEjLnOjsnPN3TwK7w
 ZX0inEKHyz3zBtgxakoa1LFcYPk46N5MM6FD0Fb9FvtzTH49mH/AazMFlPrFXPJvJ0iw
 doXU1Q5PL+18F7l+V4Dhg+dzaYTJJe96DSFC/8k9unw9ZNOms1Hh+4rxQSHrNZtWxP5d
 tSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/+cwVyjZiU4lXoMXrR09xnU2c7BRFNH9q0stX6k3GcY=;
 b=VTofgVqA4qaXAOEnftjeS1mbGH02xotSb7cRhhtfxQ0f4s9+pchg9vydfH5kzswl3O
 hWfFJNSRooha3isrk88527Od45igKYaxykgo8xrvjkw974nD0l9zWJOZuGHIRAvRiGZZ
 K6McIm+1OMLL1/ZpyyxBeCS9C2aRn7Hvyrkkzk4dTpayuNOcXA1VXUc0EGM3eA+bfIwe
 /8WL38xZ9ouJAhJA8g67a1OQTFLRIgTxz5iAOz4bTa+2HhDrM6zX6uB0eu9LV9F5K0ua
 CWqlESr19e80+IPG2Jbovhabm1BbbcKeZ8z7y0/7P8r7NFNIqyT8GM1IjhViZQJLZl+H
 0XcA==
X-Gm-Message-State: AOAM532MYvJr6waNvboCUAGee2xfB8fzeY/af/g21sZeLXRcBON3TTyZ
 5ooJZDo+LbLWWmz1HDMhy2o=
X-Google-Smtp-Source: ABdhPJxPOQcCxc3raJ9IRb9qpgoHHl7LUdH4TqQCk5D7HKxNaWnG7oex+RuA/9J9uFMXPxP7rM0+QA==
X-Received: by 2002:ad4:4482:: with SMTP id m2mr11266618qvt.102.1598386294963; 
 Tue, 25 Aug 2020 13:11:34 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:34 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 18/20] ALSA: hda/ca0132 - Add AE-7 microphone selection
 commands.
Date: Tue, 25 Aug 2020 16:10:37 -0400
Message-Id: <20200825201040.30339-19-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add AE-7 quirk data for setting of microphone. The AE-7 has no front
panel connector, so only rear-mic/line-in have new commands.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index dcc8d29d934c..8c6e38734489 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4997,6 +4997,15 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			tmp = FLOAT_THREE;
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
+			tmp = FLOAT_THREE;
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			tmp = FLOAT_ONE;
 			break;
@@ -5042,6 +5051,14 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		case QUIRK_AE5:
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x3f);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			break;
 		}
@@ -5051,7 +5068,10 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		if (ca0132_quirk(spec) == QUIRK_R3DI)
 			chipio_set_conn_rate(codec, 0x0F, SR_96_000);
 
-		tmp = FLOAT_ZERO;
+		if (ca0132_quirk(spec) == QUIRK_AE7)
+			tmp = FLOAT_THREE;
+		else
+			tmp = FLOAT_ZERO;
 		dspio_set_uint_param(codec, 0x80, 0x00, tmp);
 
 		switch (ca0132_quirk(spec)) {
-- 
2.20.1

