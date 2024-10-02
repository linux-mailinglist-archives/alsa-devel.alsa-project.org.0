Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756098E293
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 20:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5568C84A;
	Wed,  2 Oct 2024 20:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5568C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727893994;
	bh=2wvraHRrNZL3GX/oLWBMK86rPMuNcMNDkYkvoZi0fHY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lVhaKc5IEHe3nbuIT19b3JIDlfJjoXiltHI8UGAZdCe/qyqKEW+7Ht4leKAjdXq/Y
	 E9DTkf3s3JpyiI9qtAqnd3s4EkjlgCOyIxaocue5jkjjw5PxdPSna4OcGGL4jHc5TQ
	 pOtVS559aFTBQhVVz++AK4MJvu/Gc9CCgOKySg3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33F6BF805B6; Wed,  2 Oct 2024 20:32:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54339F80518;
	Wed,  2 Oct 2024 20:32:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0926DF80517; Wed,  2 Oct 2024 20:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1078F8001E
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 20:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1078F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nDncpNKJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC9F9A431D9;
	Wed,  2 Oct 2024 18:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89570C4CEC2;
	Wed,  2 Oct 2024 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727893953;
	bh=2wvraHRrNZL3GX/oLWBMK86rPMuNcMNDkYkvoZi0fHY=;
	h=From:To:Cc:Subject:Date:From;
	b=nDncpNKJNRsSPBg6/3RYt54fQRLTebIkLBFIP5zFtPPdCa80v2Hz1R6f20aiZkXvL
	 BBd/i69M8MKE0d+1snBzHN4810scoQeyCJ7f6SXhdnKwUZRKlyhYiF9fAcb5nHqW7d
	 wbrQxFtcp7cg9UnCJqpdD2kONvWf8QB5DtWnCQwP3ynSao2mvFheP6ru77f/s32EU2
	 AO3hZCoO1g5JLfBz5pQuhreZqDIHsTfpBZVrbNrg1uQnnx/s8o8DVQP/kEwrkCm5oY
	 3pvo4fJHRG748T8FcFkefTP4ieUg+EMGWv4MkhkTTN4huyotRHhNaTpvueADuVPW81
	 YiPpYlR2vm1XA==
Message-ID: <5f818aaf36b2430322c003fc92b605d3.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc1
Date: Wed, 02 Oct 2024 19:32:27 +0100
Message-ID-Hash: 3UPRHQB7NJZRKAUCK5XE7LZVOBQEOY5S
X-Message-ID-Hash: 3UPRHQB7NJZRKAUCK5XE7LZVOBQEOY5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UPRHQB7NJZRKAUCK5XE7LZVOBQEOY5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc1

for you to fetch changes up to eb1df4bbf53c29babf68fcb36e80d9c62a345257:

  qrb4210-rb2: add HDMI audio playback support (2024-10-02 18:38:11 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.12

A bunch of fixes here that came in during the merge window and the first
week of release, plus some new quirks and device IDs.  There's nothing
major here, it's a bit bigger than it might've been due to there being
no fixes sent during the merge window due to your vacation.

----------------------------------------------------------------
Alexey Klimov (3):
      ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
      ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
      ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string

Andrei Simion (1):
      ASoC: atmel: mchp-pdmc: Skip ALSA restoration if substream runtime is uninitialized

Bard Liao (1):
      ASoC: Intel: soc-acpi-intel-rpl-match: add missing empty item

Charles Han (1):
      ASoC: intel: sof_sdw: Add check devm_kasprintf() returned value

Charles Keepax (1):
      ASoC: Intel: soc-acpi: arl: Fix some missing empty terminators

David Lawrence Glanzman (1):
      ASoC: amd: yc: Add quirk for HP Dragonfly pro one

Hui Wang (1):
      ASoC: imx-card: Set card.owner to avoid a warning calltrace if SND=m

Mark Brown (3):
      Merge existing fixes from asoc/for-6.12 into new branch
      ASoC: Intel: soc-acpi: Fix missing empty terminators
      qrb4210-rb2: add HDMI audio playback support

Miquel Raynal (1):
      ASoC: dt-bindings: davinci-mcasp: Fix interrupts property

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Corrects cs35l45_get_clk_freq_id function data type

Shengjiu Wang (1):
      ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit

Tang Bin (1):
      ASoC: topology: Fix incorrect addressing assignments

Vijendar Mukunda (1):
      ASoC: amd: acp: don't set card long_name

Wolfram Sang (1):
      ASoC: dt-bindings: renesas,rsnd: correct reg-names for R-Car Gen1

 .../devicetree/bindings/sound/davinci-mcasp-audio.yaml       |  2 +-
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml    |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c                         |  5 -----
 sound/soc/amd/yc/acp6x-mach.c                                |  7 +++++++
 sound/soc/atmel/mchp-pdmc.c                                  |  3 +++
 sound/soc/codecs/cs35l45-tables.c                            |  2 +-
 sound/soc/codecs/cs35l45.h                                   |  2 +-
 sound/soc/codecs/lpass-rx-macro.c                            |  2 +-
 sound/soc/fsl/fsl_sai.c                                      |  5 ++++-
 sound/soc/fsl/fsl_sai.h                                      |  1 +
 sound/soc/fsl/imx-card.c                                     |  1 +
 sound/soc/intel/boards/sof_sdw.c                             | 12 ++++++++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c            |  2 ++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c            |  1 +
 sound/soc/qcom/sm8250.c                                      |  1 +
 sound/soc/soc-topology.c                                     |  4 ++--
 17 files changed, 40 insertions(+), 13 deletions(-)
