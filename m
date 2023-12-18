Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A206817462
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 15:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14542DF9;
	Mon, 18 Dec 2023 15:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14542DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702911476;
	bh=hgcNamp20IyxtVSNO1BYbtlnzacLKyoMbM+jZwGBK3w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sCOqMknluEfmbommq2uwrk2hwkJy2kVBUbA8Y7KamSZi2BU5fPyPUJJFChGLtv+AZ
	 6L/BXd4CUAsTc/1IlIWLHpcl7C/WGvc8Syd6fIFTGBu785V/YUQC6kJZa5fMTpsLFL
	 9sNUFi8biDvqU/EiF/zbofI57R2w2MsklDWXH++Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00800F8057A; Mon, 18 Dec 2023 15:57:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A6FF8057A;
	Mon, 18 Dec 2023 15:57:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 976ECF80425; Mon, 18 Dec 2023 15:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5DFCF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 15:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5DFCF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=l4F5EP6M
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so31375055e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702911431;
 x=1703516231; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejW8mYTHsaSP2x9nTPGi1Vc36flABAG/m92kKNfgtE0=;
        b=l4F5EP6McYxFhiXNhMhQ8tCQaPF6jTOzIHU2/19pegb7EYQa3oMHlCxmE853YpNKSl
         Pb0FsnVKrUFleENM5xYDGMgmYFtrCuraOMCHHiK0+mS+R+w6p/ZLFB17QgDGz/YxIW8L
         q8WNs40az0utArtzO2UkIf4f8WYlX6CzMMHzV4o5CnPTGD0LaU6xPkW8DhK2V3PRuJe8
         sD1gN+xt3D4SlnkBBA0jmxWr22iebtqPTSixPJ2McmGctnyklmtMbOMa4+T1MtPLbods
         Q2XiDTRdJcJKKt2n/00tOdHlt7mXM8evjwuugBvxXQejHwr6D4hh2mk7fUvrIRUt0iBK
         wUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702911431; x=1703516231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejW8mYTHsaSP2x9nTPGi1Vc36flABAG/m92kKNfgtE0=;
        b=ZfSjEwQWsU2jv+nG0OPUmX4/3RSY0db8HHTo7iHWLMkA7dMvxeOf+fXa2tsP3QY0Bm
         Z/syS1juPPzhU34uV0wePHkQXX2HPW1XO556p+zfKzp2Rx8J/Br7wVXo63KNiMRZ/B0A
         cJXwD2WjY7hDlgIM+bkdc+N9w0rTOaomatLLKidUZrfWo5MlQIKIMej7JNf22sOQtv6k
         q5gOoh8nZ6Y9NGRUGKmvDCXSk6yxiGx1PcSMwqfAm0ptuzT8E30plyWcUUCQIJQqpqkj
         hiB/oH1wxjkjYl86ZmoWUnBpUpi/vXpYMOWyU2TOBIIhI6orx7ocPRXDz6LLZLZh0VF1
         fNVQ==
X-Gm-Message-State: AOJu0Yz4ldlg8CAi9ZNYhYZNTEy2+UT4F8iBL3ySBcy5CH9jOY6DvjXo
	Q/dVCOQRbL8RdNUQbFlauqW4YA==
X-Google-Smtp-Source: 
 AGHT+IGMmNT1wjDlCVxKWzxDjNxrJWY/X56rrN+bYXUA9s8NkWBJWZr4tcv3yKeTlvtQ6zaikL0UVQ==
X-Received: by 2002:a05:600c:46cf:b0:40c:3d90:49f1 with SMTP id
 q15-20020a05600c46cf00b0040c3d9049f1mr7972031wmo.125.1702911431628;
        Mon, 18 Dec 2023 06:57:11 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:29f2:94ce:d35d:aa25])
        by smtp.googlemail.com with ESMTPSA id
 fc17-20020a05600c525100b0040c42681fcesm35465477wmb.15.2023.12.18.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 06:57:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
	Hsin-Yi Wang <hsinyi@google.com>
Subject: [PATCH] ASoC: hdmi-codec: fix missing report for jack initial status
Date: Mon, 18 Dec 2023 15:56:52 +0100
Message-ID: <20231218145655.134929-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YXMSYDKUGKNQUI22EU3XI57NKB5PNIYR
X-Message-ID-Hash: YXMSYDKUGKNQUI22EU3XI57NKB5PNIYR
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXMSYDKUGKNQUI22EU3XI57NKB5PNIYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This fixes a problem introduced while fixing ELD reporting with no jack
set.

Most driver using the hdmi-codec will call the 'plugged_cb' callback
directly when registered to report the initial state of the HDMI connector.

With the commit mentionned, this occurs before jack is ready and the
initial report is lost for platforms actually providing a jack for HDMI.

Fix this by storing the hdmi connector status regardless of jack being set
or not and report the last status when jack gets set.

With this, the initial state is reported correctly even if it is
disconnected. This was not done initially and is also a fix.

Fixes: 15be353d55f9 ("ASoC: hdmi-codec: register hpd callback on component probe")
Reported-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Closes: https://lore.kernel.org/alsa-devel/CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com/
Cc: Hsin-Yi Wang <hsinyi@google.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 20da1eaa4f1c..0938671700c6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -850,8 +850,9 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
 				   unsigned int jack_status)
 {
-	if (hcp->jack && jack_status != hcp->jack_status) {
-		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+	if (jack_status != hcp->jack_status) {
+		if (hcp->jack)
+			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
 		hcp->jack_status = jack_status;
 	}
 }
@@ -880,6 +881,13 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 
 	if (hcp->hcd.ops->hook_plugged_cb) {
 		hcp->jack = jack;
+
+		/*
+		 * Report the initial jack status which may have been provided
+		 * by the parent hdmi driver while the hpd hook was registered.
+		 */
+		snd_soc_jack_report(jack, hcp->jack_status, SND_JACK_LINEOUT);
+
 		return 0;
 	}
 
-- 
2.42.0

