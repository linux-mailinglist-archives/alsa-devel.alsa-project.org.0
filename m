Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E124E043
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B235168D;
	Fri, 21 Aug 2020 21:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B235168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036538;
	bh=l1kBF8BZg/NQAZ54l9yJvPAb2+4RPq5gVPFL9oius0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAltvA6Jqu9ceYAdiLnYKS1Nj5JJGj5jOUx4gVnteek28R/qo34XprlECPQ4CYNHe
	 y329UFqSCxDdnOmTpOKTVymIuDkvN2UT4per0Cw//cvK4xXZaHwRbMa6f1xHOZAYgG
	 p9iyp6EN00MhIbcsQrgX8lVEBSGxFKt8QeqiB9kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D421CF8033F;
	Fri, 21 Aug 2020 20:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC519F80316; Fri, 21 Aug 2020 20:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E2AF802F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E2AF802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gvt1t/tE"
Received: by mail-qt1-x844.google.com with SMTP id e5so1944678qth.5
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tJ06fkRleY+SL3Oh74bnTOPqPdvqktxwc9J8GvyZTHI=;
 b=Gvt1t/tEEo8kVHshJM0OYplg3/jyHvdrGwdXg76Ibf0aQGPsBxxZHSPDH55kU5b3/a
 BAt8jvQmIb5s2exn+dWAQ6pYp9zB3NYULZPzHeLTAZ0Ix5zq6wT9Ee4ptugayl9TsEVX
 MlQXHViqh7zA5S8ZpEkxQ02vn1dXl8Kq1/Bw6qq7AdbhxFK61TUY73ZDiTnH4fu0rVjI
 jXMxQJ0i7Dqcva/azZnWVb9JBM34s/Q+PHjLT15iId+Zrfy5nuSLxBke7SjN1hWFIC4V
 cV1sCQYbaMJGN0lUwfwUU26HNfPl8aroMb68WwMfctHCHpyXKou8HumVv+6RBY5GiZYi
 3ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJ06fkRleY+SL3Oh74bnTOPqPdvqktxwc9J8GvyZTHI=;
 b=TCDqdg5Dwaidc40wYZJTGDRMk17SKUeS36ltUjb53YKG+WFfo/apsuuuluISLBcLr1
 5dRWaJC5uGrLl/AfUoMkuXgEbTX3smI6/H4cQfil6qpGNQttAgsB0GNXQhlqscZ9Cc1Y
 ZzCbXp+5doUTM8WK6WO9fvbDExov8C9xwsHpuQ9sRXYxwscktyKjJARkv00KwlezDaYL
 mEB0XkoaNEPMY+tv30Hvoa6YCg4DTZFt9332acfwjSfhnNdIsMzdwDVMcDyqt8YBWBW9
 vgLA0EVRDhhQ5h/ExTXpmrPwlsJOFVTTr3yWtj5sgxTI4sGw1bOZlj9VLnNL4cADocpU
 ouTw==
X-Gm-Message-State: AOAM5332MWl2wP7MfPQhfW8ImlF+CHET7WQI4nTeNR1wAmZo4LxU6wVu
 M1NsD4egtXOxYjq8iPWQQRM=
X-Google-Smtp-Source: ABdhPJwuz93YvbO2QpRm/1xw+1T6qzxMVwkeceZBDu3c34hBTa2MYmtlNmoVP0dNeDLPMME9UhX4dw==
X-Received: by 2002:ac8:ec7:: with SMTP id w7mr4107132qti.118.1598036043706;
 Fri, 21 Aug 2020 11:54:03 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:03 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 12/20] ALSA: hda/ca0132 - Set AE-7 bools and select mixer.
Date: Fri, 21 Aug 2020 14:52:29 -0400
Message-Id: <20200821185239.26133-13-conmanx360@gmail.com>
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

Set the boolean values used for desktop cards, and select the desktop
mixer.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 5aad9d8ee5e4..ffad29ac7290 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -9403,6 +9403,10 @@ static int patch_ca0132(struct hda_codec *codec)
 		spec->mixers[0] = desktop_mixer;
 		snd_hda_codec_set_name(codec, "Sound BlasterX AE-5");
 		break;
+	case QUIRK_AE7:
+		spec->mixers[0] = desktop_mixer;
+		snd_hda_codec_set_name(codec, "Sound Blaster AE-7");
+		break;
 	default:
 		spec->mixers[0] = ca0132_mixer;
 		break;
@@ -9413,6 +9417,7 @@ static int patch_ca0132(struct hda_codec *codec)
 	case QUIRK_SBZ:
 	case QUIRK_R3D:
 	case QUIRK_AE5:
+	case QUIRK_AE7:
 	case QUIRK_ZXR:
 		spec->use_alt_controls = true;
 		spec->use_alt_functions = true;
-- 
2.20.1

