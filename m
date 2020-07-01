Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6B2112BB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51AE1686;
	Wed,  1 Jul 2020 20:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51AE1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593628122;
	bh=GfkGddHRjrAKyyf2gwQ/FpNtR36lQ5TE7Quok8JkwW8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELIc1VwN6NkGrWsyRy82d4xiEKvCzvy3TjB+XquOOuVYVbEEkmJM2Zq6UOwjsHvAf
	 f4zKqPj3PKTZiVEuNXV7UUjqsoTDwxrj5b4xz9I2zdMoubGKO8uDB2K5w5roTA9Lfh
	 lkYLMFjXuw1Ceh3YimbijuqoFIg1dra2jkJy+NR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A952CF802DB;
	Wed,  1 Jul 2020 20:24:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA186F802C2; Wed,  1 Jul 2020 20:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148D7F80256
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148D7F80256
IronPort-SDR: //zmMkIkn+tUv1hFfAG6/bpPehNkzrPzgV0Ss3xGOq6dGIC4t6XmjCuI5lYCCAsO5a4oakLIHQ
 B9IGly/aHhhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208189503"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="208189503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:36 -0700
IronPort-SDR: Teb3TbgeImWbsSgIi/cT+IGF9K7mjlsrAU5Z/Q5gfZS/xZeWA+2nZbAsqZcITUIL6DSpGOYA76
 7zu97vMAW4Nw==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="425679560"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ASoC: codecs: da7219: fix 'defined but not used' warning
Date: Wed,  1 Jul 2020 13:24:15 -0500
Message-Id: <20200701182422.81496-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
References: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

