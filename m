Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB154DE321
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 21:59:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F069188B;
	Fri, 18 Mar 2022 21:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F069188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647637178;
	bh=8H+fSvBCzBGouY+xYIdRW3zBY3G8zCazdYVF6zMIHl0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pt3m5UO76AL1g8iZW+OhaVrDBg828wCZ4wYTj5ErNOE6vzbU6ySvWWaJ4ys+CkwH/
	 dzDPUIKS736/xd1FlK9pARaRugO5uF8b8ISURrNIisxKz4w8Gk59G6SEshY4kx7qNf
	 VgwMqZLksxrzm3D0LpPIidzHml38RP+ZP/YLu/cE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C57F804CF;
	Fri, 18 Mar 2022 21:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23DA2F8026D; Fri, 18 Mar 2022 21:57:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E37F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 21:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E37F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uenWZO+j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E95C60EA9;
 Fri, 18 Mar 2022 20:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62419C340E8;
 Fri, 18 Mar 2022 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647637068;
 bh=8H+fSvBCzBGouY+xYIdRW3zBY3G8zCazdYVF6zMIHl0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uenWZO+jtHNyZKLuv+vHVKTeT9npEFdlcJwxutBFYQV8NQRdal6alhtyHY+sltZF1
 vePdnLQBYGp5dqt7CgTJKka8s7ZkfnawbMLnCXQe2SGBM8UH7uvLAbSQtdUj55Xmnv
 +EdjtBiVXPBrHKf6OpdBa0LGvJpVivd8H+o0Qg2n00p4X2RrF4CbzdbcRXQInMiT79
 HTp6lpROoyZ/jhgHuCducFalc4LA81V43hxBJoBl6QswCXwrNZmzv+BdsZr+GSHiKV
 0SukrFaoRDyGc059nmQ5fAZbeayHk6o/HjJUaDhsrf05oTGc3cqI1NNzDqZhYG4NOk
 PwQGoRJXL30qw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/19] Make the SOF control, PCM and PM code IPC agnostic
Message-Id: <164763706711.2336370.14651131972459901498.b4-ty@kernel.org>
Date: Fri, 18 Mar 2022 20:57:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 17 Mar 2022 10:50:25 -0700, Ranjani Sridharan wrote:
> This series is a continuation to the SOF IPC abstraction work to support
> the new IPC version introduced in the SOF firmware. It makes the top-level
> control IO, PCM and PM code IPC-agnostic. Other than the first patch,
> the rest are purely for abstraction and include no changes in
> functionality.
> 
> Ranjani Sridharan (19):
>   ASoC: SOF: set up scheduler widget before all other widgets in the
>     pipeline
>   ASoC: SOF: Make sof_widget_setup/free IPC agnostic
>   ASoC: SOF: Make sof_suspend/resume IPC agnostic
>   ASoC: SOF: Introduce IPC ops for kcontrol IO
>   ASoC: SOF: Add IPC3 topology control ops
>   ASoC: SOF: Add volume_get/put IPC3 ops
>   ASoC: SOF: Add switch get/put IPC3 ops
>   ASoC: SOF: Add enum_get/put control ops for IPC3
>   ASoC: SOF: Add bytes_get/put control IPC ops for IPC3
>   ASoC: SOF: Add bytes_ext control IPC ops for IPC3
>   ASoC: SOF: Introduce IPC-specific PCM ops
>   ASoC: SOF: pcm: expose the sof_pcm_setup_connected_widgets() function
>   ASoC: SOF: Introduce IPC3 PCM hw_free op
>   ASoC: SOF: Define hw_params PCM op for IPC3
>   ASoC: SOF: Add trigger PCM op for IPC3
>   ASoC: SOF: Add dai_link_fixup PCM op for IPC3
>   ASoC: SOF: expose sof_route_setup()
>   ASoC: SOF: topology: Add ops for setting up and tearing down pipelines
>   ASoC: SOF: Add a new dai_get_clk topology IPC op
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: SOF: set up scheduler widget before all other widgets in the pipeline
        commit: 40c2c63ac40d26bb0b8e17ada32e84541363f1b0
[02/19] ASoC: SOF: Make sof_widget_setup/free IPC agnostic
        commit: 051744b1bf0b13f63af5de3c296d04ab0cc6117c
[03/19] ASoC: SOF: Make sof_suspend/resume IPC agnostic
        commit: 657774acd00f3d63ebae06e5d15a74e013cee0ed
[04/19] ASoC: SOF: Introduce IPC ops for kcontrol IO
        commit: a0149a6bf0b4969a7f732528b2fb6ce32c309dfc
[05/19] ASoC: SOF: Add IPC3 topology control ops
        commit: 10f461d79c2d1afb22344986cc1b4631169cf25e
[06/19] ASoC: SOF: Add volume_get/put IPC3 ops
        commit: 838d04f3e232c3fb8c421959e8ff09e3a918011e
[07/19] ASoC: SOF: Add switch get/put IPC3 ops
        commit: a6668746436824c46b54b3f7fd72523f05f089eb
[08/19] ASoC: SOF: Add enum_get/put control ops for IPC3
        commit: 049307aad2a355f7b44736eeb5795d6d4499fd12
[09/19] ASoC: SOF: Add bytes_get/put control IPC ops for IPC3
        commit: 544ac8858f249950b4d99c68e538cdc07300528f
[10/19] ASoC: SOF: Add bytes_ext control IPC ops for IPC3
        commit: 67ec2a091630c28ea8d05db2bd7178a05b04b7e6
[11/19] ASoC: SOF: Introduce IPC-specific PCM ops
        commit: 967885ee45e48b669e0904a38f6aeb1a09b0d9a1
[12/19] ASoC: SOF: pcm: expose the sof_pcm_setup_connected_widgets() function
        commit: 442c7128219b1769af5685c5453b13711f6b84e2
[13/19] ASoC: SOF: Introduce IPC3 PCM hw_free op
        commit: 4123c24bd13caa8ff633d9e17fa2089d53b1f766
[14/19] ASoC: SOF: Define hw_params PCM op for IPC3
        commit: 621fd48c8cc8d77101a3ac69f7f058d3f8afdbcc
[15/19] ASoC: SOF: Add trigger PCM op for IPC3
        commit: beac3f4cb66fa05e902768ae75ea691c4a2c0911
[16/19] ASoC: SOF: Add dai_link_fixup PCM op for IPC3
        commit: b243b437f4c46b09ec26fc02bea610ace4b45aa2
[17/19] ASoC: SOF: expose sof_route_setup()
        commit: 3816bbea644202fd0a8410e54dbc30bd93f3292c
[18/19] ASoC: SOF: topology: Add ops for setting up and tearing down pipelines
        commit: 31cd6e469364c42c9c929750991c51e83a95e80b
[19/19] ASoC: SOF: Add a new dai_get_clk topology IPC op
        commit: 85f7a8b6e1bea0ad494fb786a5dd7d9715a976d2

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
