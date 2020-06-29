Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22F20D02F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 18:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB61165D;
	Mon, 29 Jun 2020 18:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB61165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593448441;
	bh=HIuTwaIUFECvkgVe/4sHoaWiVUg9l8Rmlr/RUNwejv4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m+C+ArMBbGnrKpHzvD7lVuIKYE+kEzagTEk30V0sM1srGLQ89uZEp/ozv3h3VBW5M
	 XMtmliKsDuXLMN1i0RaD/bSH8O2hq0Caw6TqNHtckZ5IKzyt2zf5AyrS9v8yCLarnl
	 pAg0slVZCW6sOKRx05i7PgU9NppvWgGKRrVb3J/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C19CF80096;
	Mon, 29 Jun 2020 18:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54AEDF80217; Mon, 29 Jun 2020 18:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E874F800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 18:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E874F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kxm+Oh1g"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 452DA2558B;
 Mon, 29 Jun 2020 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593448329;
 bh=HIuTwaIUFECvkgVe/4sHoaWiVUg9l8Rmlr/RUNwejv4=;
 h=From:To:Cc:Subject:Date:From;
 b=kxm+Oh1gumdcgBAOZqgV+BCt5iwGll3kuFq8K+7pF7ENNHAVcyr3Nk/sHJ5m2zatQ
 BvsfKnrf8t4nxC/NB3DzB83JfCUlPwtB0A3C4Ty58OfjyIPBmeDTfinP5vIrr35NbE
 7DkDzWaZxOtyNFJjjtlcGTmz6m6l16vOhala/O7c=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.8-rc3
Date: Mon, 29 Jun 2020 17:31:26 +0100
Message-Id: <20200629163209.452DA2558B@mail.kernel.org>
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

The following changes since commit f141a422159a199f4c8dedb7e0df55b3b2cf16cd:

  ASoC: rockchip: Fix a reference count leak. (2020-06-18 17:21:58 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.8-rc3

for you to fetch changes up to bc5c7f55f5ea91e137fc7939435ed2e2bb6e5a15:

  AsoC: amd: add missing snd- module prefix to the acp3x-rn driver kernel module (2020-06-25 15:06:56 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.8

A few small driver specific fixes, nothing particularly dramatic.

----------------------------------------------------------------
Jaroslav Kysela (1):
      AsoC: amd: add missing snd- module prefix to the acp3x-rn driver kernel module

Shengjiu Wang (2):
      ASoC: fsl_mqs: Don't check clock is NULL before calling clk API
      ASoC: fsl_mqs: Fix unchecked return value for clk_prepare_enable

Shuming Fan (1):
      ASoC: rt5682: fix the pop noise while OMTP type headset plugin

 sound/soc/amd/renoir/Makefile |  7 ++++---
 sound/soc/codecs/rt5682.c     |  9 ++++++++-
 sound/soc/fsl/fsl_mqs.c       | 23 ++++++++++++++---------
 3 files changed, 26 insertions(+), 13 deletions(-)
