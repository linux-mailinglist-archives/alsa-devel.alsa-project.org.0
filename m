Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14832B863E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 22:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D5E1732;
	Wed, 18 Nov 2020 22:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D5E1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605733414;
	bh=oKVEpubtqBeNd7SMBUNKlx7beTf1Fc0FlZ1f78pTxdY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5knIsZjtqmLd+ifin9h+qVoDm55fgVVKxPSl+QeMWbvmCrbVSh660EjUfXKkvEbS
	 miPWP0eYBMMQ1uc+x//Xqoh/WaTWgicP5ebREJ3YFe23nujyCcnt0MmnMluNPZzYwf
	 iLfL3XRtGhBpaJbIZJ5MYz1Fha2Svias0rkLxFNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D50F804ED;
	Wed, 18 Nov 2020 22:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B33ADF804EC; Wed, 18 Nov 2020 22:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C883FF804E7
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C883FF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YzIMz2OB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F21A246CE;
 Wed, 18 Nov 2020 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605733198;
 bh=oKVEpubtqBeNd7SMBUNKlx7beTf1Fc0FlZ1f78pTxdY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=YzIMz2OBHaD4uu63Bb38Xn++RnLTS1OBtKT4XB9Awu8ePrZ5ZxdxzgG2yJbfxuBzv
 P6Yop8z/cqWjymIrAyUrwkI7Bp3cREDmwA/NuiqvFkBEFckr+Q5ypaF8AJ8MBLMxOK
 TgnEuT2zpfprifmsTxK5kfSOxYFqfclxrhIfag8I=
Date: Wed, 18 Nov 2020 20:59:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7pt7v93.wl-kuninori.morimoto.gx@renesas.com>
References: <87h7pt7v93.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/12] ASoC: soc-component: add snd_soc_component_xxx()
Message-Id: <160573314459.46437.16859252305586667772.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 13 Nov 2020 13:14:38 +0900, Kuninori Morimoto wrote:
> These are v2 of snd_soc_component_compr_xxx() function patches.
> I think component related function should be implemented at
> soc-component.c, otherwise it is confusable to read.
> These are for it.
> 
> v1 -> v2
> 	- fixup function return timing on
> 		snd_soc_component_compr_get_params()
> 		snd_soc_component_compr_get_metadata()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: soc-component: add snd_soc_component_compr_open()
        commit: a4e427c59a266dc3eb0eb5d52879b067a6f6e73b
[02/12] ASoC: soc-component: add snd_soc_component_compr_free()
        commit: dbde5e21140cd2ad9d9e8eeeb104755f5294ce9f
[03/12] ASoC: soc-component: add snd_soc_component_compr_trigger()
        commit: 08aee25114426ba988ccb27af057dcf7faaa61ac
[04/12] ASoC: soc-component: add snd_soc_component_compr_set_params()
        commit: ff08cf80addacbf42d419c2ef5561562f765bda3
[05/12] ASoC: soc-component: add snd_soc_component_compr_get_params()
        commit: 77c221ecfed8762f65d17f3a6ee7b4f2cec61ae4
[06/12] ASoC: soc-component: add snd_soc_component_compr_get_caps()
        commit: d67fcb2d8f15df6f98698f411d9cb8c221ab6c91
[07/12] ASoC: soc-component: add snd_soc_component_compr_get_codec_caps()
        commit: 0f6fe09720a3f307ab9f218f052d40b7d4e42b4c
[08/12] ASoC: soc-component: add snd_soc_component_compr_ack()
        commit: 0506b88503645e71c18152693caee9cfa1dbf093
[09/12] ASoC: soc-component: add snd_soc_component_compr_pointer()
        commit: 03ecea64e0ae26d7a8b53bce05a39b78022e1312
[10/12] ASoC: soc-component: add snd_soc_component_compr_copy()
        commit: b5852e66b115172dc3a88cb476b99c21ac6ffed8
[11/12] ASoC: soc-component: add snd_soc_component_compr_set_metadata()
        commit: 1b308fb138eba8dd57198b25235d8369a42af293
[12/12] ASoC: soc-component: add snd_soc_component_compr_get_metadata()
        commit: bab78c238025c89df771631c54f6229f6c56fb26

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
