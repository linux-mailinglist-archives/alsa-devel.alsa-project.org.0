Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B6B302C9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 21:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9621660245;
	Thu, 21 Aug 2025 21:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9621660245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755804102;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9WkAw3y51IdetR4wIot/qcAV+Zmobpyl1QYL5rRN6LdpkF0mZeRff9EH+HcUeQh5
	 QGHWxkumdS5dbwDLz1fQFpuBreBlOd2Es0+csUyBfOzCT5O8wWMraGtTxiL4VzeLWr
	 od1k93/c2jpsmtlI2nS/qK9RWRAoAvGKWv6HZ1j4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1CE7F805C6; Thu, 21 Aug 2025 21:21:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC7AF805C8;
	Thu, 21 Aug 2025 21:21:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF68FF80518; Thu, 21 Aug 2025 21:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC8FCF80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 21:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC8FCF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uhrg0USy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9D24A58598;
	Thu, 21 Aug 2025 19:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE834C4CEF4;
	Thu, 21 Aug 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755804044;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=From:To:Cc:Subject:Date:From;
	b=Uhrg0USyFdZZBmejLEYHEB7vB2EJyUIjulIZYTJhYYb4kV02u0aWgst6Olx/c2ubH
	 saaf1tVgdcRR+wnx1Dj7K6nSQOqM/GW6UjK/FkjDWFI/cA0KUB+ex8yAB+Es+rB/Ex
	 ZPlpAL8q7Q2gB1Yu1NN/hA+JKjIraPdx1vxAcL0ueTHmY6UXBNzEcQlzC2yVt+hIBQ
	 377EQXccaW0CZ5CckTgt3p8wDrAnVs2KHs9ZoRfdrWIM/T/9faFZXO6xhlA56PY32T
	 0o4H0/GDHoj1Ez5/2o5dx6N+5GunaWlhfbYOkLVLmlsDLbJZQX9W0l0Su06Le7VdUb
	 PpztHXmbb315g==
Message-ID: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc2
Date: Thu, 21 Aug 2025 20:20:41 +0100
Message-ID-Hash: IXO64PHMWOTWIKYVB7JYPVZKK6JCPSES
X-Message-ID-Hash: IXO64PHMWOTWIKYVB7JYPVZKK6JCPSES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXO64PHMWOTWIKYVB7JYPVZKK6JCPSES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc2

for you to fetch changes up to 7c15e4cabfa96ed3cd717a2ed7a9961268ab21f7:

  ASoC: cs35l56: Fixes for CS35L63 for production (2025-08-20 19:56:20 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A few fixes that came in during the past week, there's some updates for
the CS35L56 which adjust the driver for production silicon and a fix for
buggy resume of the ES9389.

----------------------------------------------------------------
Mark Brown (1):
      ASoC: cs35l56: Fixes for CS35L63 for production

Richard Fitzgerald (1):
      ASoC: cs35l56: Handle new algorithms IDs for CS35L63

Stefan Binding (2):
      ASoC: cs35l56: Update Firmware Addresses for CS35L63 for production silicon
      ASoC: cs35l56: Remove SoundWire Clock Divider workaround for CS35L63

Zhang Yi (1):
      ASoC: codecs: ES9389: Modify the standby configuration

 include/sound/cs35l56.h           |  5 +--
 sound/soc/codecs/cs35l56-sdw.c    | 69 ---------------------------------------
 sound/soc/codecs/cs35l56-shared.c | 29 ++++++++++++++--
 sound/soc/codecs/cs35l56.c        |  2 +-
 sound/soc/codecs/cs35l56.h        |  3 --
 sound/soc/codecs/es8389.c         |  2 +-
 6 files changed, 31 insertions(+), 79 deletions(-)
