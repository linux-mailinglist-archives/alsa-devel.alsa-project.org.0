Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC7459861
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 00:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A24B1614;
	Tue, 23 Nov 2021 00:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A24B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637623480;
	bh=JMUhiCMYHHc13CD3dwkPAEnDgXQlWnHjVdSEoJjyk3M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M+2eBrr0NZcDR1qVpc7sQ9PeELE3C5vPQh7WyS/2F+o1bGeVQRieuHyTl/Gjl4k/b
	 8DML04IDkq1z7DsE9JnkCXvQ3CZAJP1o13SRHrcOfTGTfsYJgogp1KobdqCdIA2cxa
	 59eIcjIGwySmb/wkLuCW7c56FtdUDxw3M49S4Vu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5EE6F80154;
	Tue, 23 Nov 2021 00:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0382F80212; Tue, 23 Nov 2021 00:23:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 225EBF800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225EBF800E7
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="215615967"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="215615967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 15:23:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="508723223"
Received: from gavasque-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.2.29])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 15:23:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: intel-dsp-config: add quirk for CML devices based on
 ES8336 codec
Date: Mon, 22 Nov 2021 17:22:54 -0600
Message-Id: <20211122232254.23362-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mauro Carvalho Chehab <mchehab@kernel.org>,
 broonie@kernel.org, Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

We've added quirks for ESS8336 but missed CML, add quirks for both LP
and H versions.

BugLink: https://github.com/thesofproject/linux/issues/3248
Fixes: 9d36ceab9415 ("ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9ac9e9e45a4..3b1402a1f4a9 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -252,6 +252,11 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x02c8,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0x02c8,
+		.codec_hid = "ESSX8336",
+	},
 /* Cometlake-H */
 	{
 		.flags = FLAG_SOF,
@@ -276,6 +281,11 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x06c8,
 	},
+		{
+		.flags = FLAG_SOF,
+		.device = 0x06c8,
+		.codec_hid = "ESSX8336",
+	},
 #endif
 
 /* Icelake */
-- 
2.25.1

