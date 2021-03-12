Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3F33964F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE091765;
	Fri, 12 Mar 2021 19:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE091765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573500;
	bh=NUZToC7EFgmiwydPC6jElTJGKhsggE8JC9puj9rIiBk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TA19DZ1FkgTKe+lhKAe6QVO1psCndj9vXzqzKDnjnVcOQahAS0Tou9Zieh/05DRpB
	 eKRyCNkq314U1CaaCju85CNZQGNmgxo4i2fT3L73hFtEHPIxT0Ci9ETe2keXHg34Bw
	 zIU2v289L9aGR8SuIL9h5gYubwuPOBvID3dhyDsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A27F80423;
	Fri, 12 Mar 2021 19:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6328BF8032B; Fri, 12 Mar 2021 19:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EA27F8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA27F8016C
IronPort-SDR: Jebcn/TuIP/w7MTx3CeUvHCKRi6eVxN7T6dnQA0sZDY/ZfWT9Z6Ok40WKrzKTs0hGMMuXeMzfr
 80HxSI9O/bxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515160"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515160"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:08 -0800
IronPort-SDR: 3n6+mEsWk5rHd66thCMs3LXA9CGR8WYgCJUwGmEYQNLlEpgNY5fpFyNe4BZLJk61DuvqOubFrR
 RIxbULFANBuw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791897"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/23] ASoC: ab8500-codec: remove useless structure
Date: Fri, 12 Mar 2021 12:22:24 -0600
Message-Id: <20210312182246.5153-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

Cppcheck warnings:

sound/soc/codecs/ab8500-codec.c:117:20: style: struct member 'ab8500_codec_drvdata_dbg::vaud' is never used. [unusedStructMember]
 struct regulator *vaud;
                   ^
sound/soc/codecs/ab8500-codec.c:118:20: style: struct member 'ab8500_codec_drvdata_dbg::vamic1' is never used. [unusedStructMember]
 struct regulator *vamic1;
                   ^
sound/soc/codecs/ab8500-codec.c:119:20: style: struct member 'ab8500_codec_drvdata_dbg::vamic2' is never used. [unusedStructMember]
 struct regulator *vamic2;
                   ^
sound/soc/codecs/ab8500-codec.c:120:20: style: struct member 'ab8500_codec_drvdata_dbg::vdmic' is never used. [unusedStructMember]
 struct regulator *vdmic;
                   ^

The structure is never used, remove.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/ab8500-codec.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index c95f007cede1..5525e1ccab76 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -113,13 +113,6 @@ enum amic_idx {
 	AMIC_IDX_2
 };
 
-struct ab8500_codec_drvdata_dbg {
-	struct regulator *vaud;
-	struct regulator *vamic1;
-	struct regulator *vamic2;
-	struct regulator *vdmic;
-};
-
 /* Private data for AB8500 device-driver */
 struct ab8500_codec_drvdata {
 	struct regmap *regmap;
-- 
2.25.1

