Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F31A569
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 00:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91ED18D1;
	Sat, 11 May 2019 00:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91ED18D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557528088;
	bh=2lTL8FNTcHHb1FJRFCAQp4JQESwXhAIEfjPx9fnj9xA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FuYMRhJwbcCQM7KY+Aaf7O/8HRoHS7MmTtYrFiMsLacUxPOH4NZRBk6u/ooZ+KTuI
	 N5jkObMKMPXotmbITGIhDMtgB4U6MzvnabOSEtCxGZViQIs+P6r0FJ+Cb1Z3X3RjS+
	 dbfCeMYZ6TmLMKBkpN0Zh5Bl13gT1InCyHOkBbFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D93F896FD;
	Sat, 11 May 2019 00:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99BE4F896FD; Sat, 11 May 2019 00:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 384D7F80730
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 00:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384D7F80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ETEZBKP8"
Received: by mail-pf1-x444.google.com with SMTP id u17so3933176pfn.7
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xq1TpWdwTDp+vPr9dbSF7ibV0/5bhRTpDmSdefETpPs=;
 b=ETEZBKP8eV+KAtuYVJR87nKOwtbsH1T4CVkJShS5AlHxEAKWOFe1ChqZRhLq8qFsMr
 RbAyFSpHkFqVhw8m5nHAhvswwsJd7oP5twzJWaRlLmYiIkKunPYOSyCQWBL8vM8TVO0u
 EAEieXP5ZqLVl+SdDL0ZsgPOSbj8/K2AUlRgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xq1TpWdwTDp+vPr9dbSF7ibV0/5bhRTpDmSdefETpPs=;
 b=NdUypWRnvauqMCYJ9sF8Ir5gxgcd4X0wnIUQiJmV2bi3nBE+oJacASxrAe9s5OecPZ
 YXAnh6U+lAj2X9LddWjO0DCHpWOXbEitUTzHo2CDKnOR84mrFbhlJv35PTRHv1wGsbwJ
 E97qAyGpSbL3kFJTidqkHYKf45yvcPa+aYcXfzpWnxtyGNb3cvVhZXJuXxu8c856NuGn
 7LVpZ2QDDhu6MSbOPukDVA8TG86EoRZQVbxQROQfoxe/2b7Va68EfQj1KhNGUQWPO6xV
 fqbJUv7u8ZpiC51geur2A/DfwBZHe/87ppgfVmuPkqGJc6vi+pCuPY5IJlM1Q3qD/mOy
 QMQQ==
X-Gm-Message-State: APjAAAVXURkGIizaTk3p9+0XNHXmVE8YK8VwTQ2wGbkUhM4d55HFgSrv
 Qt9cfYVT4ZzvHewelG3BjMTXBw==
X-Google-Smtp-Source: APXvYqyRS+XRwoalvlFcJf99Yk4/x47QLraCe/Go1TtMh7YgQMUXhQBX3eabXg/Gd4jvAvDCFASbzQ==
X-Received: by 2002:a62:5103:: with SMTP id f3mr18196839pfb.146.1557527978098; 
 Fri, 10 May 2019 15:39:38 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id u66sm13300540pfa.36.2019.05.10.15.39.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 May 2019 15:39:37 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Fri, 10 May 2019 15:39:27 -0700
Message-Id: <20190510223929.165569-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>
Subject: [alsa-devel] [PATCH v3 0/2] ASoC: Intel: Add Cometlake PCI IDs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


This small series adds PCI IDs for Cometlake platforms, for a
dazzling audio experience.

This is based on linux-next's next-20190510.

Changes in v3:
- Copy cnl_desc to new cml_desc, and avoid selecting cannonlake (Pierre-Louis)
- Don't select CML_* in SND_SOC_INTEL_SKYLAKE (Pierre-Louis)

Changes in v2:
- Add CML-H ID 0x06c8 (Pierre-Louis)
- Add 0x06c8 for CML-H (Pierre-Louis)

Evan Green (2):
  ASoC: SOF: Add Comet Lake PCI IDs
  ASoC: Intel: Skylake: Add Cometlake PCI IDs

 sound/soc/intel/Kconfig                | 16 +++++++++++++
 sound/soc/intel/skylake/skl-messages.c | 16 +++++++++++++
 sound/soc/intel/skylake/skl.c          | 10 ++++++++
 sound/soc/sof/intel/Kconfig            | 32 ++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c            | 28 ++++++++++++++++++++++
 5 files changed, 102 insertions(+)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
