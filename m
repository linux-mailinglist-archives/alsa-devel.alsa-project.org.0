Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48D240704
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 15:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AEE1607;
	Mon, 10 Aug 2020 15:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AEE1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597067707;
	bh=PC98xNmhmsI9wyv05GetDCtA+H0GjWnJwH7i6+gkPQs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jBCPcVJpjkWAon5DZPhL7+NjVm321NrR4VkzJYUZKicWGi+o9roX3Mul+alBVxNnj
	 Z2Byv2uwBQBKqkyH5kNxU25QlVxAeDijkqRp6pRwcVNKobAkGxKzys3Qk255AQMRk5
	 WEeNztWzfUGkKdvp1wBVUf3OhVojizR7aFwc9PDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB12AF80085;
	Mon, 10 Aug 2020 15:53:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A557F8022B; Mon, 10 Aug 2020 15:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857D2F80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 15:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857D2F80085
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB700AC2F;
 Mon, 10 Aug 2020 13:53:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Make soc_component_read() returning an error code again
Date: Mon, 10 Aug 2020 15:46:31 +0200
Message-Id: <20200810134631.19742-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org, John Stultz <john.stultz@linaro.org>,
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

Along with the recent unification of snd_soc_component_read*()
functions, the behavior of snd_soc_component_read() was changed
slightly; namely it returns the register read value directly, and even
if an error happens, it returns zero (but it prints an error
message).  That said, the caller side can't know whether it's an error
or not any longer.

Ideally this shouldn't matter much, but in practice this seems causing
a regression, as John reported.  And, grepping the tree revealed that
there are still plenty of callers that do check the error code, so
we'll need to deal with them in anyway.

As a quick band-aid over the regression, this patch changes the return
value of snd_soc_component_read() again to the negative error code.
It can't work, obviously, for 32bit register values, but it should be
enough for the known regressions, so far.

Fixes: cf6e26c71bfd ("ASoC: soc-component: merge snd_soc_component_read() and snd_soc_component_read32()")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f0b4f4bc44a4..5504b92946e3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -406,7 +406,7 @@ static unsigned int soc_component_read_no_lock(
 		ret = -EIO;
 
 	if (ret < 0)
-		soc_component_ret(component, ret);
+		return soc_component_ret(component, ret);
 
 	return val;
 }
-- 
2.16.4

