Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A877C47B894
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A4C1741;
	Tue, 21 Dec 2021 03:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A4C1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055146;
	bh=2Q8o7TZKuV6at7Au9bMZ+cekxdrYpbvPeJEtKvA/2Qc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRaWi/8xfEi79vRuHUA/kRQGpNOgcyxTLQMhjyYI3eqBDm+gsYLD8y9+J5kGpZquR
	 qhMXk/4mKRw2r7Qu31epHF1xEJHx82xzNgOlZPkXfcjCyEjbAQSSGursiYLhRHD2sO
	 wd+JaPvhyiUgR28GSZwd4YzgBt6f7u3GcsKpWRL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A503EF804E6;
	Tue, 21 Dec 2021 03:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0A4F8032B; Tue, 21 Dec 2021 03:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BA13F80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA13F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n3B1nPVR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF8061375;
 Tue, 21 Dec 2021 02:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBF2C36AF9;
 Tue, 21 Dec 2021 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055041;
 bh=2Q8o7TZKuV6at7Au9bMZ+cekxdrYpbvPeJEtKvA/2Qc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n3B1nPVRcfo1YJHT/9Gr6PGW7aaE8UtqA3Ii36AizArvpVJ5Fnv9QB6b1b2OoXuI+
 lN0EPDFtqHlJIDJPm55fBLa/4ILgz585pwYbuurHopm1TkjmB8dhcbJDfkUwCnUmyJ
 /GoF2Nsav+4sYjSQu3Jo/ga1swD1sqxIouV1Gt0mTZjJ9MalzAovqED4A/9jBqlKeW
 NVuSC/0LfT2hgvWGMaJ7uDun5yFGOHWImyqp5CMTOuLJ6HcoHr5IeYNyImnTjgzSlp
 +jJMDfI8d2aynzp8FEizN/sPAQMfRS+yz9bn++lb2Wb61VbQn/BPWZVtCCRmIoHi5X
 +MGvCbddWjTgw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/22] ASoC: Use dev_err_probe() helper
Message-Id: <164005504049.2647792.11940186106567738528.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 14 Dec 2021 11:08:21 +0900, Kuninori Morimoto wrote:
> I'm now posting below patch to ASoC/DT ML,
> sorry for my multi post,
> but this patch-set is independent from it.
> 
> 	ASoC: dt-bindings: audio-graph-port: enable both flag/phandle for bitclock/frame-master
> 	https://lore.kernel.org/r/20211208064852.507977-1-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/22] ASoC: codecs: ak4118: Use dev_err_probe() helper
        commit: 5ea4e76b73cd6f2cf29b02a57040c1a11fa8c3f0
[02/22] ASoC: codecs: es7241: Use dev_err_probe() helper
        commit: 900b4b911aca2270ae3f966df5f31081a086c3cf
[03/22] ASoC: codecs: max9759: Use dev_err_probe() helper
        commit: 6df96c8f5b50574c196607f036a09b5626124a24
[04/22] ASoC: codecs: max9860: Use dev_err_probe() helper
        commit: edfe9f451a8c6174fad43689fb5af5c096940e13
[05/22] ASoC: codecs: pcm3168a: Use dev_err_probe() helper
        commit: 526f6ca95a9d0c85ccb0a83ed48936394e4185e6
[06/22] ASoC: codecs: sgtl5000: Use dev_err_probe() helper
        commit: ec1e0e72a8d4180c65aee01e9563ddfb47f87709
[07/22] ASoC: codecs: simple-amplifier: Use dev_err_probe() helper
        commit: 2c16636a8bbd85573376363420c8e9f6006d3753
[08/22] ASoC: codecs: simple-mux: Use dev_err_probe() helper
        commit: 17d7044715c5b1e0321f8e56060260e39bba54b7
[09/22] ASoC: codecs: ssm2305: Use dev_err_probe() helper
        commit: 382ae995597fbe214596f794ee5a38b4b64195be
[10/22] ASoC: codecs: tlv320aic31xx: Use dev_err_probe() helper
        commit: 7ff27faec8cccbbf499d0b4cd8ef951f1d5f5d05
[11/22] ASoC: ateml: Use dev_err_probe() helper
        commit: 0624dafa6a85be94e98822075c08006b5b528e2d
[12/22] ASoC: ti: Use dev_err_probe() helper
        commit: 88fb6da3f4313feb885f432cfc3051b33fdb2df7
[13/22] ASoC: fsl: Use dev_err_probe() helper
        commit: 2e6f557ca35aa330dbf31c5e1cc8119eff1526fa
[14/22] ASoC: generic: Use dev_err_probe() helper
        commit: 7a0299e13bc740caebbbba24b3df85fc9ffa7759
[15/22] ASoC: img: Use dev_err_probe() helper
        commit: ef12f373f21d66e9d14eeace517c05fc2c9cf258
[16/22] ASoC: meson: Use dev_err_probe() helper
        commit: 2ff4e003e8e105fb65c682c876a5cb0e00f854bf
[17/22] ASoC: mxs: Use dev_err_probe() helper
        commit: 7a17f6a95a6136cb0a5c41be2b0ac131f9238ae8
[18/22] ASoC: qcom: Use dev_err_probe() helper
        commit: ab6c3e68ab6e3c545b044a00814946e2998c8c53
[19/22] ASoC: rockchip: Use dev_err_probe() helper
        commit: b3a66d22a2fd5435bf4d0a357e220cfca88ae5e2
[20/22] ASoC: samsung: Use dev_err_probe() helper
        commit: 27c6eaebcf75e4fac145d17c7fa76bc64b60d24c
[21/22] ASoC: stm: Use dev_err_probe() helper
        commit: efc162cbd480f1fb47d439c193ec9731bcc6c749
[22/22] ASoC: sunxi: Use dev_err_probe() helper
        commit: 11a95c583c1de215d2c338bf5cb9f929312616f8

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
