Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EF946293
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 19:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AA94207;
	Fri,  2 Aug 2024 19:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AA94207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722620237;
	bh=4Wr4Y1SZPAdpInYbAwmLrq90IUTEkwf2xvn+9KmpZS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DNVv3OZlVLgL9h0l0QcjBsAEPJySPCuf2x+CYccyOhr1T6VmLi/wmsClsaje0d6uT
	 N9qogU6EgOgYnM9GdqyzByygtYbuL9cERoPp4+dKxlgDK1MxjOUAaKJi6fpq9rnCnx
	 SUW6nfSvgodK0q6QCTs4KCegZLHQGS/J8VjNfjb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0E30F805A8; Fri,  2 Aug 2024 19:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2501DF802DB;
	Fri,  2 Aug 2024 19:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0AAFF80269; Fri,  2 Aug 2024 19:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DD16F8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 19:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD16F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EpPM8npd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6267CE1B51;
	Fri,  2 Aug 2024 17:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AE1C32782;
	Fri,  2 Aug 2024 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722620119;
	bh=4Wr4Y1SZPAdpInYbAwmLrq90IUTEkwf2xvn+9KmpZS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EpPM8npd49rftp5obNuoIrM3IJW7OtsPcQcGHHVwxgn206/KtEQR9+JL+O5I3YIYS
	 aAjoOr1IGkl1sZM12UVcMc1VkQF99ysWtMsSXIpsnbBCE7QPO9+S5d2oF+yO6u9tt9
	 ZIJz6CfASxK/guEVf8jPdpE+Qb4zasvBb+721QdsUmq4wipPurPEwTzfzoQQdvRjfj
	 2DL3kWFu+RzzqvAfZiR0AyPs9qrOlPogLBj4T/+BlULnUCAYTmPd3trWQUbZ1ecLtg
	 ummcPQdir9NmG5zRhsi+ZcGRZRmYb7T8P5P0ARaJkpC2Jl13kSYLi/WjfUOxrBCCZE
	 7qlybe4H/aQKg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH RESEND 00/31] AMD SOF based generic SoundWire machine
 driver
Message-Id: <172262011687.68355.5384398343491099389.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 18:35:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: LYNUBC4WY4LAB436EBVJ6JMKVORHK53G
X-Message-ID-Hash: LYNUBC4WY4LAB436EBVJ6JMKVORHK53G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYNUBC4WY4LAB436EBVJ6JMKVORHK53G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Aug 2024 14:44:15 +0530, Vijendar Mukunda wrote:
> This patch series majorly consists of below changes.
> - Rename structures, macros and codec helper names used in Intel
> SoundWire generic driver to make it generic.
> - Move Intel SoundWire driver common structures, macros and codec
> helper functions to common placeholder so that it can be used by
> other platform machine driver.
> - Refactor few SoundWire common codec helper functions.
> - AMD SOF based generic SoundWire machine driver for ACP 6.3 variant.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/31] ASoC: intel: rename codec_info and dai_info structures names
        commit: 6588fcc8833d8338b994edd97a4446bae95ff12c
[02/31] ASoC: intel: rename soundwire common header macros
        commit: 408a454ee8886912cc8a64fcd012e0a1eb30fd0b
[03/31] ASoC: intel: rename soundwire machine driver soc ops
        commit: 96990cfeff61d0a1053dded6d1a4dceafb2f1562
[04/31] ASoC: intel: rename soundwire codec helper functions
        commit: bd5838c8999838059a25a963730bba1face1e53b
[05/31] ASoC: intel: rename maxim codec macros
        commit: a2b5ec0ca5fcd6f609733b37c52e23ddb7328ffd
[06/31] ASoC: intel: rename ignore_pch_dmic variable name
        commit: b1f7cbf0d5746ba270bc090f6f85a4b176410854
[07/31] ASoC: intel/sdw-utils: move soundwire machine driver soc ops
        commit: d39388e6555cb805beb985a7ece1c771c611037c
[08/31] ASoC: intel: move soundwire machine driver common structures
        commit: 73619137c633a89a90f8c8c5fa59171aaff6e913
[09/31] ASoC: intel/sdw_utils: move soundwire machine driver helper functions
        commit: 941d6933eb31b13d09a7293bc92d9d494513a372
[10/31] ASoC: intel/sdw_utils: move dmic codec helper function
        commit: 4776d0c9088634677749e42ae8b36b4da46226db
[11/31] ASoC: intel/sdw_utils: move rtk dmic helper functions
        commit: a9831fd1c0e6353366bbde6e1dd7b15a2dd6d825
[12/31] ASoC: intel/sdw_utils: move rt712 sdca helper functions
        commit: 09c60bc9da91f188e2aedb0bac94d3e129fa20f9
[13/31] ASoC: intel/sdw_utils: move rt722 sdca helper functions
        commit: 89b3456e9afa4c61879f6d744f6d2c6fadc2b2fc
[14/31] ASoC: intel: split soundwire machine driver private data
        commit: 4f54856b4ea460e9048c11e3f698c38fb072529d
[15/31] ASoC: intel/sdw_utils: move rt5682 codec helper function
        commit: 139e17740200d8e92677942bfee6c8cfe4da3009
[16/31] ASoC: intel/sdw_utils: move rtk jack common helper functions
        commit: da5b1831673208e235cadc9107207adb092c2eb9
[17/31] ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
        commit: 8e84fd22dc425fd0b005a20156eeb67f019ae39f
[18/31] ASoC: intel/sdw_utils: move rtk amp codec helper functions
        commit: ccc96ae2814a7faad591af68bd0115e4d2b256b4
[19/31] ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
        commit: 5fa46627d5118bf58b80df45489f49e1e316473a
[20/31] ASoC: intel/sdw_utils: move maxim codec helper functions
        commit: 051b7cb3fde16fd8788078d697d84069b0e50e03
[21/31] ASoC: intel/sdw_utils: move dai id common macros
        commit: 8f87e292a34813e4551e1513c62b7222900481cb
[22/31] ASoC: intel/sdw_utils: move soundwire dai type macros
        commit: 6e7af1fdf7da7f0b79475f573d3c1f49a826bd68
[23/31] ASoC: intel/sdw_utils: move soundwire codec_info_list structure
        commit: e377c94773171e8a97e716e57ec67d49b02ded0b
[24/31] ASoC: intel/sdw_utils: move machine driver dai link helper functions
        commit: 778dcb08832a5e526e447971f7ca72cb6dd2307b
[25/31] ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
        commit: 5bd414c7b80e39ef11bd86db76e726962c1bfc92
[26/31] ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()
        commit: 59f8b622d52e30c5be7f14212c26ca37e810ece9
[27/31] ASoC: soc-acpi: add pci revision id field in mach params structure
        commit: 0b8f009ae92fa94ab3c0ca881fce02c336056a73
[28/31] ASoC: amd: acp: add soundwire machines for acp6.3 based platform
        commit: 57677ccde7522170c50eb44258d54c6584356f47
[29/31] ASoC: SOF: amd: add alternate machines for acp6.3 based platform
        commit: 15049b6a6c19d799095e5dbe9a4772862b11ee23
[30/31] ASoC: SOF: amd: update mach params subsystem_rev variable
        commit: b7cdb4a89cc864ead6470a57947815c49870b09a
[31/31] ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
        commit: cb8ea62e6402067ba092d4c1d66a9440513a572b

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

