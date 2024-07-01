Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4D91E541
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 18:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC6AB65;
	Mon,  1 Jul 2024 18:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC6AB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719851110;
	bh=oBVFJlu3MmnNdnNe9Q9BhkVgV1GOgRax+RD1hh59NIs=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F8UR+MUJpVKwQBQn9S8VHnHPIW/dEYKpITAmJ5AYFAPC8DB3S8gR6Mo+sd49RsDKk
	 fdeL9Eom7Usu9SbKtVPi1Cc6gFMp7EIi/jGxlyvL7wXH+7Gu0Z4bpwlSw2kjj7rqf6
	 9StGd63Sx/hQWoQTfSvMvg3cWpJX6AX16MBiYCog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CECF8F805AF; Mon,  1 Jul 2024 18:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 832EAF80589;
	Mon,  1 Jul 2024 18:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C40BF8028B; Mon,  1 Jul 2024 18:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53864F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 18:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53864F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MNfaOgTI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25E19612BB;
	Mon,  1 Jul 2024 16:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F67C116B1;
	Mon,  1 Jul 2024 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719851065;
	bh=oBVFJlu3MmnNdnNe9Q9BhkVgV1GOgRax+RD1hh59NIs=;
	h=From:Date:Subject:To:Cc:From;
	b=MNfaOgTI38XHbTvoSalMKLauxUd+9J/w1Q99eE96NJCsllyoTZgXBI6Sy4yc5ZAWz
	 9lhd7stnTg5qOwtBlWhzRf1bZEBM2Z1+KvGrt35Pga41dHChLFpsASxl2s7rcG5WEd
	 IjTwmuvK9w6t2J3u5OVbPThQV2tY13Pro0/kDpUpeRyNlgPqSg4MZKVN3fUJHcLynI
	 uM2rFprmO8AIyyoheuuoCfSd2mPaz4x/Fu1dYLf3ndPBr+SxBUowtowO8S2yRpptyQ
	 /RZPof4m2qkjmhkp5DlG79wllZAAWMyyC+6SIlZNoY6TuR0RRpLC07brLaOhD0aXAo
	 ZQkCdYNG01+ZQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 01 Jul 2024 09:24:16 -0700
Subject: [PATCH] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized in
 lpc32xx_i2s_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC/YgmYC/x2NzQqDMBAGX0X23IVN/ANfpfQQkm39QKIkVoLiu
 zf0ODDMXJQ1QTNNzUVJD2SssYJ5NORnFz/KCJXJiu1kFMPL5ltbCru8en6j8DciYodbcGrgpDt
 3o0gYQt8P3lANbUmr+J88X/f9AyTAwd50AAAA
To: "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Mark Brown <broonie@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oBVFJlu3MmnNdnNe9Q9BhkVgV1GOgRax+RD1hh59NIs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGlNNyxOBzy1UVET3irgUXTDdu7+cq5F79i0f9i/ydsUF
 LG55862jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRp0cZGXr631qo3FnZemTN
 5k6jhZ1rBSbECur+dFZelzgnU3eH3T9GhjX3eNamS0ZNeMxY1K8eef8+q6tI9MMgwRiFpSrX8rh
 d2QE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: SQA6E5LKTW743ELWK7VTMF2JLY4IGL5U
X-Message-ID-Hash: SQA6E5LKTW743ELWK7VTMF2JLY4IGL5U
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQA6E5LKTW743ELWK7VTMF2JLY4IGL5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang points out that ret may be used uninitialized in
lpc32xx_i2s_probe() in an error pointer path (which becomes fatal with
CONFIG_WERROR):

  sound/soc/fsl/lpc3xxx-i2s.c:326:47: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    326 |                                      "failed to init register map: %d\n", ret);
        |                                                                           ^~~
  sound/soc/fsl/lpc3xxx-i2s.c:310:9: note: initialize the variable 'ret' to silence this warning
    310 |         int ret;
        |                ^
        |                 = 0
  1 error generated.

One solution would be a small refactoring of the second parameter in
dev_err_probe(), PTR_ERR(i2s_info_p->regs), to be the value of ret in
the if statement. However, a nicer solution for debugging purposes,
which is the point of this statement, would be to use the '%pe'
specifier to symbolically print the error pointer value. Do so, which
eliminates the uninitialized use of ret, clearing up the warning.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 0e5b4d5202ff..af995ca081a3 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -323,7 +323,7 @@ static int lpc32xx_i2s_probe(struct platform_device *pdev)
 	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
 	if (IS_ERR(i2s_info_p->regs))
 		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
-				     "failed to init register map: %d\n", ret);
+				     "failed to init register map: %pe\n", i2s_info_p->regs);
 
 	i2s_info_p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(i2s_info_p->clk))

---
base-commit: 878f4c36f9235e8a15fe0c2ecde066d92c50c8ff
change-id: 20240701-lpc32xx-asoc-fix-uninitialized-ret-4700d6d556c1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

