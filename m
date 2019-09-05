Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AEA9A1F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 07:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914D11668;
	Thu,  5 Sep 2019 07:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914D11668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567661775;
	bh=xlNZ4Ve207GtLexP/tvtWx7LiGA/91+O87Rnj8g1px4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3eyaZNWjq9rfHV7U5KFgP9W1pmHLMjCKhkZ/WXeFpcYxzYJscqSNscXB8j8toeEg
	 0M5Gg8RTvkVVkX7BEqkxVzEDF1gKWjm9Rm/WEyiyulK55fjQ6mF7UJ1GOfmC70ucK9
	 y3XPpZV7a+P0kgUNKXQ7fUlTn6TyhxFfPGMqaFls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 905B3F805FA;
	Thu,  5 Sep 2019 07:33:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50F14F805F5; Thu,  5 Sep 2019 07:33:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3663F80448;
 Thu,  5 Sep 2019 07:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3663F80448
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 22:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="212657650"
Received: from test-hp-elitedesk-800-g1-twr.igk.intel.com ([10.237.149.38])
 by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2019 22:33:28 -0700
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Sep 2019 07:33:01 +0200
Message-Id: <20190905053302.9262-3-pawel.harlozinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
References: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 3/3] ALSA:hda: Add rates 24kHz, 64kHz
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

Adds rates 24kHz & 64kHz to allow proper calculation SDxFMT value.

Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
---
 sound/hda/hdac_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index add758e11b85..72e00d93adb6 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -702,14 +702,16 @@ static struct hda_rate_tbl rate_bits[] = {
 	{ 11025, SNDRV_PCM_RATE_11025, HDA_RATE(44, 1, 4) },
 	{ 16000, SNDRV_PCM_RATE_16000, HDA_RATE(48, 1, 3) },
 	{ 22050, SNDRV_PCM_RATE_22050, HDA_RATE(44, 1, 2) },
+	{ 24000, SNDRV_PCM_RATE_24000, HDA_RATE(48, 1, 2) },
 	{ 32000, SNDRV_PCM_RATE_32000, HDA_RATE(48, 2, 3) },
 	{ 44100, SNDRV_PCM_RATE_44100, HDA_RATE(44, 1, 1) },
 	{ 48000, SNDRV_PCM_RATE_48000, HDA_RATE(48, 1, 1) },
+	{ 64000, SNDRV_PCM_RATE_64000, HDA_RATE(48, 4, 3) },
 	{ 88200, SNDRV_PCM_RATE_88200, HDA_RATE(44, 2, 1) },
 	{ 96000, SNDRV_PCM_RATE_96000, HDA_RATE(48, 2, 1) },
 	{ 176400, SNDRV_PCM_RATE_176400, HDA_RATE(44, 4, 1) },
 	{ 192000, SNDRV_PCM_RATE_192000, HDA_RATE(48, 4, 1) },
-#define AC_PAR_PCM_RATE_BITS	11
+#define AC_PAR_PCM_RATE_BITS	13
 	/* up to bits 10, 384kHZ isn't supported properly */
 
 	/* not autodetected value */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
