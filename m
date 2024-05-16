Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552148C77D7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 15:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9C683E;
	Thu, 16 May 2024 15:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9C683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715866868;
	bh=dTWh5B+LLDBWV9vtFY55/B1V8asERfAAion1Rkp/acY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EqAUN1b6Ljz7b8OPng7ko3f7Tj6ke9rvVkXjs9F0AjbTXk5bOWsZyVsxsH8avHi8X
	 DF7AII0semog2282iWQ75Mt6zQyVyaYfQseL5og2AqFJplxyzrxZJjnXJsaIc/q55n
	 SfU9cU9koJnM1Um8uipFzbudawEepI0WAz89G8lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625CBF805AE; Thu, 16 May 2024 15:40:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE84EF800E2;
	Thu, 16 May 2024 15:40:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDFD6F8024C; Thu, 16 May 2024 15:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EDC7F800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 15:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDC7F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BiO44YuU
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ba0cb1ea68so185882a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 May 2024 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715866822; x=1716471622;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL50Hp7iL/aRLAtSxMHrUM7s8ttuqkWfRiWw7eMXuF4=;
        b=BiO44YuUspd6mdRCIY/sfSdKEL5noddGZLsW8KVnoU+2FgRyi+YSBUbIrtry3Egtb7
         jw204lyKfmju2S5VKQuVHXPWu/4aEB6yFCFzd8Z+MsT0D8cG6WdEZ5mSQt5hXMqao4ck
         eN2C6YK3C3bdkDKUIPtl15jjIBXeXaJZlTioSM0ANtTBN9QoFEDzfMwUQdLv+OGH+jQq
         TQWQ3vdr7+jCbf6YRi8316BE+tkhwxUBl+265FThuySNjXX97ZIAVJ+0zQ/2LOCKGRbQ
         +QEIqSORXjhO4l0hrg9Kw6Aae+QH8OKtMz7GASgA8ojDYf0KgRElsavVf4iSRgq2kc61
         z8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715866822; x=1716471622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL50Hp7iL/aRLAtSxMHrUM7s8ttuqkWfRiWw7eMXuF4=;
        b=l8m/sjAriEYYgumt7V6CyA6kcVrdmcVafmvBxullja37e7p7llRTG/WqkdHSeC6udm
         +KZC+s3zSNJNiev46HcvkeM1cKKnDz7QZq7pCj5kdBIYoId122CmNzAaVuzExRph2CrB
         3/qeU9vHSzeK5D6AU9gSBXdTS6nuxsnZYgdVvdnOysYaM+2d3erUx66eQX8MNyMnLZ+P
         NS5vZw8mGdJrUr7dNuiSueFFnm1nV3NG3VDTk4dUABlFOnV+40L/cbeH8ghdPxkaZDZ1
         9kidnefjq7VIGQn8uKKBb9YdVPP+JK5DWJZPfo1qQQBLZDPzE3ADKA7fC6UTKMZtHWPM
         +51A==
X-Gm-Message-State: AOJu0YzL1F8qqlItbuFOlRGvbkJnrcENO2MeA6VC/9gkSiI7oDmhWFdy
	HQt9ad3ipQ9ew3oLQTfoMZhZE/FVhyMQXbtuvzpLCjFcNZEtk9NS
X-Google-Smtp-Source: 
 AGHT+IHro9w2hhTbEYma2Do1XWHkEiexNaff/iRzBuPLTV8K60hJ6+S1StvoamhoHiu3RghrrIFCag==
X-Received: by 2002:a17:90a:9084:b0:2b6:c650:fb53 with SMTP id
 98e67ed59e1d1-2b6cd0e7c20mr14758763a91.45.1715866821543;
        Thu, 16 May 2024 06:40:21 -0700 (PDT)
Received: from thought.. ([181.170.161.59])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67116601fsm13712518a91.23.2024.05.16.06.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 06:40:20 -0700 (PDT)
From: Manuel Barrio Linares <mbarriolinares@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	Manuel Barrio Linares <mbarriolinares@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jeremie Knuesel <knuesel@gmail.com>,
	Lukasz Tyl <ltyl@hem-e.com>,
	Christos Skevis <xristos.thes@gmail.com>,
	Jussi Laako <jussi@sonarnerd.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix for sampling rates support for Mbox3
Date: Thu, 16 May 2024 10:40:02 -0300
Message-ID: <20240516134003.39104-1-mbarriolinares@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <87ikze486g.wl-tiwai@suse.de>
References: <87ikze486g.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GR3K2CM7QX7HFCMRBGHSEWAQQOSSHYYU
X-Message-ID-Hash: GR3K2CM7QX7HFCMRBGHSEWAQQOSSHYYU
X-MailFrom: mbarriolinares@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GR3K2CM7QX7HFCMRBGHSEWAQQOSSHYYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixed wrong use of usb_sndctrlpipe to usb_rcvctrlpipe

Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>
---
 sound/usb/quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2f961f0e9378..58156fbca02c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1740,7 +1740,7 @@ static void mbox3_set_format_quirk(struct snd_usb_substream *subs,
 	u32 current_rate;
 
 	// Get current rate from card and check if changing it is needed
-	snd_usb_ctl_msg(subs->dev, usb_sndctrlpipe(subs->dev, 0),
+	snd_usb_ctl_msg(subs->dev, usb_rcvctrlpipe(subs->dev, 0),
 					0x01, 0x21 | USB_DIR_IN, 0x0100, 0x8101, &buff4, 4);
 	current_rate = le32_to_cpu(buff4);
 	dev_dbg(&subs->dev->dev,
@@ -1765,7 +1765,7 @@ static void mbox3_set_format_quirk(struct snd_usb_substream *subs,
 
 	// Check whether the change was successful
 	buff4 = 0;
-	snd_usb_ctl_msg(subs->dev, usb_sndctrlpipe(subs->dev, 0),
+	snd_usb_ctl_msg(subs->dev, usb_rcvctrlpipe(subs->dev, 0),
 					0x01, 0x21 | USB_DIR_IN, 0x0100, 0x8101, &buff4, 4);
 	if (new_rate != le32_to_cpu(buff4))
 		dev_warn(&subs->dev->dev, "MBOX3: Couldn't set the sample rate");
-- 
2.45.1

