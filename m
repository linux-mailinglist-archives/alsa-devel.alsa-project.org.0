Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E222A147
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 00:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D83172E;
	Sat, 25 May 2019 00:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D83172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558736892;
	bh=WlpP8wSG8KbZLPTU0i/ZPyy13PKkdGXyRR4Zy2fKko8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p8jdXmzKZut4xctn63ZzybREcDf7EUzup+VQLUdSLULznPRN3U9ODm7qdudjcnaM7
	 16ZcLl838x43JhIF7279Dk8a7jmqEKwIfElQVrN0pJ9s9yP098pIWCW+8krom/8uSr
	 9+ni52yjU6CMCH/G2kroxsZv4d7mZnUoq58K+oek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D070F89625;
	Sat, 25 May 2019 00:26:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBAC2F8962F; Sat, 25 May 2019 00:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CABEF80C0F
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 00:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CABEF80C0F
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hUIdN-00042D-5d; Fri, 24 May 2019 22:25:53 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Simon Ho <simon.ho@conexant.com>, alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 23:25:51 +0100
Message-Id: <20190524222551.26573-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH][next] ASoC: cx2072x: fix integer overflow on
	unsigned int multiply
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

From: Colin Ian King <colin.king@canonical.com>

In the case where frac_div larger than 96 the result of an unsigned
multiplication overflows an unsigned int.  For example, this can
happen when the sample_rate is 192000 and pll_input is 122.  Fix
this by casing the first term of the mutiply to a u64. Also remove
the extraneous parentheses around the expression.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/cx2072x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index c11a585bbf70..e8e6fd2e97b6 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -627,7 +627,7 @@ static int cx2072x_config_pll(struct cx2072x_priv *cx2072x)
 	if (frac_div) {
 		frac_div *= 1000;
 		frac_div /= pll_input;
-		frac_num = ((4000 + frac_div) * ((1 << 20) - 4));
+		frac_num = (u64)(4000 + frac_div) * ((1 << 20) - 4);
 		do_div(frac_num, 7);
 		frac = ((u32)frac_num + 499) / 1000;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
