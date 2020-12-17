Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C72DD1FD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 14:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6834A1884;
	Thu, 17 Dec 2020 14:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6834A1884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608210485;
	bh=21i7hI5S2MyRbTV9zwqFvcUP+kIlmKF0QK+M2/VtH2k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTUVtGlJuCMjw4GW81QXoiFZaza1HTRtr9amE4h+GPyH5STCCKY9qvJFZAWDtKJcV
	 FdyR6cpB94kxFkYXf67Z9HRmgmSd+FfJdSI0q5xq9WT527D6qEGdVQiKckA9O8qj1z
	 knhpsJV1EPzcjLT6UJ8+qhNSjQRB7CCEM2Q+uNuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7DEF80148;
	Thu, 17 Dec 2020 14:06:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74225F80260; Thu, 17 Dec 2020 14:06:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B4A9F800C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 14:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B4A9F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="skT21vv8"
Received: by mail-lf1-x12c.google.com with SMTP id y19so57059108lfa.13
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtWGzuysSWKbzOtA9aKqff+RXT8SeMJQrKTIiGkLXlA=;
 b=skT21vv8lIa2uvSWRLVkO0L4xDW1tkdv0vL+Oxl2rQ9REMRw1ikTL/FTTNzk/XgJxx
 7eN+7GELuVusEB/bY8DcdGb6S8YWTnQgFxJzGTRhbUBN7ZwfsArssi9fu2copLhoS0wX
 dRa4yoJ5y/eJNAWGDAAEvu5DGPI3siis+1CjVkaVc6GAwCDpftNXXSvuJUq+PwvwTqjc
 dPHuV7O/zXFYuayKhOkM9RIY6iGSHe6cfbT0Zzjd/lLTCsppyRLmGiiUu0g7JuQ0yqsC
 Am3JUt5hYrwWKBG87yNHYYOTZdNJmcJkjiBQuSF6d8fDzV0XqVtWIn56D94Mw/9/8+VM
 ePiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtWGzuysSWKbzOtA9aKqff+RXT8SeMJQrKTIiGkLXlA=;
 b=W1tQUPGPkRE88ahSY+JUQTv34feVHRgSwIbj01z7cCC9Kk6Zj+/e++miEG1PDh0Hx8
 j1y/ZZqLY4qU69HBwrhY9+LCivQxSetfXH0PxT6vraen9zsUFkp5x3CLlGqpsaHfzOMs
 4Y8QDlR9dWtxHjXbIJmcTZmitLDdyJCJc9RNaQM7A78SjDoDQMZkwNu6k0JgIXZ69H4b
 20+TiT3M1fPYCLLlwx3j2JWmEYrFp3MY5KW+T1dZyebsaQiB22gXuLIXPae+IAI059b4
 rfieKJ+5PLEOSIRhvWVf3AUNE+TUMkC5hbrRZBaJ9NuoYytGDx3H9WzSkCjt5I2UM89S
 j0eA==
X-Gm-Message-State: AOAM5321mgQt/xd1s4+maBa8RN9uXUPOkMAATn+G6tR6xPBrxvEXLPnJ
 EOQlUSOoyZUsmckl8M/o+EJu4Q==
X-Google-Smtp-Source: ABdhPJwwPduYP2ZedrJ0ohGFfg/MCXb/WkmLVdkdQBc1tvJGT8d58jzhHiGaw+o0Ok5LrtYH3ZgyIw==
X-Received: by 2002:a19:f11e:: with SMTP id p30mr14449368lfh.395.1608210366471; 
 Thu, 17 Dec 2020 05:06:06 -0800 (PST)
Received: from localhost.localdomain (89-70-221-122.dynamic.chello.pl.
 [89.70.221.122])
 by smtp.gmail.com with ESMTPSA id n10sm656201ljg.139.2020.12.17.05.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:06:05 -0800 (PST)
From: Lukasz Majczak <lma@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
Subject: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
Date: Thu, 17 Dec 2020 14:04:39 +0100
Message-Id: <20201217130439.141943-1-lma@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210121438.7718-1-lma@semihalf.com>
References: <20201210121438.7718-1-lma@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>,
 Lukasz Majczak <lma@semihalf.com>, Alex Levin <levinale@google.com>
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

There is no check for the kcontrol against NULL and in some cases
it causes kernel to crash.

Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT")
Cc: <stable@vger.kernel.org> # 5.4+
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 v1 -> v2: fixed coding style

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index ae466cd592922..8f0bfda7096a9 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 	int i;
 
 	list_for_each_entry(dobj, &component->dobj_list, list) {
-		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
-		struct soc_enum *se =
-			(struct soc_enum *)kcontrol->private_value;
-		char **texts = dobj->control.dtexts;
+		struct snd_kcontrol *kcontrol;
+		struct soc_enum *se;
+		char **texts;
 		char chan_text[4];
 
+		kcontrol = dobj->control.kcontrol;
+		if (!kcontrol)
+			continue;
+
+		se = (struct soc_enum *)kcontrol->private_value;
+		texts = dobj->control.dtexts;
+
 		if (dobj->type != SND_SOC_DOBJ_ENUM ||
 		    dobj->control.kcontrol->put !=
 		    skl_tplg_multi_config_set_dmic)
-- 
2.25.1

