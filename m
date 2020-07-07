Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC42177A6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:11:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 688E1168E;
	Tue,  7 Jul 2020 21:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 688E1168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149109;
	bh=CHts9+ysewqz6pElHAzPqHHP5kXO2Fzu1VoJLH9cFcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssMdSSWlXuvVZtqz0dLiuQzOZe+OWSvN8wld+tuUS5nFFz/DaAIfEf8bGcsTQDlH6
	 os48NdmZMTw6AeTl2WJdq8cEZnB/nTkmD4hFQ2HV5zVIZkYovV4GrexdTkdp7qd3BV
	 g8DDYaXIW/yxd7IXSNpgYD14LurTEPDYFALEAamQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27146F802EC;
	Tue,  7 Jul 2020 21:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C299FF802EA; Tue,  7 Jul 2020 21:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2003EF802BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2003EF802BC
IronPort-SDR: BxEL5HxbpriDoi/RY4APouq5Qb0QTUlnvvH++XRk+tNVlAb2kzMirhd6vnMg11/ZJ0p3MLmFAT
 QQy13s09FDBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202916"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:43 -0700
IronPort-SDR: DN4ldqLb/EoLMqXMt676LQSlB9MPbZE//nqOxXz/eIzQnXyoS4U+1DGvITBfXeHI62k/dHUhXJ
 LzIMIpsHATUg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278596"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 07/13] ASoC: codecs: da7219: fix 'defined but not used'
 warning
Date: Tue,  7 Jul 2020 14:06:06 -0500
Message-Id: <20200707190612.97799-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Support Opensource <support.opensource@diasemi.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>
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

sound/soc/codecs/da7219.c:1711:36: warning: 'da7219_acpi_match'
defined but not used [-Wunused-const-variable=]
 1711 | static const struct acpi_device_id da7219_acpi_match[] = {
      |                                    ^~~~~~~~~~~~~~~~~

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da7219.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f2520a6c7875..153ea30b5a8f 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1708,11 +1708,13 @@ static const struct of_device_id da7219_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, da7219_of_match);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id da7219_acpi_match[] = {
 	{ .id = "DLGS7219", },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, da7219_acpi_match);
+#endif
 
 static enum da7219_micbias_voltage
 	da7219_fw_micbias_lvl(struct device *dev, u32 val)
-- 
2.25.1

