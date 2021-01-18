Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550C2FA589
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69651843;
	Mon, 18 Jan 2021 17:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69651843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610985918;
	bh=j/mLnGJZdEDCGUguiqM8BNqaZ8IfO8PfJpKq8eHNvPc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0atplZynMzoaYc5w54bzKmZfsyu0hluKVZqpMbkaFKFzVjrgjxuFut6huRLhCGc7
	 wPmxVdfKGWYFpD83CBB6wRjWsZ9L6NMcl2/TiXVgisMl7EQT45RX7j+fWbZQKfR3co
	 ahKqV0QnBr4naFlDfBV4rBxb7QT7AJ6+9yZk8SN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C969F8026B;
	Mon, 18 Jan 2021 17:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 602F4F8016E; Mon, 18 Jan 2021 17:03:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC319F80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC319F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PbBmdoHa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 534CB22C9D;
 Mon, 18 Jan 2021 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985804;
 bh=j/mLnGJZdEDCGUguiqM8BNqaZ8IfO8PfJpKq8eHNvPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PbBmdoHa6WgJ1Q11AuyM+P295Y0nl4vY/GDtrRUytLmVbvViFZgeq5RbLPaQ5clI/
 NUvgucfazuO2NHmEX+ojCIc1fprssx1STvmAR+BkI8mzX+u9xxWpxbvKf9/W8V9M3L
 /bP/OmHhfeUG86r8T13wIeaPh6sYKbMyu+Z0tnKX+UFwJhWzxdoAl458TBagt1QB5X
 Dh2bWA0zL47nPcpJXcnSuKlZRMkjTm4MtQ4gUJ+zf5j0XrHcy7YB89d5FqYr9kcLYB
 yCOQvLxowLgyVbBqdct3BR5x2IDKrt2DEr9PmIeBpAi1XSwmO+ev5AkokgQcBuu0nw
 hn2qR8kTEhdKQ==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1610948585-16286-1-git-send-email-spujar@nvidia.com>
References: <1610948585-16286-1-git-send-email-spujar@nvidia.com>
Subject: Re: [RESEND PATCH] ASoC: audio-graph-card: Drop remote-endpoint as
 required property
Message-Id: <161098576158.26872.13693675515772808569.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Mon, 18 Jan 2021 11:13:05 +0530, Sameer Pujar wrote:
> The remote-endpoint may not be available if it is part of some
> pluggable module. One such example would be an audio card, the
> Codec endpoint will not be available until it is plugged in.
> Hence drop 'remote-endpoint' as a required property.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card: Drop remote-endpoint as required property
      commit: 57c412d43d71b12df9aa414ec27cd793e9821274

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
