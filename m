Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4AA6BD34
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Mar 2025 15:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6B16024F;
	Fri, 21 Mar 2025 15:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6B16024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742567971;
	bh=hSqtL0RwN1bx8d5gieXRycRtrnD9GRk3EOBATz5fZ4Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qAIdH/ECZFBsZWnTai61LUSmOy62cqepl0bxyylrPX8g4hAvZwy9PkdFWOAEIO0rr
	 TUDyuqUlpF/TK2NPN+ePMZLmaWoPIYZ61cUc2T0r143SqxXHLv0JIRH3PD0tMXEVxt
	 2wCjioOh4d5lObLUB5bSY3jctDQj9wHIZ0NsLCPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5296FF805BD; Fri, 21 Mar 2025 15:38:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 404BBF805BE;
	Fri, 21 Mar 2025 15:38:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19739F8013D; Fri, 21 Mar 2025 15:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 262D2F800BD
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 15:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262D2F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L+4dbu4Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FD8243A66;
	Fri, 21 Mar 2025 14:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C06AC4CEE3;
	Fri, 21 Mar 2025 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742567927;
	bh=hSqtL0RwN1bx8d5gieXRycRtrnD9GRk3EOBATz5fZ4Y=;
	h=From:To:Cc:Subject:Date:From;
	b=L+4dbu4Q9oFRwJS/HCPYMxghZnmdJFOXTOuBhnDt7dCSkKyaxUbMS5FZJrMQN9Jed
	 tgcUb+lnw5vkBio5UN1qS4QD8uWKqBBQeA2qKJbQhS9qWG6rMA4e71ETZ0OJWNSN0q
	 yCCvsAV7/QfD3fF66COMk4nY7Lq630Sl4VrPRh40+qZYFhrzrIiwhlNnn7uNbV+H59
	 KaXBqZOdAOl1yp2I9A8iOwb2HICDzRDLR4GLBzBlePforg9QEi6eWa+yolvYt+2kY9
	 61imeNCdTYOen+EBELRqMwatfKL/bCH25Hftct3IYjGUIEYYf9LX40uIqsAqt573Tg
	 3Z33bdM0jVzZg==
Message-ID: <2e7905783f8f3541e854a13742ff1c22.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc7
Date: Fri, 21 Mar 2025 14:38:39 +0000
Message-ID-Hash: WENAFGHTPGBBRWRH6DOEFFK4ROOGP5HH
X-Message-ID-Hash: WENAFGHTPGBBRWRH6DOEFFK4ROOGP5HH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WENAFGHTPGBBRWRH6DOEFFK4ROOGP5HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:

  ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc7

for you to fetch changes up to 45ff65e30deb919604e68faed156ad96ce7474d9:

  ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible (2025-03-18 12:27:34 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A couple of small fixes, plus some new device IDs - nothing super urgent
here.

----------------------------------------------------------------
Frank Li (1):
      ASoC: dt-bindings: fsl,sai: Add i.MX94 support

Jayesh Choudhary (1):
      ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible

Kuninori Morimoto (1):
      ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()

keenplify (1):
      ASoC: amd: Add DMI quirk for ACP6X mic support

 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 4 ++++
 sound/soc/amd/yc/acp6x-mach.c                        | 7 +++++++
 sound/soc/generic/simple-card-utils.c                | 7 +++++--
 sound/soc/ti/j721e-evm.c                             | 2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)
