Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A944593326
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAD731660;
	Mon, 15 Aug 2022 18:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAD731660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580791;
	bh=klkdRZjVUCbKPYpLrXmZGgCw2bm0eoGm07/vH67fHm0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVHsG40mSntuK+VsAqMvd7JyzSMXmblg83FFWC1Ox9ha4WNKXqHOgnu6emj1rI4fk
	 K7e7CXtUo4x01U4vq4WZ1VdvsNY3twDidVLFS4xi1tMJQBW88/VKbco8isn5+9sTM3
	 7NOeFKoE9rsCvb9q9AUbPy9cFsOmCtuCdycJVf3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C742F805A9;
	Mon, 15 Aug 2022 18:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D34B4F8057C; Mon, 15 Aug 2022 18:23:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E3ACF8057A
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E3ACF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BMdZqWCx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88C28B80FE3;
 Mon, 15 Aug 2022 16:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4280CC433C1;
 Mon, 15 Aug 2022 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580595;
 bh=klkdRZjVUCbKPYpLrXmZGgCw2bm0eoGm07/vH67fHm0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BMdZqWCxmbAZX9JDyxke8qQpRlT4L+NPW1DcofI0qztzENni/UHoGA4svFEfyS8eW
 RqXzeZb/7U98PyFyDzofA4055jKsxu6Hcwvo+nla/MLrvX61504i+UrtPpAF27M3/j
 RnQdzNuauvgthRMCZij2EVvk3stf8NFty1+Iojwfrod7oHg5HMSoliBpVrzmi4e9ro
 dL3rQJG+efXyn6eCW8dBDYL0GGoIs+ZWjsg9f9wDuZ2Q+/4IcJQJ6NAKIp5avGaoyI
 POgTa3GKjiCzJraX0miXU5ZDd8NRAV/YqDR6VLYzpuDW8K+WJ3hz/TGaW9gJTxgnMD
 F/Qkb+C00iJuw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Sameer Pujar <spujar@nvidia.com>, robh+dt@kernel.org,
 tiwai@suse.com, 
 krzysztof.kozlowski+dt@linaro.org, kuninori.morimoto.gx@renesas.com,
 perex@perex.cz
In-Reply-To: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
References: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v3 0/3] DT binding for sample format conversion
Message-Id: <166058059299.769843.16903933604865911201.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 8 Aug 2022 10:57:29 +0530, Sameer Pujar wrote:
> DT binding properties are available to fixup rate and channel
> parameters of a DAI. This series extends this to sample format
> conversion as well. With this now DAI PCM parameters (channels,
> sample rate and sample format) can be fixed up as necessary in
> an audio path.
> 
> Changelog:
> ==========
>   v2->v3:
>   -------
>     * Fix DT binding errors in simple-card.yaml
>     * Drop simple-card binding changes from the series since
>       there is no usage requirement. It can be extended later
>       when necessary.
>     * Use definitions instead of properties in the common schema
>       and re-use this in audio-graph related bindings.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Definitions for DAI params
      commit: b79b6220a753995b80054916f1f8f037113d8d93
[2/3] ASoC: dt-bindings: Add sample format conversion
      commit: 955927873d82c5127e31e618703d804033a93e4f
[3/3] ASoC: simple-card-utils: Fixup DAI sample format
      commit: 047a05366f4bb2e32eabbd3c8990d1d91ab87c89

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
