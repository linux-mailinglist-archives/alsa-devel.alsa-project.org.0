Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD44681C13
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2545E81;
	Mon, 30 Jan 2023 22:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2545E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675112523;
	bh=WTWM7SqB8xXGbuN9mo4glH+GptrM7/5tgGaUtKQXtpQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uHGfr4HiVPP2HBseHzrgl9qbDXkG3ftTs7u7fBRTilwL0fllfrWncILVauwDxhIb1
	 oVSAdfqv7p/id6OoUDWqjLEo6zGMBn9xd87Dz8yUMh7VT7M5HFk8SQlfPvEJQyPdSv
	 /T9GOZrzSnJvzI2m4FXILYhxqaCukgtHRNlIRKoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3262BF800A7;
	Mon, 30 Jan 2023 22:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56EA0F800A7; Mon, 30 Jan 2023 22:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD196F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 22:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD196F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mxoaS9Sz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A163761262;
 Mon, 30 Jan 2023 21:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6BEC433EF;
 Mon, 30 Jan 2023 21:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675112415;
 bh=WTWM7SqB8xXGbuN9mo4glH+GptrM7/5tgGaUtKQXtpQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mxoaS9Szvk11r18aDgzPv5EHN8uf2loNzdolvsRUP33FG0qZVipXM+1LolBBnrlpH
 nnWRZDOBHObGLpSM89sarZbs6c4z6UHZl2a/fuQ5N5tQUnmGwSca39J+W04lwSxmCy
 lSQysC8vmF5mjQalJJ1I5Hb/yz1eKHeCfL/GZJK16s4UPwlxu5ceOiBDNqd53TacBM
 DcKphWL4CaKg8CSqFogEXolyS21amV6BuaF2VSolK1WX84IWrlroMiNNJaKiuuzj8D
 U2lgOfe+dZnVLerZYw8j8j++gu0gZ2pXjcFKNoldtOtOyOAG0+7bqcg4GVKRDGLKX0
 DkeNJlA+JmKkw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/11] ASoC: dt-bindings: audio-graph-port related
 update
Message-Id: <167511241281.2141894.852476687405190205.b4-ty@kernel.org>
Date: Mon, 30 Jan 2023 21:00:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 05:23:22 +0000, Kuninori Morimoto wrote:
> Cc Geert
> 
> These v3 patches fixups audio-graph-port, and its related DT schema.
> Audio-Graph-Card and Simple-Audio-Card are similar Card
> and are sharing same utils. Thus we can also sharing same schema.
> 
> This patch-set fixup some Renesas's "make dtbs_check".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: dt-bindings: audio-graph-port: use definitions for port/endpoint
        commit: bbda859e02a4df3ef3f841c72e55d220ca75f90d
[02/11] ASoC: dt-bindings: audio-graph-port: add definitions/ports
        commit: 6a7216db63c884863db8200334ddaf991935ff45
[03/11] ASoC: dt-bindings: audio-graph-port: add missing mclk-fs
        commit: a2fabeaaf5e29df03ff90ec4ad8ecc8663c5ef16
[04/11] ASoC: dt-bindings: audio-graph-port: add clocks on endpoint
        commit: 2f0be75c9ff9351b4968b52e536cef9614ccf4b7
[05/11] ASoC: dt-bindings: audio-graph-port: remove prefix
        commit: f2a7ef1acffee5804c00029d7f273a8b7ca46227
[06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema
        commit: 13a7d9e992fa47bb94f55149a3a3b80e7148dc17
[07/11] ASoC: dt-bindings: ak4613: enable Of-graph (Audio-Graph-Card) style
        commit: 2657e28b28aee9da8d7c43ba3022c8fcd446ef59
[08/11] ASoC: dt-bindings: renesas,rsnd: add missing playback/capture
        commit: fcedf6547e650ae42bc4afc15389c840edc2b2f8
[09/11] ASoC: dt-bindings: renesas,rsnd: tidyup rcar_sound,src
        commit: f292f4d36744fb8369055d3dd7e50705babdce37
[10/11] ASoC: dt-bindings: renesas,rsnd: #sound-dai-cells is not mandatory
        commit: 60cc61a68c98f23f6fe543bd5ad830a815537677
[11/11] ASoC: dt-bindings: simple-card: add missing #address-cells/#size-cells
        commit: 9e8593ec9ef74a4731ab1a07ba0838fc48c98466

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

