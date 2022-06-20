Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350155154D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3BB18C5;
	Mon, 20 Jun 2022 12:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3BB18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719639;
	bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3SL2c2o4YEKyqmeg5V2zzn57gelu5HB286KlEKUNvJML9mx4PE3jUnUXgaafhP02
	 8M3xy6SzLYrP6Sjv43KEM3qlANbBaf+CyHP9EHRSKhIp1wAl4qBCViNX6rVz8f3fN2
	 stu44h8MbkbP4ajVq0TA1h4DKqX8moDl5Et90AE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D68F8056F;
	Mon, 20 Jun 2022 12:04:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99855F80551; Mon, 20 Jun 2022 12:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C99DF80535
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C99DF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M6gwnFdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719446; x=1687255446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0Kok7wGPSNdLmm0aDT4JNZdUbDgMsPnAiN9aOQ2AiM=;
 b=M6gwnFdQSSKp2ZWyM1dDbj0N7Kvc16/jp1CClh8JMitUPDDHS79rSanf
 z+2tHqZmZ6XtHUskF0lHqO/r+Sm0KwaK/XYgdrZQ8Lw+F4KptJmM2UPMZ
 N3eHt4J1UGooYZC0UCVPLQhGfshfXes8zkYnooT9EQRsUuOKqZH3rKHY9
 QpQD9xbmdg8+VGNiTzrtBIXLi59LOdUh8bGfjCmjMBfqSr4APg7BYl6RS
 DK3SzArzbeOv3I4Cx8k1GpdItOESikNaxiqBYT/VLAXa32KQMb/gVWm4s
 OZsVtBv0L5WqfY8Fq8hEkQNPQa5Ri/wJR6E/6poBRhM5DSLXr3xxtFVR1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180693"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046332"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 08/17] ASoC: Intel: Rename broadwell source file to
 bdw_rt286
Date: Mon, 20 Jun 2022 12:13:53 +0200
Message-Id: <20220620101402.2684366-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Rename source file to drop any ambiguity.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/Makefile                     | 2 +-
 sound/soc/intel/boards/{broadwell.c => bdw_rt286.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename sound/soc/intel/boards/{broadwell.c => bdw_rt286.c} (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index e479546a3d4b..eea1e26acfda 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -2,7 +2,7 @@
 snd-soc-sst-haswell-objs := hsw_rt5640.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
-snd-soc-sst-broadwell-objs := broadwell.o
+snd-soc-sst-broadwell-objs := bdw_rt286.o
 snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
 snd-soc-sst-bxt-rt298-objs := bxt_rt298.o
 snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/bdw_rt286.c
similarity index 100%
rename from sound/soc/intel/boards/broadwell.c
rename to sound/soc/intel/boards/bdw_rt286.c
-- 
2.25.1

