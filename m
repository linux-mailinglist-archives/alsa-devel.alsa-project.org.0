Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824FBA9A1D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 07:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FF01679;
	Thu,  5 Sep 2019 07:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FF01679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567661707;
	bh=RQD3Hq5lYQGQPEOGPNcUcBylJievIxLNaUHgaAkJRvI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GSaqZ+RUPQlqKyluHI+rDUBR8GBHqYHWjfOHCF8RDsrQ4AQz4JG8JYmRYZbDMzvUi
	 bW1biR8A2bnhtnD7Waj6OK57GYzIMHcuwULPIrTZbIiG1vaKqSWPjWEDKTM0zYgUWF
	 JSa2EWn6OgOcewenjCkUeq0JdBgLNT1hKK/jEjmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BD6BF80227;
	Thu,  5 Sep 2019 07:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 735D6F80448; Thu,  5 Sep 2019 07:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BABEDF80227;
 Thu,  5 Sep 2019 07:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABEDF80227
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 22:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="212657603"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2019 22:33:10 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Sep 2019 07:32:59 +0200
Message-Id: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 1/3] ALSA:hda: Simplify and clear
	calculating SDxFMT
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Set SDxFMT based only on given format, due to maxbps not always being set.
Split cases for formats 20,24,32 bits.
For format SNDRV_PCM_FORMAT_FLOAT_LE width is equal 32 so it will end up
with same mask.

Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 sound/hda/hdac_device.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index b26cc93e7e10..add758e11b85 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -759,14 +759,13 @@ unsigned int snd_hdac_calc_stream_format(unsigned int rate,
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

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
