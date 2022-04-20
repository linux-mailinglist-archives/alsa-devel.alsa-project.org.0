Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055D50923E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92621B3A;
	Wed, 20 Apr 2022 23:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92621B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650490946;
	bh=KsMvdME4XDrshuTxLf+7wXfZz1rrGdfPnQhfWj9JPSI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6K0Um8h1liLRypSPzrCvz9pihWff+VdHvSFIh9Ehkmyp3DhhuHFrKbPV4vl2mgpC
	 5CSrbbV+R2xF4STUzcqmBnm6oyc6l5mcNVBAP9EX8FA1vUrSH2zTWmKWjZxCZECEP3
	 tzpXWXlvbp9D5N5yoHe8kVFeDznCE79xDZzZ+KiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE19F804FB;
	Wed, 20 Apr 2022 23:40:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C56ABF80125; Wed, 20 Apr 2022 23:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEA51F80116
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEA51F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MFWFHg1f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15690B82194;
 Wed, 20 Apr 2022 21:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B585AC385A0;
 Wed, 20 Apr 2022 21:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490846;
 bh=KsMvdME4XDrshuTxLf+7wXfZz1rrGdfPnQhfWj9JPSI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MFWFHg1fhGAsw7+oGMYk+DskaYZwS88eBsaLFL8I3wj4rAN6raKm+xl8FvS3790dn
 tdqPxcMQUY+GFJ9Pq5LQ9qu5lcaIZCf1/Lwp1xs8iEFGSfYP6gWHD3nu9aWoxycpOe
 GU/hByXp1n+avAUekSV/Gg/t0ehkiA55FrK4i0nw3W++qIP5y7kpcHFKHTUx6At2RY
 o6zrztIWyD100YfSicXV5alImCtZyPWQGdePs+nWN6ME7t1X70C3TFKRh90+AstGdW
 dnFldCOtAFStrtJgxu7kYJbcDB6S/YNxXI0b1NKyP55eO1JB1qZypG5T9La1CIZkwb
 m9AB4Xe3G6+wg==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Topology and path management
Message-Id: <165049084428.138067.13288505967667485632.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
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

On Thu, 31 Mar 2022 15:52:32 +0200, Cezary Rojewski wrote:
> A continuation of avs-driver initial series [1]. This chapter covers
> path management and topology parsing part which was ealier path of the
> main series. The two patches that represented these two subjects in the
> initial series, have been split into many to allow for easier review and
> discussion.
> 
> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: Intel: avs: Declare vendor tokens
        commit: 99a15348d5842b3c1f95220dc9b119ee0fe0d81b
[02/14] ASoC: Intel: avs: Add topology parsing infrastructure
        commit: 34ae2cd536738affaa2c2f32be23aea229b3c309
[03/14] ASoC: Intel: avs: Parse module-extension tuples
        commit: 9e85ec401d038b43d9d6ad8e3f488f865404bab5
[04/14] ASoC: Intel: avs: Parse pplcfg and binding tuples
        commit: 1fba20364318819ecedab2d0f6a68a038f4f47c3
[05/14] ASoC: Intel: avs: Parse pipeline and module tuples
        commit: 276b83c807a2bc2a8d9874a92b7fb7811c2df8b2
[06/14] ASoC: Intel: avs: Parse path and path templates tuples
        commit: eee475bb1ca71e963a51c20cc0f3e7c7b1cd2ba0
[07/14] ASoC: Intel: avs: Add topology loading operations
        commit: d73d1b67ff71e39bb3a04596744fc83047e68a94
[08/14] ASoC: Intel: avs: Support link_mask formatted string
        commit: d48c1ada577588e769b26c3dea0a45e8856bc343
[09/14] ASoC: Intel: avs: Declare path and its components
        commit: f61ad1e9568c854ea49a2f58cf2a0b2877cfad33
[10/14] ASoC: Intel: avs: Path creation and freeing
        commit: 0ef882074eb1fee25083387ea6bc6669d0e24a85
[11/14] ASoC: Intel: avs: Path state management
        commit: c96059993f939fe04427164fb99a32ace8d97f4e
[12/14] ASoC: Intel: avs: Arm paths after creating them
        commit: 84a99908fc7b988067e927834575df42707ec024
[13/14] ASoC: Intel: avs: Prepare modules before bindings them
        commit: 435e25730fe7b3a4e4a8e66028e39597b2524f0c
[14/14] ASoC: Intel: avs: Configure modules according to their type
        commit: 274d79e5187558078fcf107445fe56ab2fbe4c97

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
