Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8C96DB80
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9893D851;
	Thu,  5 Sep 2024 16:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9893D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545862;
	bh=YUa9+oulAKKpY4+ZmUA43jZaEs/HvFYhSQry68awQH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lM6+gNDV1qnOEB9JGIN7nrgy3VisL7O3317JVRDwsdICiRIaN+4uKF+0Yb1y2Gk5j
	 pv2EyqPutBzRUZsSIkpSwkKM5EosFcStfXLykl9PPoQfycUksGVOdOVSxfVuFO7cvH
	 KV4X76BSDx9k3REF43FzMwB54RmoVkptIDpGl02g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0179F80858; Thu,  5 Sep 2024 16:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54897F80858;
	Thu,  5 Sep 2024 16:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D491F80622; Thu,  5 Sep 2024 16:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47618F805F9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47618F805F9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jd4LJpaG
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso456888f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545625;
 x=1726150425; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVHTuNGWpcFrdg1z92VZwboxKWfkM9u5ktFj5pVRY10=;
        b=jd4LJpaGjt2k5eEqIkwSvItzUZ5oQyEvWU0Eye7rfdAYQnUYsvOMjE2kn3hh7Mh+92
         VQHIZtwiEWBOFrjWbk7H0dKSEJYgMjiag+lFt/2i6jlBsl1nyveQGwCEZzrhLUvNTjg+
         KTgxHK50V57r5U4RMqG/bKD9PabbfumcTr91fY7zbBOSkwckqGBou246uFv9fKkcHWg+
         iRUFAfLUJvUDd7cOLW1NBw9YSy5bt0RuezjejvscoO8YtJAuY+Js+ohdVtnhJDtOPMMH
         MxdPDP6Zp3sKazERohg7EJlatbS3ZxY2rpPMXfVEry3SqRlg38WRLU3pf7aNXc6Kkvic
         rwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545625; x=1726150425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVHTuNGWpcFrdg1z92VZwboxKWfkM9u5ktFj5pVRY10=;
        b=HZJcypTbcq/eVscX9+H9Pylf4UKKZ11FecsWU8FwrgNwbXIIaYK/zNihMQWgjwZ3yf
         ugErbZyxCbeWh3dv8JMWuhB4n0LBTnhiwW1b+TmbvSY9X3kYIkmWmMmGEXh3ak0JRAc3
         pm2GbZ6GOgfwEtUb73fvm2ZQydIfIH2A088m4DidXsA77wD7MWzkdU9eMya35gWffaXd
         LVHq8SE/TCHH2uOE/BnfDETCZKKWd7dszaEbhCgWCndVnN6w6B6e1ijAmHg6VY4MMENj
         AuIGN+xd9fpjVj29ikvH+Knt+E0tnWBrtol7tQmU3qN5tuhCreNWx8t/6gR0Yl6zns40
         Escw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Y/Xdq8Ymz9n+SwyqfbUYm26Mvz7WzFggGNI5/pIg6/Bzs11MCNmRl7hBsuLAja/toSYgJSQD5SDU@alsa-project.org
X-Gm-Message-State: AOJu0Yx4qPicKH5G9ufM5Ps3hiiM37ifoHCnTmcIiILuPJX6KkDTayiA
	f74hsmvFgtcc3OZwDJgxinL5PVAjMj4BtF49s5UXfJkbUeMehgHX3tX5P7FlDQsoByRq7wXJiP3
	B
X-Google-Smtp-Source: 
 AGHT+IHAt5Z9yvfW2N2+9sKeMO31xt1LKMyq74worjfNWzRpMuSL5RmIi0iCLuGFdoOTEvAgdLpsNg==
X-Received: by 2002:adf:ee52:0:b0:374:c7cd:8818 with SMTP id
 ffacd0b85a97d-3779b847c99mr3905848f8f.22.1725545625178;
        Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:03 +0200
Subject: [PATCH 12/13] ASoC: cs35l34: drop useless rate contraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-12-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zpT7vKk5RwGNqc2qh5o2gdsxY4SIBJHwPSpJGqPGkl0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byHCu0z886qTeaxytjbJcYPUhvLKi6a5nmcQ
 KBa6BdBIQyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hwAKCRDm/A8cN/La
 hWBED/9N7WEhGEgo9YoopFhslbk0WKky2qk9oskEHauCvF+Zre638/Xs1VKjHXi5gaW9DFsewCe
 8BXQmpqic/g4g/KZ1bSU1gtRPJzWuQUM2sbKRbPjwKl3ZjZY3skXMdvGDktmbmAUEjQfWYyaHGp
 Mx+5cb9seHfCb9CfRzA7CBAiPP9QKgLirL/w73Efii1rED79nzvGyZyiUotDKkV5jCOn6FQJumq
 2kH2l4bM25BHOjvqtDCybOuKSbj7gxcC5aHitquhM9xq+pLrqkhPRa6z442lqP0GQNio182qG6a
 tIc3t4wI1L3D0bmggbA+qpNban+Ue2uHEMMlamtUZvCv45CGzqAbASvy0/rEos+HTWwVE0syyuL
 JpIFB4+crXOpQK5VoFJM1QBkYIHzuqFCN472OafDNVoVMS9d9QAQkn4UkaOoufUcAP3WZsBQ1wm
 QeWNgOVhBKM0MI9XohaVpY7JjPL2dzNlkWnHTFmWKBrew3BfxxImdzNm3eNalKpVXBQHwQJ3di8
 26bAL9glcTCmq2VhAatgJCb3Xnuml1EF8l9LtKVa58KbBQRytqxBms114Bu0XK0mS1EzsfGzgLT
 a3nLAh2/+yq1IsqtNqQxdX9kmziJfWm6CZAgMhKfP3/5UJTczHgjPwpCTCZ222w1+iJ0I5R4BP7
 cbzeB5PHdHllGJw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: UZFRADU6RNLVFFNOOWKDJ6RWS7ERTK6M
X-Message-ID-Hash: UZFRADU6RNLVFFNOOWKDJ6RWS7ERTK6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZFRADU6RNLVFFNOOWKDJ6RWS7ERTK6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l34 adds a useless rate constraint on startup.
It does not set SNDRV_PCM_RATE_KNOT and the rates set are already a subset
of the ones provided in the constraint list, so it is a no-op.

>From the rest of the code, it is likely HW supports more than the 32, 44.1
and 48kHz listed in CS35L34_RATES but there is no way to know for sure
without proper documentation.

Keep the driver as it is for now and just drop the useless constraint.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs35l34.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index e63a518e3b8e..287b27476a10 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -562,26 +562,6 @@ static int cs35l34_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const unsigned int cs35l34_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-
-static const struct snd_pcm_hw_constraint_list cs35l34_constraints = {
-	.count  = ARRAY_SIZE(cs35l34_src_rates),
-	.list   = cs35l34_src_rates,
-};
-
-static int cs35l34_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &cs35l34_constraints);
-	return 0;
-}
-
-
 static int cs35l34_set_tristate(struct snd_soc_dai *dai, int tristate)
 {
 
@@ -639,7 +619,6 @@ static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops cs35l34_ops = {
-	.startup = cs35l34_pcm_startup,
 	.set_tristate = cs35l34_set_tristate,
 	.set_fmt = cs35l34_set_dai_fmt,
 	.hw_params = cs35l34_pcm_hw_params,

-- 
2.45.2

