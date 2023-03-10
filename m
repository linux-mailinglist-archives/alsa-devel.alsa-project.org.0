Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 112566B503C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 19:43:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF947175D;
	Fri, 10 Mar 2023 19:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF947175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678473795;
	bh=vEVPN0V1xfoeeQ7G43lKnrnqTLGXDoeUJcR+fHn8bLM=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=fN509OPB3WxtQ4RR1NC/PlXdHXAwo+4qaJNLbv+K8aYM6rMaYc4+yNGvMkhG2kQMw
	 mLg8SL/kIc6EqCkj++I3+0c5y+CvSNmPRItSbZE+zqMp52+AbLFk9jY6SQabGFNfEt
	 tOCmk0Ds38rYBrSFZ3ifl86rUmk9e8hIEJoyorGM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DCB0F80236;
	Fri, 10 Mar 2023 19:42:24 +0100 (CET)
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
Date: Sat, 11 Mar 2023 02:42:01 +0800
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOTOMS5XAP7FOH7ADH5SGU3O6BOZEW2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167847374390.26.17922834000574654840@mailman-core.alsa-project.org>
From: Ajye Huang via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Yong Zhi <yong.zhi@intel.com>, dharageswari.r@intel.com,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A3AF8042F; Fri, 10 Mar 2023 19:42:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62759F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 19:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62759F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=f+z7UXe/
Received: by mail-pl1-x630.google.com with SMTP id a2so6602806plm.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 10:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 t=1678473733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUkP7iMk62KicMLNDd9BONghE79lxMRHNMqjVddqeEY=;
        b=f+z7UXe/jdrd8UL4Oj45vTzVtadTRiDq5VeCNB0VOSzmBUOi6+5xwz78xGDdYGDT5/
         +JdJvPWMOgWRfyLf0alM5eDFhjfxpHmu0GrZcZiNr4X1FTcZgLnN6TEdNAMrECIi2W9P
         87d9zOnHf6MHzegVccaApLd9NP6HX0ATRuNAaxWrMQOD9BWAKRu6gCW2NDNFNQW4jmY5
         JbtY6Mjd5gCocr7tuwUNZ64cvebqJBHdvJnkECdpVpCZjt3rE78gOTrDgj+DwzJTZwFe
         st5WkfoRyiptR5o3iPSkv9rkDoHs4JCV41EYrW6wQ3BYaOacToKaUKf8on+cGCwIDw+N
         WORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678473733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUkP7iMk62KicMLNDd9BONghE79lxMRHNMqjVddqeEY=;
        b=XeDpYqAa2I2GjLwQgm87fQiv1ZjqBpt4iTULbS9xDV97epimSXw+fn3NqxGWC/XE/r
         kBi6UDRhS7No/zDHfGYhH9OyvOT7KL7Ip75PI23pq4vhNMog/ifMF1fGdLfKBqdxZLhu
         JG5708oBGe6qnxZ+bMKhIBNgRBEGbNdl8EAOBpzG2O/4f8ja60CCI2QiYwLH2ugekoTI
         xwRD6W73gXsy4kKwIWmpPCTEzVXkQ6YRfh642Oq3OQPAbsPpWvi+M+j5xt3gsoOdNtqi
         Jm3cxH6hy+XdQvw3kiPCkj0HgR4/OQ7UKtmn2EDrzDp1xKi74HNasvo58kUNUdZMMwpU
         UpEw==
X-Gm-Message-State: AO0yUKXR97l0YUNugYqskQwo6EqizlH1vdDGkveehkTc/DnSczwv5jYX
	dDv9cftEYIJM5RpuYT5flMxm7A==
X-Google-Smtp-Source: 
 AK7set860Vqv2C+1CB57cpDPc4uXVqQY/Vb5fpr9eIyb1UBzdvJHeHaLRK9kTImQvRdbX8fyMPlbow==
X-Received: by 2002:a17:902:da87:b0:199:3a4a:d702 with SMTP id
 j7-20020a170902da8700b001993a4ad702mr3462541plx.0.1678473732597;
        Fri, 10 Mar 2023 10:42:12 -0800 (PST)
Received: from localhost.localdomain (1-171-145-144.dynamic-ip.hinet.net.
 [1.171.145.144])
        by smtp.gmail.com with ESMTPSA id
 u15-20020a170902e5cf00b0019949fd956bsm309309plf.178.2023.03.10.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:42:12 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
Date: Sat, 11 Mar 2023 02:42:01 +0800
Message-Id: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IOTOMS5XAP7FOH7ADH5SGU3O6BOZEW2D
X-Message-ID-Hash: IOTOMS5XAP7FOH7ADH5SGU3O6BOZEW2D
X-MailFrom: ajye_huang@compal.corp-partner.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Yong Zhi <yong.zhi@intel.com>, dharageswari.r@intel.com,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOTOMS5XAP7FOH7ADH5SGU3O6BOZEW2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable Bluetooth audio offload for drv_name "adl_rt1019_rt5682" with
following board configuration specifically:

SSP0 - rt5682 Headset
SSP1 - alc1019p speaker amp
SSP2 - Bluetooth audio

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4fe448295a90..2eec32846078 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1109,7 +1109,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1019_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "mtl_mx98357_rt5682",
-- 
2.25.1

