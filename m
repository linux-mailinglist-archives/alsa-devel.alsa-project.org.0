Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDF48D628
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 11:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678811F19;
	Thu, 13 Jan 2022 11:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678811F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642071431;
	bh=FhVHgSN/lNJeu2IDjj6rTRXUr8eMT8m7IgjmIJEwy3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUEJe3ox/hzU4QS5b07O17mg2P1Zs7NiIAuO93aU7UznceTLDCOsDMNVKW9iGA3ii
	 VTQTyNHn9XE1m91OAu7r4/U7Q9CuAzO1pxxGnijbHjTAbdUR5mhCYxA++MbmyDZ7FN
	 6Ko/BtAvxlFxPJbtlHQS3y3B0lsYJP2eQ3TjZXTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B71FF804B1;
	Thu, 13 Jan 2022 11:55:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255ABF8010B; Thu, 13 Jan 2022 11:55:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EE3F8010B
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 11:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EE3F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JcLwQybY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642071324; x=1673607324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FhVHgSN/lNJeu2IDjj6rTRXUr8eMT8m7IgjmIJEwy3Y=;
 b=JcLwQybYDrdwrD3prJJrLa9cNtS5acij9cTEw0uG5t+0E3XHIUfYC2Tl
 CpMaQSch1z7ef3A+zG73gtPxOM//UGvT17Th4jQSmu5b/Sn2XSV1os5lP
 qPr8H9Fmna7tqEeeaQSqCxw5JtEiAU6+A8SEDq71HYFhbkPcGjmzoV4H0
 vMo+a/NPYL/bzXsXmVStQWSoNfzihY/g1nnxLsdUJadeWYefJ4gMaBI8d
 5CWGvkK3HGSwnyRxmnZMISVKbYPj1UgwTflZivSgZPxyDG2c7EAZ2Ofo9
 yjn8rxDAxBBUhtjf+32CAdxROENDcGhMwUv93RtoumcHkDQMvEnhUEEQV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330332918"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="330332918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 02:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="475267052"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2022 02:55:19 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: hda: intel-dsp-config: add JasperLake support
Date: Thu, 13 Jan 2022 18:52:19 +0800
Message-Id: <20220113105220.1114694-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113105220.1114694-1-brent.lu@intel.com>
References: <20220113105220.1114694-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Add rules to select SOF driver for Jasper Lake systems if digital
microphone is present or the system is a Chromebook.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/hda/intel-dsp-config.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index c26229ed642f..3a3026fa4a17 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -309,13 +309,30 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 
-/* JasperLake */
+/* Jasper Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = 0x4dc8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF,
 		.device = 0x4dc8,
 		.codec_hid = "ESSX8336",
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.device = 0x4dc8,
+	},
 #endif
 
 /* Tigerlake */
-- 
2.25.1

