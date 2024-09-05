Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65C96DB7C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73DA2B65;
	Thu,  5 Sep 2024 16:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73DA2B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545852;
	bh=HGKKWuwE3+8ouI0WFbu/VAtPy+LRBtX+ATMaNod25ho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cywdtPrJt02JC1uDG3d4LPlE0ssCpTruflhe/m9MnJe1dEzvzuJ7QHBlTKfLcyu17
	 WfIGOrRiHah044w042GFN4ITaTX4OGCJ65pckHf8xaoaLKRVzFVTj+j0TLy3odt3Sl
	 QbVNKupZxazso+QYQynwX1WcgQxx/wjNgVu9KpAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BFB9F8080A; Thu,  5 Sep 2024 16:14:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65776F8081B;
	Thu,  5 Sep 2024 16:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06E49F805B4; Thu,  5 Sep 2024 16:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BED1DF80605
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED1DF80605
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YX2fyYEv
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42c94e59b93so11220435e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545627;
 x=1726150427; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3kylnJVXfNp6rw3d/1irQrhp19zNyQdKhcZsUU9cnk=;
        b=YX2fyYEv0upITTzImTQT1efT7HQ8Il7VAp9BL7+Qg/AD5JsdNiffxctheHi9/epwCw
         doSrwX9wpyGFefP9zzggt/AZenvN7VaZK5ELAexxLUb885L/8jBn4sHWOwQeoD5R8EnQ
         CU5nH2qFjODYyTJQRaWdMtMpIu2GyfwB7dtA85l4NJn3nJLFhxaoVpFdI1Gpi0HgRjaR
         iEPHS0IFL0J69hlozoFf0eMzIbsaHdEYLPGiHvS8nkpfKV2zT3s+aWh4kwUkNIpJMyZf
         dKMneABU5LxkqEkZPFxUK+XdF7lcWaT/ciMKZkJ6W+5cLqc9oHzrjbK/FUhriz9jx3YP
         +mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545627; x=1726150427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3kylnJVXfNp6rw3d/1irQrhp19zNyQdKhcZsUU9cnk=;
        b=Voqf6ofPHZWJEjslold2g6PTUujUGSn/ZprphMhjWwb1sNeIDznJqYxFmx45fCrpGK
         TJHpYjLdKybEp7t1/MKcK6fY0OKJ2aN8RmIeLbwEuj7d5yPbJUulQI3V/NwqKW8jvB2v
         qpa43GjwfDz+3qtjNd4tpNGWc1b6hiF3NArxDi61HL7lUTBBwzpOJN+WUDbdmHtVOCn8
         y8+etg9gyiwN8M52FoSs4729T7X5hZFe5e+E9W/8uqW4aDQrjYQ8F5MtPw0GukAG2h/G
         bsLg4V7PuVIjYXUbj6yI6/yg7Fivz21VyYApoDQ2tu+PApf4bCN2Jv3pQE2CGG0B0/SR
         yZOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzASSVWwFh85tAmQ+taU5azodhiVlyK9OZnvo45vpc9s+TPF+zPc0vCpzwEmxhIFH8KMM/fjUAvZcD@alsa-project.org
X-Gm-Message-State: AOJu0YwyCikOS9yDt9N4vJ1nD27+3raC58olS5itpr+cIXJ8k/ejIQ/0
	CPhXz6E22GH9teQDGyyr1GrktdQLGzEgs4CBvieyiVZbO3VabkRxzSSSqb7Jt/o=
X-Google-Smtp-Source: 
 AGHT+IFM7C/kDhVKsqo8gQ6poeqRmyyUiqotKRoAB2OwlkxpEQHF6JubaidKOiZBM8wLmGV88wvgwA==
X-Received: by 2002:adf:f745:0:b0:374:bd00:d1e with SMTP id
 ffacd0b85a97d-377998aafbcmr3833233f8f.3.1725545626528;
        Thu, 05 Sep 2024 07:13:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:04 +0200
Subject: [PATCH 13/13] ASoC: spdif: extend supported rates to 768kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-13-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=HGKKWuwE3+8ouI0WFbu/VAtPy+LRBtX+ATMaNod25ho=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byIdu+85ezuHy93WyoVP+yWVeGiEH5uiklbm
 ulYpPtqetGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8iAAKCRDm/A8cN/La
 hSFOD/9TXxTKB/AmL9i5/scP75UlZWF2gxl0FZzdSxtB9odmLY4QtohIVqBLWKF/m10g5rOpk+x
 eUR9f+9WMuTP6Ya1RfwSxUydN9Vc/CGtInW+6uPNAQq9ucANTIRbu/ZwEjpoyraXshUAXjaq6ky
 i0TlxG4s7qKuY/0ZLoQLKSylnqxgUEqxPMGe/ys5q6eqbJAF8Z5wmgu0efKW+a2HPZsFkATOaUA
 HNR5J4aoEDZ+YlNh79i9yFG5Cfv0BuZp2s7wKrE6/xbN5pe7STe2mPjnaLtLzjJunezCPpgOR5g
 zFXVHXXxuS518z0uYjIp1Lu8LsE+Hok0Yy+1hMNvd+jctg0iQWNxZ9Y8YflraJ8/HnSpZPeQJgr
 ajQDDm9amsoB6wGM7YpsQiE7GTN+cA0QMRlp30521hVu/6yeCEDqZyW+8qkdtDIt1EJb3JhMsx4
 VzLTkeMEdHtWZ2GXKlfNvNaWYnksLfi6q2C7T08h05VzXkohE8jSmP9WHeoPMFtMG8rnjXN9Rrx
 6mwyHNApsEomVX5gx0JcJxBDpXKKW5Ny6b6KTDXQus4C+j+lF1E3NndGyGbZX2uDtBDEERybCRF
 4Rpja3xmwdlmvg31mLCavX9pnnV9xJGyiSS0z6e4s/b2yBf/m7IIBNzHuKZY6LpRt186CTo7+ze
 OH0S7WtKYhGB5nQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: 4OA353ZCW66IGR72ZRNCNE2O6N2CNNM3
X-Message-ID-Hash: 4OA353ZCW66IGR72ZRNCNE2O6N2CNNM3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OA353ZCW66IGR72ZRNCNE2O6N2CNNM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

IEC958-3 defines sampling rate up to 768 kHz.
Such rates maybe used with high bandwidth IEC958 links, such as eARC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/spdif_receiver.c    | 3 ++-
 sound/soc/codecs/spdif_transmitter.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..310123d2bb5f 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -28,7 +28,8 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 	{ "Capture", NULL, "spdif-in" },
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..db51a46e689d 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -21,7 +21,8 @@
 
 #define DRV_NAME "spdif-dit"
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \

-- 
2.45.2

