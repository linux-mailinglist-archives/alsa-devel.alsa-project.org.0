Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE329DFC39
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0A0210B;
	Mon,  2 Dec 2024 09:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0A0210B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733129031;
	bh=I5YCLO6EscYmRHuFv26CuhdZFgeTmhHZGaOy61Yx4H4=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=thB+LyUH1EE5RDOX3GWGa6YiB8NuCnh4rTlVgkfUFqaayaFNgqsADQzwC5lvsnfIV
	 uggJvLDSrlXiQ8uEMXH96BYl5YO4UIw4mtf42rGBd9S+G49dHw143+KkQoF7yeCpT6
	 e0D7r+KhX03debCZE0ZlfURJBoNCVVacLldprSYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CF7BF805C5; Mon,  2 Dec 2024 09:42:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CDDF80656;
	Mon,  2 Dec 2024 09:42:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91035F80236; Thu, 28 Nov 2024 21:53:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD457F80073
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 21:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD457F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=P/VQz2tH
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-aa525192412so70455766b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Nov 2024 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732827166; x=1733431966;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qob0FBpsUU/sx2eCBfCzGQ8cEgowX6VKZMzDfM9xuIE=;
        b=P/VQz2tH5oVuCZDV32jvPdMLLDizDAZRUiBVyjPQHP6YLjyAcrabZdk+FEkLulUdqh
         ApYXQHWZEEweR+zd2UqR7PLDOy9NMEgo9AYWe1kBymZ390ciqul/NH2oJtttgw49gAIg
         RZjWplyUkJFO/CeluKT9YsUSQSsF0nR6qZWu1pnFgxrpJyJEkEVFFqpIkqfSjHoAxb8n
         I4coVvU60LXI7+f6aiQBuvqJe0UpGUuP2bZ+SXMoYLXVjamzelfMpLX0zLow5pYajPQP
         di9Jr7OcRnuD7O/VDCTM49YgjAZW5cPjSAqivMA16dJE+LqSGK+Pb/5TrPtyYjvhxxif
         IZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827166; x=1733431966;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qob0FBpsUU/sx2eCBfCzGQ8cEgowX6VKZMzDfM9xuIE=;
        b=kapZYYlVJ7FUkoXWJqf2Nmami32KLvJTXlBqaXNgXCwtGFnHPlo0FgHiJoUkQ/Yz72
         gnY+xkdT0WRzKtKyQXbGNmDNRjyCoAcBJBVPhVzw6cegVydO9zdDUlrS7K/RGW0r61Af
         HNrTzVI49sR/eo+Ecg9PbGOEgd2nwSFUaF8SeW7rE4bFp6ERLvfgksEVR0CpOpxVTllL
         8q+gcIjrSeLgsc79RrbNdTGT4z3/sKE5SKjbXxaBG7QFTr9ctxPjSVcM5rqP9/RCFNo5
         Bh9VpUr5ZQnPFpPhjNe42nxmUDFPOJi83jW1Xzze1qjzqnOSytl6jOb/DZE6PAunPQKj
         h5dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOYx8Z/fJfx8jha1VcvQv0LoeydzHHzOe+giw8Qfl8+0dcnQAxOsHktgbOJbkwlFpjWr83s5snCh5G@alsa-project.org
X-Gm-Message-State: AOJu0YwPofuI5aLP4Jm+SeoIoZohyd7Bu0nh8aKUtogTAzubtxqZDcrU
	FBPnUL+yDkdZFtqKl+LFlzzZ1KkFIm4L8ZaB1tjgHqxQ1kah9zH+d4btRaskxy6tQse6eHd2OxK
	64rmNuenRMgHapg==
X-Google-Smtp-Source: 
 AGHT+IHBgsLr3pLJH/ACZefffdWeb80QzhCBRqY4vhCfqkMxxEok2tAWW+nYrVbcV0Ijh3nfSJvgonr+4y2YvgM=
X-Received: from ejct1.prod.google.com ([2002:a17:906:2681:b0:a9a:bf43:6c33])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b392:b0:a9a:f82:7712 with SMTP id
 a640c23a62f3a-aa5810664dfmr643677466b.52.1732827165635;
 Thu, 28 Nov 2024 12:52:45 -0800 (PST)
Date: Thu, 28 Nov 2024 20:52:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128205215.2435485-1-mmaslanka@google.com>
Subject: [PATCH v4] ASoC: Intel: avs: da7219: Remove suspend_pre() and
 resume_post()
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?="
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3HdhIZwkKCjIaaOgZObYOUccUZS.QcaOZgO-RSjSZOZgO-dfcXSQh.cfU@flex--mmaslanka.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HVMR6S7HAE2GPPBXRFUBFXGR4WHH2HCU
X-Message-ID-Hash: HVMR6S7HAE2GPPBXRFUBFXGR4WHH2HCU
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVMR6S7HAE2GPPBXRFUBFXGR4WHH2HCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The presence of a plugged jack is not detected after resuming the device
if the jack was plugged before the device was suspended. This problem is
caused by calling the
sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function on resume,
which forces the jack insertion state to be unplugged.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
Changes in v4:
 - Remove redundant spaces from the commit message
 - Link to v3: https://lore.kernel.org/all/20241128155926.1774625-1-mmaslanka@google.com/
Changes in v3:
 - Fix line breaks in commit message
 - Link to v2: https://lore.kernel.org/all/20241128151239.1666582-1-mmaslanka@google.com/
Changes in v2:
 - Rephrase commit title and message as suggested in v1
 - Link to v1: https://lore.kernel.org/all/20241128122732.1205732-1-mmaslanka@google.com/
---
---
 sound/soc/intel/avs/boards/da7219.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..daf53ca490a14 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -211,21 +211,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_card_suspend_pre(struct snd_soc_card *card)
-{
-	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
-
-	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
-}
-
-static int avs_card_resume_post(struct snd_soc_card *card)
-{
-	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
-	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
-
-	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
-}
-
 static int avs_da7219_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
@@ -257,8 +242,6 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	card->name = "avs_da7219";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->suspend_pre = avs_card_suspend_pre;
-	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
 	card->num_links = 1;
 	card->controls = card_controls;
-- 
2.47.0.338.g60cca15819-goog

