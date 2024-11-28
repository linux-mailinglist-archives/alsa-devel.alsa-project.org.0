Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F79DFC33
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27EE623CD;
	Mon,  2 Dec 2024 09:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27EE623CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128983;
	bh=jZaFTESlQqgjM5/g0OhUkZlvRLk9iLWdZ26ik6OqKKA=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NoJ5llAjl5bCHBr6llpFXXy4r/yORF6nIvHs+sh53pINL24ua1JG3IybmTBT98Ci8
	 h93YSwwdOlBFislFy4xwXiYhMhEqS/vQTyvq+sTORaXf1nkcLfeaubK8djz6yUxvVW
	 2TkUTkoHFQbhl8YEnmLMdq9aBdp1wSgkhY2Glnl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B3C6F80610; Mon,  2 Dec 2024 09:42:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F1BF80610;
	Mon,  2 Dec 2024 09:42:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5EA3F80236; Thu, 28 Nov 2024 16:14:01 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FBFBF80134
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 16:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBFBF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=2bkOxsqr
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-5cfc0004fabso988329a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Nov 2024 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732806779; x=1733411579;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSh6QnXu4JErwCzUbAtARbKC+82Ed2BaKiOEpcdsIeA=;
        b=2bkOxsqrb9OvfN3A5V8h3fMgFaoMh8Mb61bGgJSNpm/LbFVt5e3+jVj5aFPmO+4hl4
         B2NyUKvC1ARst5DGNKvsszL5hfhYqe7nkV4Pbju3qsuYs02s8B7h/Mr5gIJSobHqhH2+
         yukdXgbPyEY8vPzyhqfBTBH2NjnZleOmIY86fmqX3QJP62862q9vx+u+/9IPJ1LAz8iK
         pE2o3NfnGV49R4oDFCc2QfBS/xAarPk1rZI0U4ylRIRIjZxcqpehR0X3q3Y9SJHZUP4v
         Q9XdxLO3j2wqE3/PfuNmq6jJK6TONnAvoc3u4hAAKRNJOgDNU1CdcjXfncTdTJEU77yQ
         UfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806779; x=1733411579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSh6QnXu4JErwCzUbAtARbKC+82Ed2BaKiOEpcdsIeA=;
        b=ExjrizoCPIcbEiC4CUIPEMDL001S7VBwz7jx+9BVxqp6AsTO44KhbGiESDZamE3OiW
         X6JpW119xmHNhdNTYIUMszjFHZTZbukd6UOnNmd/UCr+vN2DBZvWMybqzv9FiG1RfsHp
         fmA3Q9iUQE/AyZBbbnwflATmyrTDlbiLN207xCPrK8XnCKkLxGJRUzf5UValm6e9YU26
         PYdSye5tmgtO2x3AFnILE7Ci8pS/R9lMnntpOjDPicuJJXyyXcI9acloCVyKc3L5BrRK
         o9cFbKKrifqAM7vGytljLyX9m4Qt0tkkn/t7G5BKlyTKzA+TLwLqrtSqdwpOgK6pl/mQ
         3a8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWELcwAPwzlMrysqTMSuPqqmoXl6x5se+0v+QwRW1ziwPHHOjgpvAGc6ctAxQk+Hnwl2dP0khvgFfOF@alsa-project.org
X-Gm-Message-State: AOJu0Yx6kGPZix7l5TklFJCjDSk0lhYjPsNTflROzKNgqOLQ5gLyrubt
	/VjqgrR1ibKu3Io72Hb2PLEolYfiGXZ+VGJH86XtS3GtZRVEcUs09UI4nzwiaCeUqAVQbpHBjHF
	joYCeEm+p0zxkNw==
X-Google-Smtp-Source: 
 AGHT+IHq0l2qnpUzY5y+BAxA1IUd+Zn8AezLj6NB6ygY7wGAKaYgh5TGRFSFknDmKi+RWi9rn7z1x+pjDOUKr1o=
X-Received: from edfb72.prod.google.com ([2002:a50:9f4e:0:b0:5cf:8596:18aa])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ed4:b0:5d0:975:b1c0 with SMTP id
 4fb4d7f45d1cf-5d09516035amr4028779a12.11.1732806779218;
 Thu, 28 Nov 2024 07:12:59 -0800 (PST)
Date: Thu, 28 Nov 2024 15:12:32 +0000
In-Reply-To: <10062d09-34c8-4e53-b5d7-f96a5b19f6f8@intel.com>
Mime-Version: 1.0
References: <10062d09-34c8-4e53-b5d7-f96a5b19f6f8@intel.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128151239.1666582-1-mmaslanka@google.com>
Subject: [PATCH v2] ASoC: Intel: avs: da7219: Remove suspend_pre() and
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
 3e4hIZwkKCu4ccQibQdaQWeeWbU.SecQbiQ-TUlUbQbiQ-fheZUSj.ehW@flex--mmaslanka.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RTQBYFG2ZGGEN7AQWMNQTZD2M7QZAIGT
X-Message-ID-Hash: RTQBYFG2ZGGEN7AQWMNQTZD2M7QZAIGT
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTQBYFG2ZGGEN7AQWMNQTZD2M7QZAIGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The presence of a plugged jack is not detected after resuming the device if the jack was plugged
before the device was suspended. This problem is caused by calling the
sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function on resume, which forces the jack
insertion state to be unplugged.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>

---
Changes in v2:
 - Rephrase commit title and message as suggested in v1
 - Link to v1: https://lore.kernel.org/all/20241128122732.1205732-1-mmaslanka@google.com/
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

