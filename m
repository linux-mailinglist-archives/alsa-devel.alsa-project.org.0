Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AC583F64
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 15:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48E11663;
	Thu, 28 Jul 2022 14:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48E11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659013231;
	bh=X0Baos+jId/W4p8LET80ZNeDZGLjKBBJFjqmrzQ0970=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lHBvWjkfB3z/0GWfoRBsscdON9VVv0DTSAtagNOv+ec2rcXuUA4Mpljze0yrEklsr
	 1Su1Muyi/y+q2lOJg2xaEMoxxE2aPt+k3danjnmZUPV5R7Pzue+xDrCyJzyk1yHUKq
	 4x2sTo94yL9oX8RigQNEA259VgSvX5az3H2B5C3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80612F8050F;
	Thu, 28 Jul 2022 14:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A1EAF80430; Thu, 28 Jul 2022 14:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15C64F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C64F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iuC+hH4z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FDC0B82444;
 Thu, 28 Jul 2022 12:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78640C433D7;
 Thu, 28 Jul 2022 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659013170;
 bh=X0Baos+jId/W4p8LET80ZNeDZGLjKBBJFjqmrzQ0970=;
 h=From:To:Cc:Subject:Date:From;
 b=iuC+hH4zVva762QQmuLfG7ohyJmNX1IiQv0zDxAyF2mTaS2HawV0qlptmlXMJxkwP
 IG8wF6G4T4xsJ39aQ9Z8guYMPEnvNCyvQdaxdZMBKJ4vrhZe9DzjzE5I8qQ7jKpnX/
 Bdv8JS1AhyQcSvF/VfI8bmmfJQoBYvFrMcJgKXQ6Tb25RC1o79Xa7XVEviaLOiMeVt
 twrDEfz0EMX1tnAGFBQaajiMvtdL9EHqXFqKOzaB2/5ym2vwTh0ZFu8SwPVfJ2dEI3
 3N8O8oKSohDMEdsQZIVDJyv4fFtkB8qxBv8Q0OsC9VLoTaxMRENNnVjbIBOvx3xtcX
 AJSiLUcqqtcog==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.19-rc8
Date: Thu, 28 Jul 2022 13:59:21 +0100
Message-Id: <20220728125929.78640C433D7@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit 1e347f861da8ddb17e1d1b3113cb6c188e0de3e5:

  ASoC: rockchip-i2s: Undo BCLK pinctrl changes (2022-07-14 13:25:52 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc8

for you to fetch changes up to 30097967e0566cac817273ef76add100f6b0f463:

  ASoC: codecs: va-macro: use fsgen as clock (2022-07-27 14:46:41 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.19

A few more small fixes, they could all wait for the merge window if you
prefer.

----------------------------------------------------------------
Ryan Lee (1):
      ASoC: max98373: Removing 0x203E from the volatile reg

Srinivas Kandagatla (1):
      ASoC: codecs: va-macro: use fsgen as clock

Wang Jiada (1):
      ASoC: rsnd: ssiu: add missing .quit callback for gen2

 sound/soc/codecs/lpass-va-macro.c | 11 +++++++++--
 sound/soc/codecs/max98373-i2c.c   |  1 -
 sound/soc/sh/rcar/ssiu.c          |  1 +
 3 files changed, 10 insertions(+), 3 deletions(-)
