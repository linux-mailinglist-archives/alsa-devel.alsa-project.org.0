Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2021F130
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:29:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3591915F9;
	Tue, 14 Jul 2020 14:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3591915F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729762;
	bh=nFrp6I0L33LzsyJaTN1nfQmbYTcksaP5HjedJjBKxQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gW3PspPon/Hsj+mqb1xdxIyZQGoojL23s4Wy/F7z3J4Qlf9upKgZ6/IZS00Ir4YF9
	 2DNW07JLP1FLgCxmA5mTgeQo2cRcECYm/5rsudSVqN1M50DUQ7Mad5J+/mN2zQEZdy
	 NEX/TEx56iUHbyTdzBV8pk4FtMUl5T8kKUQSp+hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B05F801F2;
	Tue, 14 Jul 2020 14:26:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E515F8026A; Tue, 14 Jul 2020 14:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53E42F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E42F800E5
IronPort-SDR: 0dqSj6dPW/zfeHKDf7pd0L7LzLcmHVWUuTZW2E/m1A7U8i90Cwu5q51HXrLDSTWX5gsmAVL/fq
 QuDxIYehwv4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981779"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981779"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:25 -0700
IronPort-SDR: tJ2j9VWfVQ6+4SUR5s6nELRCeP2V/+ZOBZdAntQccxf1mCq2Z0wBtt3TeFWUP+dDKDCBiZKy8T
 i9Pej0JJMh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860388"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:24 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 01/10] topology: decode: Fix channel map memory allocation
Date: Tue, 14 Jul 2020 13:25:02 +0200
Message-Id: <1594725911-14308-2-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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

