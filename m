Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB75BA6B8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D441944;
	Fri, 16 Sep 2022 08:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D441944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309428;
	bh=5qkFvIdEhNpjcNS44c5t3DkuEJh5e19oowyDA1KTR5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PzPEGffOuahkOK9P5qmN9l3Vq6+YTwqsfD0abvo20t4b0R03/pd3j6vonc75WLIjq
	 HaymbP6OE51djmWCl7PMhuUsx1oc/WmuwTz5HqUx6+72l9zI3/oVRwMhKqO36URVI3
	 3xkJO5s9c5ztoJK5VvTH+jQdXf2IaJuPDEInB6NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2913F80165;
	Fri, 16 Sep 2022 08:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29E8F8019B; Fri, 16 Sep 2022 08:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 543F3F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 543F3F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MmkbqEj1"
Received: by mail-pl1-x633.google.com with SMTP id l10so20499247plb.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+MmMIqtR6gK+uJ43QZQbXrlj8rVSJr7UP9ANkMT6yW8=;
 b=MmkbqEj1j3pilvmcCNQ430oGSQeS6MVM8z0JwyNS7e7ToGLvwRs0hEUVFw//m6ma32
 cRAlF9AA44nGuo0dNy87oRm8qDbG1uJn80407u+obsJgk4RrAwGivr3HkVxp/j7HhgWJ
 Grw9rMYEVi4Th1WfN1ww3kMyhxPmKJOIyrJGQAOL6z3BTLkipYH8llbheFfLYQUw6DEG
 f7cdqsBkX5zaE27EVNTP6Bbo6dwH1q3dEAjHlJNmFZAA/W7wfBVh1avQhdegXWYXmt2a
 KmM/I4KdNsm1moENErWAEEvenua7dtyt1K89RwamP/CwrUYoVs+HLcxlA1hFEVlzIa9V
 36Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+MmMIqtR6gK+uJ43QZQbXrlj8rVSJr7UP9ANkMT6yW8=;
 b=tX+lvq/dchDFIhUDnqs4gV35lSJC+aaZF/MeOrtg3LspqE9tjRHvtXQCwMYusRX5FW
 8QHexitHM2BH6asHYmMkr0CtNIN2t7uASfSgpF229Tk9Mvt/Dulwmz3IqOFjeDQHaP+H
 yTNcpJbYy0tkBU+8TB16I7aZ1kNxPihUBhonDsiUxbPYe1r4gGohB4xYR/0/p9Wq6uv/
 7JPvsYG4WCn2QIrfRYHXnlEvDjXknNx3ppMJyOadcnPYqxzhI3NJYiLGaUzxPc20h4IW
 O7C2u1yW31gSOceqexDZ4J0qTDGjSe5eTBFPIUb1CkNBrCGXa4HcpHUgRBlMLoeISy7R
 sIBQ==
X-Gm-Message-State: ACrzQf1ZvK2VzQOlEM18P0/IjM3ueEigGMiS0rvAfzMNlPilGuS9Ycs8
 M74rCXHpPoCsb6qG6WVB6Qg=
X-Google-Smtp-Source: AMsMyM5rpm6UR6GaMvlD2WAfq3EyoiU9M/YbbBf9csTDqNrvJV2F1/Aj8zF35sjsbttJgqfS7eIOYQ==
X-Received: by 2002:a17:902:e212:b0:178:5c:8248 with SMTP id
 u18-20020a170902e21200b00178005c8248mr3359695plb.102.1663309360532; 
 Thu, 15 Sep 2022 23:22:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 c206-20020a621cd7000000b00536431c6ae0sm13538652pfc.101.2022.09.15.23.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:22:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: Intel: sof_cs42l42: use function
 devm_kcalloc() instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:22:34 +0000
Message-Id: <20220916062234.153275-1-ye.xingchen@zte.com.cn>
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
 sound/soc/intel/boards/sof_cs42l42.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 85ffd065895d..e38bd2831e6a 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -445,9 +445,9 @@ static int create_hdmi_dai_links(struct device *dev,
 	if (hdmi_num <= 0)
 		return 0;
 
-	idisp_components = devm_kzalloc(dev,
-					sizeof(struct snd_soc_dai_link_component) *
-					hdmi_num, GFP_KERNEL);
+	idisp_components = devm_kcalloc(dev,
+					hdmi_num,
+					sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
 	if (!idisp_components)
 		goto devm_err;
 
@@ -543,10 +543,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_dai_link *links;
 	int ret, id = 0, link_seq;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
-			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
-	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
-			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
+			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
+	cpus = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
+			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
 	if (!links || !cpus)
 		goto devm_err;
 
-- 
2.25.1
