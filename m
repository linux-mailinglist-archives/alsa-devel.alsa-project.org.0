Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301121FDE2D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68DB16CC;
	Thu, 18 Jun 2020 03:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68DB16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443882;
	bh=U/qoEAVeB8iCO5EXhVzLLWw4mzWwgbNVgm8+Xu0dWoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=io3lp49nhHMOWWM/7YAg7YTKAZm7S9P1glgWOZ747zN7xtk5jbR+D2LUPdL7cph8L
	 ErzE33TQ79znNxYtXTNVb4BKXCy8QCmNB2ChVHsOjVR27n9TCkGwTU5a9yKoTPvvDG
	 Q+2+UGiq78J2uCscJCIZ62vP8TY6s/Wl/1NXP3/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A01B9F803D7;
	Thu, 18 Jun 2020 03:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1865F803CA; Thu, 18 Jun 2020 03:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACC92F802BE;
 Thu, 18 Jun 2020 03:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACC92F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C3GxPQlz"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19E6921D7D;
 Thu, 18 Jun 2020 01:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442957;
 bh=U/qoEAVeB8iCO5EXhVzLLWw4mzWwgbNVgm8+Xu0dWoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C3GxPQlz0z7EWYH26lFPyVix+CeVrad+TPl+6MEyzLWJASTdAm/BxJUC8+4IWph0k
 fGEMiifuyH5w/J5mysK8m61MO+H/OhdUMLlOZ6Uf2kNwnkzLjKZrFyKmKfzrCNhLut
 AW6dGEPHNqIEH+uFWpGBC8FVMwXlo7J5/tOdPMys=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 364/388] ASoC: SOF: nocodec: conditionally set
 dpcm_capture/dpcm_playback flags
Date: Wed, 17 Jun 2020 21:07:41 -0400
Message-Id: <20200618010805.600873-364-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit ba4e5abc6c4e173af7c941c03c067263b686665d ]

With additional checks on dailinks, we see errors such as

[ 3.000418] sof-nocodec sof-nocodec: CPU DAI DMIC01 Pin for rtd
NoCodec-6 does not support playback

It's not clear why we set the dpcm_playback and dpcm_capture flags
unconditionally, add a check on number of channels for each direction
to avoid invalid configurations.

Fixes: 8017b8fd37bf5e ('ASoC: SOF: Add Nocodec machine driver support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200608194415.4663-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/nocodec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 2233146386cc..71cf5f9db79d 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -52,8 +52,10 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].platforms->name = dev_name(dev);
 		links[i].codecs->dai_name = "snd-soc-dummy-dai";
 		links[i].codecs->name = "snd-soc-dummy";
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
+		if (ops->drv[i].playback.channels_min)
+			links[i].dpcm_playback = 1;
+		if (ops->drv[i].capture.channels_min)
+			links[i].dpcm_capture = 1;
 	}
 
 	card->dai_link = links;
-- 
2.25.1

