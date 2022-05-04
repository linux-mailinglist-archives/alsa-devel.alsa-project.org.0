Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC45192CA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 02:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96ADB1E2;
	Wed,  4 May 2022 02:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96ADB1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651623987;
	bh=B55Dkoomaqpa69tDvng1a33q8JeJHPwuOvqbp3T+cSo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rdLwvOIgGU4P0mx8PuL1pg568n7l/Tw75CNwB0yINWHzlTYf0/DtD66qDgS09VqvM
	 EmTBPSw4ncQRxcQ9XEZvepBx6HRjI1quu0BTfZGTwxc2NY/qU6NSdeB2lio/Oxgmfh
	 qC+E6eyS1b3zxZYjjtUJayYpVYwUkgfguFT+eNY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069CCF8025E;
	Wed,  4 May 2022 02:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9FECF80236; Wed,  4 May 2022 02:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF49F800E5
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 02:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF49F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g51Ue/s5"
Received: by mail-qt1-x833.google.com with SMTP id x9so14823882qts.6
 for <alsa-devel@alsa-project.org>; Tue, 03 May 2022 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2Rvi2fYjCUZ2fnH709+1VRnkklGH3OfPRUgCz8KlGY=;
 b=g51Ue/s5rS5LLtj4OEQPwT7d494kHpWcGbxGHxE981zyTogl4UOv74UfawU0k4oCqW
 9HCYKSJi+8ywrRxtyJo1CGXrJhNCB8P+rFKRAWALSMOcO0B0fxKd4+8No0qRMXFd/6Zs
 vQ7DomBoVP/+VmjvAMeGpOYeuEKcxvYv92dPSFm5FPLxwbScd8La5FO8UiVLhn0sjqyn
 Lu51rk8SACDzvOxxHLHZ3d2QpUSSamZQPo8K0YLZR1hIE+RuTg6mcnfajAbCTVG5fX1S
 KCF9UkahWu+IV3M0YKr3UmUGkW8aE1Mp956rRUkAG+uqWHxrRWMIcO3MQx/lKcw9hFm7
 /fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2Rvi2fYjCUZ2fnH709+1VRnkklGH3OfPRUgCz8KlGY=;
 b=cUeaPBOGLRDmuitfKvKgImBHA1uFqM1NRFURMbJYFCQW1nogSiqbXIIFCdpXYzrzi4
 buvOH6o/QDxOocJgpA9VbkXvDtVzDljpBARVQR8Ax7QANf2wWLP5GVW6mVpQowFCvc8P
 igd3A31rYaiLNSZhBkCw3IWrzlWGyEgu9yDij8qSqyKsnCW8GDBXwbL4E1Z/XRQbk7E5
 33+JUQJA5L5YJC4tck8y3Ac0R16d9oSUm8x/Nzy3DKFGmUjd7ACgl9AauAuu3jye8UPs
 Xrw9vYny58Yxxmxg4ZISuM9pEwuZCA+2fcimONU8qJmfCr/Cn7CxNbETV/EqTSSMcS2u
 N9jg==
X-Gm-Message-State: AOAM533Pe0KLn7pUvETtaFvD9pwLgbZIp7cBAG6GRAed30FH9Ij02oTe
 yNQ1rrEuDwn38OJTDKpu3Lo=
X-Google-Smtp-Source: ABdhPJyyjndUav0nHPLHbvWv9sEmjBBeh4RCNWvs91dbqR/94MA255Ej35UXNwSKxVOTtD0x4Y8l+g==
X-Received: by 2002:ac8:5950:0:b0:2f3:9101:e0d4 with SMTP id
 16-20020ac85950000000b002f39101e0d4mr17583041qtz.613.1651623921516; 
 Tue, 03 May 2022 17:25:21 -0700 (PDT)
Received: from localhost.localdomain ([66.63.167.151])
 by smtp.gmail.com with ESMTPSA id
 e188-20020a37b5c5000000b0069fc13ce225sm5966358qkf.86.2022.05.03.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 17:25:16 -0700 (PDT)
From: Forest Crossman <cyrozap@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Don't get sample rate for MCT Trigger 5
 USB-to-HDMI
Date: Tue,  3 May 2022 19:24:44 -0500
Message-Id: <20220504002444.114011-2-cyrozap@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Forest Crossman <cyrozap@gmail.com>,
 linux-kernel@vger.kernel.org
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

This device doesn't support reading the sample rate, so we need to apply
this quirk to avoid a 15-second delay waiting for three timeouts.

Signed-off-by: Forest Crossman <cyrozap@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ab9f3da49941..fbbe59054c3f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1822,6 +1822,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x0711, 0x5800, /* MCT Trigger 5 USB-to-HDMI */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
-- 
2.36.0

