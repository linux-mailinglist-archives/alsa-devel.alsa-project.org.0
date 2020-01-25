Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934D14962E
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 16:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68061670;
	Sat, 25 Jan 2020 16:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68061670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579965077;
	bh=0GlVBN46pEezkisVoLQcGwTzx2wiNakt+O3dQ/8aThU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OFHMyOOA/aLWCzUNUlPFCxU/SWi6RLNpOqg3W9Ov0hfvvYyHglkSgH1vxwLGBUb6W
	 MQvfXNmq8mRZT9TI/N5Me6ruD/fItULi90OA6PXEIwPJktAKkNx1VL2NeQMnXcPY9Q
	 jE7ycqoXIUfLfvcy2Mz1ELGH2bV1naFy736LDvoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29CFCF801F9;
	Sat, 25 Jan 2020 16:09:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14CD5F801EC; Sat, 25 Jan 2020 16:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4D63F800BA
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 16:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D63F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vFatWbvQ"
Received: by mail-wr1-x443.google.com with SMTP id j42so5548340wrj.12
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8mS/O8wLpp6xq0qUKbcloxwb3uookpZ9LqY5C9YshPY=;
 b=vFatWbvQeuoivDqcUxIEWhNKeN3awcrZ4ct16y8T6RAOPlpJQr8nTG4whFtS14vEUM
 3U3qxJam8j55iSr2EoEZ4D7LA2Gh6Qsu+eIx2fHMO6SgrZlSPGeMaJfWtLNvfeKXBPTz
 cjZOSQEOGK6PfDnrla3uma1X3vb28bonud61iQ42c5wlkkeP2mTX/5gEJb0Kly+YIIs8
 rERukmeh2R8uJvYPbKYvv9fRQY39txPYu6OENNSFeaMDmyvRs9dLFwR/TShgjl++O92H
 PS/MQYiTWpxIBsfPl2H+V+JodDOSXKHSriEiq915CH95PUOxBuozigFnevvZE++j1KZz
 znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8mS/O8wLpp6xq0qUKbcloxwb3uookpZ9LqY5C9YshPY=;
 b=Wyw5fXjAdeh1f61biB3yQe0nnsc3crl+3qUy98s0bhrySaOLtFnLxjobv5Y8uA2ek9
 TbJJCIPVleRMhwgjykUHyvAnELHCPRnoy3VEqbzkUEowOOxOrhMVB5eqioleTmgdPrbH
 zbMPiJdHivfrXkNTaSf+Ko3ChJhEXlxz7159+cFlhkuvcklSBuEHfrQvkpPxaFH9fiNk
 +dHTiEIRlsCDapjMmORdrcyZefJY/cOzwbh+Q06qEBCbeNTth4CVZf54sjiwzm9Wrm50
 3rvVrnEt7p8vMxsMNOrmJ/adOb6Qsc1oBrjAlXhzSZrwvI3X4fHTVwMxS41f2rM6CxKM
 30qg==
X-Gm-Message-State: APjAAAUVsEjcecP9fEFQ0gUvK/V7wSwz7sp0Yv2vdPkSk3ELG6WxS9lv
 KyPYB7aLlFTUHpbNBsUXsKP8tu+BDx0=
X-Google-Smtp-Source: APXvYqzj++VJ2fMH9qYyC4PUoURDZREUhNA1o0+rfUCaqjMDlfAnj5le3fg28lJQkZ818QizZmTyZw==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr10652947wrt.110.1579964964420; 
 Sat, 25 Jan 2020 07:09:24 -0800 (PST)
Received: from localhost.localdomain ([80.111.60.43])
 by smtp.gmail.com with ESMTPSA id z133sm11327442wmb.7.2020.01.25.07.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 07:09:23 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sat, 25 Jan 2020 15:09:17 +0000
Message-Id: <20200125150917.5040-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Nicola Lunghi <nick83ola@gmail.com>,
 Carlo Calica <carlo@calica.com>, Jens Verwiebe <info@jensverwiebe.de>
Subject: [alsa-devel] [PATCH v2] ALSA: usb-audio: add quirks for Line6 Helix
	devices fw>=2.82
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With firmware 2.82 Line6 changed the usb id of some of the Helix
devices but the quirks is still needed.

Add it to the quirk list for line6 helix family of devices.

Thanks to Jens for pointing out the missing ids.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/format.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index d79db71305f6..53922f73467f 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -296,6 +296,9 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0E41, 0x4242): /* Line6 Helix Rack */
 	case USB_ID(0x0E41, 0x4244): /* Line6 Helix LT */
 	case USB_ID(0x0E41, 0x4246): /* Line6 HX-Stomp */
+	case USB_ID(0x0E41, 0x4248): /* Line6 Helix >= fw 2.82 */
+	case USB_ID(0x0E41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
+	case USB_ID(0x0E41, 0x424a): /* Line6 Helix LT >= fw 2.82 */
 		/* supported rates: 48Khz */
 		kfree(fp->rate_table);
 		fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
