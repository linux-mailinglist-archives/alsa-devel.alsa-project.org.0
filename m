Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2D3201AB
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:19:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 617A71686;
	Sat, 20 Feb 2021 00:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 617A71686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776756;
	bh=ntDfTUQZUIdq6zCOvNTjYmNckwec2q8Ks+qR04x3SK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FINiaFT5/TAx/WuNck8Aj50IsabxENP8O8nPg7MAVEGszWBAjSsUzL/aOaA+FHVBv
	 P6b6zqHxGzqV59eNnZQW6uVGcrnP3j3apzvmaR6FgNdabKU6MI3HwU0xCwgfZQuOOR
	 HKgtzY7WouoiBLmHd66qXPqs6HiqrXmEtp53cwAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46DA9F802C9;
	Sat, 20 Feb 2021 00:17:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39114F802A9; Sat, 20 Feb 2021 00:16:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1743F800D0
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1743F800D0
IronPort-SDR: whaYPx+d4i0BFUw5WsceZQOIZcMmlQsasNaWKJz/2nknjrJDjq4nvjhy5BDWOKNSf0b53qL0sB
 N6V8ODbDj4hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="245426538"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="245426538"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:48 -0800
IronPort-SDR: HHfAxCGfiJr6izk7gAHyu5M5QYwuBPbCjAGhzrhmE0lbMsAkGiTU0fNQkjhlQXVHT1Wz9Xcsfp
 42MV0KsPutUw==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329795"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: sh: rcar: ctu: add  missing error check
Date: Fri, 19 Feb 2021 17:16:32 -0600
Message-Id: <20210219231635.5749-6-pierre-louis.bossart@linux.intel.com>
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

sound/soc/sh/rcar/ctu.c:212:6: style: Variable 'ret' is reassigned a
value before the old one has been used. [redundantAssignment]
 ret = rsnd_kctrl_new_m(mod, io, rtd, "CTU SV0",
     ^
sound/soc/sh/rcar/ctu.c:205:6: note: ret is assigned
 ret = rsnd_kctrl_new_m(mod, io, rtd, "CTU Pass",
     ^
sound/soc/sh/rcar/ctu.c:212:6: note: ret is overwritten
 ret = rsnd_kctrl_new_m(mod, io, rtd, "CTU SV0",
     ^

All the kcontrol creations are checked for errors, except for one. Add
the missing error check.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/rcar/ctu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/sh/rcar/ctu.c
index 7647b3d4c0ba..20eecd088d13 100644
--- a/sound/soc/sh/rcar/ctu.c
+++ b/sound/soc/sh/rcar/ctu.c
@@ -207,6 +207,8 @@ static int rsnd_ctu_pcm_new(struct rsnd_mod *mod,
 			       NULL,
 			       &ctu->pass, RSND_MAX_CHANNELS,
 			       0xC);
+	if (ret < 0)
+		return ret;
 
 	/* ROW0 */
 	ret = rsnd_kctrl_new_m(mod, io, rtd, "CTU SV0",
-- 
2.25.1

