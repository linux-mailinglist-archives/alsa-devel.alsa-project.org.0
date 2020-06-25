Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A0209E22
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 14:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932BA18E1;
	Thu, 25 Jun 2020 14:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932BA18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593086950;
	bh=3IyPOezfJjebFqUSNNL4opUwfK5akQA/OmxyD9z+A+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPLnhTNtRZSVfMzpV0agBnW5txQLXjeBbu5upuMpCZB7ZgnsJVDSN+SCIz129mxUs
	 2xuyEttFnajbXR/MEXUWITHYc43A6f7zI6cZ12QswhUH8q7yjwfNu57UbZJjcAh89k
	 pLBtx+6q20SfMHEPOjkho1KM2TScWwHE/vKfVqbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918EBF802BD;
	Thu, 25 Jun 2020 14:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76B4CF802A7; Thu, 25 Jun 2020 14:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48F01F80218
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F01F80218
IronPort-SDR: LTpjhfrAc632oAEE615eBw2mim6bt/m2X8sfv4V9qdkuMHN1blfacx66QYahjXgjde29X4K9gH
 WDVnJChKwIgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="206389937"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="206389937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:05:40 -0700
IronPort-SDR: hHHPgURUk1BOougzDVnAdbbGTx1TAPW9gdtq8fMUpq2njTTeyFf4xd6Vo7TE/YGD5aDU91mfju
 PjddTDrNtvXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="354438961"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 05:05:39 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 5/8] topology: decode: Fix decoding PCM formats and
 rates
Date: Thu, 25 Jun 2020 13:03:43 +0200
Message-Id: <1593083026-7501-5-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
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
makes data loss while converting binary to UML.

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

