Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE77568771
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE631703;
	Wed,  6 Jul 2022 13:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE631703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108580;
	bh=bQ+aAZlbc5HXs25ux9Ak17W/MeBwcyWe5vefkvQKEpk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfKrAid56fFaS9sOQj7tL48DOcpY1XGpU5kw/tFpiVdg0rYTDMz9hGMdL5oZdlAPg
	 0hw3Glpag/8aMQ/hfz9btLjp4hox3Wyv4t62daCSuybTwex4w1S7PT8J++mZv7SC28
	 sRAW7LWQuerDTYqNtzaq4+vl+uUJm26JvQjUNC4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E343F80579;
	Wed,  6 Jul 2022 13:52:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4B69F80553; Wed,  6 Jul 2022 13:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A487F80551
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A487F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kbxgKL3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108373; x=1688644373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bQ+aAZlbc5HXs25ux9Ak17W/MeBwcyWe5vefkvQKEpk=;
 b=kbxgKL3nKrHBjPzq8gloKJdHz48SMRlshv6hOPdx3Cww20z0rvqUFR9o
 CwSq6yQVuHo8Q1BPmSUEzHRiuZook4PzgRWb0uTEPH/qa19Dx1y9oTUwX
 dCE5s3DHO2Ym5P1+ME2kOr5G+WJILjbfH70bShk5U+cFIP5m1aHoHUb7W
 s0selGfjQZCqf3WXUl90FRqvjGBI82PgzwrcuHhwd3g86iCp8nOEmbEqk
 YXUSezqTldMTD4tKqSz5BX8goL/3xxnbmQRmlvBRYsQ2C9W8IsXi8wrGt
 BHS4/czX2Nhol6vM5bOxUc2bhdxg26O/A7nSYg/erIFWGxtYUOZpoPILw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042666"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136326"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 9/9] ALSA: hda/realtek: Remove redundant init_hook() in
 alc_default_init()
Date: Wed,  6 Jul 2022 14:02:30 +0200
Message-Id: <20220706120230.427296-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

snd_hda_gen_init() does that for every codec already.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/patch_realtek.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f3ad454b3fbf..a8688025352d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -923,9 +923,6 @@ static int alc_init(struct hda_codec *codec)
 	if (is_s4_resume(codec))
 		alc_pre_init(codec);
 
-	if (spec->init_hook)
-		spec->init_hook(codec);
-
 	spec->gen.skip_verbs = 1; /* applied in below */
 	snd_hda_gen_init(codec);
 	alc_fix_pll(codec);
-- 
2.25.1

