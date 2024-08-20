Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2395874F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 14:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0C5F825;
	Tue, 20 Aug 2024 14:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0C5F825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724158105;
	bh=X5AoTVD2yE9lBdfJaMp7zgH0CVmec+oU9/W/US1mxYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eInklUyz+jIPzmVrzzyyvcuVHW87bw/yX2p5obC6AOsJ6Ez50ybV+wbPoA8nfpGW+
	 SffwxZdLX5MALgix6HOfMUPJvV5TH6Gv7rLAJ+EWvaFs9Hide/RdD+S6YuCSh0PEVl
	 nws04QRSbNRUAfXWNu/ZpkR1pSkNE3uHItME+Tew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2976BF805B6; Tue, 20 Aug 2024 14:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91CCDF805A0;
	Tue, 20 Aug 2024 14:47:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E15FF80496; Tue, 20 Aug 2024 14:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75F9AF800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 14:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75F9AF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LGnUwoun
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C49D6CE0A1D;
	Tue, 20 Aug 2024 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5F0C4AF0B;
	Tue, 20 Aug 2024 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724157856;
	bh=X5AoTVD2yE9lBdfJaMp7zgH0CVmec+oU9/W/US1mxYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LGnUwounOuvqdN05+yU1aQcTJbE0hT49SS9F7DMKvQpPp5hpPp2FBRhfh/kLt6LMP
	 VsMAb7iBmXl862jOIQgZvVrP060bqNysRnwUR70OESRk7UQsgVPces+QVOBGRMYKWT
	 UUnbGpDPWbFiplhLgYCwQf3ka99O0zWo37CNLZVIeuheiMHwjTS/7zujlCcoFQmpTX
	 v1galI7YaaOYMrFjBOlYnZvCXh3bbRq45Vc+gU7AY9jf8WnRJ/ZN7ELdKjPAgskkvx
	 r5PbF4YIzAoDwfVCgCCwIhirTTs7x7ybgmqi+wvl9MZ3XMesPSz81zEUVCgF5k75kd
	 jsPbpzMdiN34w==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
 lmajczak@google.com
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Message-Id: <172415785444.39606.12714679433175466185.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 13:44:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ZQJAPACFUNWAUK3X32SOLZ3XPVWYOC27
X-Message-ID-Hash: ZQJAPACFUNWAUK3X32SOLZ3XPVWYOC27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQJAPACFUNWAUK3X32SOLZ3XPVWYOC27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Aug 2024 10:39:15 +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ALSA: hda: Move SST device entries to AVS
        commit: ec7bccd770b628a465458194aeac4408cdcc5ccd
[02/14] ASoC: Intel: Drop skl_machine_pdata usage
        commit: cd5c4dd97f35cd7cf772fc8c12738bd971cbb58e
[03/14] ASoC: Intel: Remove bxt_rt298 board driver
        commit: 4d61ed7609d8b8fef71f78db6a8ac3221a46ea17
[04/14] ASoC: Intel: Remove bxt_da7219_max98357a board driver
        commit: fa07502e01569b39265008bac783a1202a7560e5
[05/14] ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
        commit: a08b5fde945ef8b427d2d29515a806fe571d7639
[06/14] ASoC: Intel: Remove kbl_rt5663_max98927 board driver
        commit: 1af24289751253e58850ba572c584f7e6b1caa87
[07/14] ASoC: Intel: Remove kbl_rt5660 board driver
        commit: 1a40ef882fee37006243ebf0b4848c7811672fe2
[08/14] ASoC: Intel: Remove kbl_da7219_max98927 board driver
        commit: 1daa8dce04619f39d4d8ee43ae2a0cec9ab31897
[09/14] ASoC: Intel: Remove kbl_da7219_max98357a board driver
        commit: 15d6966580f3e40fe2f4ecfcde2edd69cc5508e9
[10/14] ASoC: Intel: Remove skl_rt286 board driver
        commit: 51d8e9b20db840e78e0d1ff585cf4c8eb4e091b0
[11/14] ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
        commit: 4dbf2f9a725d1370d67f9a3bce2f33e913b57e52
[12/14] ASoC: Intel: Remove skl_nau88l25_max98357a board driver
        commit: 6de8dddc56b0577df996212b634f82f6f1fb013c
[13/14] ASoC: Intel: Remove skylake driver
        commit: 46e211411113932be1fd31580a03502466648f91
[14/14] ASoC: Intel: avs: Enable by default for all SST configurations
        commit: 526139aff1d14c5a2cc0a769c063f439444c61c2

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

