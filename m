Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98496DB57
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9706284D;
	Thu,  5 Sep 2024 16:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9706284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545652;
	bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IzPCoenL7bvotsH0OSMv2Y2VDIAuDhyeJpW76HBObdaIMV0ueVpM34wYe7a/E/Y60
	 6R1nxXXbJiEWNhrI0qz4Hb2XI063jqvzJN6EWRejnp/ocuyULaxD9gpsJlJu6w8TpC
	 MW/NCQJ2TYH2D6ejROmE1r8wwqGRfpty6lZ+1QA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69ED8F805B0; Thu,  5 Sep 2024 16:13:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B8A2F805B2;
	Thu,  5 Sep 2024 16:13:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4616EF80199; Thu,  5 Sep 2024 16:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40A2EF80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A2EF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QAGPiEjJ
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374c7d14191so1086522f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612;
 x=1726150412; darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=QAGPiEjJvq3kbclDWeZVBqCxiJsIO69UOK6SSs1QvwHmwqgeZOLA8v/rAH/fYBAwGk
         Vg84GT98WmWkApEt6OsKleGCsMonc1WrWUKHOgSq5bjWQ0O8yN5XMN5u63ylgy+3uMCY
         OzLKCWd/X3OflhqMqgRIEqeosSjaJrQLZsszdgGo8JyNytAng0l0q3cl+dUtPLDUdpFj
         jgxKnHnf9jzyHRLuWQ0ihHPQlDYb3jqC7t4Sgp8C/gxBgqV3Fm0fvMprOudVwbMSmISY
         cpBBknfT9LFzK4a6LSdgS76p9IxYsJ/rhb9R555M4jm+kr7cZAz2aaVR/+Zrf5nK104Y
         qADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=fBye6nGwpcfH7h1ZcyuKnz06JHQriPRPLM3kpOp11671+/TbimSw1UqOxFYzzimAbt
         YTleiERWsshqekZZiD6grGthchWx9okbFqs+D7Bvf6NKs6VH9JgvfuBoGhRoxU0UlgRB
         c/gtmQc+S8KAat+6m7suxG+y2C+niWDXGU0dm7UrxxrulJoQg1qUUtl652LRHEHVUAuW
         FgEEZFWacENxCbyl/03WVwxEtCjKgdG1biEUWdoOw0jL+zFy0uS9yT8WeSVguz9VGJF8
         uZy9w7cGOLmVGCx3vKohemAhnultHepErAGkhTXp1HSajmGpweG7k4dYKbYcZ5OA9hzY
         AseQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdf3YBbsaNXGEByDj2zsQZcwT4in3iRQF2tUrjEn3oeXm8JNCjsSbFe5dz4+HT1vWiuRSYa+L5Q2m2@alsa-project.org
X-Gm-Message-State: AOJu0YxxKOIqVXc9POukARGG+9IWDJ7pfIGjjjFtBynn+W2FIvcMY3LG
	Gq2Pn9fB9ZgWcp7Q9iLkO68psz5E03zqQrEccJi9i1RzbcrhTST5vrXt/yUKCwQ=
X-Google-Smtp-Source: 
 AGHT+IEqMw+2kphBD8AL47tz8mEmZuHpdof+C2fJJPrSK7gGZlJt0fkH5qGDaTFGsntWoEZveuTOWw==
X-Received: by 2002:adf:a456:0:b0:374:c613:7c58 with SMTP id
 ffacd0b85a97d-3779bd185fbmr4162384f8f.29.1725545611138;
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 00/13] ALSA: update sample rate definitions
Date: Thu, 05 Sep 2024 16:12:51 +0200
Message-Id: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGO82WYC/0XMywrCMBCF4Vcps3ZKMqSSuPI9xEUuUxvpRSZVl
 NJ3N7hxc+BbnH+DwpK5wKnZQPiVS17mCn1oIA5+vjHmVA2kyCinOvRj8agJydS1aDn5YKKyKRm
 op4dwn9+/4OVa3csy4ToI+3/mSFYTGXItKW1V51DjPchz5vUc/GfMQbiNywT7/gUSmCnRoAAAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3160; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx9Rt27YuEl+t/28l1DzL0bq/aw0aPG+xyMs
 P3ISqYgUY+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fQAKCRDm/A8cN/La
 hX38D/9ovEPkT3Cdm6h/ix/ywvp24EQmKKZ3cy1CIVrIDMqy05UHAjwcsPllY7DezngTTiaeejA
 stPW/OsTKkDllAAbw8PX7q0eKTp0udn9BRQaYfKz9vSkDaXDgpM4f82Yj2mGwSzHtby0EY7WmO4
 CUYLtTavSyEtndrRnq056qUDZnwMSFHdRNLrMwkhHZPMOuMYcu9Fg/cdXVzopgFC0cPWcNXv+xt
 mxOsOvlwQNBbziHBZspOcvEpocfhL/1OAXurjQRtdYinwyg3tokeIlDFFZXe1szwSzOq3XrtLcE
 e4jcQi4cO4NHjcngVCHclnJtNMFNQIG5b54I8Fx3VjrqTmk7Ru/dUzqerln/WoUH3DYYFsiOsbg
 V6J1Lvbmq5pcFNKkm1R/w6gPmKAMrX68f4oXMz0Sn8n7YKng4GocbREm5LzIcqXF9vOki8GZUbg
 WJwskALFndic23zjavZZ2honWm+d8rZNqzJQHZbWslukrbpPTUEvorrajC0mS7jrf3BowWTslhS
 kjkNERBX8LTdPCbT09ll4l881blOSlxxz/rT/fUBMW5h2jexZ8YuRKisA77H+x8KeBAfTlXSN9o
 cR06agIcgoG8PusLU8buKcXLfDHfxQB8p6T2MRJOLRLkLFIAvhkteDdcDV1kIh7MK0m/JfGir2I
 O865q1eD0MuKh6Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: APRG2CXLWHIOB6I7BHONMFEBX3EFHCPA
X-Message-ID-Hash: APRG2CXLWHIOB6I7BHONMFEBX3EFHCPA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APRG2CXLWHIOB6I7BHONMFEBX3EFHCPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.

It is follow-up on the series/discussion [0] about adding 128kHz for
spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
clean up the drivers that no longer require custom rules to allow these
rates.

Identifying these drivers is not straight forward, I tried my best but I
may have missed some. Those will continue to work anyway so it is not
critical. Some drivers using these rates have not been changed on
purpose. The reason for this may be:
* The driver used other uncommon rates that still don't have a definition
  so a custom rule is still required.
* The constraint structure is used in some other way by the driver and
  removing it would not help the readability or maintainability. This is
  the case the freescale asrc drivers for example.

There is one change per driver so, if there is a problem later on, it will
easier to properly add Fixes tag.

The series has been tested with
* ARM64 defconfig - spdif 128kHz at runtime.
* x86_64 allmodconfig - compile test only

Last, the change adding IEC958 definitions has been dropped for this
patchset and will be resent separately

[0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/

---
Jerome Brunet (13):
      ALSA: pcm: add more sample rate definitions
      ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
      ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
      ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
      ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
      ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l34: drop useless rate contraint
      ASoC: spdif: extend supported rates to 768kHz

 include/sound/pcm.h                  | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c              |  6 +++---
 sound/pci/cmipci.c                   | 32 +++++++++-----------------------
 sound/pci/emu10k1/emupcm.c           | 31 +++++--------------------------
 sound/pci/rme9652/hdsp.c             | 18 ++++++------------
 sound/pci/rme9652/hdspm.c            | 16 +---------------
 sound/soc/codecs/cs35l34.c           | 21 ---------------------
 sound/soc/codecs/cs35l36.c           | 34 ++++++++++++----------------------
 sound/soc/codecs/cs35l41.c           | 34 +++++++++++-----------------------
 sound/soc/codecs/cs53l30.c           | 24 +++---------------------
 sound/soc/codecs/spdif_receiver.c    |  3 ++-
 sound/soc/codecs/spdif_transmitter.c |  3 ++-
 sound/soc/intel/avs/pcm.c            | 22 ++++++----------------
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 31 ++++++++++---------------------
 sound/soc/sunxi/sun4i-codec.c        | 28 +++++++++-------------------
 15 files changed, 96 insertions(+), 238 deletions(-)
---
base-commit: 785f4052380684dbcc156203c537c799e2f4be09
change-id: 20240905-alsa-12-24-128-8edab4c08dd4

Best regards,
-- 
Jerome

