Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214BB86B6A5
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 19:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48CF3846;
	Wed, 28 Feb 2024 19:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48CF3846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709143405;
	bh=CwgFLxE+TfZHfSF0P5viIf/XdBKv2ayZUZypJuBKbUk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rTyupP2o62fPbMLM5Rn9z4IONPd6rDeVqxQk/6o7BNIcmnJDud9ppBUvIaUSPwovT
	 ac82Z+3XiF0iN8qk6BTMntAKY6dKt736s9DP9kqHC5c+FJpPypTiFzv7SDJiVUbhPR
	 9OK1pYLCOLxVOhwt4hpQDJjdY7+xTqHNJS6tjVuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 089FFF801C0; Wed, 28 Feb 2024 19:02:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC10F8057B;
	Wed, 28 Feb 2024 19:02:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFE26F801C0; Wed, 28 Feb 2024 19:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7CD0F80088
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 19:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CD0F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LAA2XOtW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2450CE130A;
	Wed, 28 Feb 2024 18:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BF7C433C7;
	Wed, 28 Feb 2024 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709143352;
	bh=CwgFLxE+TfZHfSF0P5viIf/XdBKv2ayZUZypJuBKbUk=;
	h=From:To:Cc:Subject:Date:From;
	b=LAA2XOtW/yas1LcHZu/n/iTINbW4Aq9QCnwBYCDB6yv4pqhMUW99J61jcL2fOqhGV
	 6RPaNlUMoZdzZjFqyzlAXaXQtt498AwAs+6OBMtJKiJVsi7w+PhtCZpodONyukupXA
	 17/2MX0BryuV2XIcJlvjw0BfGeZafy8Rl04qJYKLpmnrhlzP5muJiNWgEMEAAIoUzE
	 waT9YmgSz2cRT+2iYazr66fkW+iogkAlQZaAg+EngQ1JZyqxM6P0++SZdC4Bnk3K7A
	 DqSa8iA6tgGpH4/kycumQQMi7MQc/b7df98s4V7TU0/oZybzBPw41yzGED6H8uMH6t
	 gHceX8JESD5JQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-rc5
Date: Wed, 28 Feb 2024 18:02:24 +0000
Message-Id: <20240228180231.D8BF7C433C7@smtp.kernel.org>
Message-ID-Hash: ZZHC6LDWIUB2ER4HHXSVJMFCRVPHOHL5
X-Message-ID-Hash: ZZHC6LDWIUB2ER4HHXSVJMFCRVPHOHL5
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZHC6LDWIUB2ER4HHXSVJMFCRVPHOHL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 0db0c1770834f39e11a2902e20e1f11a482f4465:

  ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property (2024-02-13 19:37:25 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc5

for you to fetch changes up to ed00a6945dc32462c2d3744a3518d2316da66fcc:

  ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2 (2024-02-28 12:24:59 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

A few small fixes, some driver specific and one slightly larger one
from Richard which adds a new core helper and updates a small clutch of
drivers to deal with the fact that they were using a helper which
requires that the lock for the list of controls without holding that
lock.  We also have some quirks for new AMD based Lenovo systems.

----------------------------------------------------------------
Colin Ian King (1):
      ASoC: qcom: Fix uninitialized pointer dmactl

Jiawei Wang (2):
      ASoC: amd: yc: add new YC platform variant (0x63) support
      ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2

Johnny Hsieh (1):
      ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table

Richard Fitzgerald (2):
      ASoC: cs35l56: Must clear HALO_STATE before issuing SYSTEM_RESET
      ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()

 include/sound/soc-card.h          |  2 ++
 sound/soc/amd/yc/acp6x-mach.c     | 14 ++++++++++++++
 sound/soc/amd/yc/pci-acp6x.c      |  1 +
 sound/soc/codecs/cs35l45.c        |  2 +-
 sound/soc/codecs/cs35l56-shared.c |  1 +
 sound/soc/codecs/cs35l56.c        |  2 +-
 sound/soc/fsl/fsl_xcvr.c          | 12 +++++++++++-
 sound/soc/qcom/lpass-cdc-dma.c    |  2 +-
 sound/soc/soc-card.c              | 24 ++++++++++++++++++++++--
 9 files changed, 54 insertions(+), 6 deletions(-)
