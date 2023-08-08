Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D21774333
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 19:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A233684A;
	Tue,  8 Aug 2023 19:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A233684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691517535;
	bh=y23kRNRD8ekqEblXp/2C6XQ8wqkBZcYL0kEbohOM+I4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amQCqF+V1hGqoVuDu+F2t7oqQZd7d4RCIizjK2+HHMcPqSm3qDkAzvVRrUn4JWA0U
	 2eOcKUPOop3IEjoICDmYCR0JhrHo8B1106RT16sLOTr+XYUAIXMcSkLQeGPBMGAmMa
	 T2/Hsl/kOSHPhgk5knrh1U5wN78npD1RhwO/ENOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D96F8056F; Tue,  8 Aug 2023 19:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC0BF80538;
	Tue,  8 Aug 2023 19:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E98AF80544; Tue,  8 Aug 2023 19:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23E81F80154
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 19:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E81F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mw2G+1Dn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D74D62971;
	Tue,  8 Aug 2023 17:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED84C433C7;
	Tue,  8 Aug 2023 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691517424;
	bh=y23kRNRD8ekqEblXp/2C6XQ8wqkBZcYL0kEbohOM+I4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mw2G+1Dn5Jjjx9SVd8hOTEu6saCBYfG4kkn1zBC4IfRt6rfM3P5WxaDrv0jihXICq
	 I4qJZPEWrm2YewJ9vPqO3s0p3Rcr4SYaVWO1KyfJ1vwmymgVJU1ennZ+GWn/Evk7dJ
	 bwM4tdygaAdCNhM3PflsIRev6UKxqjqD6ZZHcln9EyoRhhVJQt/005zeRkZocV3/hF
	 lDdqwl50B/XXMIm3yiFX7yx7/F0/Gn9XLcYikDrsXdz6SBNZCNIOf2wW7H9ki3ruul
	 82n2/8cl0TsepBooGoYIKMV2YOTEyzkZ7ce9/e8+JWLdBMZyVvU08vUYwwjIXf2OIm
	 9izkiBfEK/+2g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, vkoul@kernel.org
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/20] ASoC: SOF: Intel: add LunarLake support
Message-Id: <169151742284.78353.12632136311395145877.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 18:57:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 3TRLN3WZF5ZMX4PPBXPMJX7QVTC64FJ2
X-Message-ID-Hash: 3TRLN3WZF5ZMX4PPBXPMJX7QVTC64FJ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TRLN3WZF5ZMX4PPBXPMJX7QVTC64FJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Aug 2023 16:09:39 -0500, Pierre-Louis Bossart wrote:
> IMPORTANT NOTE: this patchset is dependent on Takashi's hda-intel-6.6
> tag. The PCI parts will not compile without merging this tag into the
> ASoC tree.
> 
> This patchset first fixes a number of errors made in the hda-mlink
> support, then adds Lunar Lake definitions. The main contribution is
> the hda-dai changes where the HDaudio DMA is now used for SSP, DMIC
> and SoundWire. In previous hardware the GPDMA (aka DesignWare) was
> used and controlled by the audio firmware. The volume of code is
> minimized with the abstraction added in previous kernel cycles.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: SOF: Intel: hda-mlink: fix off-by-one error
        commit: 7075b0c91b3cd5d32b4ac7403f771a3253d3fbf6
[02/20] ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
        commit: 7a52d7062e02af4a479da24b40cfd76b54c0cd6c
[03/20] ASoC: SOF: ipc4: avoid uninitialized default instance 0
        commit: defc0c638d20eec17ebb3dbf82709aba1ac2f0d4
[04/20] ASoC: SOF: ipc4-topology: restore gateway config length
        commit: ef8a29bae82fc635952de97fdd3bcf8e29d8c6be
[05/20] ASoC: SOF: Intel: hda: add interface definitions for ACE2.x
        commit: 701c0ba46fabc4715606f840119271a818209357
[06/20] ASoC: SOF: Intel: LNL: Add support for Lunarlake platform
        commit: 64a63d9914a5e9278fcd81c6dbc095fc84b772d2
[07/20] ASoC: SOF: Intel: split MTL and LNL operations
        commit: c22d53279709c46f2e19caf2886e38cee93d07ea
[08/20] ASoC: SOF: Intel: LNL: enable DMIC/SSP offload in probe/resume
        commit: e78576c4aa0d5b7185e1f5188578d9bfb2d43d4b
[09/20] ASoC: SOF: Intel: hda-dai-ops: add/select DMA ops for SSP
        commit: 12547730e5b7c41e2203003cda74f39f43739c53
[10/20] ASoC: SOF: Intel: hda-dai: add ops for SSP
        commit: a8338e76457c14c56bb13fbb16c8607e80498499
[11/20] ASoC: SOF: Intel: hda-dai: add DMIC support
        commit: b6c508b46d84d88e617d8b9f38ffbe60470589d0
[12/20] ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams for first CPU DAI
        commit: f8ba62ac863c33fc0d8ac3f1270985c2b77f4377
[13/20] ASoC: SOF: Intel: hda-dai-ops: add ops for SoundWire
        commit: bb0b992c1bb94e44ba40f82ddb2c4e6d5c9fcc9e
[14/20] ASoC: SOF: Intel: hda-dai: add helpers for SoundWire callbacks
        commit: 2960ee5c4814ee50b7b9f030dd99382623a4d7f0
[15/20] ASoC: SOF: Intel: hda: add hw_params/free/trigger callbacks
        commit: 186ca4b522fec020f0201d4fcef09ea58b4d5701
[16/20] ASoC: SOF: Intel: add abstraction for SoundWire wake-ups
        commit: 9362ab78f175db2003674e008ef1b8917725d502
[17/20] ASoC: SOF: Intel: hda-mlink: add helper to get sublink LSDIID register
        commit: 34e38f03d7e77141ef6879c69ca55fc2a44b9f2e
[18/20] ASoC: SOF: Intel: hda-dai-ops: reset device count for SoundWire DAIs
        commit: 699e146d9ebf42ee2a5d4e4e28f7a49c4aef0105
[19/20] ASoC: SOF: IPC4: clarify 'pipeline_ids' usage and logs
        commit: 1eaff2647eb1dfbaa500fb5f28e032db5ad35b70
[20/20] ASoC: SOF: Intel: hda-mlink: add sublink to dev_dbg() log
        commit: 02c7f8729a5a1e78412177482372c3124edd4d62

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

