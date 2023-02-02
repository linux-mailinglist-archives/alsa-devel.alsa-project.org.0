Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BFF68848B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 17:36:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0BCA823;
	Thu,  2 Feb 2023 17:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0BCA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675355758;
	bh=4bpf1y8Gwhp/w9VhMFKg+NgCFgYS/3a8aHv9zIxyUdk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EKjDebdN+PY0EJxl/bh904C/lAtlJQO47A+3UXC80YTMT0qHYAanH4j5/vS5wiUXk
	 kTcSFrNU1w5LnL45H/xl2qV2jdOqQ4Kbszb5rk62uitO7XLs8ZFfRaURYcHOHK7pEW
	 6RwOr1o9Xl3l2HueCKmy7NM333DIlIvkIXDaGS5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAF7F800E3;
	Thu,  2 Feb 2023 17:34:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9DE3F804C2; Thu,  2 Feb 2023 17:34:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DE9F800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 17:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DE9F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a8pb53m9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04DA4B825EE;
 Thu,  2 Feb 2023 16:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B514C433EF;
 Thu,  2 Feb 2023 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675355686;
 bh=4bpf1y8Gwhp/w9VhMFKg+NgCFgYS/3a8aHv9zIxyUdk=;
 h=From:Date:Subject:To:Cc:From;
 b=a8pb53m9EEH4lcl2zbe6hBoYTQA9c27xtXYEhoFxg7e1lH9MiJtbOLBBouPeoSmpR
 ckznj66rT1B25SnUxOIJ59UHhwUVxFMeztZKuiLAKXa6B+ysdKqMRYieMbIFugkz4U
 7vlG7AWufG9p7674WsHIeLdHoY0zaxVwaZV52eDvBF5KGBpRRB3VbvHaOWkMn+h6aV
 oMwuVWQDWmrj1zIg3TLLHPw9TTCkDURUKIpJTXPeLq89M7bRsJ0o7c4EgLzAs01gy7
 /du4bZuLQik1rn5xiL1k5h38sE25t0QJCSUHrifAvdyaceXrc4/fVEcs8ZOAodWZiC
 KgvAYCXtZlw1w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 02 Feb 2023 09:34:19 -0700
Subject: [PATCH] ASoC: mchp-spdifrx: Fix uninitialized use of mr in
 mchp_spdifrx_hw_params()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-mchp-spdifrx-fix-uninit-mr-v1-1-629a045d7a2f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAvm22MC/x2NTQqDMBCFryKz7kCaWrC9Sukixkkzi6RhRosg3
 t2xmwcf728DJWFSeHYbCP1Y+VsNrpcOYg71Q8iTMXjnb84ES8wNtU2cZMXEKy6VK89YBAd390O
 yUB8fYANjUMJRQo35nChBZ5LTaELW/L++3vt+AIUW/mGFAAAA
To: codrin.ciubotariu@microchip.com, lgirdwood@gmail.com, 
 broonie@kernel.org, claudiu.beznea@microchip.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4bpf1y8Gwhp/w9VhMFKg+NgCFgYS/3a8aHv9zIxyUdk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMm3n6kqqfjOfldQz9a39+jF+4pXzLtd8lxfTajM1DKdK
 XsyJCK9o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkhY/hf5Tv1MuePe38l53T
 LZ/HbLx4MZdlqlwuY63NGm/RJcltaxkZJqszrOzi0PiSx9EjLJDllJbocFoo9mmq/Bf/cLWtZxr
 ZAQ==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org, trix@redhat.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, nicolas.ferre@microchip.com,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clang warns:

  ../sound/soc/atmel/mchp-spdifrx.c:455:3: error: variable 'mr' is uninitialized when used here [-Werror,-Wuninitialized]
                  mr |= SPDIFRX_MR_ENDIAN_BIG;
                  ^~
  ../sound/soc/atmel/mchp-spdifrx.c:432:8: note: initialize the variable 'mr' to silence this warning
          u32 mr;
                ^
                 = 0
  1 error generated.

Zero initialize mr so that these bitwise OR and assignment operation
works unconditionally.

Fixes: fa09fa60385a ("ASoC: mchp-spdifrx: fix controls which rely on rsr register")
Link: https://github.com/ClangBuiltLinux/linux/issues/1797
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 526dd3a17471..eb0c0ef4541e 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -429,7 +429,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
-	u32 mr;
+	u32 mr = 0;
 	int ret;
 
 	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",

---
base-commit: 1d78f19d90d1932c83d8c96c6f86fbb06c05e29a
change-id: 20230202-mchp-spdifrx-fix-uninit-mr-80528f2024c9

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

