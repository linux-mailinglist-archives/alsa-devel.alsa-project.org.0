Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C93215541
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 12:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295361660;
	Mon,  6 Jul 2020 12:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295361660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594030402;
	bh=rWtqJvbUeiP86JbImJ7QFSyPWgixsZFwlf3KUB5C0Oo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvfHXaxEdM3LwvWcWELP0pjD11naIbtQfR9+FXvdqgnugd072FjVMoKEItWDC0pUx
	 FuepaFvUfE96uxtCuFFKv1d8m5lDUOVuj160TMI3i54poVpe63smmOm0zoF3rshJoQ
	 zuOUJr+cNkKDbtTvhWKw3LxLfA8ERuXMG8SgJrpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B9BCF802F7;
	Mon,  6 Jul 2020 12:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16F02F802C2; Mon,  6 Jul 2020 12:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0521F801D8
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 12:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0521F801D8
IronPort-SDR: J5ePQtRB87NzSIvHB4xeXTT6LCo14r49PSmJLExcf7NjLoSgUgjWNV520IDa+Th5y0ebGyFeML
 GQJTYDjXfWXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="135637972"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="135637972"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:07:41 -0700
IronPort-SDR: ACksTtTBLkJiNMti9FChuwV4E+0PlMr7R7WL3Mh05rV59q4LPUcP+KUE7Nw/tk9JzfCcqVWbsM
 SMohfJ5kvl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="313913024"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 03:07:40 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/10] topology: decode: Fix decoding PCM formats and rates
Date: Mon,  6 Jul 2020 11:06:00 +0200
Message-Id: <1594026363-30276-8-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
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
makes data loss while converting binary to UCM.

Change-Id: I71ac42b65e8b1d79f2a061f805c62e29a758ad74
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

