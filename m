Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7A2D0BF6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 09:48:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C0A1753;
	Mon,  7 Dec 2020 09:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C0A1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607330886;
	bh=9TuW79sUERd6wB8xZFTeMneXErbGQMwtyGsPE4Oyrr0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aXQakbCwDrL9oHJ0TKgKbgyzGweuVo92XLCJXYHp4rfpckVMKLe7A8MuI4A1Yy3EK
	 ttWNEpFdSYH28oZDmEc5ZVCw3rSJp/owSUfQNm0YnAFmmj1H73/FN//1T8x8vo0AsE
	 9U3zIFpwCad9irbBz56ICLgadTjNhH92oaNYSB4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE9CF8021D;
	Mon,  7 Dec 2020 09:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AA16F8020D; Mon,  7 Dec 2020 09:46:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6D4F8015B
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 09:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6D4F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qtEErtAS"
Received: by mail-qk1-x741.google.com with SMTP id 1so11890743qka.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 00:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75+i+NBjMQ6GtQpKGQNJdPXnFNLfGkuAW15cSzTPqVQ=;
 b=qtEErtAS+Fb92gBJJjJECw0zeq/TSSiOw+SAGqvz05PQyWQg+Vm5xV1PMYBZRTQSeL
 rEYnaz/4PoSsnlGGivHNdiKKBwgNQkSGTKNEZc0iy/KmHB1Qqav1wnBWC4iDdj64ZJku
 /JyQS3OsosSBW0QdRSqpayQ0qsaRarXb9lYfhgpbtNlKLuTVGjbVbqZPS9XUVJeqMypR
 t0+8iZSKPwOWSBrIE/+4Sw4qBcw+I1IIB+/unnS7abycAYg9DHxJqvOAI+YDeGIuqLdB
 kTCklslvNbRo/JU6Vp9Ur/03iGqPHlYnKgg6IgT4365O8hZsnDZ8xDOIkzcmxaJV5sym
 SR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75+i+NBjMQ6GtQpKGQNJdPXnFNLfGkuAW15cSzTPqVQ=;
 b=LLrjTk4hOBUHXa/hDWkhz18Wx4GJPV59N5Dm8SYSME81W1+FDYfwM30v8U1DV8ytJU
 kyAPUT4bh+eElACF+W8QNR0AwwdzugLnL2FWjwflu27Q8+pt0fHmgcplRsK/T6jyenqc
 G50sSXupNfrg/E8xd//CwwVXQK3RlcBmv/2fg8/WPYeTt05+wsjtTOz13ESVN7PPrIUM
 fZCV8EkB5CKc3OkGl+44rXlwh5E9ubRzfxi8msCt7lXzPAqqX6sISfKqG4hGbyKylAHi
 SBDKRmeUoISB3wSBaFupwuiZJ05NDum2s/UcccbPc8MBpP7pG7IFAHztJREi0M3TcHkk
 aReg==
X-Gm-Message-State: AOAM5300dCEF+nbt6sUPe2FntviB25STqV0VlG2vValaOt5U2iC7VD/V
 gew73OOGBGqjv5ZRrORzmvUcvN4X6qc=
X-Google-Smtp-Source: ABdhPJxAQ2lH+fXjAcGTh8FCHNA5Xmj8q7aXjdHsR8Ac7wnaqenQn56nJi45e0DcoO9LXDp2Q5xMWQ==
X-Received: by 2002:a37:9c4a:: with SMTP id f71mr5396954qke.495.1607330783087; 
 Mon, 07 Dec 2020 00:46:23 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id a9sm3424681qkk.39.2020.12.07.00.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 00:46:22 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 1/3] ALSA: hda/ca0132 - Fix AE-5 rear headphone pincfg.
Date: Mon,  7 Dec 2020 03:46:13 -0500
Message-Id: <20201207084616.411531-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The Windows driver sets the pincfg for the AE-5's rear-headphone to
report as a microphone. This causes issues with Pulseaudio mistakenly
believing there is no headphone plugged in. In Linux, we should instead
set it to be a headphone.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 4fbec4258f58..e96db73c32f5 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1223,7 +1223,7 @@ static const struct hda_pintbl ae5_pincfgs[] = {
 	{ 0x0e, 0x01c510f0 }, /* SPDIF In */
 	{ 0x0f, 0x01017114 }, /* Port A -- Rear L/R. */
 	{ 0x10, 0x01017012 }, /* Port D -- Center/LFE or FP Hp */
-	{ 0x11, 0x01a170ff }, /* Port B -- LineMicIn2 / Rear Headphone */
+	{ 0x11, 0x012170ff }, /* Port B -- LineMicIn2 / Rear Headphone */
 	{ 0x12, 0x01a170f0 }, /* Port C -- LineIn1 */
 	{ 0x13, 0x908700f0 }, /* What U Hear In*/
 	{ 0x18, 0x50d000f0 }, /* N/A */
-- 
2.25.1

