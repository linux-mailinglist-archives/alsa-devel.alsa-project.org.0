Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F6A35A88D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A16E168F;
	Sat, 10 Apr 2021 00:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A16E168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618005836;
	bh=KuTupBgI05Ma4/2bnXrtTVfEnWLOYcuRBOggjYi9BQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuUdZbY8ydj9p7CPp+ixnh2fLwz1ZgBKXZj6m5Fmxwi7wzqY1BwQ7FpYVA43mnNg6
	 Zk4v5DXQmKNotb8o4ycy8IRB0ymro4CHS4QN1JW0WAeyIX0t/3kWnSbF5fchihaFJN
	 KQFWN/SxPacess2nSvRxjrvLfl4i52g4OI0BD4eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9CFF80430;
	Sat, 10 Apr 2021 00:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33979F8032C; Sat, 10 Apr 2021 00:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 006D6F801F5
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 006D6F801F5
IronPort-SDR: aUI6I1kIL5pe2aQBH3tm+TyUq+AICbQUffInDzQJ5JhbKweHX+9N75hzbDbjPPrHbCkhe18mwo
 RRFcEeolFMkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214284729"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214284729"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:36 -0700
IronPort-SDR: 4ZuvmOdWxUDnQMLi/oaT2ryt7E2PupBp6zaWCSwcJTo/9drTSr4XR0NNZKOkLyRIX2T013qpko
 8m+eJaUVNI7A==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599290614"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:34 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: soc-acpi: add new fields for mach_params
Date: Fri,  9 Apr 2021 15:01:17 -0700
Message-Id: <20210409220121.1542362-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
References: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We currently have an ugly way of handling the SOF nocodec mode, with
blatant violations between layers. To create the nocodec card, let's
add two new fields and the existing mach_params structure, that way
there will be no differences with regular cards.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc-acpi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index c45075024c30..2f3fa385c092 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -63,6 +63,8 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
  * @link_mask: links enabled on the board
  * @links: array of link _ADR descriptors, null terminated
+ * @num_dai_drivers: number of elements in @dai_drivers
+ * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
  */
 struct snd_soc_acpi_mach_params {
 	u32 acpi_ipc_irq_index;
@@ -72,6 +74,8 @@ struct snd_soc_acpi_mach_params {
 	bool common_hdmi_codec_drv;
 	u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
+	u32 num_dai_drivers;
+	struct snd_soc_dai_driver *dai_drivers;
 };
 
 /**
-- 
2.25.1

