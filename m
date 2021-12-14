Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63DE474372
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 14:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559191ABD;
	Tue, 14 Dec 2021 14:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559191ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639488435;
	bh=+FyMOj1y47J0jKkiU7/fNkq+8RT+GijdYH8HXwKy9UM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSYgstUw0rGhwX9Cx16QGVlhNewZixVerp8xFSqvHFtiETQsF8/Gooa2eaGCoZnZU
	 kD25TIZro0Ol/MLrE9G8UQS+77msiSo5mjYPEaOpkuPKbqfBjr0XCBIr0dQcG3Z2SC
	 h9+/CbMsBB7lpya9RVO5cz7bnKNg4pEU8aKXtUTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5165AF80271;
	Tue, 14 Dec 2021 14:25:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF344F80475; Tue, 14 Dec 2021 14:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED989F80246
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 14:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED989F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K3hKjq/U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52D3B614F3;
 Tue, 14 Dec 2021 13:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CA2C34605;
 Tue, 14 Dec 2021 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488332;
 bh=+FyMOj1y47J0jKkiU7/fNkq+8RT+GijdYH8HXwKy9UM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K3hKjq/Upt25FBJ1BBPN71lKZHUzxMW0Bev6LE+t+EG5KTwVqghwvEGBNBAkFF6fu
 aCMPYWhrpje5mTlIkIAmzVIrF9sf9it3U93yklsiUiPjY0bp4NWTcruukG1QluXtk5
 oE4wJcA5wvcxnKADPHis9WBgJH9B8+tT0e2NqiR0H+o9ycsXDiEsRmfemwtKog49uZ
 u/KQTIhumt8czyKtdsKzBKr/VFXXsS40vepyYSC6CffeziPmW628Sh6BWd5Q26OgYG
 ETeqJATzGFnBJMlV+E2UvFWVEUKCVoQPmTVDMUbEKz/qfTfYK9JLRDX463/DUSVSrF
 r1pAREIfnrQ8w==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
Subject: Re: [PATCH 0/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
Message-Id: <163948832993.2865729.5795229789612585528.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Thu, 2 Dec 2021 15:55:00 +0100, Stephan Gerhold wrote:
> This series makes it possible to route audio through the combined
> audio/modem DSP on MSM8916/APQ8016 devices instead of bypassing it using
> the LPASS drivers. This is necessary to support certain functionality such
> as voice call audio. See PATCH 4/5 for details.
> 
> Also, qcom,apq8016-sbc.txt is converted to DT schema by adding it to the
> existing qcom,sm8250.yaml. The bindings are similar enough that it is easier
> to share a single schema instead of duplicating everything into multiple ones.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant MultiMedia routes
      commit: c55676ec292e0ff83261eb61efaf99a91079a3b8
[2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
      commit: 1875ae76f82c5c9acd7b7f44bd9226fbcbe858b7
[3/5] ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,sm8250 DT schema
      commit: b7875d88bf70100d2fe0dc08072018f994ccd6c4
[4/5] ASoC: dt-bindings: qcom: Document qcom,msm8916-qdsp6-sndcard compatible
      commit: 38192dc36f1fe1615b7a12cc78b9354d6b4ba8b7
[5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
      commit: 190357e1e09f271566e91fcd108c161f7e25a253

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
