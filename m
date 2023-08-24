Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69BD787B63
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC929F6;
	Fri, 25 Aug 2023 00:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC929F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692915539;
	bh=xG5O7OVbu1xHfgtvQrvGUtdzYJibyFr+elMaMfRkfAg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NEcAyZO1jr4oS1mpsUx8TyD4EUk9Mvl4DWvvA1VuHrWSswgghcGlMztJxRCvSYKWT
	 T4JPe7nhQPcPU9RjLKEILcEvOZ7osydMEITq38SzIFK1IeshJrnu0Z5CnpfCvrFMMd
	 uVPsdtckwxGAG+zZysxypLaXyyVaJWkAhbmrgohg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3868AF805B5; Thu, 24 Aug 2023 23:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED916F805AE;
	Thu, 24 Aug 2023 23:52:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B379AF805AF; Thu, 24 Aug 2023 23:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44942F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44942F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B4+LCqQ2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC797630E7;
	Thu, 24 Aug 2023 21:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B33C433C7;
	Thu, 24 Aug 2023 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692913952;
	bh=xG5O7OVbu1xHfgtvQrvGUtdzYJibyFr+elMaMfRkfAg=;
	h=From:To:Cc:Subject:Date:From;
	b=B4+LCqQ2L60c+qFN5yQGHyZ3WWykgo1gkLglhDtAI3hhtPi6BZUwI+rLFygK6ezXI
	 GFXaX+Rtynj8KXUTCvqXuXoGNp+ehM2XpqBPdtqutN5/xtYTnrUSb6V4/OBtOKYL+2
	 zc0ig+E4pmTvXs22zTx1YQy+vyXfeCdd4LSizukfUvqMN/yE8x7ifutddji3SJQ1mz
	 CCMRgi9H0JY9mvb54XfVcNtiKW+TAIdPP8kG4y/v2U8iokdtU51ly2OjRSJmLwD6jW
	 uUEnAJLvLOHdF9Efy0c+lRywrCI8LRzjJX0gxMYzxlvkjlavBXu4oudPxbrahjvDxs
	 +lSOsgEKelehQ==
Message-ID: <f3cfc114aa5fefb981c3401877c8d5d0.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc7-2
Date: Thu, 24 Aug 2023 22:52:22 +0100
Message-ID-Hash: O4YSKOEZWW5ZVS4T5WZTJT45FVDZWKMK
X-Message-ID-Hash: O4YSKOEZWW5ZVS4T5WZTJT45FVDZWKMK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4YSKOEZWW5ZVS4T5WZTJT45FVDZWKMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 37aba3190891d4de189bd5192ee95220e295f34d:

  ASoC: rt1308-sdw: fix random louder sound (2023-08-13 18:16:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc7-2

for you to fetch changes up to c008323fe361bd62a43d9fb29737dacd5c067fb7:

  ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ (2023-08-24 13:15:33 +0100)

----------------------------------------------------------------
ASoC: Quirk for v6.5

One additional fix for v6.5, an additional quirk.  As with the other
fixes this could wait for the merge window.

----------------------------------------------------------------
BrenoRCBrito (1):
      ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for acp6x

Chao Song (1):
      ASoC: SOF: ipc4-pcm: fix possible null pointer deference

Charles Keepax (1):
      ASoC: cs35l41: Correct amp_gain_tlv values

Kevin-Lu (1):
      MAINTAINERS: Add entries for TEXAS INSTRUMENTS ASoC DRIVERS

Maciej Strozek (1):
      ASoC: cs35l56: Read firmware uuid from a device property instead of _SUB

Mario Limonciello (1):
      ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ

Mark Brown (1):
      ASoC: cs35l56: Update ACPI HID and property

Shenghao Ding (1):
      ASoC: tas2781: fixed register access error when switching to other chips

Simon Trimmer (1):
      ASoC: cs35l56: Add an ACPI match table

 MAINTAINERS                       | 33 +++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c     |  9 ++++++++-
 sound/soc/codecs/cs35l41.c        |  2 +-
 sound/soc/codecs/cs35l56-i2c.c    |  9 +++++++++
 sound/soc/codecs/cs35l56-spi.c    |  9 +++++++++
 sound/soc/codecs/cs35l56.c        | 31 ++++++++++++-------------------
 sound/soc/codecs/tas2781-comlib.c | 19 ++++++++++---------
 sound/soc/sof/ipc4-pcm.c          |  3 +++
 8 files changed, 85 insertions(+), 30 deletions(-)
