Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F22D0B37
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 08:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EF11737;
	Mon,  7 Dec 2020 08:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EF11737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607326819;
	bh=XpGD5jcSHRRv1cdyGZ+XWZZzZMLzV5EdFsNmmvoI6Eo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HXh1W9qEQ1h7BYpHwqLTqtFkxUncTM7jPKOzAd1RDwJ6zgm6vcGMDeMNh+DdERn3E
	 7GPD0GZkanLKfpEpLmooxmF8QrRa01xvOP1W3tJ6HME+j61E2fwk3Mpob6U7ifjEXI
	 xrS6NZeLo9cL1KogAWgARphRS9JjUemHb2wdZN90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE3EF804CB;
	Mon,  7 Dec 2020 08:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CBDFF8020D; Mon,  7 Dec 2020 08:29:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E7AF8015B
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 08:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E7AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="iWBTJq5C"
Received: by mail-pj1-x1041.google.com with SMTP id z12so6850003pjn.1
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eiXnTypx8iGHIDHIpH1IqsjSnkTqPj/jp8psF8GKGy0=;
 b=iWBTJq5CjoMlZFZhqFEKiDqt6rcSYwjwk4CTH+p9nD+eLKAiX5IYedxQDbp478e3q4
 Fha9ke1nTNbO2cxiNsxcEYCFL8Yv7VatnzbFR4HQyjii/Pug1EOzlsJC98s9ZF/T1FZQ
 y05gjA/L+0Wck547YPostvoKm5uCCUqctc/yEgqDo1mBClPGjRqLlODxJO4Xn3IqCAO9
 VBvhgxD1ON/+hA8PfRbTGcOfZDSKEEphScGMi+osekIzg1T5VwJWlrYHT4GHNYc6bByo
 w8VdQDlfVg1UfTD77Q0osiznxVeVg9JrNSEqEFNL/XY3YpUguj70vONpY6deuXBopdKp
 4QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eiXnTypx8iGHIDHIpH1IqsjSnkTqPj/jp8psF8GKGy0=;
 b=FbDKZCAE2K3hIzCZr5CYwKSTJorXnUDC4RF6SC2ROUMN1ANN6670+kO4uxrt5LyrMl
 VSj9Prkk8wLm0pDE5djr6j8DndP270wh3LI5GZo3CXpaN5cS3seGz0ppFtY3EPixWBRN
 NSTu4GMZq6fB/UaNv1tfPZVoV2T1wIBS+Qu5LEWl5GTBZ/+9XVYGeICrIft0bEDqGe9S
 T0jYUkwSH+PkpDbjRfe80o8aS16/ayCRDkOLn5z/MzJ9PNP9dmqVZEbzxX55Pjd+M4fK
 a1taped1OpXAWvopdOdifOKN9WJmjITA+s7N/XrtxuQaW94x1CisgMlSjNJFyNHodG20
 K6Sg==
X-Gm-Message-State: AOAM531CCfPJkTCSz5rl/m4vCCwCB2gkCJJELX1zIhwIQhoiD8qd5y8J
 1mHcw03DC/P7brY8U4qhMLGlQA==
X-Google-Smtp-Source: ABdhPJxvxHIAFCQCx15Tya3R2k3ZaOTIlbHT9aQLElluohJNraqQReVL7NirnXVrug7oxXL/qdmBuQ==
X-Received: by 2002:a17:90b:1945:: with SMTP id
 nk5mr15258577pjb.30.1607326174019; 
 Sun, 06 Dec 2020 23:29:34 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id k23sm12736969pfk.50.2020.12.06.23.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 23:29:33 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek - Enable headset mic of ASUS X430UN with
 ALC256
Date: Mon,  7 Dec 2020 15:27:55 +0800
Message-Id: <20201207072755.16210-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:37:43 +0100
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, Jian-Hong Pan <jhp@endlessos.org>,
 linux@endlessos.org
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

The ASUS laptop X430UN with ALC256 can't detect the headset microphone
until ALC256_FIXUP_ASUS_MIC_NO_PRESENCE quirk applied.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f2398721ac1e..d5e4d0ba1008 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7827,6 +7827,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x10d0, "ASUS X540LA/X540LJ", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x115d, "Asus 1015E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x11c0, "ASUS X556UR", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1043, 0x1271, "ASUS X430UN", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1290, "ASUS X441SA", ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x12a0, "ASUS X441UV", ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC),
-- 
2.20.1

