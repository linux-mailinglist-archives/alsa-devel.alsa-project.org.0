Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D92177AD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E165E1612;
	Tue,  7 Jul 2020 21:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E165E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149251;
	bh=rQAi/s5XFU2GAp163k1Ju7ZtRxNQIR2I2cYqxGpg8xI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crDBE/MtyKzk1DicOTIcsecPB16PJ6gnH76HINtQJZtHoVQ+1ge8Abtf2RcBh7xqm
	 rx9Kseqz4xgQ1tMkjWSzhXnENSPMF904bwySL/mZm7VkVil0W/gwjpHuY5mJ8f2gfM
	 MDjiGDxjWW/JKbHkXf0wINlkFNwPpEThPXPZCJ7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D52F80337;
	Tue,  7 Jul 2020 21:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DB2DF80305; Tue,  7 Jul 2020 21:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AB4BF802EC
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB4BF802EC
IronPort-SDR: RGIHiuoRyOSXl2EjGipkAFL8PGZNcs+kTFtFlydHk07UkwIq4HddpfECQcE5JQLZSdaAEzlmM1
 qKJPsLqIM0fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202933"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202933"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:50 -0700
IronPort-SDR: Be2XIvFoWxf08RM7wO9zo0An2S9ds88sPy/HXI1/ivkRdiWTG8kehMYTvovW5VEO6ZgC++3BH0
 xP8SYOLcM/+A==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278638"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 11/13] ASoC: codecs: es8316: fix 'defined but not used'
 warning
Date: Tue,  7 Jul 2020 14:06:10 -0500
Message-Id: <20200707190612.97799-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, broonie@kernel.org,
 Daniel Drake <drake@endlessm.com>, Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warning

sound/soc/codecs/es8316.c:842:36: warning: 'es8316_acpi_match' defined
but not used [-Wunused-const-variable=]
  842 | static const struct acpi_device_id es8316_acpi_match[] = {
      |                                    ^~~~~~~~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/es8316.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 36eef1fb3d18..70af35c5f727 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -839,11 +839,13 @@ static const struct of_device_id es8316_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, es8316_of_match);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id es8316_acpi_match[] = {
 	{"ESSX8316", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, es8316_acpi_match);
+#endif
 
 static struct i2c_driver es8316_i2c_driver = {
 	.driver = {
-- 
2.25.1

