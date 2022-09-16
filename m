Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC35BA6CA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4750482A;
	Fri, 16 Sep 2022 08:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4750482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309622;
	bh=m5c/fcI7B/R6iSN9lAC/+4vhtah1Zsaol9QGuEEOEog=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NCPubAzeRa/j+lVOwCQMm4YC4Bh4ccBv1Y+woSdUVVL+8iqOhmSRmYkrs1yQK61SX
	 w90FDJ+rivGVLKn26/e1M6AtRlHtiDpxyQokc9nRdwJniE9fCMPSO8zYOCwsSvUSuU
	 GKMNTn0KaQbDzA/x70M/61AXCIEgj9ooSsajukGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DC5F8019B;
	Fri, 16 Sep 2022 08:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7385F80496; Fri, 16 Sep 2022 08:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D0BFF800E5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D0BFF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eoqTrLR7"
Received: by mail-pf1-x42e.google.com with SMTP id d82so20285615pfd.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Lzq4OJ9/dH/QCsn/g5d/W3YD36QlPEBSuggjgpZGHHs=;
 b=eoqTrLR7BMXelG9emwzH54nw3MhxYBhb+3nFGdzWo+EDZ/DxFHX64XUYbUUSC0jNxd
 aPX2BylkhergaQZiwf6l9jJA7HUA0kKn4qf1mn/avXiKSks38y+2/lGGyVpfy3MQ7JV8
 rlQ/obuB2sAgsGl9Ig48dvZQ3yWdyrAxwOlClTzsO/dDBpiudqnIG3h5gzlTDRMdkgeZ
 y7qW+T4BZRa6inyJhy6kOh2ST1McDmbFB2KZt2Cq9B3cWb1/FzH53g7Xgi+MGUHStHn0
 k0EyKgVxKbddbGIxCjbbiV5wk2dzIweBDst4Gh74Q2GC39/cWpevTgnRJEsWj29RpNJa
 NHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Lzq4OJ9/dH/QCsn/g5d/W3YD36QlPEBSuggjgpZGHHs=;
 b=ga1jYa1azTVxX5wOATdnXWrZJnEfHZWHyw49XaF93ZghdvfNjBsxScx4Ok67xIp3Rh
 B8a+frpEI67uTpK8yZ0LB08vzto9uSJBmclfG74WlBI09OmH5LjMFS66xa2yDbkuYzQ6
 rqtp/X4vUJe3hVC/X8HWPq+7XMrrQM6jKrvTft5h+hpTe7RC2Hx9n9lktXQNLT1kbDQx
 fILw2jVWkz6kmwMf4xuhran957Mhwez9b4KWMudYh+7xhCGBWwxEoSB8oUbjP7FQfnIQ
 mfVevo93pviww96mRmKX3+xeLp55rdOVXl/Jmcyz09aoe+THRMpc2Q/p0z1gg7eV/NqV
 GZaA==
X-Gm-Message-State: ACrzQf1qAEUR4NMW5WWJtWNOozjoNRyvhcxrg6grpcOBSClWO63vB47l
 8k9figwfq9shF1f3gWfSw88=
X-Google-Smtp-Source: AMsMyM7U+wtd7SRHjO5vUG9xPpBAJYTAmuMoZ86bnGBSTF4BCFRRgjmTaixpyEuxPoJQSvFYofCliA==
X-Received: by 2002:a05:6a00:a82:b0:547:d660:c077 with SMTP id
 b2-20020a056a000a8200b00547d660c077mr3560740pfl.38.1663309554211; 
 Thu, 15 Sep 2022 23:25:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a621d0f000000b00540ad46bc1dsm13415992pfd.157.2022.09.15.23.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:25:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: Intel: sof_ssp_amp: use devm_kcalloc()
 instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:25:49 +0000
Message-Id: <20220916062549.154114-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, akihiko.odaki@gmail.com,
 ye xingchen <ye.xingchen@zte.com.cn>, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com, linux-kernel@vger.kernel.org
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
 sound/soc/intel/boards/sof_ssp_amp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 4a762e002ac7..94d25aeb6e7c 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -210,10 +210,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
-					sof_ssp_amp_card.num_links, GFP_KERNEL);
-	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
-					sof_ssp_amp_card.num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
+					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
+	cpus = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
+					sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
 	if (!links || !cpus)
 		return NULL;
 
@@ -306,9 +306,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
 		/* HDMI */
 		if (hdmi_num > 0) {
-			idisp_components = devm_kzalloc(dev,
-					   sizeof(struct snd_soc_dai_link_component) *
-					   hdmi_num, GFP_KERNEL);
+			idisp_components = devm_kcalloc(dev,
+					   hdmi_num,
+					   sizeof(struct snd_soc_dai_link_component),
+					   GFP_KERNEL);
 			if (!idisp_components)
 				goto devm_err;
 		}
-- 
2.25.1
