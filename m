Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A9D59C667
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F661630;
	Mon, 22 Aug 2022 20:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F661630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193140;
	bh=xXLp8vcpSHFXcg8Thw4aqS7oAXd1A4ff7T8kKAEapI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DG6640HmyxY7WQTxPiXFdNzoB5C1EdH0nL7LmrX+xBbcNPTdrB1W3d0CY3RMwsb1I
	 0/dCJ3NJEFAqcPqyQFbYcv/aSQqbyThM24q3FbgL0zJh8cuHU9S8oNI3Z3AYAozbeR
	 D4BNxrMwjJAV3guOVwxdGl0ySoTtGKYIJFyXqvWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F01F8026D;
	Mon, 22 Aug 2022 20:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0539AF8026A; Mon, 22 Aug 2022 20:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 470D3F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470D3F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BJqqyAHD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83085612E3;
 Mon, 22 Aug 2022 18:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378F9C433D6;
 Mon, 22 Aug 2022 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661193068;
 bh=xXLp8vcpSHFXcg8Thw4aqS7oAXd1A4ff7T8kKAEapI8=;
 h=From:To:Cc:Subject:Date:From;
 b=BJqqyAHDoivLbBiMTx6xaDsVTE0XnbDmqovaLOU1mOvJ22j85rhVQgGVWxN7+bozo
 b9izsqjngBTe+tmQYon6HJMNUsEOZDAbKq9HdQuJrcyJM9XjFKFwEMHnx4ftqrT9fn
 hnTp7UCjOyu68bd1yjnrXAab0XBDOjohSaGNC9N0DbXP5wue/CK21Bw/hu/Eww5neC
 scniUIrRbM6wIdtvmTHIDNApbUBu1lMxpFYKzGOi+CseTrV46rjCcbrxsP49tG7mpm
 wUBm/GCHACYjoerh1kXVKVtv0pkmmWe2kWp9O/Zwipx4PdM404UcGvH27nhci/CCBz
 YJKw1xxP7Nd4Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matt Flax <flatmax@flatmax.com>
Subject: [PATCH] ASoC: codes: src4xxx: Avoid clang -Wsometimes-uninitialized
 in src4xxx_hw_params()
Date: Mon, 22 Aug 2022 11:31:01 -0700
Message-Id: <20220822183101.1115095-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
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

Clang warns:

  sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                  default:
                  ^~~~~~~
  sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
                  ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
                                                                          ^
  sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
          int val, pj, jd, d;
                            ^
                            = 0
  sound/soc/codecs/src4xxx.c:280:3: error: variable 'jd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                  default:
                  ^~~~~~~
  sound/soc/codecs/src4xxx.c:293:59: note: uninitialized use occurs here
                  ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
                                                                          ^~
  sound/soc/codecs/src4xxx.c:223:17: note: initialize the variable 'jd' to silence this warning
          int val, pj, jd, d;
                        ^
                          = 0
  sound/soc/codecs/src4xxx.c:280:3: error: variable 'pj' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                  default:
                  ^~~~~~~
  sound/soc/codecs/src4xxx.c:288:59: note: uninitialized use occurs here
                  ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
                                                                          ^~
  sound/soc/codecs/src4xxx.c:223:13: note: initialize the variable 'pj' to silence this warning
          int val, pj, jd, d;
                    ^
                      = 0
  3 errors generated.

According to the comment in the default case, other parts of the chip
are still functional without these values so just return 0 in the
default case to avoid using these variables uninitialized.

Link: https://github.com/ClangBuiltLinux/linux/issues/1691
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/src4xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index a8f143057b41..cf45caa4bf7f 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -283,7 +283,7 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
 			 */
 			dev_info(component->dev,
 				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
-			break;
+			return 0;
 		}
 		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
 		if (ret < 0)

base-commit: 94f072748337424c9cf92cd018532a34db3a5516
-- 
2.37.2

