Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13629DFC37
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58532393;
	Mon,  2 Dec 2024 09:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58532393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733129014;
	bh=CEPCLyGcP+5TlVcrY9sskKx8WTDeCpweS8+NStxhbuw=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nlIrkuG1NSD8SFaZt9ahmeaa+VZX5YFpxo4qdREgs0YysRpPwaZAFl2PGTNely+eW
	 LUCJf2nf+9RE5ZDWTAMvijJNsYelafEIshcJgHLAFlwI3F2+Ijg2zzdpB3RReERzjL
	 JM2zZZVZyKhlvmb6Tb1/x5kllFb8atrWE1dMIFvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71AA2F80622; Mon,  2 Dec 2024 09:42:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49ED3F805F1;
	Mon,  2 Dec 2024 09:42:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0B1FF80236; Thu, 28 Nov 2024 17:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A0F9F80134
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 17:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0F9F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=aZKeZR7k
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-5d0214ba84eso684893a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Nov 2024 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732809624; x=1733414424;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HCg1Km73Sbp4/xSTNme8D+2Uw46vaSy0dpia+RIb3WE=;
        b=aZKeZR7kiR8UcDlI7vbF8byFTzCn6mdWxjdwjZ/daamdgwVIlEWl1j0az5c93hqHOR
         v4uagS1c2HhnaAz3gqXecs9P6dbgawpskPx6RpYcK6P94MBRl3hx84LDJ3URWkwy0BxD
         mCInRqftIqadyMq32KHpDscCtUA9AGwgaCdZc9MMYlmU7calKYO+eZzG4+MOOCzqOcnM
         6NbN2DH1eEWZqmVBaPcQzQyUGSTBtkybrEzyqTYu3TgbX3fww7mme7UolyOpfRsK4cW1
         0LWzoxdAegPwROZhOUaRM3WV63ta40tJHbD+yraKLUhqmmUbMANGnrbnB/HuyeNwwJPw
         chQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809624; x=1733414424;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCg1Km73Sbp4/xSTNme8D+2Uw46vaSy0dpia+RIb3WE=;
        b=UWBuCslM43/dC2nkqJqWQc7opiv2UFb/vyuvSSLE7Z5bElhBquDyAIxCfck0gImozm
         +u8AP/OjMPLZWQVgXn4E+P5ynLiscg54WOoYbgEVRpc/kFEkuBPmto6/EZKx/AhuBTuy
         QzmVA8c+yXy0ZcJW6HqGov37eI0gN+63Sk8rkYKX3oE8xTiqpnV95pofYN4a3pY0go6H
         QXV8dz2TX3K/okqOWHx3No8i7vzBDR+5d3LCg/xKcsN7uidgM8VUiJ/53szXZHJVaLqX
         Bf6uHfGMzUdPLSI2ybBBK5bH2jWrG6zKpVdWE1X8Y126+xphCmDTvb8QbYQlt2gdxGA4
         0+5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs+ZFkOxFYDqG8+Sw10MjHsNkDF0s4LOPdLwW5EodBkxtlqDPzbV8JCLgEFT/jtwDJ9SUOexdiLYdd@alsa-project.org
X-Gm-Message-State: AOJu0YwBajY1GcRDYsyK2Qt/FCDUFKGx8S24NklkaKbDXvdzKfP/JvY3
	k7z/YXBpYRuZ4bbaNpD0qXGp6WXxQjQE7j8xCmMz+yBspyCP8vZDXogb1rF9mKCiGEX01jY+TMh
	rFDncXdp9fDPlwg==
X-Google-Smtp-Source: 
 AGHT+IH7O2F88sy1YkGak+ZTUuWwKlxn8SdhOmaY7RlKSth26WNlQQxcOCfxKgSD/+8oTPB23XqZRw9oivubtks=
X-Received: from edal21.prod.google.com
 ([2002:a05:6402:2315:b0:5d0:83b1:b8ab])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1e93:b0:5d0:8f29:73b9 with SMTP id
 4fb4d7f45d1cf-5d08f2974b0mr4346712a12.28.1732809624031;
 Thu, 28 Nov 2024 08:00:24 -0800 (PST)
Date: Thu, 28 Nov 2024 15:59:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128155926.1774625-1-mmaslanka@google.com>
Subject: [PATCH v3] ASoC: Intel: avs: da7219: Remove suspend_pre() and
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
 3mJNIZwkKCiMLL9RK9MJ9FNNFKD.BNL9KR9-CDUDK9KR9-OQNIDBS.NQF@flex--mmaslanka.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OQY2NAQTN5TWIPSJ4LBIRVHKYDUQ4YFS
X-Message-ID-Hash: OQY2NAQTN5TWIPSJ4LBIRVHKYDUQ4YFS
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQY2NAQTN5TWIPSJ4LBIRVHKYDUQ4YFS/>
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

