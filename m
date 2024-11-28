Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C59DFC32
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:42:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E73E82390;
	Mon,  2 Dec 2024 09:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E73E82390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128962;
	bh=rnOC0uH0wL+DXjz2H6rqda5uQT4oyuQ5UJk1N1XxOts=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tzxU11MakiiuS9xOHY5AO4ut7xDwqIzCYqBTilVNeVLIOrNi74cBbi87rqdmfQ9Ea
	 dY9SMeSXIyt31nTfwqWPoFLR8ywm2Av2qewAUlWQ6P3SvCAAOufxcpQyn0RhTUkwKY
	 lNil/jkuhgM4ZbpJPRIBR5fRlgkUbt46c3JT/JLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B56AF805FE; Mon,  2 Dec 2024 09:42:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9635F80610;
	Mon,  2 Dec 2024 09:41:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E97F80236; Thu, 28 Nov 2024 13:28:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com
 [209.85.208.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF33AF80134
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 13:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF33AF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=lek4HB9A
Received: by mail-lj1-f202.google.com with SMTP id
 38308e7fff4ca-2ffd1bb0f13so3286101fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Nov 2024 04:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732796858; x=1733401658;
 darn=alsa-project.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hHScKB5wW3lYyaHNo3U+czR+30FvC0SvhNqkl2ETsUM=;
        b=lek4HB9AR3KwmJaZQ1m9KYoHat+RsnhrfL1+prIdGKOIhL4uWt+xGysgfRVJrzyRQm
         xi6VMdCGShFfNHV72m5NTEv57W+FkFviXemgbJFYA4MmM/PPq/EWYLwAggLVgtZTX5TY
         Q9PhCbGdX7OzLvc2vK99OODINw4milunN/8fT1Ntdw/jG/KTgC70zEMxFoo/n7M/aGyh
         1+FtuOEQFxKWexNXLGfWa3DuZ0MDhY8fC9GFksq5GLjuKa2kiD8S/WZhpOgmtx60uIKS
         FEMCrFsKor38qgWPUWKnCxnCbuPzgqxi+LWBgjjgBIkK/QqNJ6U5x+OzBll68LurrP/o
         1Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796858; x=1733401658;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHScKB5wW3lYyaHNo3U+czR+30FvC0SvhNqkl2ETsUM=;
        b=eRLom9xhXoCcJgNXBQkUfWruE3Cv/v3os6i3A+A45Zrd9QHdmkrtrPVDrzGHrVBZgY
         uoF3yOoi8/Pqnicg5r3JFBNvPd+6S2SpeI9Ly314zN6LwvTL9SJVb+rnu0EF4tT40YNu
         69R+E3cTXj2vW0b9bIfg7V+x/cu4aRq65TvC+3OXPZaBr8U0J26LIBEFfhJmNHN3jMjg
         BDKgdeKFgIRcn7ybznWlBde0l6HJvSN/UoTVDxYMMW7yxcL1/5yDIscl30tHVvfXKIOa
         g5NbMj9RcitMoiMxMQMYlQpQDyfB7s6y839dDUelAhMtEsYp5K8BpJG7869E/6rE4YZn
         90hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY3Zc9qf5vuaTwEkoiwTmpbKj6WrDsyFB0rU3g5JsHt6qnay/TpZNfLQE15GI9L9X0BRu1hvMCetCa@alsa-project.org
X-Gm-Message-State: AOJu0YxLf2k9t+x8IQvvIJP/rWRTQcbr4ERlNC3WqMKvINLw9doaI+34
	DRT2+gUWa0sU0AStUOPAKuSVWauySQoXeOTCq+5KIFZOk8KgXyGM6m35/PJH0pqi2x9TNuobhC5
	28rbrndPOhpEp5A==
X-Google-Smtp-Source: 
 AGHT+IG386o/8+zflhUeB+C04ILmkl0WNRST1JorMAgcHdNp8s7vWtrSpAiv3PMxUfmbfhdDnCwCZO5eIeiScQ4=
X-Received: from ljqn20.prod.google.com ([2002:a2e:bd14:0:b0:2fb:48a0:ba68])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a2e:bc22:0:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2ffd6043995mr41060741fa.14.1732796857921;
 Thu, 28 Nov 2024 04:27:37 -0800 (PST)
Date: Thu, 28 Nov 2024 12:27:26 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128122732.1205732-1-mmaslanka@google.com>
Subject: [PATCH] ASoC: Intel: avs: Remove component->set_jack() on
 suspend/resume
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
 3uWFIZwkKCt4MMASLANKAGOOGLE.COMALSA-DEVELALSA-PROJECT.ORG@flex--mmaslanka.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ABGRER4TCHJUDLLOI7HIONIQ5UZHOUEI
X-Message-ID-Hash: ABGRER4TCHJUDLLOI7HIONIQ5UZHOUEI
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:41:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABGRER4TCHJUDLLOI7HIONIQ5UZHOUEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Removed calls to component->set_jack() during suspend/resume to fix an issue where an inserted jack
is not detected after resuming from suspend if the jack was inserted before suspend. This problem is
caused by calls to the sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function during resume,
which forces the jack insertion state to be unplugged.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>

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

