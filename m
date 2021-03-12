Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EB339689
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7722181D;
	Fri, 12 Mar 2021 19:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7722181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573867;
	bh=DUAmvqKbYxa3r+gsHIHnOeM9wmP8D9/NEsaVPu8e19A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmbiEM8bOzMvwEgpxo0fxS0Xva0uAyZV6stQGQpbI9oCfglOiqS1Upq3Y7MwN3EZX
	 YbYhZ2e6RcAZ5InNVCG7eUS/XWU9TXs9CqFyEcRVIpqnkRFa1ZItfBD9OHAOoRRDio
	 6Ikw1l1yGtMuWx9R8+twrCcF+RqX+QxFL4rKx9uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FBC2F80529;
	Fri, 12 Mar 2021 19:24:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BDC4F80528; Fri, 12 Mar 2021 19:23:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BE6F804E5
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BE6F804E5
IronPort-SDR: 9aNVMHBBIq4I8wan1pc+IPGnM04fmRq2dQkp4bnoqr2BMfGhhDQMYl0gs/AKkSRmSVt1fGgtDk
 a0aNXQU4ivpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236489"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236489"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:48 -0800
IronPort-SDR: jVhDZNM4RYTZdGGQjrKfNLLoVRCL8lSQOE2XbcEPGMv6TgIV53VG1rZd6d3Fnj9tqITuLrOVIf
 a+CZvjMRNRyw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792054"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/23] ASoC: sti-sas: remove unused struct members
Date: Fri, 12 Mar 2021 12:22:41 -0600
Message-Id: <20210312182246.5153-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
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

cppcheck warnings:

sound/soc/codecs/sti-sas.c:54:25: style: struct member
'sti_dac_audio::field' is never used. [unusedStructMember]
 struct regmap_field  **field;
                        ^

sound/soc/codecs/sti-sas.c:55:24: style: struct member
'sti_dac_audio::rst' is never used. [unusedStructMember]
 struct reset_control *rst;
                       ^

sound/soc/codecs/sti-sas.c:61:25: style: struct member
'sti_spdif_audio::field' is never used. [unusedStructMember]
 struct regmap_field  **field;
                        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/sti-sas.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index ec9933b054ad..ffdf7e559515 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -51,14 +51,11 @@ static const struct reg_default stih407_sas_reg_defaults[] = {
 struct sti_dac_audio {
 	struct regmap *regmap;
 	struct regmap *virt_regmap;
-	struct regmap_field  **field;
-	struct reset_control *rst;
 	int mclk;
 };
 
 struct sti_spdif_audio {
 	struct regmap *regmap;
-	struct regmap_field  **field;
 	int mclk;
 };
 
-- 
2.25.1

