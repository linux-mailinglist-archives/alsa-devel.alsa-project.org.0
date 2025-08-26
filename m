Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA0B36E03
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 17:41:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A5D60281;
	Tue, 26 Aug 2025 17:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A5D60281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756222892;
	bh=e1IxRhJNfBVPgixPhdtFHmYVX1m5TSkpTuyErZRKZio=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VCZVN/mpN+wbcW5VsAuep0BwIgrbqa7xPF+JRcjJCBEn+FQzlAMEcWEmrJ/33f+/o
	 9fiErMIwKQDTsV6rHCuiGkb5eNR+LU6HBcca698FgcD1gaxFOse9ljLOZx9L363wES
	 ZLVeCHULnlU8vxVt6vKoQyVb17w32UuYeKBGKre4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A37D5F805BD; Tue, 26 Aug 2025 17:40:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 525DEF805C1;
	Tue, 26 Aug 2025 17:40:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C042AF80508; Tue, 26 Aug 2025 17:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7729F8010B
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 17:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7729F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=B+h6cM3U
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-770522b34d1so2324424b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Aug 2025 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1756222847; x=1756827647; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6f+oL5erjgnIG54ke5F/FkltoGarOf5946uCvH5YNQ=;
        b=B+h6cM3UrK7jOrTSCeAT8Cd5eWeCjb5xIPrt7OIwTuTjJuzUozT1SwzkkM/IERroZG
         VuSUjbrVgkY7BTC7Et/W5psmbMCJkIo05WfWXFcyEg4Hkxhehm3PexDe8BHJlxoUHsmi
         LRsHnVausjrQBmKal0CJ21skSq/DbZEs/HARm85E20UEcddNd6dgYEuLzX380QC3DpNB
         5P6dOsl0mCN9kQbkCw6Rdnng2ytvoovJTk2YgdkkVJqzILuywM0pPJ49AiNO9CUbT7R9
         Mj0Qw0SXfa74ZLugCRVJvKdFKtTMowplAcoCuT0sqaCLIXBVT0tLbti7WxCBJjj8KgPr
         lDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222847; x=1756827647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6f+oL5erjgnIG54ke5F/FkltoGarOf5946uCvH5YNQ=;
        b=qD5AIUDKcLIWedcQUl+BeZAGgm6IhlHdlGds5V7mh6dsBUPDmSO1OHL8//1Yl9vom/
         PZHNPK37oR3FNSOiDVWzmppxQBjD4gLKsx4DzL7RwkB+YRU+8yM/lol2c6xJNy79lMF0
         lMM8UCZACJ68e0lbsOudY8mlpO7P/Frpc7t30nF988LGrWmk0PilybAAp4jn4FK6/RkG
         2QlDzv9DfGJtEGlYWBvd76WrgYV5hVH7RMzj6tBH+NIWQYzv46h7xX6+xSXlWElVmBAE
         rIvfJtcyeYt2xt0xdJkOFPWGIOmTkZyY7J9woJEl0LxsLwPB/x22ip6AV7A3E2ZrLkIm
         BxHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqzWM4jGVSk8OIdfmxLi/d/uFY0z0qT+j9Lt+p2CAoDxpybtZR6z6KzmjA6VURAOq+HUALjeN6aSEP@alsa-project.org
X-Gm-Message-State: AOJu0YxSD5nGmHIwTT5x5O722QqF/LnZKb273ZUg5uA3hhYmXuF4hVYF
	F66+yMcYhq1Ynor7jWGUmJ8SmrHmVXMzpX9Y9iJL9CVhdlEjNMhZE7vuRtTVCLAqjhk=
X-Gm-Gg: ASbGnctn2QUTQQN/wVLFwe4z51f3tPtuu9ZUItOOH86dGgNcUhRgZmXveHYIVNik5MC
	S+H7cXU6r1U5AmD1FomyfNrCr36BZPgECSsDdyGXFEq1lNTtPLouH/oCI1FuC+dQJEjodY+f6Op
	GHUvFVqLCE7Een7SY6lTw9Osr1hSpHbclQmC5uo7LFLmf9BqdUP07bEAB+ue+IYRxmlTYjv2rlj
	5FFZXaZ5PezdQBxTv3yJ+5sQs+Jw/WFHYy0OyYFl+9HnEzUCyIdbC5r1hpAljOKGU10pO4bN0s2
	0fFEcuBLm9vjxQY6ywhUoDbK0P08eu1p3izWBrkvJW0p7EOZD67ktV3rNhgNsNgTyHB7zeBslFX
	7RYSkGiqxfeUEmCU91kN1kqm8q9g+Zc8p3JDLOFnF8o4f7/szykR4sUqsgw2Db42Roy0kGa+Xcb
	hMRt5ftewloE+VYeGJHAX1LwWjavdc3nBt8AKZ1t+A
X-Google-Smtp-Source: 
 AGHT+IFhBVaZYGu9IKPFKe9pJlE3st+GV2WgnybrgrUPlI9dqOaccQqXFsDRq+o5QdSDJZXqXkvTSA==
X-Received: by 2002:a17:902:db01:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-248753a26eemr25285385ad.17.1756222846647;
        Tue, 26 Aug 2025 08:40:46 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246a4e7f517sm75905195ad.117.2025.08.26.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 08:40:46 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mac Chiang <mac.chiang@intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 23:40:40 +0800
Message-Id: 
 <20250826154040.2723998-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SICL7OHHVUZIXFIQQFYU4ZCOLBC57XMC
X-Message-ID-Hash: SICL7OHHVUZIXFIQQFYU4ZCOLBC57XMC
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SICL7OHHVUZIXFIQQFYU4ZCOLBC57XMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing op in the device description to avoid issues with jack
detection.

Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
v3: Add Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

 sound/soc/sof/intel/ptl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index 1bc1f54c470d..4633cd01e7dd 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -143,6 +143,7 @@ const struct sof_intel_dsp_desc wcl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
-- 
2.25.1

