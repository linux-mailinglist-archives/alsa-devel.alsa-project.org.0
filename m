Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DB62083F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 05:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15426852;
	Tue,  8 Nov 2022 05:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15426852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667881755;
	bh=UJEGS5ECCs57pGynTcx/Ve7HdqEyHSaJYsCwYSEqWkU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQcMbUH1EJfNqOG6onH1kZly9uKEcHE+AyvrwgurAokNym5B2GL5Lq1Xd6Pbq7WQJ
	 4FcHHZXYcBg8Ojmma2KfUHRkrGvt2yzktV9v7uIFGxD+uHsvBmrC9z7qyGWarOt+bS
	 Pt7DcJHIX7XZNBsxw+0m8jT5tW6H52XpSRRaRGiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A4AF80557;
	Tue,  8 Nov 2022 05:27:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56274F8025D; Tue,  8 Nov 2022 05:27:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3EAFF8025D
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 05:27:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3EAFF8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="b8vZnjuK"
Received: by mail-pj1-x1030.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so12344846pji.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 20:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIIGd8oP3sziwMfS5bjNdlZ83g03MLKO/gH68/ERIKg=;
 b=b8vZnjuKOV19audB3sn+ISPXH+awdfhfeJtmIytlnPM8pImaTJVYKLhIcjrVIvzS1Z
 wUGo6Vsv673ZH3Y73EfasjM3agz4k35iV5TnWXgZ7PazN7aSgcxTWtWe76YjKDSVXTUB
 gKnzifFd8Ophnyb2JGwApkeSmk84zZAVYBcrxfCX9IWhpjfOK6RB9VH5pjj/DXtaN5a5
 82cBYM4KwX5yCXiHpBAK+fUg/yflgOO/EvAty35VlXPH3N05iKf+Lvdb+oR092R+I2oM
 09mvwNYzNCZYLzGWjrV6W8AoN4R+6Cq2J1Ytr4jENHUjHXfEo4aU6GRSS3T2oYx8XIuG
 CJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIIGd8oP3sziwMfS5bjNdlZ83g03MLKO/gH68/ERIKg=;
 b=4Y5tzjrW5h13OqTRNCQzMa2v6N8QcDaYI9+mu59Lqhqr/WNnY4Fh2GFMNYVDdb9/UF
 Z3J4/v+p+3YB5SRfCyYU33NdHmW2WF7kFG02CgGG6+PrkuRrBGOUiRdrpTnhpzE/Kol1
 /zsv2m4ofnJoA59RW1Rm8plXmJzAgOiG2Qr/Xh5qouxxUKDf3BPpiTLsDz98B6vUvtP6
 RxR91j1npJupM7ZQzKwPbX4BPZvxnd4miIE+ewfKE/+mpaQCnLSo4KRxElokxFdXrt2A
 i8Q9WRh7laIRwOpYqotXitXDTr/vyMemYQRSfd+ZlR2Hdn1oFwBIuY/wU36ysLhKUjOQ
 lBwg==
X-Gm-Message-State: ACrzQf00ZfJ9KjRWzdKDNYnCHBQpcdgOIZPtlguxIuLJ9PMrrjAZ+U3n
 SL+v6ixOThZb8guCHjxvNvLhcA==
X-Google-Smtp-Source: AMsMyM4Zyf89FLUAoW4CNQByU6fT4GCrJPUd+YcTiXulxLCcqVtH4ZqdfuELixR3ErWYZ9AZnttmYw==
X-Received: by 2002:a17:90a:fc94:b0:213:f73a:86a7 with SMTP id
 ci20-20020a17090afc9400b00213f73a86a7mr43210065pjb.144.1667881652413; 
 Mon, 07 Nov 2022 20:27:32 -0800 (PST)
Received: from localhost.localdomain (118-167-183-234.dynamic-ip.hinet.net.
 [118.167.183.234]) by smtp.gmail.com with ESMTPSA id
 j63-20020a625542000000b005627868e27esm5265945pfb.127.2022.11.07.20.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 20:27:32 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: Intel: sof rt5682: remove the duplicate codes
Date: Tue,  8 Nov 2022 12:27:16 +0800
Message-Id: <20221108042716.2930255-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
References: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, David Lin <CTLIN0@nuvoton.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

Remove the redundant code to prevent user confuse.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 0e803c1c2b06..4a2f91249b10 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -867,10 +867,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (acpi_dev_present("RTL5682", NULL, -1))
 		sof_rt5682_quirk |= SOF_RT5682S_HEADPHONE_CODEC_PRESENT;
 
-	/* Detect the headset codec variant to support machines in DMI quirk */
-	if (acpi_dev_present("RTL5682", NULL, -1))
-		sof_rt5682_quirk |= SOF_RT5682S_HEADPHONE_CODEC_PRESENT;
-
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
-- 
2.25.1

