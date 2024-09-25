Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D00985867
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 13:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D308C851;
	Wed, 25 Sep 2024 13:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D308C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727264570;
	bh=KsUbmYF8YtOYHc24gp4P3/8STVskOaG1zmO+RYKzUhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TvcI4R2KOSC+frWR87OgAgowX4R7mKCEmWRzgcy2DG3/ZsKc0awxwYjTyvwWxxFHq
	 yO/ugSTe3tn7ivXaDMZSnvT/gDtx3yEEUwRejGjxMA6y3PvKTt9S0GWkCC8NzBfqXE
	 NnQAvjEy1neM1skOEGZ68EgW+3h6WUIQCDKPF4Ds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B8DBF805B0; Wed, 25 Sep 2024 13:42:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C22BCF8049C;
	Wed, 25 Sep 2024 13:42:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC876F802DB; Wed, 25 Sep 2024 13:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932B4F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 13:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932B4F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ceMei6pE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47EF85C02BC;
	Wed, 25 Sep 2024 11:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AC0C4CEC7;
	Wed, 25 Sep 2024 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264528;
	bh=KsUbmYF8YtOYHc24gp4P3/8STVskOaG1zmO+RYKzUhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceMei6pExIgdWkgxQIiD5ltuVVHmCCpRmOWVuUaiq9eWBle7qfQBPZP3wrTiNdVxo
	 T+DIKN0M/uJXlawzsO53CxBkuTlmFN/RbfvW6HOhULZb8qNRKXZApRDwaEep2UYYGQ
	 MAWgI/+bq1PuzcjXyvIz5OvYGwyYrMQXbsiRMxBJKiSQZ87S5TUCcbn4f8nyYHrGdI
	 YWvOliUobWxjPY5WMZmzdmsykCcy2Tb1Jfywv4ZwfdCvU6bM58ccFzT50uhCc4ZUk/
	 qbfFBx9GSiW1CsE9H6GTq44X9ZTL/KjYR8we3sFBwm2504BZKH4+Du/BfZFh9icGxB
	 RgOFZ6SkbBf4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	hdegoede@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	alban.boye@protonmail.com,
	tomlohave@gmail.com,
	chao.song@linux.intel.com,
	christophe.jaillet@wanadoo.fr,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 111/244] ASoC: Intel: boards: always check the
 result of acpi_dev_get_first_match_dev()
Date: Wed, 25 Sep 2024 07:25:32 -0400
Message-ID: <20240925113641.1297102-111-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RHG3N4C7APSU5P5ZKUFPIOYWDYSBALDR
X-Message-ID-Hash: RHG3N4C7APSU5P5ZKUFPIOYWDYSBALDR
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHG3N4C7APSU5P5ZKUFPIOYWDYSBALDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 14e91ddd5c02d8c3e5a682ebfa0546352b459911 ]

The code seems mostly copy-pasted, with some machine drivers
forgetting to test if the 'adev' result is NULL.

Add this check when missing, and use -ENOENT consistently as an error
code.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/alsa-devel/918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain/T/#u
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://patch.msgid.link/20240827123215.258859-4-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 4 ++++
 sound/soc/intel/boards/bytcht_da7213.c  | 4 ++++
 sound/soc/intel/boards/bytcht_es8316.c  | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c | 4 ++++
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 ++++
 sound/soc/intel/boards/sof_es8336.c     | 2 +-
 sound/soc/intel/boards/sof_wm8804.c     | 4 ++++
 9 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index df3c2a7b64d23..8c2b4ab764bba 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -255,7 +255,11 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name), "i2c-%s",
 			 acpi_dev_name(adev));
 		byt_cht_cx2072x_dais[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* override platform name, if required */
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 08c598b7e1eee..9178bbe8d9950 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -258,7 +258,11 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		dailink[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* override platform name, if required */
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 77b91ea4dc32c..3539c9ff0fd2c 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -562,7 +562,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		byt_cht_es8316_dais[dai_index].codecs->name = codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index db4a33680d948..4479825c08b5e 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1693,7 +1693,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 8514b79f389bb..1f54da98aacf4 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -926,7 +926,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_dais[dai_index].codecs->name = byt_rt5651_codec_name;
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 1da9ceee4d593..ac23a8b7cafca 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -582,7 +582,11 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	/* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
 	codec_dev = acpi_get_first_physical_node(adev);
 	acpi_dev_put(adev);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index d68e5bc755dee..c6c469d51243e 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -479,7 +479,11 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snprintf(drv->codec_name, sizeof(drv->codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = drv->codec_name;
+	}  else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	/* Use SSP0 on Bay Trail CR devices */
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 2a88efaa6d26b..b45d0501f1090 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -681,7 +681,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 			dai_links[0].codecs->dai_name = "ES8326 HiFi";
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENXIO;
+		return -ENOENT;
 	}
 
 	codec_dev = acpi_get_first_physical_node(adev);
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index b2d02cc92a6a8..0a5ce34d7f7bb 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -270,7 +270,11 @@ static int sof_wm8804_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name),
 			 "%s%s", "i2c-", acpi_dev_name(adev));
 		dailink[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENOENT;
 	}
+
 	acpi_dev_put(adev);
 
 	snd_soc_card_set_drvdata(card, ctx);
-- 
2.43.0

