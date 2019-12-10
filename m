Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E4119878
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD7A166B;
	Tue, 10 Dec 2019 22:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD7A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576014001;
	bh=eAv3Ug7fR0tMRbzeUeJE4m1AMGpt4bB+e//PaBo2mRk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usJSV8BaVUeJ8jvR9MpJCp4+6bxKG87oAXFxD4avfSsPJth/x4CN/7Na3KALkvZko
	 XEJPlw3VsZnYjq65M8Rbqnuj3+IDtz/rdML5J8OUl8Px7ASAQVkcsNpXod2s4aldOg
	 Dm0GkCYRw8O5t2F4hrgqoFCJNBhTLS+LEuzVlyGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF3DF8028A;
	Tue, 10 Dec 2019 22:35:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A82F8027C; Tue, 10 Dec 2019 22:35:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F882F80279
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F882F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YnvQNwCT"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 107A32467C;
 Tue, 10 Dec 2019 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013725;
 bh=i3d+Mr7rCrKOrMGOgnBR7oNXe8BKKYWyKMgjuthYFnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnvQNwCToURXhFUJUnUdVgER5FqGyv+Z5ExRWrCXNwPGcq8ctG051nVqBg1XGxA3f
 0sL8tb0pRtiHl0LVFGS8Wvk8eOWTF1glmmXYo0+DSgAiVpKQDGEeTijp9WF69h7bT2
 +Ys7N91r4yebSyK7Kn3TFczynT8MMygyKfWnZEMQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:31:55 -0500
Message-Id: <20191210213221.11921-151-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 151/177] ASoC: wm8904: fix
	regcache handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Michael Walle <michael@walle.cc>

[ Upstream commit e9149b8c00d25dbaef1aa174fc604bed207e576d ]

The current code assumes that the power is turned off in
SND_SOC_BIAS_OFF. If there are no actual regulator the codec isn't
turned off and the registers are not reset to their default values but
the regcache is still marked as dirty. Thus a value might not be written
to the hardware if it is set to the default value. Do a software reset
before turning off the power to make sure the registers are always reset
to their default states.

Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191112223629.21867-1-michael@walle.cc
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8904.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 1965635ec07c7..d14e851b91605 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1902,6 +1902,7 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, WM8904_BIAS_CONTROL_0,
 				    WM8904_BIAS_ENA, 0);
 
+		snd_soc_component_write(component, WM8904_SW_RESET_AND_ID, 0);
 		regcache_cache_only(wm8904->regmap, true);
 		regcache_mark_dirty(wm8904->regmap);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
