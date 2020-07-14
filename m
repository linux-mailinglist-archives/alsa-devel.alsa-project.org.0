Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8021F152
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D87684D;
	Tue, 14 Jul 2020 14:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D87684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729955;
	bh=6XcfBZ6gIU+25YGDxOzafZU/Ro2U4bVHwBIDBCEVU28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJsTstpqew053cwe98d/WHIVdqzHLUc/U7FkYRbR/z3T+4ND7mDNoDOFqVR4cLvOa
	 mbRm76V1dw4z6W18pUszgDdEIcL4CnKpm7MoHFMiLwoXrNklKSCgU9RY4J1m1wZP0F
	 1bEHPM2WeB7LVHWW44q9EpmUUdnrJcGAKLsNd2SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F6AEF802EA;
	Tue, 14 Jul 2020 14:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8ACAF8020C; Tue, 14 Jul 2020 14:26:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64538F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64538F800E5
IronPort-SDR: l2lpzpmw8ZZebDBMEcN6DcXt9swZ8xMhdOudE7ZQGtYjBjopeqAinLWzan3jn4BRqlejSVvqgM
 AGBjpBaV+WCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981800"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:38 -0700
IronPort-SDR: +/dY0ghKLl7CLizGSxAPDqxpu5npsXCF6+jEjJLVbYhCnZQGpcrFbJMn9hVp2oJBPBOHhZGd61
 y3f/g2/jxXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860438"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:34 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 07/10] topology: decode: Fix decoding PCM formats and rates
Date: Tue, 14 Jul 2020 13:25:08 +0200
Message-Id: <1594725911-14308-8-git-send-email-piotrx.maziarz@linux.intel.com>
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

Not checking _LAST format and rate, which are valid indexes in arrays,
makes data loss while converting binary to standard ALSA configuration
file.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
---
 src/topology/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index b15b950..db40114 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -549,7 +549,7 @@ int tplg_save_stream_caps(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	if (err >= 0 && sc->formats) {
 		err = tplg_save_printf(dst, pfx, "\tformats '");
 		first = 1;
-		for (i = 0; err >= 0 && i < SND_PCM_FORMAT_LAST; i++) {
+		for (i = 0; err >= 0 && i <= SND_PCM_FORMAT_LAST; i++) {
 			if (sc->formats & (1ULL << i)) {
 				s = snd_pcm_format_name(i);
 				err = tplg_save_printf(dst, NULL, "%s%s",
@@ -563,7 +563,7 @@ int tplg_save_stream_caps(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	if (err >= 0 && sc->rates) {
 		err = tplg_save_printf(dst, pfx, "\trates '");
 		first = 1;
-		for (i = 0; err >= 0 && i < SND_PCM_RATE_LAST; i++) {
+		for (i = 0; err >= 0 && i <= SND_PCM_RATE_LAST; i++) {
 			if (sc->rates & (1ULL << i)) {
 				s = get_rate_name(i);
 				err = tplg_save_printf(dst, NULL, "%s%s",
-- 
2.7.4

