Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8630245BA3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 06:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B591672;
	Mon, 17 Aug 2020 06:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B591672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597638886;
	bh=5irR/94iY/05pq6+YxinEPS9U17hg4qLK5ejvFyxhm0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dzp2w/4GvaAoM7IT3dExYs+qM3qD9jqxyRQDh+C2z/uIaaplOPNDgfcnGJGYuwdci
	 Ak+cQ82agZOwDCKD/uupXFb0DoNGdwXZOl8xubX6GxdX6qp/qXQha0R9m0VhOWLzvH
	 PFQe2w4Mo5qlyJUQAvPfZiFZFRDf4tQnk9jSjWTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E814F800F0;
	Mon, 17 Aug 2020 06:33:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57D45F80218; Mon, 17 Aug 2020 06:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15EFEF800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 06:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15EFEF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="grILEzy0"
Received: by mail-pf1-x444.google.com with SMTP id y206so7594189pfb.10
 for <alsa-devel@alsa-project.org>; Sun, 16 Aug 2020 21:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3887PACzm2rTPUGN/6IdQET6Bnh6NyEKe6nTCAYCsS8=;
 b=grILEzy0NEZTK57HI7cdMjvE7Vnh5C5rJNNMHTmrkGFDt1BKMELCmk11OlAPw88Pw2
 8Sav8ApvwvftrCA97od41UgkjZaxiZs90oMj9uQbmW9iTxAqqOnrqQYQln6U3VCOsg6k
 DmmeJWK37wfgGCfOQG8w1Vz55hzVC0WvDyuCDLuJCayayM1Ztb0UVONC+2YEO/Sr5ZGi
 dLX71LZXX+tEPm4snRF/10JR+iiXVHtKRsKKlQDMdHWn0M+Od/vzhjfoPNhFZQCtzGan
 wKQlMBrda6gPXk6AYB8pHhkKTFO+rLwq5Ov0ntEtRROmZVYWyUPO2fxOZ+fd1s6C3I4d
 BAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3887PACzm2rTPUGN/6IdQET6Bnh6NyEKe6nTCAYCsS8=;
 b=j+uyz970PzgfVtj2q7FLg36fPOSbsrt3fXQeAwYNaBlHAWyBclorFAdKwmOpz4KXqn
 cmh8JtOHcUp+qmc0HcdqLO9ghmiA2GZHSODUA3cZ7t+kfU86v20oODVfKV8FS2aa/UmC
 w7R6Dsuv8FSf3DRZYGHORryFDYx87QcLkzBH0LNom+RdaOrsSDdZjteCmcyvDETMES/X
 Kg/+883KRLpBo36kQrLGpYGSbrd2AL2mPkTTk55zUJ7eYCcejp+oz8STAYng7iL0/6Ra
 Z0ZA1PaEoCjMDBBZl8PvhIVKI1EyCIGSFEZRvjv2vlcNHb5fJw8sCDkOPhinr0rPDomC
 x/9g==
X-Gm-Message-State: AOAM531IvRYUo6n8oeoyKgC5NzrM0CmTTvMu2x7okjpNGCXrl33hPOOB
 887roEvaN3PFb1pdOi9WUSA=
X-Google-Smtp-Source: ABdhPJyWrZyT+ww5Lg1ZSgjFD5wroh1KR5mI/vhgxnLklBChwjOANiN9ayu0EFGxcZShM7rtRjE+5Q==
X-Received: by 2002:a62:6847:: with SMTP id d68mr10271667pfc.110.1597638777437; 
 Sun, 16 Aug 2020 21:32:57 -0700 (PDT)
Received: from localhost.localdomain
 (68-123-15-75.lightspeed.sntcca.sbcglobal.net. [68.123.15.75])
 by smtp.googlemail.com with ESMTPSA id
 q82sm18714443pfc.139.2020.08.16.21.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 21:32:56 -0700 (PDT)
From: Mike Pozulp <pozulp.kernel@gmail.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add model alc298-samsung-headphone
Date: Sun, 16 Aug 2020 21:32:17 -0700
Message-Id: <20200817043219.458889-1-pozulp.kernel@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Mike Pozulp <pozulp.kernel@gmail.com>, Chris Chiu <chiu@endlessm.com>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 open list <linux-kernel@vger.kernel.org>
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

The very quiet and distorted headphone output bug that afflicted my
Samsung Notebook 9 is appearing in many other Samsung laptops. Expose
the quirk which fixed my laptop as a model so other users can try it.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207423
Signed-off-by: Mike Pozulp <pozulp.kernel@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 29f5878f0c50..722d01a06422 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7867,6 +7867,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC299_FIXUP_PREDATOR_SPK, .name = "predator-spk"},
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
+	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.28.0

