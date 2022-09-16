Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE45BA6C1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A1821A74;
	Fri, 16 Sep 2022 08:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A1821A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309521;
	bh=HjkGfUJL2x+qCtKMwOLSUjqS/h8sR+T7M5BDs0+MuDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RO1o7JIOyiHNNiS+syXyd1GBeTqcTS7OQICRO+JQAiklUu2UcbC1CYCek26QfMLXi
	 YQoyJ5DNna13B+wk6JBJ8NUK2ITNQE0VFKhPXPI/dpJD9mqmR9x/Vp9m5ALimZm0u8
	 mI8l4KrLCVuzqdQJFjkH5YVgbOh/vmRlXbN9141E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36447F800FE;
	Fri, 16 Sep 2022 08:24:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F1FF8024C; Fri, 16 Sep 2022 08:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54005F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54005F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KDBVkZqE"
Received: by mail-pg1-x536.google.com with SMTP id r23so10866515pgr.6
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=n4S92ltdclB9gEaEbidGcfEJc4hoERFLtmLJlSQbuQo=;
 b=KDBVkZqEu+wmjHfMe6cFICUhPZbfK2OfZqL4HN2oITBvNKQWfAc6A4p4OYCo7LCInU
 Pqy2UX2U/O3NSzrRQJr4X3JVpE0+SuvngoL9dZAxf6SkBeYpLhubw/jx7tHMfuzDmAxr
 4dlZD340iwkCMUlxCemdzGM7VCnrIs7/eVF83Q90o+DjfG4w5vq02EdjhaXOWWZogyhc
 sPWIezVefsnrvonXdkBZJ7hmylxuwvzZVu2kPtyfkNerVV7Eu7dZ5Kxr96OmL+pOdRJM
 HL/AdBwhwUVApWf3gt1yOg+HQgcJ0YSlt0VkPQfyHXzS3lgES4329a7zDteliIeDR4it
 0Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=n4S92ltdclB9gEaEbidGcfEJc4hoERFLtmLJlSQbuQo=;
 b=wRHI9jswY2UZWshyL2xDP178SiSar1xgC9zVinkovGaOhksN90OgEnDvcR200SdyQH
 UFYgukeweWbtiB2gJXp1wZPi7cb/BJUQO7vRM26iMzI8m78TBciZpV5/5MMaR8SQ68Mm
 Cr+x3I8EwFMJan6Wv4zGUCFnm10AQSbIV5qLizKFK/gc40+toLnA3Vc3Rv6IjSp03kV2
 abBnQMhYBoJIbqVsGjvar57Inei+Vj/vpd9uqGJ8ErAmUrXYAreZSPS01/cixaDN4mPe
 KTuv6Q8V2Sw1EgEI9cMwtGl3zVDwSEWxE1/fQt9k+w4YpKRkvVM1zDEwdumbAoCD0iNp
 CJ/w==
X-Gm-Message-State: ACrzQf3Qa548MXapQcnTwjKqNb57ncq7Qg+cgF1FdNQVueABNqtJ21yr
 LKJhSfzaNh/Vsx1JOiltozI=
X-Google-Smtp-Source: AMsMyM6Xeip4PMKJuOyP0VyLECoI9jr5AlNeekFVQUtmid6WX66FRGnMKmOjJNGNlbaEp4NNGRahvA==
X-Received: by 2002:a05:6a00:23cd:b0:544:cbec:6d60 with SMTP id
 g13-20020a056a0023cd00b00544cbec6d60mr3894104pfc.16.1663309460689; 
 Thu, 15 Sep 2022 23:24:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b00176cdd80148sm13982414plg.305.2022.09.15.23.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:24:20 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: Intel: sof_es8336: use function
 devm_kcalloc() instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:24:15 +0000
Message-Id: <20220916062415.153659-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com, mchehab@kernel.org,
 andrey.turkin@gmail.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, muralidhar.reddy@intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/intel/boards/sof_es8336.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 606cc3242a60..fbb42e54947a 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -481,9 +481,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 	/* HDMI */
 	if (hdmi_num > 0) {
-		idisp_components = devm_kzalloc(dev,
-						sizeof(struct snd_soc_dai_link_component) *
-						hdmi_num, GFP_KERNEL);
+		idisp_components = devm_kcalloc(dev,
+						hdmi_num,
+						sizeof(struct snd_soc_dai_link_component),
+						GFP_KERNEL);
 		if (!idisp_components)
 			goto devm_err;
 	}
-- 
2.25.1
