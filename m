Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5463201B0
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:20:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6841676;
	Sat, 20 Feb 2021 00:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6841676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776859;
	bh=RXzRrS8+MRiulGZC1krS40z/KWqRLP9gnBWiV4XRZB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyd0NtkeFxLaTrePM0ghreEYbxRXrdRlMgoJWQM+dLMWP2MO8OnU6CG8qZSMJAqiy
	 SB780lC6tkuLMh7AHRdt4U8Y87G6oT+I91ddsrEJc7DJ2QZU8c3KKvWumXdd4SHGJP
	 nt9dApazJxX1vXL1sb4607e76z4ouLgZ5uBqZUas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA6D1F80431;
	Sat, 20 Feb 2021 00:17:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0DC8F8025B; Sat, 20 Feb 2021 00:17:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D7DF8025B
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D7DF8025B
IronPort-SDR: d+XvrgE6+JA7k4lF4asyOaJSwcEThquLPZyuMbrMeAG1vhCZqM9UhlhHtaMav13XnHyivqYysv
 BjWoKpnVndzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203290903"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203290903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:46 -0800
IronPort-SDR: 3Vyh+b56L2wFYOqJ7+IpBlJ+c/MPgmrxYkRJS/nEl80YIm3lxh2dQ89V/MIPmkqEYnGjDpu96D
 lh73KywpMEBA==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329783"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: sh: rcar: align function prototypes
Date: Fri, 19 Feb 2021 17:16:29 -0600
Message-Id: <20210219231635.5749-3-pierre-louis.bossart@linux.intel.com>
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

cppcheck warnings:

sound/soc/sh/rcar/adg.c:208:51: style:inconclusive: Function
'rsnd_adg_set_cmd_timsel_gen2' argument 1 names different: declaration
'mod' definition 'cmd_mod'. [funcArgNamesDifferent]
int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
                                                  ^
sound/soc/sh/rcar/rsnd.h:608:51: note: Function
'rsnd_adg_set_cmd_timsel_gen2' argument 1 names different: declaration
'mod' definition 'cmd_mod'.
int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *mod,
                                                  ^
sound/soc/sh/rcar/adg.c:208:51: note: Function
'rsnd_adg_set_cmd_timsel_gen2' argument 1 names different: declaration
'mod' definition 'cmd_mod'.
int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
                                                  ^
sound/soc/sh/rcar/adg.c:322:44: style:inconclusive: Function
'rsnd_adg_ssi_clk_stop' argument 1 names different: declaration 'mod'
definition 'ssi_mod'. [funcArgNamesDifferent]
int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
                                           ^
sound/soc/sh/rcar/rsnd.h:600:44: note: Function
'rsnd_adg_ssi_clk_stop' argument 1 names different: declaration 'mod'
definition 'ssi_mod'.
int rsnd_adg_ssi_clk_stop(struct rsnd_mod *mod);
                                           ^
sound/soc/sh/rcar/adg.c:322:44: note: Function 'rsnd_adg_ssi_clk_stop'
argument 1 names different: declaration 'mod' definition 'ssi_mod'.
int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
                                           ^
sound/soc/sh/rcar/adg.c:329:49: style:inconclusive: Function
'rsnd_adg_ssi_clk_try_start' argument 1 names different: declaration
'mod' definition 'ssi_mod'. [funcArgNamesDifferent]
int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
                                                ^
sound/soc/sh/rcar/rsnd.h:601:49: note: Function
'rsnd_adg_ssi_clk_try_start' argument 1 names different: declaration
'mod' definition 'ssi_mod'.
int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *mod, unsigned int rate);
                                                ^
sound/soc/sh/rcar/adg.c:329:49: note: Function
'rsnd_adg_ssi_clk_try_start' argument 1 names different: declaration
'mod' definition 'ssi_mod'.
int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
                                                ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/rcar/rsnd.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 6b519370fd64..1255a85151db 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -597,15 +597,15 @@ phys_addr_t rsnd_gen_get_phy_addr(struct rsnd_priv *priv, int reg_id);
  *	R-Car ADG
  */
 int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate);
-int rsnd_adg_ssi_clk_stop(struct rsnd_mod *mod);
-int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *mod, unsigned int rate);
+int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod);
+int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate);
 int rsnd_adg_probe(struct rsnd_priv *priv);
 void rsnd_adg_remove(struct rsnd_priv *priv);
 int rsnd_adg_set_src_timesel_gen2(struct rsnd_mod *src_mod,
 				  struct rsnd_dai_stream *io,
 				  unsigned int in_rate,
 				  unsigned int out_rate);
-int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *mod,
+int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
 				 struct rsnd_dai_stream *io);
 #define rsnd_adg_clk_enable(priv)	rsnd_adg_clk_control(priv, 1)
 #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
-- 
2.25.1

