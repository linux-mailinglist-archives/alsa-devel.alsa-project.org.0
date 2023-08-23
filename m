Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8A7860D8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 21:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F098283E;
	Wed, 23 Aug 2023 21:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F098283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692819746;
	bh=mCr5ocvyOeu2z0mozrELa/is5m76n47C97ZuPuIngY4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OGgg3osOty6szmtMAZvhi2dvJ66W1Rz4mfSLWXtXZutYmRowNl2Uiibg1uLipuOEc
	 uqaUfz/T+O9YlRAde02iBVMLBQ6k5uaq32mGi23GocERzSfV6Kq7K6UoM1TlmUjNqs
	 IWPapAPndRpnH9k/8vF0/35+9fB0Drp4kXdNvQU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C96F804F3; Wed, 23 Aug 2023 21:41:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 254DDF800F5;
	Wed, 23 Aug 2023 21:41:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 135BEF80158; Wed, 23 Aug 2023 21:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C561F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 21:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C561F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ILYukSvJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EBD561879;
	Wed, 23 Aug 2023 19:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201C2C433C7;
	Wed, 23 Aug 2023 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692819649;
	bh=mCr5ocvyOeu2z0mozrELa/is5m76n47C97ZuPuIngY4=;
	h=From:To:Cc:Subject:Date:From;
	b=ILYukSvJho2ikauKcqvGbkQGwmA4qkJ4w5/YpLKJMg0uXCjthpGqnfTVnvegZI6Xy
	 E92oTQXoW0JOQVRKQWn9XMLjwsJWZ0HETvIR4wQ24Dq9JA/BmkeM3VTLkpT8GMrpoa
	 cy5/TYxD7CF1eI6uVXusmFcPwctgHu/NHTF+dWzfTnljeUX7QQ5MlXZF+I+H91pFeA
	 UIqQqSirkyvWCID6NX5TuCdfr6KI2mP52wDzJ4BsBLQNEOcXYNh0bF1MFatvgMRfYz
	 cz3WyD+rAAgX0MfXLMZI1DhIl2tUIpvyyuGDB/EAJfthtD/1JuJNqks40WNPQoD14E
	 P8rzIHEh3X4oQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc7
Date: Wed, 23 Aug 2023 20:40:09 +0100
Message-Id: <20230823194049.201C2C433C7@smtp.kernel.org>
Message-ID-Hash: 6E6AS3WUXKTJUBIVBBAT7ORUZEE3FXDO
X-Message-ID-Hash: 6E6AS3WUXKTJUBIVBBAT7ORUZEE3FXDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6E6AS3WUXKTJUBIVBBAT7ORUZEE3FXDO/>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc7

for you to fetch changes up to 1613781d7e8a93618ff3a6b37f81f06769b53717:

  ASoC: cs35l41: Correct amp_gain_tlv values (2023-08-23 13:27:06 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.5

A relatively large but generally not super urgent set of fixes for ASoC,
including some quirks and a MAINTAINERS update.  There's also an update
to cs35l56 to change the firmware ABI, there are no current shipping
systems which use the current interface and the sooner we get the new
interface in the less likely it is that something will start.

It'd be nice if these landed for v6.5 but not the end of the world if
they wait till v6.6.

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

Mark Brown (1):
      ASoC: cs35l56: Update ACPI HID and property

Shenghao Ding (1):
      ASoC: tas2781: fixed register access error when switching to other chips

Simon Trimmer (1):
      ASoC: cs35l56: Add an ACPI match table

 MAINTAINERS                       | 33 +++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c     |  7 +++++++
 sound/soc/codecs/cs35l41.c        |  2 +-
 sound/soc/codecs/cs35l56-i2c.c    |  9 +++++++++
 sound/soc/codecs/cs35l56-spi.c    |  9 +++++++++
 sound/soc/codecs/cs35l56.c        | 31 ++++++++++++-------------------
 sound/soc/codecs/tas2781-comlib.c | 19 ++++++++++---------
 sound/soc/sof/ipc4-pcm.c          |  3 +++
 8 files changed, 84 insertions(+), 29 deletions(-)
