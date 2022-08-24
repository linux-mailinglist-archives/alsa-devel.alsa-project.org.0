Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFAE59F4E2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 10:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DAAAEA;
	Wed, 24 Aug 2022 10:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DAAAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661329105;
	bh=JYYK/HoSl7QgwJaL0qk/TrC208IOnHGfcXqRF0OPQ8M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ascUq10iZlaRZwJvAAWGSThKiJ0pCs252BAwvgvujOlcvLqZo+X2EuGbAyrC1+A0d
	 5jRu46TMB9QoK97+/XwdAPfTuU5tDWa1IbNNqylZevowVK7DausH/T0QMuhs7kqIrE
	 QcyBO4I/BU1CuZjwbMR/voHtxGqBVufA8iu39RRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA14F804C1;
	Wed, 24 Aug 2022 10:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 631EDF804BD; Wed, 24 Aug 2022 10:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C4CF8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 10:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C4CF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="adyUncsa"
Received: by mail-pj1-x1031.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so797493pjj.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ozY6u65Wi+tb61B+PChTsXWw55lG3sk+g53XzCkY8H8=;
 b=adyUncsaZuyugIqkgE+MiXTuAYgrLURFpzhiOdHp5Linka3Yr0Y467uxQ0WUvLXnp4
 3ruxQKf3TzItSDkp6T+24017+iGgltSAqABJTCfD1x/KMC7NVrv3eb56rjVRr4cDHmhK
 +iGt4a40f5kWEz3+o1WDZ6SRlaZhyt4ezP0Sht9IvbK2bf9gjrOyOulPROdjN2pQ8kMc
 PrCSJk+se4jBDgWrX91IqlXOIp7V2JpK7IX/wmEycjshQSPUT1+AA8U40mnz1e/I7xw5
 ea+xIisJifimHPSi7vEWpPGCgo2Ljew7gH9UDTaBthdbEVOtKkKrud6CUBPdQDXHgyQB
 RGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ozY6u65Wi+tb61B+PChTsXWw55lG3sk+g53XzCkY8H8=;
 b=oVVTXegXbRjfaF/rV1mWUHqYodyFTPCPrhfeJ7AuXch5jdIDdbN2Ibc5aW22RCMcff
 /9wRgjyzBFL4DjSBmM1VyLL0IDU4jlRKPM+LOG/nSPdbivhNcptzB9iFMOmvcRGCn46f
 my7BKvzJRrSqc6U2D3iGDsj5edjJpj7H7t3TM/+rbwStZjX0UKXlzmQk9mjZ3ywnpTua
 nDC5b57TvPIxHscgjyf0gm4sMbYBN4jXX70k0QsTiV2XCLptXMsDOSQg/uCXxn+TfwdI
 6Zgk8pnKOg82gFquUuifX973sLW7RoaDORlgizw6UG//ERZuu9dMKyayh8KYv3BjoPhe
 n1aA==
X-Gm-Message-State: ACgBeo2h5u3Ug73ybRvP8vVHBAehqwsRKTcW6scLUTL/Uip9iSVCDdnD
 E4YFhDspyzPMGXQVIW1ISw==
X-Google-Smtp-Source: AA6agR6rjNVqUfcFvWmii8TDq32o5AzK/lk3X020Lbxg7Jc9EA12wtGdXpulliMTcEUWMN6OiPG+zA==
X-Received: by 2002:a17:903:1ce:b0:16f:145c:a842 with SMTP id
 e14-20020a17090301ce00b0016f145ca842mr27483329plh.83.1661329037147; 
 Wed, 24 Aug 2022 01:17:17 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a63fc02000000b0041a615381d5sm10508288pgi.4.2022.08.24.01.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 01:17:16 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: control: Fix an out-of-bounds bug in get_ctl_id_hash()
Date: Wed, 24 Aug 2022 16:16:54 +0800
Message-Id: <20220824081654.3767739-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

Since the user can control the arguments provided to the kernel by the
ioctl() system call, an out-of-bounds bug occurs when the 'id->name'
provided by the user does not end with '\0'.

The following log can reveal it:

[    10.002313] BUG: KASAN: stack-out-of-bounds in snd_ctl_find_id+0x36c/0x3a0
[    10.002895] Read of size 1 at addr ffff888109f5fe28 by task snd/439
[    10.004934] Call Trace:
[    10.007140]  snd_ctl_find_id+0x36c/0x3a0
[    10.007489]  snd_ctl_ioctl+0x6cf/0x10e0

Fix this by checking the bound of 'id->name' in the loop.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/core/control.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index f3e893715369..e8fc4c511e5f 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -385,14 +385,14 @@ static bool elem_id_matches(const struct snd_kcontrol *kctl,
 #define MULTIPLIER	37
 static unsigned long get_ctl_id_hash(const struct snd_ctl_elem_id *id)
 {
+	int i;
 	unsigned long h;
-	const unsigned char *p;
 
 	h = id->iface;
 	h = MULTIPLIER * h + id->device;
 	h = MULTIPLIER * h + id->subdevice;
-	for (p = id->name; *p; p++)
-		h = MULTIPLIER * h + *p;
+	for (i = 0; id->name[i] && i < SNDRV_CTL_ELEM_ID_NAME_MAXLEN; i++)
+		h = MULTIPLIER * h + id->name[i];
 	h = MULTIPLIER * h + id->index;
 	h &= LONG_MAX;
 	return h;
-- 
2.25.1

