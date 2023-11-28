Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4167FBBFB
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 14:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F9A84D;
	Tue, 28 Nov 2023 14:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F9A84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701179784;
	bh=19LV0L4o7RrVySDyn2CdYco7nMORkBVfN1GFrixZSK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aBjHes59ZfE4eYYb5P8Jnvdqgjo3L2Dn2jM6ZRfnxCxOxYPVshNhf1lUdi8NhTXn2
	 yvYC1dpYSQYwpF6YpM8oWyGSTDke0fKjIu89JbHPOK2Y5rVsLQzvnrlVv7N1rQKk4a
	 wQJYEk4ESWsWfv4MaTeQsVZPUx+yzCCIgRNHRdmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC30F80589; Tue, 28 Nov 2023 14:55:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74DB8F80563;
	Tue, 28 Nov 2023 14:55:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F1CF801D5; Tue, 28 Nov 2023 14:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A70FF800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 14:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A70FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fWNYnK7e
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 198F161721;
	Tue, 28 Nov 2023 13:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1FFC433C8;
	Tue, 28 Nov 2023 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701179736;
	bh=19LV0L4o7RrVySDyn2CdYco7nMORkBVfN1GFrixZSK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fWNYnK7eNTRKSkIPdj/vIaOezibTymEioIt87WnPLANPIArV5yxXbSl4aa2PH9SPr
	 rlKCmhMh0kBC9xxithuaJ8TWH8h1+oba4wjWZOSnBNRW8Sf2p2dxyySiIXIWc6Q1N3
	 +SGU3PEd8GJthUzT8H6NLY4gWbE9BkwdN5rONbPvvA8CXphCYi9N8rQkoqXp2GiLYj
	 QGdPfrQ1VX4Vp6zVNcwOBHT0FjFviWBLrm4bUP/OS059xnVVNq7dB/rsTQb56bJA5C
	 lozcHudS2iNUm2dBtaJaG1CQIe4goNd7b4rE+N24agX2LZZfriPvpghRhMeIUAYpi1
	 j4baDWEMWG38w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, cezary.rojewski@intel.com,
 yung-chuan.liao@linux.intel.com, ckeepax@opensource.cirrus.com,
 yong.zhi@intel.com, chao.song@linux.intel.com
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Soundwire related board and match
 updates
Message-Id: <170117973370.2717289.14976871167039211150.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 13:55:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 3ZWBVS6DY36NKEZYKROGYJI4V2VCKMVJ
X-Message-ID-Hash: 3ZWBVS6DY36NKEZYKROGYJI4V2VCKMVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZWBVS6DY36NKEZYKROGYJI4V2VCKMVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 15:34:41 +0200, Peter Ujfalusi wrote:
> A small update for SDW machine support:
> Small fixes for sof_sdw machine driver
> Support for rt722
> New TGL/MTL and LNL match for new configurations
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Intel: sof_sdw: Make use of dev_err_probe()
      commit: 5c0e047ab629bcb5efa94de63fcdc75c9fe69516
[2/7] ASoC: Intel: sof_sdw: remove unused function declaration
      commit: fd8ff49d35f917c65383642c8f8f20656734f3ad
[3/7] ASoC: Intel: sof_sdw: Add rt722 support
      commit: def127feaa8a9d8684ac41139638b079e6e637e2
[4/7] ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config
      commit: 817178e7674bd8ca35344b2212a3105ed75559e5
[5/7] ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
      commit: faca26b6ca90b220cba787ff7c6a05e99528731c
[6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs56l56 support
      (no commit info)
[7/7] ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support
      commit: ed99878462ccc143395987faebda33c50529b116

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

