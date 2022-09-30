Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A35F0BEB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 14:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD64116A9;
	Fri, 30 Sep 2022 14:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD64116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664542031;
	bh=UA4ECxvWuz/29r95Hr8c14rfqEaSErwOZAFzIrRrmK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ET4YlQ8Cs53ecgW8QvjE4MEx2dJamhV7GTv0SsIKo9NYQwu5wHDxNpeHffyn0UqB7
	 H1PdNod/R4CZMQB/th8jtNyJ31K5RPSjhweADgBL43/GAPgMhfep+wI4C4hGO0+M35
	 6SbwYpKDRfhkbE/w21tM6AaQ7WtCLOlY3gMs5I8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12946F8053B;
	Fri, 30 Sep 2022 14:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CDF3F8053B; Fri, 30 Sep 2022 14:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FD72F80095
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 14:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FD72F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g8AgCRqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664541925; x=1696077925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UA4ECxvWuz/29r95Hr8c14rfqEaSErwOZAFzIrRrmK4=;
 b=g8AgCRqDonv5scVzY+R16efe5FD9jL1o2OtGCIPKHknY7AlIUjyLOwAs
 Z/K8/4j3L1fdE0VGFh0qLDH9p53Jkc0+5Sv/CDEp4LYIEb7ZCdjT/wwFz
 d41uHUGwQVqKubk4CTIG36QYEPDt0JQba1R9m1V9VU1IqnEB//57nyj3I
 WhCysdggx77WRR1bCHwwExUJelcwXX+CzFZjAcQ5bJ5t1FW+LaM44dpCR
 5p9yk+beBTqQoQigebv1fDvPMNp9rSerDPyptykLfCwVVie2hEy7e58ND
 HjUr/4PYHtDnDMqZu7f8BTSSKD2qDU4t0aymlVQx7JwwE0j5RxFl4Edp3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303667494"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303667494"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 05:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="748219014"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="748219014"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Sep 2022 05:44:57 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: Intel: avs: Load max98927 on target platform
Date: Fri, 30 Sep 2022 14:45:38 +0200
Message-Id: <20220930124538.354992-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
References: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

In order to load proper board configuration it needs to be looked up in
ACPI. Add board configuration for MAXIM 98927 codec present on
Chromebooks.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 87f9c18be238..1a85349f9563 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -121,6 +121,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		.machine_quirk = dmi_match_quirk,
 		.tplg_filename = "rt298-tplg.bin",
 	},
+	{
+		.id = "MX98927",
+		.drv_name = "avs_max98927",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.tplg_filename = "max98927-tplg.bin",
+	},
 	{
 		.id = "MX98373",
 		.drv_name = "avs_max98373",
-- 
2.25.1

