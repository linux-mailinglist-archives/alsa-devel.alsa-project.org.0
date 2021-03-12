Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C6339665
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DE61783;
	Fri, 12 Mar 2021 19:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DE61783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573629;
	bh=0gqmIVbn0kxHkrOTuuNJKPDrVhxiVSuQPQs9T4Rcles=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jieGXk1q81TmfrL5ca7kXPp+sOAXPcJ/t27Zy/tUhX3Ve0C8cUAe+8irmdqrPJJs2
	 KipGJ4Gm9MbMym8LHF5EcTndGT82wpRp29jDEOPEX7rjfWVoANI4jU1go3BRNYGEGe
	 LM4pYi0DalNahgOTrHTzerfvjBgpEcktgqJmAXGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 685C0F804C1;
	Fri, 12 Mar 2021 19:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0B3F802E0; Fri, 12 Mar 2021 19:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34072F80279
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34072F80279
IronPort-SDR: AtTzVAcyPiulU5IbpHImG7fcefrMjcJC9z4EcW/RnRhMYUwM8mBpNzCmHYvPxDTVUyDa88KDU7
 D4BbZOm+CbjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515172"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:13 -0800
IronPort-SDR: QqSJl6GqR83C0e1V9F0rNWXneiMt4IABHFnIUl5YH3DYsIw/OIfDhsvJtSC6hWb0VEFFffamOJ
 OdqkXBbqKPpA==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791918"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/23] ASoC: cx2070x: remove useless assignment
Date: Fri, 12 Mar 2021 12:22:28 -0600
Message-Id: <20210312182246.5153-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Cppcheck warning:

sound/soc/codecs/cx2072x.c:830:26: style: Variable
'reg1.r.rx_data_one_line' is reassigned a value before the old one has
been used. [redundantAssignment]

 reg1.r.rx_data_one_line = 1;
                         ^

sound/soc/codecs/cx2072x.c:782:26: note: reg1.r.rx_data_one_line is
assigned
 reg1.r.rx_data_one_line = 1;
                         ^

sound/soc/codecs/cx2072x.c:830:26: note: reg1.r.rx_data_one_line is
overwritten
 reg1.r.rx_data_one_line = 1;
                         ^

sound/soc/codecs/cx2072x.c:831:26: style: Variable
'reg1.r.tx_data_one_line' is reassigned a value before the old one has
been used. [redundantAssignment]
 reg1.r.tx_data_one_line = 1;
                         ^
sound/soc/codecs/cx2072x.c:783:26: note: reg1.r.tx_data_one_line is
assigned
 reg1.r.tx_data_one_line = 1;
                         ^

sound/soc/codecs/cx2072x.c:831:26: note: reg1.r.tx_data_one_line is
overwritten
 reg1.r.tx_data_one_line = 1;
                         ^

Likely copy/paste.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cx2072x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 8ab22815c2c9..d2d004654c9b 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -827,9 +827,6 @@ static int cx2072x_config_i2spcm(struct cx2072x_priv *cx2072x)
 	}
 	regdbt2.r.i2s_bclk_invert = is_bclk_inv;
 
-	reg1.r.rx_data_one_line = 1;
-	reg1.r.tx_data_one_line = 1;
-
 	/* Configures the BCLK output */
 	bclk_rate = cx2072x->sample_rate * frame_len;
 	reg5.r.i2s_pcm_clk_div_chan_en = 0;
-- 
2.25.1

