Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABC4D6974
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:25:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F741AA6;
	Fri, 11 Mar 2022 21:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F741AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030344;
	bh=pGNMk223h4BZ8m+prGReU7UbXwhhVVjRPjPkB2jb8y8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPRrZzqTESegKRmKFKubUjiAlLqE3sbvIc7xBYnoi1wYVSBnUyVg0Uyzzx1u9FqVh
	 aCW9Zj6grbKBhkPWgLaIpj4MhhyoArGQHkqO1BI6kLp0iviiHsSBdbdJTx9++0HdGi
	 75u76GeYAP4HzTaPdE/xFp6jvsaUxI4I6MYB2klA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EFF2F8052E;
	Fri, 11 Mar 2022 21:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67788F80527; Fri, 11 Mar 2022 21:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A423AF804AE
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A423AF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u5Ht8ZbD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53A1A61F70;
 Fri, 11 Mar 2022 20:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D87EC340EC;
 Fri, 11 Mar 2022 20:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030169;
 bh=pGNMk223h4BZ8m+prGReU7UbXwhhVVjRPjPkB2jb8y8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=u5Ht8ZbDzkpWZ8m5f0kxcEgcZyYxQIgDm4ATBKSKxQ8itzTEwgnVTnkOT4aIiqWgE
 5TSEzB+GG2XqveNNbC8ia/hvmcR+ke9wM68JN8jNlXzahzwBYra2OchOyq58yfdlmo
 ZULBRb00Iuz7x6xTW3Y89YvwFpdaMOSC86jPc9ad9LNSJChLRlgl1CAtHKVbEahQ9q
 04I1r6+7RJRiU4rj1mrJQAloepdVjk7W1kDzisRzv863SIUGUbrUykCU9DL93CIOzG
 RauX3FYXDDQZFZoEgxa6ebLF0tWYwe7Gitm2MUI71SPyU1N0Qs3qnlrHtG5qZS9qxd
 iq6Te0CE06xAw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Message-Id: <164703016723.264137.1929793280515599976.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: rad@semihalf.com, upstream@semihalf.com, harshapriya.n@intel.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 11 Mar 2022 16:35:27 +0100, Cezary Rojewski wrote:
> A continuation of cleanup work of Intel SST solutions found in
> sound/soc/intel/. With two major chapters released last year catpt [1]
> and removal of haswell solution [2], time has come for Skylake-driver.
> 
> Througout 2019, 2020 and 2021 Skylake-driver has had many fixes applied
> and even attempts of refactors as seen in fundamental overhaul [3], IPC
> flow adjustments [4] and LARGE_CONFIG overhaul [5] series.
> Unfortunately, story repeats itself - problems are found within the core
> of a driver. Painting it with different colors does not change the fact
> that is it still a house of cards. As changes needed to address those
> issues would make Skylake solution incompatible with its previous
> revisions, a decision has been made to provide a new solution instead.
> In time it would deprecate and replace Skylake-driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ALSA: hda: Add helper macros for DSP capable devices
        commit: c19bd02e9029f0f75b58f4b8662527da74be8985
[02/17] ASoC: Export DAI register and widget ctor and dctor functions
        commit: da0398099a83483014adc509a2845c88ccf672af
[03/17] ASoC: Intel: Introduce AVS driver
        commit: 9fe51c559a862d6c884f6784de26c8f9463187b1
[04/17] ASoC: Intel: avs: Inter process communication
        commit: 2879516fcd6d7ec5972762dbd94859d9221e70d8
[05/17] ASoC: Intel: avs: Add code loading requests
        commit: cb1eb6b5be42799d23f81ffde84ee3537365b0ed
[06/17] ASoC: Intel: avs: Add pipeline management requests
        commit: b956b27b477ae63e92240f813c1027de601df11f
[07/17] ASoC: Intel: avs: Add module management requests
        commit: f14a1c5a9f830025dc8638303ddefd5f731ae4bc
[08/17] ASoC: Intel: avs: Add power management requests
        commit: 469e87ca9a2029c325362496c7b589683a382505
[09/17] ASoC: Intel: avs: Add ROM requests
        commit: 25f414fcdb875e4203ff43f42898367c32df4827
[10/17] ASoC: Intel: avs: Add basefw runtime-parameter requests
        commit: 3322e1688953966da15fcd0ae3183a351e241ea3
[11/17] ASoC: Intel: avs: Firmware resources management utilities
        commit: c1a427e8da9332a5832fd4a5429adede34bfa85f
[12/17] ASoC: Intel: avs: Declare module configuration types
        commit: 580a5912d1fe774f9902b614fa33e1add92ca749
[13/17] ASoC: Intel: avs: Dynamic firmware resources management
        commit: 215e67b2d2de1d8d34a53c440b9a19a732ee6fb0
[14/17] ASoC: Intel: avs: General code loading flow
        commit: b27f452317236b0cbaa94c4498f8241e2ad871b1
[15/17] ASoC: Intel: avs: Implement CLDMA transfer
        commit: 45864e49a05aa446b9d99c464c1a9f46956ed32c
[16/17] ASoC: Intel: avs: Code loading over CLDMA
        commit: 65794fe1a5f6f5fb10fa7b71a762158332144855
[17/17] ASoC: Intel: avs: Code loading over HDA
        commit: 092cf7b26a48a542d9aabfc0f517fa263102a4c1

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
