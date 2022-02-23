Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AA4C130C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 13:46:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB1D168E;
	Wed, 23 Feb 2022 13:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB1D168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645620369;
	bh=lHipXai0ktXrFOOpV9s37182vz0U6yaE0/q9Udzd3Mk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M+saG0oCI619Zdx8lypxl5ooqNavzERxKrfo3i+qOCcnlSaPWt/A2NfVqZKLQrZSx
	 idBCWio8y2rZJZj36ppoQtcUY5Tex8rda04P0kmUsrzpvsBAJxV6pJEO63EttmdlGL
	 msQ8H0NEA/s80iIWr+ug4poGb2wqQY/HyvNHFxOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 456E5F8025D;
	Wed, 23 Feb 2022 13:45:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19BE5F80237; Wed, 23 Feb 2022 13:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F349F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 13:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F349F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Baxb6Egq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FCBB6117F;
 Wed, 23 Feb 2022 12:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7F6C340E7;
 Wed, 23 Feb 2022 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645620294;
 bh=lHipXai0ktXrFOOpV9s37182vz0U6yaE0/q9Udzd3Mk=;
 h=From:To:Cc:Subject:Date:From;
 b=Baxb6EgqI5EbKW3WMzR6aWDDw7VOhaYJQKuzJuAkVTaWq8ygJY10X/acnEmHYVnxd
 PVBQIN4zrsgFB8j3bLPiMgc3h5XLDnY8/FjZpDhSAIvesghxJ81bBMYM4qtB2Lpsbe
 ZUW2cZslAftS8vTHEGE18Zv1TYWimbPBMQR0ILt65fb22jH6mQT98BrvFQPGBYSHNy
 oWiOpJNxMWqFivi08LS0KRvlqsPONN4GOG0Ghchh8qyaWBUOGpxG2c1YongZ2piQ6v
 rTVkkgwu9aZ0pEPgSJw4DF7hyn1jGVhBPh+cObJBmK8iYd/vKY9zjs99yKNqamG05g
 PDt8clMmjjPqA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.17-rc5
Date: Wed, 23 Feb 2022 12:44:41 +0000
Message-Id: <20220223124454.8C7F6C340E7@smtp.kernel.org>
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

The following changes since commit a887f9c7a4d37a8e874ba8415a42a92a1b5139fc:

  ASoC: wm_adsp: Correct control read size when parsing compressed buffer (2022-02-10 17:26:43 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.17-rc5

for you to fetch changes up to c5487b9cdea5c1ede38a7ec94db0fc59963c8e86:

  ASoC: cs4265: Fix the duplicated control name (2022-02-16 16:34:16 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.17

A few more fixes for v5.17, one followup to the bounds checking fixes
handling controls which support negative values internally and a driver
specific one.

----------------------------------------------------------------
Fabio Estevam (1):
      ASoC: cs4265: Fix the duplicated control name

Marek Vasut (1):
      ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min

 sound/soc/codecs/cs4265.c | 3 +--
 sound/soc/soc-ops.c       | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)
