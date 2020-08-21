Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A224E04F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A7B169B;
	Fri, 21 Aug 2020 21:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A7B169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036577;
	bh=z6QJSklEC/pFQg13kIj5nI/f+GvEJk7sFJ91nz3XBN8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZeLsYyFoz3Wrpzwud+su0xnKaPPkW7PdAvfV5SsiuiVQ3rWP02hz24a8+m9wAL3U
	 /XVyoiLuI5Xe9bEca9eee5lAcPv+CuqQCgTdcoDPX/TIHbV5fLpmK1l0sQaLkyQxpN
	 SORLkVojBVznj81CcETTfcvf/SFjrNVFOXmjoYTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B52F80340;
	Fri, 21 Aug 2020 20:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F82F8031A; Fri, 21 Aug 2020 20:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2505AF802FD
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2505AF802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fkvKiaq1"
Received: by mail-qt1-x843.google.com with SMTP id t23so1957882qto.3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKt7bPUZQnkT6XxuyI/7DeILPZNYGDd8MAMg7+2S4/c=;
 b=fkvKiaq14uwqeFl2aJIPJ5b+7SSEgU1TB8DCu1vYRpFleqw1QoN6DkOBRqNuNPyC22
 CbsaWhw3Z8V96rct34xe2ro7d58LY0ir4tVF5G5UH78JStO9e/17g+k2D1qRSpIhoON0
 sHRca8IHZYCT3cdjyf/T8DToR7RwxrgeVEphQgo76e5hStJjiaOcHa0vtn7NE4SrKV0m
 g7bCbtP2+QnjKAGuqSNwBixzTruehwrcfOfQcl5iM6mKaAqHTQj/mTUcmdTBoX7JhCYJ
 VQX9wOiLHLP54osruzrzV2Spyk7pRTD/WTU0PEze/D2eksoQ5q1n3Ed/pE6MilLcgfeQ
 ciow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKt7bPUZQnkT6XxuyI/7DeILPZNYGDd8MAMg7+2S4/c=;
 b=txLP6KZjsI75WWU9AqEL2s36mf/pUZDSEnBAhImMKP2JigCe+t01dnsiNdbJBt/L4f
 LzisQGWjz3E2jf4l1Rf/RflMdcOwU7S85OFZb/RF5dellJ6iu7p4Kr4J3lJbvAtO3aNd
 WwaVWWO+muwII3VEIw2WgZw0Alo0QOtfgxieln2xZ/IDDGDSVhDZ6ngaLL5pg/D6wsSK
 dk2vocqhuVVpQnggxrA6k4HBBDLjxIrvtlRm3RkznlKzqrblB1mL2LDU6ACAY43V3aDJ
 3H7uSdymce2SFBiZGwHFLKvCGsC+1VxiCcZOB8KKaG1MlO+QyE3UyVR0s/DmwmEVoTbV
 +ZXg==
X-Gm-Message-State: AOAM533qsVf9xlnt8Of+lXOOc+HHF0B1gghPRMG9JMc8WZr46g8phnpF
 qZ52oI/F5cTxD0DV1YoUQBc=
X-Google-Smtp-Source: ABdhPJwTOkWX/G9fbyfVm9iYhQhIPaZK9WX8Tg95UwBfH7O2FJaPNCh8McdgwdZdDlhe81LqygJXAw==
X-Received: by 2002:aed:36aa:: with SMTP id f39mr4078516qtb.297.1598036045579; 
 Fri, 21 Aug 2020 11:54:05 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:05 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 13/20] ALSA: hda/ca0132 - Add ca0132_mmio_init data for
 SoundBlaster AE-7.
Date: Fri, 21 Aug 2020 14:52:30 -0400
Message-Id: <20200821185239.26133-14-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
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

Modify the AE-5 ca0132_mmio_init function to add AE-7 specific writes.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index ffad29ac7290..41838a5587b6 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8748,8 +8748,26 @@ static void ca0132_mmio_init_ae5(struct hda_codec *codec)
 	data = ca0113_mmio_init_data_ae5;
 	count = ARRAY_SIZE(ca0113_mmio_init_data_ae5);
 
-	for (i = 0; i < count; i++)
+	if (ca0132_quirk(spec) == QUIRK_AE7) {
+		writel(0x00000680, spec->mem_base + 0x1c);
+		writel(0x00880680, spec->mem_base + 0x1c);
+	}
+
+	for (i = 0; i < count; i++) {
+		/*
+		 * AE-7 shares all writes with the AE-5, except that it writes
+		 * a different value to 0x20c.
+		 */
+		if (i == 21 && ca0132_quirk(spec) == QUIRK_AE7) {
+			writel(0x00800001, spec->mem_base + addr[i]);
+			continue;
+		}
+
 		writel(data[i], spec->mem_base + addr[i]);
+	}
+
+	if (ca0132_quirk(spec) == QUIRK_AE5)
+		writel(0x00880680, spec->mem_base + 0x1c);
 }
 
 static void ca0132_mmio_init(struct hda_codec *codec)
-- 
2.20.1

