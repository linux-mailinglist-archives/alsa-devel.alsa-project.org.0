Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0904C78C1
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:24:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7B1191A;
	Mon, 28 Feb 2022 20:23:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7B1191A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076260;
	bh=3bz7Qsk+snnXqiot5wWBZHY9JSrCtvtcLoIgzffSDeo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2WmPAjCxTwKwDdBsQEqWSZBylcSL+HEm5UHG0YlcuNt+M1E+z/D/HXXBwl+cEWt+
	 2ytXl96zd5n7F6oX1AX1s39YjuFpCZ6QFS3wooavqI5MT33xtjK6F9tlrbneImSIUc
	 n/qzdD5HcR+cD3FBaQ2npFJp0zufAjQhK1qSbrtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00649F8013C;
	Mon, 28 Feb 2022 20:16:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D239CF805B5; Mon, 28 Feb 2022 20:16:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FAB0F8057D
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAB0F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bKW3ESh7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D611761594;
 Mon, 28 Feb 2022 19:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE39C340F1;
 Mon, 28 Feb 2022 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075756;
 bh=3bz7Qsk+snnXqiot5wWBZHY9JSrCtvtcLoIgzffSDeo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=bKW3ESh7tv0gSsPTb5mEFFgrQeiokQxiZOcnp5MTxI+YZwiZu5V3aQKrDkufSZmCr
 OGnZW+oZDnSBuD809U730F9n11csXcyR+ZaBEFXH9NXWa4/JvxFpSDL9N+cPPZo3FC
 ZPi3xs3sE0anePHr17TA42bvJQLX4lJ/CpNImk2IP4lyXEzesvi9uE9jj/yvzMf9td
 uJ7XI/DiovqcO+KD7BXT4QG6OOt+xRFV2xsUpN1gx1e56IB0R6tEq8mFymaS3/BDIb
 kY8TLCHBEVj6o3TCFE8YS5k8cSjzPN9gwPcxy95HDSnYSG749MQ58zerECrGoKkcil
 FOYPBqifMrczQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, perex@perex.cz, linux-kernel@vger.kernel.org,
 bgoswami@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 swboyd@chromium.org, agross@kernel.org, judyhsiao@chromium.org,
 alsa-devel@alsa-project.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, rohitkr@codeaurora.org,
 quic_plai@quicinc.com
In-Reply-To: <1645898959-11231-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645898959-11231-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v5 0/2] Add power domains support for digital macro codecs
Message-Id: <164607575278.3538791.10960449349795091046.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 26 Feb 2022 23:39:17 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add power domains support for RX, TX and VA macros.
> 
> Changes since v4:
>     -- Fix uninitialized variable return error
> Changes since v3:
>     -- Add dt-bindings support.
> Changes since v2:
>     -- Remove redundant local variable.
>     -- Update pds error handling sequence.
>     -- Update module description.
>     -- Clean up pds init function.
>     -- Remove redundant arguments.
> Changes since v1:
>     -- Add missing macros in Kconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: Add power domains support in digital macro codecs
      commit: 9e3d83c52844f955aa2975f78cee48bf9f72f5e1
[2/2] ASoC: qcom: dt-bindings: Add bindings for power domains in lpass digital codecs
      commit: 6619c7d4379aca716a90f7581be2853071c086f6

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
