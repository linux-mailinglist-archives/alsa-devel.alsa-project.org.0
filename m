Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFD336924
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85861706;
	Thu, 11 Mar 2021 01:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85861706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423674;
	bh=4iHZ0g4BQR60Vz1px16i3S4WyC4g7ooCRiDithEBl8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isutUxbWx/vZcb/v8yt999vAkybQhqVoidxW56Z6cJhDxGiLUkssKkSf0AAb+DY1B
	 QKP6KEtnhLQK1jK10B028m4udQTWYVxTi/q0aGnfx2fKKdUbSHrEH9PdsuexZMYbAa
	 01IW/1/OIUFn8B07G/15UpPy1jQVVVe8c/gj7ceQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 680B0F804B0;
	Thu, 11 Mar 2021 01:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1077DF80475; Thu, 11 Mar 2021 01:44:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC73F8012F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC73F8012F
IronPort-SDR: 65MnacLqudZM0gTtMLPIH5SI8EyKqUXx7nfcww5ME6AX6WWd50eYlF7nRQuDW5upiH9tsNCVB2
 zNeNbEwWdIPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185741"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185741"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:44 -0800
IronPort-SDR: zmGvFnV07kObsN94AXN3O3kyNha4lBXpozEE4AdLPOIxkmvYVG0slTqDoFJVHIWr3wr+RPjxDh
 SS7dKESKj1rw==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385620"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/10] ASoC: wm8903: remove useless assignments
Date: Wed, 10 Mar 2021 18:43:26 -0600
Message-Id: <20210311004332.120901-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, patches@opensource.cirrus.com, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/wm8903.c:1552:11: style: Variable 'best_val' is
assigned a value that is never used. [unreadVariable]
 best_val = ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
          ^
sound/soc/codecs/wm8903.c:1559:12: style: Variable 'best_val' is
assigned a value that is never used. [unreadVariable]
  best_val = cur_val;
           ^

Indeed what matters in the code is the blck_div, the best_val is
assigned but never tested or used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8903.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 026603ae44ce..75f30154c809 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1549,14 +1549,12 @@ static int wm8903_hw_params(struct snd_pcm_substream *substream,
 	 * BCLKs to clock out the samples).
 	 */
 	bclk_div = 0;
-	best_val = ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
 	i = 1;
 	while (i < ARRAY_SIZE(bclk_divs)) {
 		cur_val = ((clk_sys * 10) / bclk_divs[i].ratio) - bclk;
 		if (cur_val < 0) /* BCLK table is sorted */
 			break;
 		bclk_div = i;
-		best_val = cur_val;
 		i++;
 	}
 
-- 
2.25.1

