Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A35F099A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 13:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F745169A;
	Fri, 30 Sep 2022 13:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F745169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664536268;
	bh=+2Z6l6P/6CzFz0S3EiuB/UeZGlBXJNLWZsF/UuObq0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pS6flCgTeO4KgUPyQ8lSzaZNvsxS9rw6DACF1bNveM/aSefGR6PsyzJnw318Kw3Mb
	 sTEhPuBcZ7vsPUq1Ur/hv6Gw7olvIc24e/DNWO0SGPGDgg274B2Ej3LtDGGyw+IZo/
	 F47cAomqLTiY4j8JQ9d7JFI/LO5bZKJ2RUeaYSpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83428F801D5;
	Fri, 30 Sep 2022 13:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E096F80155; Fri, 30 Sep 2022 13:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8EAF800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 13:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8EAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FQuP7MJ9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D8915CE24CD;
 Fri, 30 Sep 2022 11:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4E8C433C1;
 Fri, 30 Sep 2022 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664536201;
 bh=+2Z6l6P/6CzFz0S3EiuB/UeZGlBXJNLWZsF/UuObq0U=;
 h=From:To:Cc:Subject:Date:From;
 b=FQuP7MJ91H8awgF5SBpjesAh3nMJ4O/xLBTuNCCtykHySvPntnVqRA42Ui8he6W0n
 nCdpfU+1sBuK9JJQC60BnbbgvsJsAwmuF8ITp/Z0ou59DsWxfMrHzHO5peYDLfi+Nv
 BhSH3bj0hj0RefHegDr2xusqfyKjZfovC80ZLf9lF3sIHm9xRs90VWmXQzhFrkWwNU
 Oq401p/Fq2M0XrY1193k9xiPbgTDudF1Hjdx8m+G5hD8hsgk4wXS1GgYiCNBI8NmRx
 PEm2m6L/kdO6O+36o0d7W/AzMZ+Af2YDgQAqDUNEn9tTHJzt7GVIZVczZ7djAh1ICC
 j7mBKqtjjscFg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.0-rc7
Date: Fri, 30 Sep 2022 12:09:50 +0100
Message-Id: <20220930111000.BF4E8C433C1@smtp.kernel.org>
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

The following changes since commit 0a0342ede303fc420f3a388e1ae82da3ae8ff6bd:

  ASoC: tas2770: Reinit regcache on reset (2022-09-19 18:48:43 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.0-rc7

for you to fetch changes up to e18f6bcf8e864ea0e9690691d0d749c662b6a2c7:

  ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()" (2022-09-29 15:20:12 +0100)

----------------------------------------------------------------
ASoC: Last fixes for v6.0

In the even that there's another pull request here's some more driver
specific fixes.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ASoC: wcd9335: fix order of Slimbus unprepare/disable
      ASoC: wcd934x: fix order of Slimbus unprepare/disable
      ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()"

Pierre-Louis Bossart (1):
      ASoC: es8316: fix register sync error in suspend/resume tests

Shengjiu Wang (1):
      ASoC: fsl_audmux: Fix amixer write errors

 sound/soc/codecs/es8316.c      |  2 ++
 sound/soc/codecs/wcd-mbhc-v2.c | 10 ++++++----
 sound/soc/codecs/wcd9335.c     |  2 +-
 sound/soc/codecs/wcd934x.c     |  2 +-
 sound/soc/fsl/fsl_audmix.c     | 16 ++++------------
 5 files changed, 14 insertions(+), 18 deletions(-)
