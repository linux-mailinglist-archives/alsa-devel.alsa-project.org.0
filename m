Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F100867E92C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:14:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E23E851;
	Fri, 27 Jan 2023 16:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E23E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832452;
	bh=qHFv32Sphq3shdPGA48KxW70YX1Wi01oojb+PZVT0JE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LQq7ckVEHRjB08DPRv+dDB/H3EAAsxhHSmc+20mybwpgI6vEFSmlENp0TNQ7rjLV7
	 k4DRf8qCj5XZI0FJlTtK46kjDp8C/9aXYMacGKo/QH2/Ll6dIWT/6edgufoqmVewa6
	 dCfN4Lj1Uhh2GSKzX10YY5/HoWP6+LKGkelDeFxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04147F805A0;
	Fri, 27 Jan 2023 16:10:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9F1CF8057B; Fri, 27 Jan 2023 16:10:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEBDF80567
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEBDF80567
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ElezYAdU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832230; x=1706368230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qHFv32Sphq3shdPGA48KxW70YX1Wi01oojb+PZVT0JE=;
 b=ElezYAdUEKySAbcD2nHEkAWD3WFSnPBm7tXmyqiIcaLs3F2NqaPHi+jP
 ORStIadsceia+0gVBWm37SCDJluxuonp60MRn0c62WDv0Rzp/K4zuZPHo
 ahEP3qXR3Us7DvmqlBL/orp4bVjhlFXTJUkWpy00wTy8GAqpLze1MPhrS
 aeBzxHEthvMOEexGX2Fkkvbljf8Z//PYJeJT7D1WxYPmpkuX4vxkfXam8
 4fXeSzZ1j+z95Non157niBXN6qdivTTdccXF15mIHjkhH+HigVCMX/y7W
 gmfOY4Erv58jQujr6pqhT9cRS+47GdL6mYiIC6Lio1Bwg2Gb3f5Ofltfs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795855"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795855"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709034"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709034"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:27 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/11] ASoC: Topology: Remove unnecessary check for EOF
Date: Sat, 28 Jan 2023 00:11:09 +0100
Message-Id: <20230127231111.937721-10-amadeuszx.slawinski@linux.intel.com>
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

Caller already checks if hdr_pos is behind EOF, before calling
soc_tplg_valid_header(), so there is no need to recheck it again. This
also allows to remove behaviour of return 0 - forcing the caller to
break out of while loop.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 08dd55f94584..6689cf44464c 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2389,9 +2389,6 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	if (soc_tplg_get_hdr_offset(tplg) >= tplg->fw->size)
-		return 0;
-
 	if (le32_to_cpu(hdr->size) != sizeof(*hdr)) {
 		dev_err(tplg->dev,
 			"ASoC: invalid header size for type %d at offset 0x%lx size 0x%zx.\n",
@@ -2442,7 +2439,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	return 1;
+	return 0;
 }
 
 /* check header type and call appropriate handler */
@@ -2528,8 +2525,6 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 				dev_err(tplg->dev,
 					"ASoC: topology: invalid header: %d\n", ret);
 				return ret;
-			} else if (ret == 0) {
-				break;
 			}
 
 			/* load the header object */
-- 
2.25.1

