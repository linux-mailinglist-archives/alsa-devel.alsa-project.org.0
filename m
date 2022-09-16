Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3135BA6CC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536AE1A9A;
	Fri, 16 Sep 2022 08:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536AE1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309657;
	bh=9W+nDVeqdLoNY9HTBVz4l2nlcD9nLl7mlXnpkgsDDlg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OWAAiWAFZARCTEe2dGncMIJX3bbFFe7rDeFIFZOMB+HDhVuYOoN31zHhR+9AHG9BF
	 JS84KYRVBLuwvLRUq4ND1Dbjozp4Em2EgiHibjGHnpej2kh8TgJqnfhLb56KNttgpT
	 YOAxfQuyvxP/KOL1V1j1IAINLWyYKes6LpJP7AFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF493F804D2;
	Fri, 16 Sep 2022 08:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F20C5F8024C; Fri, 16 Sep 2022 08:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB2E7F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB2E7F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fv+3HMJf"
Received: by mail-pg1-x52d.google.com with SMTP id 207so11047601pgc.7
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=XCDwki2qZ4Nr/nkC+/OXLcZMdTv44msrWgOLDzkJxRY=;
 b=fv+3HMJf1UQzCUIvyoizWAgiHV2CIyM/xXZwucrTFjCDQxYW+QFM6ZeoxF26Xo35LY
 F1EXPI/bAUHuNyarmXJoickZkZb0UsgDRZlWZX2JWHAl1c79WJOdAmV8qrLZ4ZT8oMqD
 CbYJuNgJPtziiE6Q71ZUFWLtGCk+8yHst6ooc52nwM0+Ivn/DHzHREYkigzZKkUstln2
 tUK5lJ4oXvx0o8lLXc5yP8iiWmg2rZpH+aXqB+Qe1+7fdj9fxSO/PBKKg9mQneou5e5w
 UKCBIm4AWVmt/ZrouinRRgc8SLLgdXK2p0GvRB1MyTdOEBtcv4vxojhzNsl9cb7sIEc3
 klJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=XCDwki2qZ4Nr/nkC+/OXLcZMdTv44msrWgOLDzkJxRY=;
 b=jg0k2LGHzRCLaUnUEXM7gZ7UPwa4/HR3B6/c8q3IaS9qcop68LS56NBbbSWhDu2uqH
 JF/88qGUi2wAZ5/iLKDMTurRU10iZvNk3DYfzyKomJ/OHE1rh/PQGJRulUEg6twNIBo9
 4tKbBbSal1nB10jAUMnMlpkh6eM0Bg4L6EfSWZuTQpgf1+kaWkTxKV7pZRQPx/Ds2qKX
 PN6wFC3xV5Mc84AbdsU4jGVnfE3qucm9moL9r1XTfQCzf2YfSQmrDSw+0RbmIiMCmKe7
 oZGjtri4bpI24UiAMyqOXQ+nMnr5APrrwvw37HqCVotVzrwC2uBF65ay0EHaeUCI4CAP
 OY+g==
X-Gm-Message-State: ACrzQf36Bvm/kMgiZKg6G2Rut1OPnfb3YVjEBSO3m7AuW/ZeTP8fXE4W
 s8Fkg00aMdXi9wv6CKWw8e0=
X-Google-Smtp-Source: AMsMyM7htnW8o/km9HpQ/knPb5Q/9DNcisZhgjRQPh61cNMIrdUyyWfMSMlSyHeNkUnGBIDZaJ8QbQ==
X-Received: by 2002:a05:6a00:1691:b0:53b:3f2c:3257 with SMTP id
 k17-20020a056a00169100b0053b3f2c3257mr3734327pfc.21.1663309596584; 
 Thu, 15 Sep 2022 23:26:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w70-20020a628249000000b005363bc65bafsm13565044pfd.57.2022.09.15.23.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:26:36 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: Intel: sof_rt5682: use devm_kcalloc()
 instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:26:30 +0000
Message-Id: <20220916062630.154277-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 linux-kernel@vger.kernel.org, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, ajye.huang@gmail.com,
 yung-chuan.liao@linux.intel.com, brent.lu@intel.com,
 vamshi.krishna.gopal@intel.com, yong.zhi@intel.com
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
 sound/soc/intel/boards/sof_rt5682.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 045965312245..1bf9455eaf93 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -600,10 +600,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
-			     sof_audio_card_rt5682.num_links, GFP_KERNEL);
-	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
-			     sof_audio_card_rt5682.num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
+			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
+	cpus = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
+			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
 	if (!links || !cpus)
 		goto devm_err;
 
@@ -687,9 +687,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 	/* HDMI */
 	if (hdmi_num > 0) {
-		idisp_components = devm_kzalloc(dev,
-				   sizeof(struct snd_soc_dai_link_component) *
-				   hdmi_num, GFP_KERNEL);
+		idisp_components = devm_kcalloc(dev,
+				   hdmi_num,
+				   sizeof(struct snd_soc_dai_link_component),
+				   GFP_KERNEL);
 		if (!idisp_components)
 			goto devm_err;
 	}
-- 
2.25.1
