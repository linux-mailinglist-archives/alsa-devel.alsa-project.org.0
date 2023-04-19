Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B403D6E829D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 22:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71F7EF2;
	Wed, 19 Apr 2023 22:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71F7EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681935926;
	bh=c4Ag/KR2KQCqB87X2rzqnn8Rb9MtEKsg+ofF9eRZnO0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bU9H/annImWfGF3VM+dCt+MdX5j4G4QS7SiROokEXedhZDua3O1MYwFP7PAi5ehCG
	 jFgq1y4t4XndR28zsifPz3klnfZ46COKy4a+3BldCARxT8/1mCiPFyOg9wp1VZyJ+Q
	 6IEEGPNlqmVMTN5X+vC08CeIea/jW9mqkzzr1LHc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99895F80149;
	Wed, 19 Apr 2023 22:24:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3912F80155; Wed, 19 Apr 2023 22:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA959F800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 22:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA959F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WPPj5Sfu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE42862344;
	Wed, 19 Apr 2023 20:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8CEC433A0;
	Wed, 19 Apr 2023 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681935865;
	bh=c4Ag/KR2KQCqB87X2rzqnn8Rb9MtEKsg+ofF9eRZnO0=;
	h=From:To:Cc:Subject:Date:From;
	b=WPPj5SfuxcaZ+JxAb7ZFCP+spDb3JwNf7pc+4189LQoKor/N6tUZ/ligH10UKxl3M
	 kiBgJ0aY4aOFCd+GEotSJobtHcrw5NwE4L0jBn+jBK8UZNR/XykgwXQIqK3NzfYsMc
	 kY35WCcyDF01JdAPFZ+rcDQpYS4wKKogfu0jH0LkD4ZnN5NyAcQ6BU2p5TsC3JV1qR
	 JHSjvxHyftUTTLGQCk1N67i9FVtzr+UW4mLDGR6b29UsoRy477Pq/0SBiv+aGHeuBY
	 qUtk1UOPdXL7JCagFkNcNfRkNIo/R2+ceSQFe0hMFsQuc1J44fHUlKznzZakiMXKRR
	 dEkfOthvvPWrA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.3-rc7
Date: Wed, 19 Apr 2023 21:24:11 +0100
Message-Id: <20230419202424.DE8CEC433A0@smtp.kernel.org>
Message-ID-Hash: LIA7IJXBODYZOWIQYYB5EKOZKW6ROTWH
X-Message-ID-Hash: LIA7IJXBODYZOWIQYYB5EKOZKW6ROTWH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIA7IJXBODYZOWIQYYB5EKOZKW6ROTWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit e3720f92e0237921da537e47a0b24e27899203f8:

  ASoC: SOF: avoid a NULL dereference with unsupported widgets (2023-03-29 14:40:18 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.3-rc7

for you to fetch changes up to 86a24e99c97234f87d9f70b528a691150e145197:

  ASoC: fsl_asrc_dma: fix potential null-ptr-deref (2023-04-19 13:42:56 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.3

A few remaining small fixes for v6.3, all small driver specific ones.

----------------------------------------------------------------
Chancel Liu (1):
      ASoC: fsl_sai: Fix pins setting for i.MX8QM platform

Daniel Baluta (1):
      ASoC: SOF: pm: Tear down pipelines only if DSP was active

Long Wang (1):
      ASoC: max98373: change power down sequence for smart amp

Nikita Zhandarovich (1):
      ASoC: fsl_asrc_dma: fix potential null-ptr-deref

Peter Ujfalusi (1):
      ASoC: SOF: ipc4-topology: Clarify bind failure caused by missing fw_module

 sound/soc/codecs/max98373.c   |  4 ++--
 sound/soc/fsl/fsl_asrc_dma.c  | 11 ++++++++---
 sound/soc/fsl/fsl_sai.c       |  2 +-
 sound/soc/sof/ipc4-topology.c | 10 ++++++----
 sound/soc/sof/pm.c            |  8 +++++++-
 5 files changed, 24 insertions(+), 11 deletions(-)
