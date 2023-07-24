Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07875FF10
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 20:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2683D210;
	Mon, 24 Jul 2023 20:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2683D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690223363;
	bh=Y5BZ90s7VncOPk/FjooP6FsblsLhIzYhA3fNDj4Hjb4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oQRrWT1cZ35CgJ29A5JrvEmUCDFD3pJP5/pC5m7eV3efYyRqQ5htGNtmb/TWbvtl+
	 5U2xHnjdCJ8+LiSzWyUPQgN8CFVAoAcS4TuyiKJnO6iPysaNHccKTL6IWLsn+tC4if
	 0uVBsfDVS3jh+YScgUCtu25A+kJHyYafzWihzCHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 692BFF80163; Mon, 24 Jul 2023 20:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D90F80163;
	Mon, 24 Jul 2023 20:28:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78155F8019B; Mon, 24 Jul 2023 20:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D88F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 20:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D88F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yx/KqbS8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 965B861368;
	Mon, 24 Jul 2023 18:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9648CC433C7;
	Mon, 24 Jul 2023 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690223289;
	bh=Y5BZ90s7VncOPk/FjooP6FsblsLhIzYhA3fNDj4Hjb4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yx/KqbS8eULe1hAuvi7MQ2Y+vpce4EGyxZpfKKmrHEaPLAKAm+9QztqMv/+s0JPPf
	 q0GAvn+H5cjTQF7qgRmjfA0WC6l6hNc30+YAR+s7jnc1titTuLx7gGczDnDxIxLpOV
	 xNY96uzVYOooRSuwQAiXw9+quHy+VnGoQ6+9RBa9zS+YFYMHYFReim/yLpGUIJqg4M
	 KurdvqfmMY/IikXg2INw0ETdzmlZ4/VnCKSD0s2hTY8tUafmYMOEtD41+o471KnUCq
	 t9okbb57wKPZp5dpQvGqn39AsyVuvE5AMCqa/XLD9lIhniq+lZPRra3+NK6CCtf9jU
	 j6ME4n4ZeXG+g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: perex@perex.cz, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v5 00/11] ALSA: hda: Adding support for CS35L56 on HDA
 systems
Message-Id: <169022328831.1044066.6080075080661040862.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 19:28:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: TERSOEN5EOSURYH2RBOAO6FALUPYT6AV
X-Message-ID-Hash: TERSOEN5EOSURYH2RBOAO6FALUPYT6AV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TERSOEN5EOSURYH2RBOAO6FALUPYT6AV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 14:21:09 +0100, Richard Fitzgerald wrote:
> This set of patches adds support for using the CS35L56 boosted smart
> amplifier on HDA systems. In these systems the CS35L56 audio is
> routed through a HDA-to-I2S bridge codec.
> 
> This doesn't include the changes to the Realtek driver to actually hook
> up the CS35L56 driver, because we don't yet have the QUIRK IDs to
> associate it with. But we want to publish the driver now so that it is
> available for bringing up hardware with the CS35L56.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: cs35l56: Move shared data into a common data structure
        commit: 898673b905b9318489430663083f629bc38c7461
[02/11] ASoC: cs35l56: Make cs35l56_system_reset() code more generic
        commit: cf6e7486de80b680fe178a6517dd7c4166a12dbc
[03/11] ASoC: cs35l56: Convert utility functions to use common data structure
        commit: 0a2e49230f7f1796aa79c532426d56e8739ee4b1
[04/11] ASoC: cs35l56: Move utility functions to shared file
        commit: 8a731fd37f8b33026e545f5ee5cdd7b9a837cbeb
[05/11] ASoC: cs35l56: Move runtime suspend/resume to shared library
        commit: 9974d5b57697770cba2a99c6fe925d01152cd544
[06/11] ASoC: cs35l56: Move cs_dsp init into shared library
        commit: 22e51dbb257a218e43de42764b5bdc5302f27cd1
[07/11] ASoC: cs35l56: Move part of cs35l56_init() to shared library
        commit: 84851aa055c890f2ea731a128e8feb64520c2c8e
[08/11] ASoC: cs35l56: Make common function for control port wait
        commit: f32a2bcbc092d60ba8a1b00a22607b220d53a25e
[09/11] ASoC: cs35l56: Make a common function to shutdown the DSP
        commit: 444dfa0912639fb2431553e8e54d2b35fdf590c2
[10/11] ALSA: hda: Fix missing header dependencies
        commit: 64e05321506261b737abdbfc7a82144f30d0a925
[11/11] ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier
        commit: 73cfbfa9caea8eda54b4c6e49a9555533660aa1e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

