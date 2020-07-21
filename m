Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D2227C53
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EEC1682;
	Tue, 21 Jul 2020 11:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EEC1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595325602;
	bh=toxX3ay6KFkAOXqip8vQyySu6iLUjfMkUX4+3iEyypk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhJLsCDucMwNny2wC6PSkLre8APWDk2uuxfMQpG9iqZXLHM2UQCKAva1N2YMd6boB
	 79kVrZJb2wwYEtw2KJMsuNMJi1nw51YpRMTFf1mMhU83Zy8fM4h4xAA/Pcg8iVD4MO
	 XgitkrvxlNoPGdR8OE1rc86B5eQnVH1s9iWz1JqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 502F8F80212;
	Tue, 21 Jul 2020 11:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C02CFF80274; Tue, 21 Jul 2020 11:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D01F8024A
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D01F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t0m7J3cK"
Received: by mail-ej1-x641.google.com with SMTP id rk21so21060105ejb.2
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 02:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBCLfYeJXOZusVoEeZmuNPBvbkxJljfVbIgIuShjfrc=;
 b=t0m7J3cKCDBSn5StTo/Zj/x5WR7QvJObd/9SNkTMTQhfGNQ/nPYXKGP4y5PTanoMmt
 ZxKtxCRGzZmz+3uIzDVpvQwfnmsEvc4Q7n4olM1JTJVohnfhYqNjz1KbryeNuNIldC1M
 Z2l3q4q9SU5YEwrSj97hSY/qR4xlIPzjJB1J9+fkWC3+fSCn6urUc4G68Dk6nRqJ3lWF
 g8xcOEagLdqyhTCLdZVUMWu3KQfE+kA5pkYu6G9Rl3lRNQJKdHZqFN25d7oxkbjU7jRn
 xMO0bEse5C5XKWLbmmgEcYvUG8lpFQmu+7e+7T0rWhaIlqOBGDL68uOHiReLDUp2R/Fa
 wThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBCLfYeJXOZusVoEeZmuNPBvbkxJljfVbIgIuShjfrc=;
 b=n3rmRW+tGt18XJB0koRE9wo4hvJxlWlRWwTsM7inMk3bmSod130KfEwCHDABSFcYo1
 h1lP1wjror/0Peb8qg2lH33uUQL6A7PIAtfosoht16QGIpN4FSVDZAyv4ffwyg3xauHW
 Mjpz81EX+HWpVTGszaDfBv7shT8U6rgKHQslqaxMek8uSdRaG5jjXK9yv3/aQ/4Fyj2V
 rheF683lpltH8olhShL+XY/cQvAjsrEm9tPkrEMwABy2Oi4SaHFFIFhu0rDx/J9tc6fU
 lIqOuUarzysG2SLNVhyHIucADCB2Rav/Vgshu2Tma8Xwu19OJ0is1HZxMm3xv6z58qdX
 Bigw==
X-Gm-Message-State: AOAM531fTYRJNFnia/L5vniDoJagmuupQX8mrxCALJg+rYw/9dvYx7sd
 qDa6CTnpDDOO6wqA7DeK0LU=
X-Google-Smtp-Source: ABdhPJzJrzrC1Oem9FuZoV69MAFANon+oIsoi9bOeyVhXgQmrAi/ILO+sLiOsNOVKC4ByUHb0wjPaA==
X-Received: by 2002:a17:906:958f:: with SMTP id
 r15mr23208558ejx.77.1595325492062; 
 Tue, 21 Jul 2020 02:58:12 -0700 (PDT)
Received: from t5500.home
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o17sm16426079ejb.105.2020.07.21.02.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:58:11 -0700 (PDT)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 2/2] Pulseaudio needs snd_pcm_hardware.channels_min > 1
Date: Tue, 21 Jul 2020 11:57:48 +0200
Message-Id: <20200721095748.16224-3-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721095748.16224-1-rene.herman@gmail.com>
References: <20200721095748.16224-1-rene.herman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

Pulseaudio with snd_pcm_hardware.channels_min=1 creates a mono device
only.

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 sound/usb/6fire/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 88ac1c4ee163..cce1312db93a 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -58,7 +58,7 @@ static const struct snd_pcm_hardware pcm_hw = {
 
 	.rate_min = 44100,
 	.rate_max = 192000,
-	.channels_min = 1,
+	.channels_min = 2,
 	.channels_max = 0, /* set in pcm_open, depending on capture/playback */
 	.buffer_bytes_max = MAX_BUFSIZE,
 	.period_bytes_min = PCM_N_PACKETS_PER_URB * (PCM_MAX_PACKET_SIZE - 4),
-- 
2.17.1

