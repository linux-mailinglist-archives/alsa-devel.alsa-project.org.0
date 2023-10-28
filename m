Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A67E0651
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7EEE9A;
	Fri,  3 Nov 2023 17:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7EEE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028579;
	bh=HFf0jnK9iK25j0qBoJQeFFZNdnbnq1K7qEfacrGVaoU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vVDjL6TOE1dfYr2PrvakLtp0Wbiht4r4TWEui7w9wvoC2TqWZ8DNxWEN7IVag0rxq
	 /Srn8x3JQk5oEQGA5kIfelMA83gYro/0PYeb7YrvT9tEW5powXd2Bs7aNS7Sr9KEkx
	 Zz7x8XMa56tEmVaSStGODqPdO0Oabp0J4SiTk/EQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD76AF805B0; Fri,  3 Nov 2023 17:20:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9A6F8058C;
	Fri,  3 Nov 2023 17:20:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6555F8019B; Sat, 28 Oct 2023 14:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85374F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 14:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85374F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XE5YagKG
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3575732df7fso348685ab.0
        for <alsa-devel@alsa-project.org>;
 Sat, 28 Oct 2023 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698495909; x=1699100709;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSxHFmesFAB9kTq2jfm6itRE/8cOOBEbwEMaK6v6h14=;
        b=XE5YagKG6+l1KhXg/dlnndlLSAo0bWrhUOteWym2MkeGi9uGLg6MESR66VzNDMuLN3
         aZxWwedt/PY99gVrZYVdw4v6aatLd4HCLetGgy+9DroeSw17kIXLnanR3xBjdTwhSND+
         jBz3H9QtYePN3DRhN/29bSMXnhfSfXoIScq34OO6N08vqwjlvgOsTuCQetxEQhT3BsV4
         op4H1pyYOdXJxs+s/RWfjRYX1m9Ps8/BmrfFcXdsfWB7MyUtIfI2LIJ/s+eeFH2MSPRd
         7UxnGdwbOVSY8Z6LLMAEl1sYj9CsVkUPTVwKzCrduejnJxegcHftlmIK8VlbnxXsPhnl
         jCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698495909; x=1699100709;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSxHFmesFAB9kTq2jfm6itRE/8cOOBEbwEMaK6v6h14=;
        b=tR02CwVr4UnDCKRM24kkDqATSn2PAIRS5z6LryLx1Wngfq6mJpv+3/KQwOdOFDVhZC
         jXyFN2Uq3lWF2PnR6rzWNv4qMjRCC5mtmNg4IapPkbUUEwBOz9zBTIaUCz1zSoveoS9t
         OX+WIwEzjd+UAFoswa6LGYF5YfopCf8X14YZsvip3rWTkD409lJJcEDj133Ss0kGdKKD
         gwzqPQWvhurK/13uj+KgkjMAB5yGUHnifw/0jHtXM+MvS4yi1r9tc9KGzkqkXAqFhmRy
         vg5ohkJPEkI6AIYMJuSdNQ0Lh/iC6e5RNNb0zgpXumzBLnjGGKKfx4JsNtbklQLjCIfH
         2tiQ==
X-Gm-Message-State: AOJu0YzqNhccjB/GNBFCWICsllKd9r0H84hia79w0rVoatozdInRnGzr
	xLDy7CJUWICu2UFnOdzKf/8=
X-Google-Smtp-Source: 
 AGHT+IE4kmyNAp8GEi2qsVg0bMr/n6b2Qf8SbxEfHgzlYw4xUY53hPB/urxzfzaWyXZAuOjSw4jtVA==
X-Received: by 2002:a05:6e02:218a:b0:359:a6d:bcf6 with SMTP id
 j10-20020a056e02218a00b003590a6dbcf6mr918480ila.1.1698495908891;
        Sat, 28 Oct 2023 05:25:08 -0700 (PDT)
Received: from arch (c-68-55-100-39.hsd1.mi.comcast.net. [68.55.100.39])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a056e021a6400b003579f927291sm1108075ilv.38.2023.10.28.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 05:25:08 -0700 (PDT)
Date: Sat, 28 Oct 2023 08:25:06 -0400
From: Brady Norander <bradynorander@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ALSA: hda: intel-dsp-cfg: Use AVS driver on SKL/KBL/APL
 Chromebooks
Message-ID: <ZTz9orCylVwn3Pye@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6XIFOC4TX4KVNNDRQMUQYNZWX4V5X7ZQ
X-Message-ID-Hash: 6XIFOC4TX4KVNNDRQMUQYNZWX4V5X7ZQ
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:20:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XIFOC4TX4KVNNDRQMUQYNZWX4V5X7ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The legacy SKL driver no longer works properly on these Chromebook
platforms. Use the new AVS driver by default instead.

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
 sound/hda/intel-dsp-config.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 756fa0aa69bb..1045be1fd441 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -16,10 +16,11 @@
 static int dsp_driver;
 
 module_param(dsp_driver, int, 0444);
-MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
+MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
 
 #define FLAG_SST			BIT(0)
 #define FLAG_SOF			BIT(1)
+#define FLAG_AVS			BIT(2)
 #define FLAG_SST_ONLY_IF_DMIC		BIT(15)
 #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
 #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
@@ -56,7 +57,7 @@ static const struct config_entry config_table[] = {
 /*
  * Apollolake (Broxton-P)
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
- * Chromebooks (SST), as well as devices based on the ES8336 codec
+ * Chromebooks (AVS), as well as devices based on the ES8336 codec
  */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
@@ -81,7 +82,7 @@ static const struct config_entry config_table[] = {
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	{
-		.flags = FLAG_SST,
+		.flags = FLAG_AVS,
 		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
@@ -96,13 +97,13 @@ static const struct config_entry config_table[] = {
 #endif
 /*
  * Skylake and Kabylake use legacy HDAudio driver except for Google
- * Chromebooks (SST)
+ * Chromebooks (AVS)
  */
 
 /* Sunrise Point-LP */
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
 	{
-		.flags = FLAG_SST,
+		.flags = FLAG_AVS,
 		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
@@ -122,7 +123,7 @@ static const struct config_entry config_table[] = {
 /* Kabylake-LP */
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
 	{
-		.flags = FLAG_SST,
+		.flags = FLAG_AVS,
 		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
 		.dmi_table = (const struct dmi_system_id []) {
 			{
@@ -667,6 +668,9 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 		}
 	}
 
+	if (cfg->flags & FLAG_AVS)
+		return SND_INTEL_DSP_DRIVER_AVS;
+
 	return SND_INTEL_DSP_DRIVER_LEGACY;
 }
 EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
-- 
2.42.0

