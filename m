Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BE5BA6C7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C00B1A6C;
	Fri, 16 Sep 2022 08:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C00B1A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309586;
	bh=pQVyeLh3ve5Reea78KlyPlNXJV3Raqxnc09PV4jJHGU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OHKbWZEemEnSgZz4ES3oxNhl3LTMghSlfGQugY1w18H5HYV1KMoIe08TKL+I6a1Ab
	 vJK8uYPD8SBSnWzkRbYTbiv7y6ATuU2ABJqiUb+2Gm3tyJ+qD7f143IfMZ4DK+qlSZ
	 +LCRkSi8W6GN0PyDNyJM7dnFBcIsd8BOLNyRdWJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4753F800FE;
	Fri, 16 Sep 2022 08:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1025FF80254; Fri, 16 Sep 2022 08:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6881BF800E5;
 Fri, 16 Sep 2022 08:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6881BF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SrgEuNZj"
Received: by mail-pj1-x102f.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso18401876pjn.2; 
 Thu, 15 Sep 2022 23:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=u8dZyZyEmYUHpM71+E3HiKXQlujdNpXoeQ0z9HInFJk=;
 b=SrgEuNZj1nSfxDq9JNMMV0CaoibvzZ28f0cinyXqmTqWeR6VHPzjxperY1OEPBAhN6
 fU6jUc59dz7YPrx46bEInYvS0Ih/nNKz++1oVyNFZ2VeNpwzBD6UIHfBK3zMCZcf5jeb
 uQtdIy8HBTggun7p6zf6ABgXxOHxK6oGpuW2kLN3yuAsuLxWpFg9PrmE8s0xtUorqvzY
 +HIa9n9W0nXt3qpuVrQq292xWxCqghCe83PBC5GvJ91tw/oSZrik57MbRXwFAheKCI+J
 kNYSDNekqaggTU8pqZZcGAomtonI88DZ1b1VyxwtHRHh4aW8yV3Sq6AGxnp324NltkkZ
 vANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=u8dZyZyEmYUHpM71+E3HiKXQlujdNpXoeQ0z9HInFJk=;
 b=TUCOnDGh1SJXPG1VJ6IRfsGtzAd1NhEGwBo2FXw9FMd/3biLG32XVHDk3ySI3CRxft
 XbnOHgyIvBMTNQSZUoly6TT0suWSPtNo2X5eBLNSVHuCptBChGtkNrNnnE50IBUJyxN/
 NQmY0l6zZw/GaVbmjqd1gDH7am2ccPDGB+IxhZJx9y4jEh/ywG+r79me9JIQ1WbIc/jC
 kGu02hxD2nhFqT75PQz6c3jYMV6FjW3FcjIOAgjs3qSfMql2GsRX16GmWMY255wvBB15
 1od9/7khE0U+48htReRXpDEnGz6x5mDpYDwaUUZ3B+Jo8/l8k2z0dETY+c3NvjAvuf0c
 INHQ==
X-Gm-Message-State: ACrzQf2mKnsgsI2pxZkcwO6PE/eTtZZJBB5T7dq+IpS5pLy0tvBCBFtT
 bWAhYKYsGp2bAwuMbcaiiJQ=
X-Google-Smtp-Source: AMsMyM5A4+NSIkir6I5l0vbKkK7GUlWOx3OaaTI2tlDfie1myNdNjNeJJd+g7m353IdR2pZD5AZSJg==
X-Received: by 2002:a17:902:8d8a:b0:16f:21fb:b97a with SMTP id
 v10-20020a1709028d8a00b0016f21fbb97amr3208205plo.160.1663309516326; 
 Thu, 15 Sep 2022 23:25:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 g3-20020aa79f03000000b005465ffaa89dsm7341967pfr.184.2022.09.15.23.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:25:16 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASOC: SOF: use devm_kcalloc() instead of
 devm_kzalloc()
Date: Fri, 16 Sep 2022 06:25:11 +0000
Message-Id: <20220916062511.153962-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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
 sound/soc/sof/nocodec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 356497fe4f4c..3537805070ad 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -32,7 +32,7 @@ static int sof_nocodec_bes_setup(struct device *dev,
 
 	/* set up BE dai_links */
 	for (i = 0; i < link_num; i++) {
-		dlc = devm_kzalloc(dev, 3 * sizeof(*dlc), GFP_KERNEL);
+		dlc = devm_kcalloc(dev, 3, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -78,7 +78,7 @@ static int sof_nocodec_setup(struct device *dev,
 	struct snd_soc_dai_link *links;
 
 	/* create dummy BE dai_links */
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_dai_drivers, GFP_KERNEL);
+	links = devm_kcalloc(dev, num_dai_drivers, sizeof(struct snd_soc_dai_link), GFP_KERNEL);
 	if (!links)
 		return -ENOMEM;
 
-- 
2.25.1
