Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B596F8352
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 14:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B8812CB2;
	Fri,  5 May 2023 14:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B8812CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683291266;
	bh=ZbckkUZq/Pib43NDqV6zL6YD9ztLq+HvTkQlh+gl9nU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fKwAsqOFvJlGhyLY9RxCZ3yMhyDBAsDF1HlF7rTe64r35q/VBrBSzUaWy0qe+dU4+
	 IGqCdqWd41yhYzI1wEmCONwX9Veoei/hfBwjDpkvqIbRYCFSuq+Cx1Njpjzq4sr8V4
	 1MzVhyvDrzAksmi2amu5aRtRUvRlkWzaLcO2qg00=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C80C4F80529;
	Fri,  5 May 2023 14:53:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBC15F8052D; Fri,  5 May 2023 14:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1D78F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 14:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D78F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OP+RK3Z4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5366663DCB;
	Fri,  5 May 2023 12:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E96DC433EF;
	Fri,  5 May 2023 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683291196;
	bh=ZbckkUZq/Pib43NDqV6zL6YD9ztLq+HvTkQlh+gl9nU=;
	h=From:To:Cc:Subject:Date:From;
	b=OP+RK3Z4eV2aehFIPVZruLHNx59qkH72WJR16fs1CMhXUHfD/iaEm6mYAPwgkvClE
	 nHxjw7txGzdQO3dOH36psBWJKoD8SUQUXgBAlwJle+bUr0cHPtPUzVU3zZ1maiCctd
	 yyC9I/cK7Va4FJx/YsYsHGq3ND5tJxUjwR2nqF69wyluZTCLs39DHgxFQ5HqMCfZa8
	 +O7zS9JTabkQinrge9jbfXgYafV7Xt5e3vXaneTCQ7hlEPj/fJpY+x1mj26LZjuVeM
	 WVEqWAlJYdSA8AQUhXZmv4jzoI7feNdmal3PVSND2WZzjev7SjqbRWp9WT7fvPgvl/
	 M8IvzoDui/EIw==
Message-ID: <f59623910a640a79d7c09ea24b1763f7.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.4-rc1
Date: Fri, 05 May 2023 21:53:07 +0900
Message-ID-Hash: 75T7UHMVVRIEEMJHJ6WQ3F2GK4VSVPCV
X-Message-ID-Hash: 75T7UHMVVRIEEMJHJ6WQ3F2GK4VSVPCV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75T7UHMVVRIEEMJHJ6WQ3F2GK4VSVPCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit dc801ea8ae37d54706e6f1cef140731ac5981c9c:

  ASoC: fsl: imx-audmix: remove dummy dai_link->platform (2023-04-21 13:45:07 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.4-rc1

for you to fetch changes up to ec6f82b4c63cc68f8dc03316e725106d242706be:

  ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares 8A tablet (2023-05-04 10:14:31 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.4

A small set of fixes and device quirks that have come in during the
merge window, the Qualcomm fix seems quite large but it's mainly code
motion so looks larger than it is.

----------------------------------------------------------------
Andrey Rakhmatullin (1):
      ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC to the quirks list for acp6x

Enrico Belleri (1):
      ASoC: amd: yc: Add ASUS M3402RA into DMI table

Hans de Goede (2):
      ASoC: Intel: soc-acpi-byt: Fix "WM510205" match no longer working
      ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares 8A tablet

Krzysztof Kozlowski (1):
      ASoC: codecs: wcd938x: fix accessing regmap on unattached devices

Maxim Kochetkov (1):
      ASoC: max98090: make it selectable

 sound/soc/amd/yc/acp6x-mach.c                     |   14 +
 sound/soc/codecs/Kconfig                          |    2 +-
 sound/soc/codecs/wcd938x-sdw.c                    | 1037 ++++++++++++++++++++-
 sound/soc/codecs/wcd938x.c                        | 1003 +-------------------
 sound/soc/codecs/wcd938x.h                        |    1 +
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |    2 +-
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |   26 +
 7 files changed, 1072 insertions(+), 1013 deletions(-)
