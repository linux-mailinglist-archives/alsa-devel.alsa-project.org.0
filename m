Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FE7E0675
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:25:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10D6EC0;
	Fri,  3 Nov 2023 17:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10D6EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028754;
	bh=seCUVWtCCcmJ/XTWam1et+aH6NGI2wbqVJrjcuwqBts=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oVkjDI1W7qo/w41Mta4cuQkBN3WjQzAzL4oSQjCHBi4KrYgfM9e+DdFu7+V4XYpYK
	 A3MZC5R2L+coLq8GI4LeNaEehwOVX0xTCAXvJw/HOlvPZdwFJeU5u4VpVXyUwht2S4
	 QSwxcD91PKtoD5QU+ApKQJTiQd58gerW6ivygwe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A632F80557; Fri,  3 Nov 2023 17:25:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD65F80290;
	Fri,  3 Nov 2023 17:25:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 988F7F8016D; Mon, 30 Oct 2023 19:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4708F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 19:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4708F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jm/se8vp
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-351610727adso1827005ab.0
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698692334; x=1699297134;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib4hWYqy3xNJl0QRkrHS+EQAyDQg24oqh98TyujegYM=;
        b=Jm/se8vp9RAi1eId54E/ih1n4joXKI6YYsWkreMZCas2Z8yuIZZO86oc4X9r8TBy3P
         aq+PGnqoU+Jq7t4egrylsQP0DHxrg/PqW4T0WAB4pYUI0hKrMN62oV0MNzGcWZJTgh6G
         wrX3QdFWnlcH+UgmnfKShdAvpbrjBYmuyme3wFqBnvaJH+a3JqevWLdES9ierb1uZuDA
         XVgDoLS2lo7k34P2hahi1glZFnxbz5nRrKNC0pq8dLLmqQB72qRBXNYGAKZX7mJ+Nmmw
         Lhh1vAnNn/AMu3dJXZJpsnHKXJ3bXXH1ktkxmP/0ratxmSOTpuWa/+d9cXY/oGO7BhuK
         Cbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692334; x=1699297134;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ib4hWYqy3xNJl0QRkrHS+EQAyDQg24oqh98TyujegYM=;
        b=mn+z5u4PS5xtiSQkM/v/fAreIjNEO251yK4iyqCG/d9NRM/1PrpEajIzTkTZTs8nyi
         0TmW2SlnvVcncpR4jNFMQ3pSR1oh/TipglKzI2YWMff3weQWwJXpWshAgcsyYtkat7wd
         YoOKBnrh/aAyC5hkxCYooc0jNSYzHvcSqzKCWxBveIiNVq8NW7a/EJBNI4yjESU7Nz0L
         9ZSI2KUEhaQz5XDmI/Bl7CFfcb2UkdTwro+lDw/RIjnD5I0PtT5e4oEbdMsu+nxkMMDd
         XCxZ32I06HN+wonhgicLaYN/cLjyBKnmK9KvmQdQwXFlw5J/qV5nLne7PcSVU3HofGQ3
         /peA==
X-Gm-Message-State: AOJu0YykShyiBXtMSxXNq0MsqAELqgx4dBiaZkiCVUcnvMIa8goWllF7
	Ogy1jnPtw3CbOG2PJoBKxW8=
X-Google-Smtp-Source: 
 AGHT+IHTXBjdU2JVa1Y5xfA9ehT1aBnweJbHPmw18ifW40iqGSvqPI500VL4jLaKSM2ZPIWlYLhIhg==
X-Received: by 2002:a5d:8b13:0:b0:79a:c487:2711 with SMTP id
 k19-20020a5d8b13000000b0079ac4872711mr10733086ion.0.1698692334159;
        Mon, 30 Oct 2023 11:58:54 -0700 (PDT)
Received: from [10.69.0.11] (c-68-55-100-39.hsd1.mi.comcast.net.
 [68.55.100.39])
        by smtp.gmail.com with ESMTPSA id
 m38-20020a056638272600b0042b6940b793sm2317203jav.17.2023.10.30.11.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 11:58:53 -0700 (PDT)
Message-ID: <2f5ffc3b-01be-413d-843e-8654d953f56f@gmail.com>
Date: Mon, 30 Oct 2023 14:58:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
From: Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] ALSA: hda: intel-dsp-cfg: Use AVS driver on SKL/KBL/APL
 Chromebooks
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SNSE6ZQWHEQG262DSCCKPY2BCJH6UEY4
X-Message-ID-Hash: SNSE6ZQWHEQG262DSCCKPY2BCJH6UEY4
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:25:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNSE6ZQWHEQG262DSCCKPY2BCJH6UEY4/>
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
v2: Only use quirk if AVS is enabled
  sound/hda/intel-dsp-config.c | 26 +++++++++++++++++---------
  1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 756fa0aa69bb..e056aca01900 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -16,10 +16,11 @@
  static int dsp_driver;

  module_param(dsp_driver, int, 0444);
-MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP 
(0=auto, 1=legacy, 2=SST, 3=SOF)");
+MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP 
(0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");

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
@@ -79,9 +80,9 @@ static const struct config_entry config_table[] = {
  		.codec_hid =  &essx_83x6,
  	},
  #endif
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
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
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
  	{
-		.flags = FLAG_SST,
+		.flags = FLAG_AVS,
  		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
  		.dmi_table = (const struct dmi_system_id []) {
  			{
@@ -114,15 +115,17 @@ static const struct config_entry config_table[] = {
  			{}
  		}
  	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
  	{
  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
  		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
  	},
  #endif
  /* Kabylake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
  	{
-		.flags = FLAG_SST,
+		.flags = FLAG_AVS,
  		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
  		.dmi_table = (const struct dmi_system_id []) {
  			{
@@ -134,6 +137,8 @@ static const struct config_entry config_table[] = {
  			{}
  		}
  	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
  	{
  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
  		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
@@ -667,6 +672,9 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
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
