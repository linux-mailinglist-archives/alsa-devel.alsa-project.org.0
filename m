Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC097D6FA2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8773784A;
	Wed, 25 Oct 2023 16:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8773784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698245281;
	bh=1bed6+cvhg2e4+Wu0/xzpBi6Pr945mwQB22eQdy+JDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iSyXfpPgptm8TfRhkLKzRvm8Fki7ZhTpJS/JCDfVQxpa8iY5J8XPUvzksRllCPNNH
	 RAanIPo6yqa7FBnx62qoFM6AGlxMEwG1muGbqflzFITjXn1WMQyEdbWK71p5pRrjYG
	 MRSpfd/0sWF17MCfOB6zuItVFz5+tyu58MsVJDiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A66FF80567; Wed, 25 Oct 2023 16:46:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 806ECF8055A;
	Wed, 25 Oct 2023 16:46:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A78F8019B; Wed, 25 Oct 2023 16:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 453CDF8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453CDF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q22y2hxr
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so9043636e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245170; x=1698849970;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXAGRRDQU3qBmM4PuKRmO3omKxsrPu1G2pV7PjgXi9w=;
        b=q22y2hxrAbc90kn6RBMY3KuTKB4tt8fNugfh/7vbymMqWwR07XlUuWoXQPsZwoK8Hl
         MvZ6B7hHwejFVVpqiLkhNvE5kC2Dw+ylPXUTES7K2gVrDcvzbj2HCMl/ay4llBsM/TUJ
         vl90ScXQhhbG2BW99PdcPhnv6WPAM6iFYvKSaDs7cfUGNoQ8sCurmIEhUcwWPcCDNBXq
         ZiUNBS2BA0hxM/VCq1aBTqAnOQutSUM2/1RTbGH6ZGY6j0uZFJl5tH4bkr+UkcEQ5g0B
         N8X52upRVfYmd/upcpLGMS+5k/X9LP/69uXuMzq5th6UvdmCpHLyuD+fmKD1m38p4opS
         uTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245170; x=1698849970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXAGRRDQU3qBmM4PuKRmO3omKxsrPu1G2pV7PjgXi9w=;
        b=no0JsdQVZthRDLxIfPMIPAEa7uOe9xO6eODdKV08/WpuHSU3g92oRJcJFSXKQWOby6
         O767DeB6i2RmVAnI9BN7yKYtEaSo39bXHUG9p9oMXUctPP4sxl1RCYrHclcBW3ZJAbtO
         +TOzUrdkmZUr+8qlXvB0mQxsZpN6Ary/mFzXxBML0jow8dUizv22BYRqqYF80dd4pQV5
         JXk2OEuT3K2BJTyBjHUrZGQixIeszSquOUl5mnD3i7yc22NDEAVMMhY9wvNfvsU9yOzb
         q+bEM5+Beh1uJEkY6kUxf91/1T698m627MHrhzzP7DIieQhd2fCWUbqYQxvXkH839Tu7
         fqPg==
X-Gm-Message-State: AOJu0YxUjEcv9N/GFLL7UpCSoH/GnKPGdOyQciO1CYWMagfS++c3CvvA
	Hkvn3HGCFQGmdtI3tDKzLEcH0Q==
X-Google-Smtp-Source: 
 AGHT+IEm+oG84DNxepaw/B3zgRVBOqJdqjjLvSed6FNsaPOPc1JSYQPpe7VYHi0f4Xg01yt26Oo5fg==
X-Received: by 2002:ac2:597a:0:b0:507:9623:8ae8 with SMTP id
 h26-20020ac2597a000000b0050796238ae8mr11125024lfp.29.1698245169886;
        Wed, 25 Oct 2023 07:46:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b0032dcb08bf94sm12267138wrx.60.2023.10.25.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:46:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] soundwire: qcom: set owner device of runtime stream
Date: Wed, 25 Oct 2023 16:46:00 +0200
Message-Id: <20231025144601.268645-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GXGY3ZJTAVT3GEWDTBFVGIBDEA4KMD45
X-Message-ID-Hash: GXGY3ZJTAVT3GEWDTBFVGIBDEA4KMD45
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXGY3ZJTAVT3GEWDTBFVGIBDEA4KMD45/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Store the pointer to struct device of Soundwire controller owning this
runtime stream.  This can be later used by Soundwire devices, to check
if their DAI prepare callback is called for the same bus, in cases where
multiple Soundwire buses are used in same soundcard codec list.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c      | 1 +
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fe65c26c5281..a95f39563b47 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1298,6 +1298,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 		goto err_alloc;
 	}
 
+	sruntime->dev = ctrl->bus.dev;
 	ctrl->sruntime[dai->id] = sruntime;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 4f3d14bb1538..650334adc261 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1023,6 +1023,7 @@ struct sdw_stream_params {
  * master_list can contain only one m_rt per Master instance
  * for a stream
  * @m_rt_count: Count of Master runtime(s) in this stream
+ * @dev: SoundWire controller owning this runtime stream
  */
 struct sdw_stream_runtime {
 	const char *name;
@@ -1031,6 +1032,7 @@ struct sdw_stream_runtime {
 	enum sdw_stream_type type;
 	struct list_head master_list;
 	int m_rt_count;
+	struct device *dev;
 };
 
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
-- 
2.34.1

