Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D8B3580F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 11:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D2E60202;
	Tue, 26 Aug 2025 11:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D2E60202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756199233;
	bh=YgtaFHi/bxrhz17NVyh3pLs5z1ygFjpcVAiiYPcL668=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wb0iF6aWYV1lIE8Lcvx9obLYW+pIL7oTrDSZ7ZZGNqranWKBDQvIvoOZ2mx0wAx+r
	 hSVCWpmsMb5ImPkpX6FKckAiDWrRDGNcB0jepFMBMJyP5HGddXmSidN3zYtgWqQ4lb
	 brRroCmOF4ojR1oOeMp2iBe4uvuarwtMNy3qji44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34FB7F80154; Tue, 26 Aug 2025 11:06:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2571EF805C0;
	Tue, 26 Aug 2025 11:06:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43FF5F8051F; Tue, 26 Aug 2025 11:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 215B5F80154
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 11:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 215B5F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qm26e/wd
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-771eecebb09so1571499b3a.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Aug 2025 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1756199161; x=1756803961; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZe1UjdRbGOPov6yiPQ0LhX88zH29A9ZZWF+7zEKVVo=;
        b=Qm26e/wd47t/1DZZsAKcXsf4uYIWRNmgbwCkwFwn/sGPs1qCPKzOqP6EHJ3JnfhurI
         8TLAfAFbUtAwMPlsROb7skWZc4mMHnwhCa+IHBqrzgxjC9Fuo90r8h6B7XQ1aibG5W4u
         bwVP8RU/DHg8ho5vrvdJlzHVT9S7sJah/H4vDj0LjvoreI7wOoK4hNMXiBixO2dyvvCM
         oZhL5zl27y5KeWQ2CpqhWTTgnQUaVJJhWZjCT3qpxT/xsimxAi6deGvmzJb6G1Bv7k/z
         3nhjChi4PQOjACNmPswHuxg+BnGx4CQRa4BSA+00WLdFmrEtJU8NRiSyRm80ac4vE6gH
         k4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199161; x=1756803961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZe1UjdRbGOPov6yiPQ0LhX88zH29A9ZZWF+7zEKVVo=;
        b=RrPpb2raWrEBGzAf7nkTOiwjjlJUDYsuUB7vYt375MihsmBat50dvdGg+c9cwEF/ZT
         5P2RFN71kOpagVX+mt2MGXoqB8wcDBw3Z+RShKyQTZ2ET2Oc3yp8uQ2wBi1Dd5pH0lWT
         HGjG7+pdwfANtGK7LFgiP4IimItqyTOKlB5UpdZnkg3oj1LBvUlqkgtum3waHs4pVhvQ
         ypQ/Vps4xZA86E5E9YVTaemLPadveVow3DTMnkvC06I9L2dTrc/Uf24X2DI+Y9+sSVm0
         eaFOWc0xCoUEQ++Rnjop8lACv2zhkoAk0jaHVh6L86F18HK/OHkhaoct3mnVZB9ZshIz
         Qs8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNQG2DLL9vf4VQ55El7P3YZ+VH73pvKjomfQblpOMIwkolGUGcgIXG1T4DnMloOAS05WmEX0WnI04H@alsa-project.org
X-Gm-Message-State: AOJu0YwNHADoBbDtwntMzxBJ4PBJxkEOxpkz2YLs+aoCDD+EVDPGfOc8
	2EQbPCChCdwnMx+LoxnVYEpW44XBhuavdIR4DdywicyMCwZf/Ety8KjsQ2I6SClMm1A=
X-Gm-Gg: ASbGncvs2j0QQepKfoYygYQtohG0muw9R9AKz1cKWUDMoMZsURnewcx7tMtfasgitFb
	gA548i5Zrq849xoeWztAxx8Kmlt5xlLnWKJz8my1zE6ujjHIzsDJr66MoJWRe3QhAHuMqV3h8RU
	FNOXdbOVZjm29BxztH1LV2QoLgPEEdcBwMyQzexQDN8FV7K+9oSGtqq7GoHahuKxAvJsSScKJad
	X4CFgzCCDlqivy6lTtxKfvZN9qyihonP2NjCwR51/e+IolmBIiOzOEPJ4kjnPc24mHg1ZpggM31
	JjP0r9Y3NkHWGFNjuc5J+AxFQMDZmNI0PmTGTwxBVWOx69BwCldiS0g1q+5aa63cibdSA/7z/v4
	/t2Lvt4Nk7zgZbFJjMafFMYgZ/9JVw3NacoQg/1vsuUXrVSAp1wolDLc/6VDYutKiDja3kj31Yr
	cqHX9jRztyIJ8urhhpWvbbBeL2YY+PWKS+wN34sjBZD8FF53HH3dk=
X-Google-Smtp-Source: 
 AGHT+IFF3yN7+WJotq830CgHmPvmXMKEJdmaqjUoUbu/8vEGyPahcd8Cv+OX2SGGHwyFylNgl8pxFQ==
X-Received: by 2002:a05:6a21:9999:b0:23d:ac50:333e with SMTP id
 adf61e73a8af0-24340e6bd14mr22095061637.43.1756199160864;
        Tue, 26 Aug 2025 02:06:00 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (60-251-68-181.hinet-ip.hinet.net. [60.251.68.181])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm9796053b3a.79.2025.08.26.02.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:06:00 -0700 (PDT)
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
Subject: [PATCH v1] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
Date: Tue, 26 Aug 2025 17:05:30 +0800
Message-Id: 
 <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QB7FCASVYSB424YDNLQBGB436ABG6HW4
X-Message-ID-Hash: QB7FCASVYSB424YDNLQBGB436ABG6HW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QB7FCASVYSB424YDNLQBGB436ABG6HW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing op in the device description to avoid issues with jack
detection.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
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

