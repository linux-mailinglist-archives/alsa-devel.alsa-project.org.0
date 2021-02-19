Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A563201AD
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:20:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DCB166F;
	Sat, 20 Feb 2021 00:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DCB166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776800;
	bh=2Tg9Ur5gLX6OEvub2FjbrVZWblWJXQa0yd4L0eBIKJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YWkwE9owtEetvkZTkYphsF5pUV8whcKjHV0v2nhE6YeoAncE1y/lYHtBWK2Nmire7
	 vKlxNFOI7TRyvCKn0Lx+JqupyFeBLuNEIqQgptxUlQSszHlqa1y+qQ9obwzU0Ytqad
	 h17Nbh5ultDXzcAaw4aJXY/J98Pw0lbgYpBGzmG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E2DF802E0;
	Sat, 20 Feb 2021 00:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3431F802E0; Sat, 20 Feb 2021 00:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF46F8026C
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF46F8026C
IronPort-SDR: pvcBK0vVps43KXn/W04+DeT0VBqig2vDiw+xjNxQPS0lKy7x3u2cpaXO4TMRTYym0clfV22sJx
 8x5UJB0tQUJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="181436679"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="181436679"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:49 -0800
IronPort-SDR: Sy6FnqPnnvbXqdEgeQ4pySWTxw1MemS+B+X3yoI7ikwleB6vt/RdBImOY54leyCPORNVoXUhVo
 69faFWJSU4pQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329796"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: sh: rcar: ssi: remove redundant assignment
Date: Fri, 19 Feb 2021 17:16:33 -0600
Message-Id: <20210219231635.5749-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
References: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

cppcheck warning:

sound/soc/sh/rcar/ssi.c:403:6: style: Redundant initialization for
'wsr'. The initialized value is overwritten before it is
read. [redundantInitialization]
 wsr = ssi->wsr;
     ^
sound/soc/sh/rcar/ssi.c:372:11: note: wsr is initialized
 u32 wsr  = ssi->wsr;
          ^
sound/soc/sh/rcar/ssi.c:403:6: note: wsr is overwritten
 wsr = ssi->wsr;
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/rcar/ssi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index d0ded427a836..659b25992ff2 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -400,7 +400,6 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * see
 	 *	rsnd_ssiu_init_gen2()
 	 */
-	wsr = ssi->wsr;
 	if (is_tdm || is_tdm_split) {
 		wsr	|= WS_MODE;
 		cr_own	|= CHNL_8;
-- 
2.25.1

