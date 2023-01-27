Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1967E91F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:12:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330DAE82;
	Fri, 27 Jan 2023 16:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330DAE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832334;
	bh=dbqe6oUSGVfYqp5mtGiuqvJApjaK+nBpEujCeUCnT4c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oKS9mhbR7i/4NO5kBCAC8cvoJcmbfemdnzdlKSOCVOWhawG/ZTcNBPpybBzaJI4Wv
	 Ue6uSU33ZM9iS474kl/lMwhXhTZPyDY2NRXbBN8O+MG+vxmrwiVs3k2oLRNC4dfVyk
	 NI3Qlrub9kXmvilNDNZhGG551oOUELhnpgk0qc80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D992FF80549;
	Fri, 27 Jan 2023 16:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91BF5F804C2; Fri, 27 Jan 2023 16:10:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAC4F80494
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAC4F80494
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SWLhWYt+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832221; x=1706368221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbqe6oUSGVfYqp5mtGiuqvJApjaK+nBpEujCeUCnT4c=;
 b=SWLhWYt+nLblzTa9ct1nycdU/9SZXQ8OAX+8ukFeHh5Uur0ZSWdCQjrt
 9vCr/OMowe6sV2UTwrOdJuUKXoXsnNk2PTmtyk8hegT3P1SD1CLzQ3fQf
 cJYpqudKEY3mDeordqZsDFakRLAoXOItEGq+4Yi6ePBzW1i/Iw+1Ggopn
 H4h8EVX3PAspX6tiiU1C8+RHeXuefj93+ClZD2DuSFXr859SpQvLwcOnw
 +taS7ASSMngz1iJ8h7DZGS1FI9Fmp8TAZvICtiUtiRkbOvRsi+CSKn63D
 j9Xi8/G1/dyEY4Xu799COUcbk7pmXlHmYzGx1bumSw6uzSnfDTQMl6R6T w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795810"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795810"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709004"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709004"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:17 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 04/11] ASoC: topology: Fix function name
Date: Sat, 28 Jan 2023 00:11:04 +0100
Message-Id: <20230127231111.937721-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Functions other than soc_valid_header have soc_tplg_ prefix. Rename
function to follow convention in file.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b9c29effeb60..1fe4fa82fa2f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2389,7 +2389,7 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 }
 
 /* validate header magic, size and type */
-static int soc_valid_header(struct soc_tplg *tplg,
+static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
 	if (soc_tplg_get_hdr_offset(tplg) >= tplg->fw->size)
@@ -2526,7 +2526,7 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 		while (!soc_tplg_is_eof(tplg)) {
 
 			/* make sure header is valid before loading */
-			ret = soc_valid_header(tplg, hdr);
+			ret = soc_tplg_valid_header(tplg, hdr);
 			if (ret < 0) {
 				dev_err(tplg->dev,
 					"ASoC: topology: invalid header: %d\n", ret);
-- 
2.25.1

