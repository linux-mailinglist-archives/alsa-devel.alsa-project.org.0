Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFA24FAF1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 12:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B236415F9;
	Mon, 24 Aug 2020 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B236415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598263309;
	bh=6CPeNh36mQKp/nkwCWwDJJ6XmOXB/zcD/y538MjbDm8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eK3ojfPlrl3H7aq/TnUos6yhGc4jnNB1AcuBgK1DTxojlh0VegBKyQ1UL69gEn/4i
	 Qu4WcNUdjQKRCEmOFNWMc2MSiycnGcfzEi5nG9u1qJpigMkgS709gJ6sVSwG6HQN3D
	 oibw0EH9+2T9fXrDWDLjT/DDcqQ168dCShm/lmmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 201C9F8016F;
	Mon, 24 Aug 2020 12:00:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD54FF801D9; Mon, 24 Aug 2020 12:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21568F800B8;
 Mon, 24 Aug 2020 12:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21568F800B8
IronPort-SDR: jOxaXn6A1c8i0O2jKDAZzR6Bs99jeG5CrWVw3FbAZlTj3dqA7W4CV5QzdWnDUExyL7fm9HITCm
 Eu0SMrKgqy7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153459011"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="153459011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 03:00:37 -0700
IronPort-SDR: CnF8pBmg5rOQb3p8mhmVLkf8GOd8qkq/u3VGCgw5hbbRl16fLHXqoXSv6+4Q16L12lxXmoBf8Q
 N0rKC0J5N8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="322145847"
Received: from pharlozi-hp-elitedesk.igk.intel.com ([10.237.149.38])
 by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2020 03:00:35 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Refactor calculating SDnFMT according to
 specification
Date: Mon, 24 Aug 2020 12:00:34 +0200
Message-Id: <20200824100034.3129-1-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
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

Fix setting SDnFMT based on High Definition Audio Specification Rev. 1.0a page 48.

Bits per Sample (BITS):
000 = 8 bits. The data will be packed in memory in 8-bit containers on 16-bit boundaries.
001 = 16 bits. The data will be packed in memory in 16-bit containers on 16-bit boundaries.
010 = 20 bits. The data will be packed in memory in 32-bit containers on 32-bit boundaries.
011 = 24 bits. The data will be packed in memory in 32-bit containers on 32-bit boundaries.
100 = 32 bits. The data will be packed in memory in 32-bit containers on 32-bit boundaries.
101-111 = Reserved

Set SDnFMT depending on which format was given, as maxbps only describes container size.
Henceforth split cases for formats 20, 24, 32 bits.
For format SNDRV_PCM_FORMAT_FLOAT_LE width is equal 32 so as previously it will end up with mask for 32 bits.

Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 sound/hda/hdac_device.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 333220f0f8af..2ccf79866f99 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -762,14 +762,13 @@ unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 		val |= AC_FMT_BITS_16;
 		break;
 	case 20:
+		val |= AC_FMT_BITS_20;
+		break;
 	case 24:
+		val |= AC_FMT_BITS_24;
+		break;
 	case 32:
-		if (maxbps >= 32 || format == SNDRV_PCM_FORMAT_FLOAT_LE)
-			val |= AC_FMT_BITS_32;
-		else if (maxbps >= 24)
-			val |= AC_FMT_BITS_24;
-		else
-			val |= AC_FMT_BITS_20;
+		val |= AC_FMT_BITS_32;
 		break;
 	default:
 		return 0;
-- 
2.17.1

