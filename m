Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6325762F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0426D184D;
	Mon, 31 Aug 2020 11:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0426D184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865156;
	bh=ApzChtk66UAKjl39ihxLNZA0AxcKtfhsHOjE7Ko1u0o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZyzkNoLEKGZ3wn8U79+/oKYW0vPjUd1DfyGPbrcBAdFduwBNS5sP1hMKMrUfZZ3V
	 zRPfUlGBV+hvYVVDroqgLYFjsR0decMUD6omNWhzLcI/UoH7+9ZX7W/8kUDTiKhIhb
	 XBEaeN2Cla7fE1MH/ESCeC8YcjCs7S5QLyKezCkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 924E0F802EA;
	Mon, 31 Aug 2020 11:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC58F802E8; Mon, 31 Aug 2020 11:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0348BF802A1
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0348BF802A1
IronPort-SDR: GzZDOE8gPcJgCoa6d4L5UKvZ6zGslq6ub+qUUTGG/eSMKZjMhIhq+wVl7Q9/NMhdf0x8ZHsbao
 nNvTbtwqDJfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466768"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466768"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:14 -0700
IronPort-SDR: m4XB9olji4b0eDuL6BKUB+qLVDHsE33BiQIXSb8GGjWrRTAyNimWn/xZYFsEC9tRvVoHdcTVRW
 ZC/6fG4JZTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286901"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:13 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 07/10] topology: decode: Fix decoding PCM formats and rates
Date: Mon, 31 Aug 2020 11:09:00 +0200
Message-Id: <1598864943-22883-8-git-send-email-piotrx.maziarz@linux.intel.com>
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

Not checking _LAST format and rate, which are valid indexes in arrays,
makes data loss while converting binary to standard ALSA configuration
file.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

