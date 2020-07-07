Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8842177AA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE4B166C;
	Tue,  7 Jul 2020 21:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE4B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149209;
	bh=YioSQtzrEbR23s+WIUMX9a9l7dKRTxoWp8bnW0Cx8Bs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPWeaIgvh+CSA1a3Uzxamcn1UY+NOW1xng9foSHq5UJcUOsvhNI4kCJLkCTDgkMmT
	 LMj8RfqqehDepKCEZikbZXcoHGzok6VBfSviBLS9ZsDKa+OGU3vVt+OyWuCiVjAofD
	 m7CC6vpXgY+xKbSdXVRNf2EoAMsl/V0Ne88F63ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE9BF80322;
	Tue,  7 Jul 2020 21:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 530A1F802FD; Tue,  7 Jul 2020 21:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2797FF802DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2797FF802DF
IronPort-SDR: UxL0lbtvj67Y3bCgdeYK+4JjB0GgMBeO3pUaTIjDTz4OAofpFPbcHuZO3/T9TJ5QChNcuaZO0D
 njyD/RVAqZEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202928"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202928"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:48 -0700
IronPort-SDR: /MWEQ/MISJuXsx3lIK1n7URj93S1QqdpW4WkcuEGVLhoJ+JnxJFPLTRfn1EiE+uynwHJ3g1eHH
 1JAcCX0XYWCg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278623"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 10/13] ASoC: codecs: cros_ec_codec: fix 'defined but not
 used' warning
Date: Tue,  7 Jul 2020 14:06:09 -0500
Message-Id: <20200707190612.97799-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Benson Leung <bleung@chromium.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 broonie@kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, open list <linux-kernel@vger.kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

fix W=1 warning

sound/soc/codecs/cros_ec_codec.c:1056:36: warning:
'cros_ec_codec_acpi_id' defined but not used
[-Wunused-const-variable=]
 1056 | static const struct acpi_device_id cros_ec_codec_acpi_id[] = {
      |                                    ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cros_ec_codec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8d45c628e988..f23956cf4ed8 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1053,11 +1053,13 @@ static const struct of_device_id cros_ec_codec_of_match[] = {
 MODULE_DEVICE_TABLE(of, cros_ec_codec_of_match);
 #endif
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_ec_codec_acpi_id[] = {
 	{ "GOOG0013", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_codec_acpi_id);
+#endif
 
 static struct platform_driver cros_ec_codec_platform_driver = {
 	.driver = {
-- 
2.25.1

