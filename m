Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BEAB35929
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 11:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB40F60239;
	Tue, 26 Aug 2025 11:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB40F60239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756201092;
	bh=rOnwfMAg3INdElV3aRVOTwiBkwEa8av1tj4H4Fl0SEY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ppf6oh1ueTXrNdFool4kSt0RpYA4HnAn5Xc7PWYrTbSNmQ7smUuKSSoFfATmdI7W8
	 5ULMvmy5kj2zoDCBYIoSEZq1IOcgg5Uz5OCjAxNKJr+iGcBUqlxumi0lusto7lxe26
	 zmhCo2zVPe2UNy2sJndXzviHB96CeC8QfxXDvbXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC45F805BE; Tue, 26 Aug 2025 11:37:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1601F805C8;
	Tue, 26 Aug 2025 11:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C80A4F8051F; Tue, 26 Aug 2025 11:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7EE3F80153
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 11:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7EE3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=CsbIdVKf
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-325393d0ddaso2513546a91.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Aug 2025 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1756201055; x=1756805855; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mcb5bkMtc2XORNKLuQuVAdE/1TJbciXhfUQDl6LaYc=;
        b=CsbIdVKfguSGZpROaYYYcRZbku2PmT7X9OM2omyvC6c0N8RZ6YcN8UdbmJtA9DeJel
         E8UIGrdEztmn/o308pEjs9Tp/whkCK5nuxQkacslff9TZugfqq6w9WO2KW5F30wSzE1k
         8UUfgXq37hze5BFfD2xSaPyEClptUoe2BvVYFw4MPtOtgqcW+uqV21HNdfj3KlT6x+FD
         PMDd0bPrpAYdZPQjWD4xGx/eXhr/vxB5PCRYK05/0v9SAAIPkZ2D4y68Rgu99yH8v6J/
         MBAQLqcvaa00pOzVVGHoDzIjgPj5SVV3L8jyJrHJyrKKr0EeVHcMZkDUotqMw/NnzCCr
         e9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201055; x=1756805855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mcb5bkMtc2XORNKLuQuVAdE/1TJbciXhfUQDl6LaYc=;
        b=sPS+DU16edeAD2YjHBMpgF5t29JBmLfOZINd22xV/tDQs/XjMX+jV/H6FwL0z8+wUH
         ZY183CGR6Tb1N4XcLaN0gGv+DbqfY+kp0w/u7vpadDOf35qIzG+VKjQk/9hYzOPwvckn
         WxYvv6PFFHhUuqrqrmo39j3aosKAgxTeb4X8e6twJAUAiroDCp3n3X3kkfel6VOVNC2z
         wJEdlN4hgUvJjp1JvcBwMNFQa7ewWJ+1r5mKZFQLnK8fovoQHonLo2kPpiPNfcHpNTyb
         vR1FzuE5kN638yK6XrbXIua6rilvQG5+LaDmvW/Oxa9ASQ4ajI+pPTVcLqB7MJzhmfsG
         YA8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBneMHVg4V6elQaxXpB96GU4gXzj25pM4DwseLnzJVnbMUH2f5Ox8xsMmvimeGTOy3utnaMsge5h4h@alsa-project.org
X-Gm-Message-State: AOJu0YyqPcCEXJv/8W3mDBWYmBrIN3A0ny1FdI09agJI44NYxK0KQsUW
	l5ksHtPeRAMq+UX56jg1n/jRx0l4xee0RXhN+6EzQ52t2nqVpQ00FnSIVrp+VQGNaQY=
X-Gm-Gg: ASbGnct8GEu2NR04X7TQc9Y7d+xwg51JCODOURNO408CFYj3DvQGkGMCgqvldCPJTqy
	JwlBc2fefuy3Pm4fRpNu3WOTKEDrjiuXczMDv6bJxvz6H79WDL5gil6OhQ+NnTfqvFLQ2Ibh6uR
	Jptk6Gj2ZOGzhh8DLjMWqgC+UL9NGN2XU3TipOPV7e9A/vM/n5+Ci5LHGs1sw2M/ly8vBr5bbuR
	8TDYLjEQbagl5zseCCprPaMj0jn2bKtVD1YuiIagz2TuUW3Hi5my4Km6TCxjLYOUH+dOyRia3qv
	sBLV1xfMv9NsbHIQBe7muFqM3uAfBle5XFJ7CVTrvTO36VSgX5jMQkIRdxDFssrDb/3Fm2gKNhh
	/6xSnJi3WWuRZrG1C2EXUuyECxcawEkQljE2o9RLkvrxGWBOmjK0sdVCWQGHoeSeuogKzOPZPgx
	ntHYLS0gQTpVVaejUnhL0xEJi/EGZXgwIaGn/PiY0y
X-Google-Smtp-Source: 
 AGHT+IErMpCIz6xZ5L4Dai10sGE88F9Po4L0thCMVQfmK480d2PRNhldDxgRTc81OY9BE4TV9ujwsw==
X-Received: by 2002:a17:90b:384c:b0:311:ea13:2e63 with SMTP id
 98e67ed59e1d1-32515ef86fdmr19131536a91.13.1756201054504;
        Tue, 26 Aug 2025 02:37:34 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32549fe6c21sm9530925a91.5.2025.08.26.02.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:37:34 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 17:37:25 +0800
Message-Id: 
 <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MUVBK4XPXGNNM6HLUFB3T2IFE34ZCRRB
X-Message-ID-Hash: MUVBK4XPXGNNM6HLUFB3T2IFE34ZCRRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUVBK4XPXGNNM6HLUFB3T2IFE34ZCRRB/>
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

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")

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

