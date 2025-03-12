Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF25A5DEA6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Mar 2025 15:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC3C6023E;
	Wed, 12 Mar 2025 15:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC3C6023E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741788552;
	bh=kEsDpTKxQ3UQq71PcqQdVH0yUmbushia9MrK7Fmz9qc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p1alKhB1Ad5jqn6BExDwyjY2rsihPcBKUDpld+ANWCWK1vnEvUKlmuJYX5/lq3alY
	 ybe2XId4axYE8ic9co7a1ud+ZGkYVFuJ0aQXbd5l9qvK5cymM9vse99l7F7dxKWx2F
	 aOIs0rmdN9Daz7V2rdtnq9YYuArmh6/qMud8IhDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18994F805B0; Wed, 12 Mar 2025 15:08:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 075E9F805B0;
	Wed, 12 Mar 2025 15:08:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E78F80301; Wed, 12 Mar 2025 15:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E092DF80095
	for <alsa-devel@alsa-project.org>; Wed, 12 Mar 2025 15:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E092DF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IvhUo4o7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4464EA41C35;
	Wed, 12 Mar 2025 14:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E7BC4CEDD;
	Wed, 12 Mar 2025 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741788508;
	bh=kEsDpTKxQ3UQq71PcqQdVH0yUmbushia9MrK7Fmz9qc=;
	h=From:To:Cc:Subject:Date:From;
	b=IvhUo4o7ewlByC9FOamurULHAZd14wHAYKX0UlBdxxMvgGP9G+UID1Fznh6mjf7/Q
	 R2emWbaTOVSOcblDwwwZW/Z1GknBo3ESVFQmKAZRalmH8nA84koa+HpAriLSnAGfjx
	 dfcxPtuuiF3pMTBK9lY7nzaaNIe3dueNAgfyvr8kBdqooeVwlJWp9jm9CaK7dHu5/V
	 ZN0jFMej6oSkoi/6AmG2E7BsS7Sjazckf5lX7MrW/jLeo9rBJ1wY1omSyeb0iLpoRY
	 ORLeYgkMIZ+tfEpP6gFM2rIPddlqQeLl5PsOwmzDWvWfU4L52689iUuLIWq4jPxpYX
	 wDcLOqhTmwSkQ==
Message-ID: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc6
Date: Wed, 12 Mar 2025 14:08:20 +0000
Message-ID-Hash: BD3CHZ23DH5GIUFYT7VWS2PH4DKTXCWD
X-Message-ID-Hash: BD3CHZ23DH5GIUFYT7VWS2PH4DKTXCWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BD3CHZ23DH5GIUFYT7VWS2PH4DKTXCWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6

for you to fetch changes up to ed92bc5264c4357d4fca292c769ea9967cd3d3b6:

  ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe() (2025-03-11 13:51:52 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

The bulk of this is driver specific fixes, mostly unremarkable.  There's
also one core fix from Charles, fixing up confusion around the limiting
of maximum control values.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius

Bard Liao (2):
      ASoC: rt1320: set wake_capable = 0 explicitly
      ASoC: rt722-sdca: add missing readable registers

Charles Keepax (2):
      ASoC: ops: Consistently treat platform_max as control value
      ASoC: cs42l43: Fix maximum ADC Volume

Christophe JAILLET (1):
      ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()

Maciej Strozek (1):
      ASoC: cs42l43: Add jack delay debounce after suspend

Peter Ujfalusi (1):
      ASoC: Intel: sof_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()

Thomas Mizrahi (1):
      ASoC: amd: yc: Support mic on another Lenovo ThinkPad E16 Gen 2 model

Thorsten Blum (1):
      ASoC: tegra: Fix ADX S24_LE audio format

 include/sound/soc.h               |  5 ++++-
 sound/soc/amd/yc/acp6x-mach.c     |  7 +++++++
 sound/soc/codecs/cs42l43-jack.c   | 13 ++++++++++---
 sound/soc/codecs/cs42l43.c        | 17 +++++++++++++++--
 sound/soc/codecs/cs42l43.h        |  3 +++
 sound/soc/codecs/rt1320-sdw.c     |  3 +++
 sound/soc/codecs/rt722-sdca-sdw.c |  4 ++++
 sound/soc/codecs/wm0010.c         | 13 +++++++++++--
 sound/soc/codecs/wsa884x.c        |  4 ++--
 sound/soc/intel/boards/sof_sdw.c  |  2 +-
 sound/soc/soc-ops.c               | 15 +++++++--------
 sound/soc/tegra/tegra210_adx.c    |  4 ++--
 12 files changed, 69 insertions(+), 21 deletions(-)
