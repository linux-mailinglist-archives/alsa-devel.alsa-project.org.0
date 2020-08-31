Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00F257620
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E2A1844;
	Mon, 31 Aug 2020 11:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E2A1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865042;
	bh=+Q26Pgh/P+Ns91ADSBUrhWoGxlD+cFUamO3ZC4wZ9Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4E6irwGQT5UUETYgkruQGFh8kfdVWZ/54FSvtgu1nthsHp7IdEDLzCghJsuAx08O
	 G5KTvba4RpR/4VYRCaDcMmaiHvkfBe/4HGavSosFT49Ud7tuXFbAyuSrWq2ZvbtGqJ
	 Wq6x3q7dyeyAmXIfaSGDmoUFYqR65LHvBJyAdn/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64843F802D2;
	Mon, 31 Aug 2020 11:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B63AF80146; Mon, 31 Aug 2020 11:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D1BF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D1BF80146
IronPort-SDR: yJnZxtOD3N/TXp9zLCBMRW7gcACxPcoW3t9ZytNIL6qJOWMoB3ReR/xQYCaCkjtytd+gCT7cNa
 OSJYHDmIfBNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466737"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:03 -0700
IronPort-SDR: SpPDj+AQdaZ8Xb3k3GtLAwUQCtuAAbqvbE42EQ8HqJFclfOg+Et8mKh3VcucApByF0uhTT+Lxt
 Tal/Hs2NSoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286858"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:02 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 01/10] topology: decode: Fix channel map memory allocation
Date: Mon, 31 Aug 2020 11:08:54 +0200
Message-Id: <1598864943-22883-2-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

Memory allocated on the stack was referenced outside of the function scope
caused undefined behaviour.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/ctl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 90241b6..6e6c1d1 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1330,7 +1330,6 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 			      void *bin, size_t size)
 {
 	struct snd_soc_tplg_enum_control *ec = bin;
-	struct snd_tplg_channel_map_template cmt;
 	int i;
 
 	if (size < sizeof(*ec)) {
@@ -1375,11 +1374,13 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 		}
 	}
 
-	et->map = &cmt;
-	memset(&cmt, 0, sizeof(cmt));
-	cmt.num_channels = ec->num_channels;
-	for (i = 0; i < cmt.num_channels; i++) {
-		struct snd_tplg_channel_elem *channel = &cmt.channel[i];
+	et->map = tplg_calloc(heap, sizeof(struct snd_tplg_channel_map_template));
+	if (!et->map)
+		return -ENOMEM;
+	et->map->num_channels = ec->num_channels;
+	for (i = 0; i < et->map->num_channels; i++) {
+		struct snd_tplg_channel_elem *channel = &et->map->channel[i];
+
 		tplg_log(tplg, 'D', pos + ((void *)&ec->channel[i] - (void *)ec),
 			 "enum: channel size %d", ec->channel[i].size);
 		channel->reg = ec->channel[i].reg;
-- 
2.7.4

