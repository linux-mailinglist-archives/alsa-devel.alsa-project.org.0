Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260462317E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A0E81709;
	Wed,  9 Nov 2022 18:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A0E81709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014925;
	bh=KycwG44bBsMnvbRSurlTiYd2V5m92DkGiLuPLRLCzBQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cVG6KLOKAxPdf0PVjA10EhpbSwhg3ccSIIR0+IjQ7bRCb4VuajZGrGu+1n7U8fHIm
	 erQMGZOKD7hYi2dP0ID6rX2H5GJZReo9CZUqJxbXfk+n7txesOe4JqScsJ8tXOFGZC
	 Nqu6WC1YOidWRkHXLI6IDvHaCiHtuKQDOwk6t75U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC2C1F804FB;
	Wed,  9 Nov 2022 18:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C013F8023B; Wed,  9 Nov 2022 18:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD1AF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 18:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD1AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NOT09UVJ"
Received: by mail-oi1-x22a.google.com with SMTP id n186so19502188oih.7
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YnbAgRc0SG1is4s9YE7B1B7B3OnFjSAdcO6sCa2yLhk=;
 b=NOT09UVJK5f0mTzSZl8ZOPwyuPGXRWjmBVrVvfniY7Vt0gyJKBcHiwKfYkhfLeKmtj
 OI3DaOYheHrS3CZvaW2gWokRkcJAZd70Ha+jybu39TSrG7q1qR6o6IwVOaek3tfS5eP4
 rZZ9jKSAPO1phT0S1aj/kql08aCdsCcpM4ieDUiUP5WjfA+wn3YrUYyID2hUto44AH+w
 iXEQolL+iQQBIK4nu3+Ekmbnyqpl4rhTzOZzZmtfXDcnfJKyHvLalhN5AXbTMX9Rvlxo
 2gOxAVPYXbw3Y3elFa0Tmw7Ie6n1hVNO8Nuk1t+TLqPoX4NfWZQWlmVLGOk+hCgyh5h2
 0uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnbAgRc0SG1is4s9YE7B1B7B3OnFjSAdcO6sCa2yLhk=;
 b=lLq2cj9ImnOSuyVYQ0hCE6VE4JJTd+m8s3gkP+tml29ivw4pXey8ZFyOJveYxxK7pC
 Av7GPGc9KL2dTcGH6fIMlOzMcQIS34fN42CkaWtDNRlGMDNAjFY2sVXRcaL15hYigluA
 dc2q/VeoLNn82B/Ifabl9iXQ+N5dJdv9bWBgntURkCCiMuY8ZMnha13dESdI4xzRwhvI
 U4UxSI7QG1IcKJ04XxdYAiE2a+TWU2+r3wXJzpjW5M5CLASimuvj5MPfYjslI6kBC0Nj
 kMFWmB/0WXMZalMU7w/Ys9cej/XIWgY/fBOuXTw+n+xHJj6YZfMVW41HAn9Na4mQNEyH
 MKLw==
X-Gm-Message-State: ACrzQf3AELPqwh1k4QGV/SUEZJ14VfCvWf3rSrgx4qTK50F67Z11GDja
 I4+UUq28BD+DfMzQzZ3RF1o=
X-Google-Smtp-Source: AMsMyM7LBsKqFCrAhqRYjQytYpTyHbWZMCi2oiu7E5nfZFygmwpCSzk2lQddELwc+dRT799FEp9apg==
X-Received: by 2002:aca:ac82:0:b0:359:d662:5bfb with SMTP id
 v124-20020acaac82000000b00359d6625bfbmr33911565oie.218.1668014287353; 
 Wed, 09 Nov 2022 09:18:07 -0800 (PST)
Received: from x-VJFE44F11X-XXXXXX.cardume.local ([177.134.206.108])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a9d6645000000b0066c15490a55sm5471674otm.19.2022.11.09.09.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 09:18:06 -0800 (PST)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add Positivo C6300 model quirk
Date: Wed,  9 Nov 2022 13:17:32 -0400
Message-Id: <20221109171732.5417-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sbinding@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 tangmeng@uniontech.com, p.jungkamp@gmx.net, tcrawford@system76.com,
 tiwai@suse.com, wse@tuxedocomputers.com, linux-kernel@vger.kernel.org,
 edson.drosdeck@gmail.com, kai.heng.feng@canonical.com,
 alsa-devel@alsa-project.org
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

Positivo Master C6300 (1849:a233) require quirk for anabling headset-mic

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 701a72ec5629..7875566d6183 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9608,6 +9608,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
 	SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100", ALC233_FIXUP_NO_AUDIO_JACK),
+	SND_PCI_QUIRK(0x1849, 0xa233, "Positivo Master C6300", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
-- 
2.37.2

