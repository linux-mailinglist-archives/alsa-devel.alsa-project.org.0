Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F84DB996
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49541896;
	Wed, 16 Mar 2022 21:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49541896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463239;
	bh=dBHX5m8i+01XSpcJLv6mNJKXecy8Zi7KCldH3DoFIos=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9vcFfjPFJhWtWPxSRkeK5+vY/kEDd/Tjs1IRMzMyy5mtJh4bL/1BrkeECC+5xucH
	 k52wZ55z5jJpRvaTFdeRqtieyihw0csRq5UCYygAX4zRUdBSLM0GYbfNGnW9Vu/oiv
	 d38U68Hcmh1I3D29oekuoLJclv+6E5GmmkN+v6dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2236FF8055C;
	Wed, 16 Mar 2022 21:36:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0821EF8055A; Wed, 16 Mar 2022 21:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59892F80559
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59892F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hWO9u6TT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0744E6144C;
 Wed, 16 Mar 2022 20:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2419AC36AE3;
 Wed, 16 Mar 2022 20:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462972;
 bh=dBHX5m8i+01XSpcJLv6mNJKXecy8Zi7KCldH3DoFIos=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hWO9u6TTOEanKTXo6J8jfp3vgJfpccEa8M97+te/khlYCmcorlxMT07jdI8RzkI63
 CQ9AG8tiIZn+hSMY6FrKI0aNDzSJAFJXXa1JY5gX3YXM6jOoh+dfDOrPOKw3+LY75P
 KXgDs2V39Yg82EOlOMDX13cw6WugmH4nMtCAYcNvXOFIcRG9JcY/AZjEM/ck2CS9Ox
 Xp/heMjOsx7gs1t9pv7phRFU0RIlEjc4ZaX/k5cWtA5KqKTafLeEzGofKTeepv64f+
 VdTq8S6Gjq0rEXxF63gSEf2CdCGd14EgdwrSwKpxAaZyewvjocZnyXfz4jjrGHojEH
 TScfi7myCMp6g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/18] Introduce IPC abstraction for SOF topology parsing
Message-Id: <164746297181.1220201.7417837304168404411.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:36:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com
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

On Mon, 14 Mar 2022 13:05:01 -0700, Ranjani Sridharan wrote:
> This patchset makes the topology parsing layer in the SOF driver
> IPC-agnostic in preparation for supporting the new IPC version
> introduced in the SOF firmware. These patches purely contain abstraction
> changes for the current IPC version (IPC3) supported and do not introduce
> any functional changes.
> 
> Ranjani Sridharan (18):
>   ASoC: SOF: Introduce struct snd_sof_dai_link
>   ASoC: SOF: IPC: Introduce IPC ops
>   ASoC: SOF: topology: Add helper function for processing tuple arrays
>   ASoC: SOF: Introduce IPC3 ops
>   ASoC: SOF: topology: Make scheduler widget parsing IPC agnostic
>   ASoC: SOF: topology: Make buffer widget parsing IPC agnostic
>   ASoC: SOF: topology: Make pga widget parsing IPC agnostic
>   ASoC: SOF: topology: Make mixer widget parsing IPC agnostic
>   ASoC: SOF: topology: Make mux/demux widget parsing IPC agnostic
>   ASoC: SOF: topology: Make src widget parsing IPC agnostic
>   ASoC: SOF: topology: Make asrc widget parsing IPC agnostic
>   ASoC: SOF: topology: Make siggen widget parsing IPC agnostic
>   ASoC: SOF: topology: Make effect widget parsing IPC agnostic
>   ASoC: SOF: topology: Make route setup IPC agnostic
>   ASoC: SOF: topology: Make DAI widget parsing IPC agnostic
>   ASoC: SOF: topology: Make control parsing IPC agnostic
>   ASoC: SOF: topology: Make widget binding IPC agnostic
>   ASoC: SOF: topology: remove snd_sof_complete_pipeline()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: SOF: Introduce struct snd_sof_dai_link
        commit: 0af0f4633adfa211807262af4d446b09698df6c8
[02/18] ASoC: SOF: IPC: Introduce IPC ops
        commit: 226abb759063ca53a32c1570d058db03b7850fdf
[03/18] ASoC: SOF: topology: Add helper function for processing tuple arrays
        commit: d87524bf9aab511906e7e9bab90198510c28149f
[04/18] ASoC: SOF: Introduce IPC3 ops
        commit: 7006d20e5e9d25c079a82e2bc0ea7e292fdea6e6
[05/18] ASoC: SOF: topology: Make scheduler widget parsing IPC agnostic
        commit: 2141b55d9174c7aa5b32da95a2caa807a018968a
[06/18] ASoC: SOF: topology: Make buffer widget parsing IPC agnostic
        commit: 6bd0be1c29dc0c9b69636f11f80071d46e1e2285
[07/18] ASoC: SOF: topology: Make pga widget parsing IPC agnostic
        commit: 8a2e4a734f5ecbc48a3227c8ad68c12a71272c79
[08/18] ASoC: SOF: topology: Make mixer widget parsing IPC agnostic
        commit: 30f4168024e91e85aff9edcef561715ed271b34c
[09/18] ASoC: SOF: topology: Make mux/demux widget parsing IPC agnostic
        commit: 683b54ef603825328859d867aabf9a6d973238a2
[10/18] ASoC: SOF: topology: Make src widget parsing IPC agnostic
        commit: 8d8b1293473022953ed316c3e0c723ff5a1505ac
[11/18] ASoC: SOF: topology: Make asrc widget parsing IPC agnostic
        commit: cb7ed49acf585d45c1140660d076b389de7d468e
[12/18] ASoC: SOF: topology: Make siggen widget parsing IPC agnostic
        commit: 111d66f62e9bf49ff33631c4e81efdcc4a54b88f
[13/18] ASoC: SOF: topology: Make effect widget parsing IPC agnostic
        commit: f2cf24a1afa836be44dd2abdf7896b236df8d9a2
[14/18] ASoC: SOF: topology: Make route setup IPC agnostic
        commit: 85ec8560893cb9aae2728dd12f59537b6247d91f
[15/18] ASoC: SOF: topology: Make DAI widget parsing IPC agnostic
        commit: 909dadf21aae8f7e604973218907ed39e10499e6
[16/18] ASoC: SOF: topology: Make control parsing IPC agnostic
        commit: b5cee8feb1d482a9d07b677f4f2f9565bacda53e
[17/18] ASoC: SOF: topology: Make widget binding IPC agnostic
        commit: 8ef1439c51048b9359a8d1be2360dd4cd9848a77
[18/18] ASoC: SOF: topology: remove snd_sof_complete_pipeline()
        commit: 61ad28ff6cf349c3e25f6c4a56ce4d140c003d19

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
