Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFC5803C5
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 20:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B589620B;
	Mon, 25 Jul 2022 20:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B589620B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658772419;
	bh=chxglXlJohwTOIfvgsfFMrSIax1zhLv/KC55sAhxMXA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ARUgMqxKH0DTJA+nTffDA+MhcN/A2YW9PxsmM6RXk3By+mwPP2+5kGmiAGATSwnPT
	 eXIqVez16oOTy0sEnOHjZQFue9ip/7oyc6IZ20JpBLEjgmJYvAgY+zXajZc1gEbsW1
	 f3YLL8EilGJVRpWeEtda+3ZAHnI87njj41LyImN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2815DF80088;
	Mon, 25 Jul 2022 20:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5383F80163; Mon, 25 Jul 2022 20:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D32F80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 20:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D32F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C5s6FQ8C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79D006139D;
 Mon, 25 Jul 2022 18:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F75C341C6;
 Mon, 25 Jul 2022 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658772350;
 bh=chxglXlJohwTOIfvgsfFMrSIax1zhLv/KC55sAhxMXA=;
 h=From:To:Cc:Subject:Date:From;
 b=C5s6FQ8C4iYZRCP0LMl3jvHfIIeZZdY2pkWd+OrxG+FaP8flwjQ6v01AL2HamQ8rT
 t6eye+BEUVoIbZCCaTPAGUZSJDDc9tKWSUMlnK2vxyxAbzqdAQz0Xa5f7GmFY0IdsT
 6uiulK9Py6cUUUFG0ZduHDM0xmEGx/ZyoOmTxMRYAuJ8+qXZRE5otcszlrHM1Ey9z9
 5neezKFGhtfB/MAeALo8AGr9ruPmso12KjkRUGKJ0SggzLM5DhfbXCrI/K4Ha7Zzvz
 NHcosVXzRptcaXpGr8HwRtvfR3atwG8n64G0H4/Q+NdJlPwdDBml83Lqj1WyD7x9dm
 tHVGk0dInTsfA==
From: Nathan Chancellor <nathan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: acp: Fix initialization of ext_intr_stat1 in
 i2s_irq_handler()
Date: Mon, 25 Jul 2022 11:05:39 -0700
Message-Id: <20220725180539.1315066-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

  ../sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat1' is uninitialized when used here [-Werror,-Wuninitialized]
                          if (stream && (ext_intr_stat1 & stream->irq_bit)) {
                                         ^~~~~~~~~~~~~~
  ../sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable 'ext_intr_stat1' to silence this warning
          u32 ext_intr_stat, ext_intr_stat1, i;
                                           ^
                                            = 0
  1 error generated.

The variable was not properly renamed, correct it to resolve the
warning.

Fixes: 93f53881473c ("ASoC: amd: acp: Modify local variables name to generic")
Link: https://github.com/ClangBuiltLinux/linux/issues/1675
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/amd/acp/acp-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 10730d33c3b0..f561d39b33e2 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -100,7 +100,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 
 	if (adata->rsrc->no_of_ctrls == 2)
-		ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
+		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
 
 	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 

base-commit: be0aa8d4b0fcb4532bf7973141e911998ab39508
-- 
2.37.1

