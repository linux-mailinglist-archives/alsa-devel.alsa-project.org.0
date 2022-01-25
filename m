Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEEC49B138
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C5420DD;
	Tue, 25 Jan 2022 11:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C5420DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106167;
	bh=bPm0LjPdqkJuh3S4vN12VSn0qh8bPUdA5DbAm6JDSKI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBgqSoztCT3eSkLKuEwDaOhjGAnulwE2ldKnVkGerb3KjLJQ+TeG8OI87hFjIObeY
	 DdUVlvdxxS2TqMJz2jHC/jkg9dGSu3MWAC6AleHyicv2qxI4elCQekDRVZUQ+q25+7
	 QqVc/ldH+KTSn7hI3DIy02O3Tn7R6foV6+YLt0Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E63BF80524;
	Tue, 25 Jan 2022 11:20:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACEB7F8051B; Tue, 25 Jan 2022 11:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF88F80517
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF88F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E0g1wqBL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDCC8B81752;
 Tue, 25 Jan 2022 10:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54366C340E5;
 Tue, 25 Jan 2022 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106023;
 bh=bPm0LjPdqkJuh3S4vN12VSn0qh8bPUdA5DbAm6JDSKI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=E0g1wqBLEi1ip7lwDDh6jAKSNrueJIO+J0FOpq62I7AyowojSutWWFQbU8me7o04V
 rsYRAH9ZkB1Ri9RGHM636oiMoGhse+mlfVjQ+X5ue3y/7EIiB4jhYyHBc7vDhxy92a
 f07gXfB7UvO0Gd5Wfu5xUWZmB+GlNVb/ewuAuZ0zlWLVeIfOhI8how56sbrGszcnSj
 ZgqVhR7FLfQ/qNHy3cWz1qYwGZDU+TEkFV+MjW0J1Z//bCqPB34erCS7otnbW7CEek
 nJtv5F3/F3zA8LBmta6Qe03PefruPPgKOq1peyynvmGAlK8ZqGvZS6b+z1WGf2q/4h
 0/AuOhLHqfo0w==
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v2 0/5] fsl-asoc-card: Add optional dt property for
 setting mclk-id
Message-Id: <164310602006.74844.15557219169532586931.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, tony@atomide.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, robh+dt@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, shengjiu.wang@gmail.com
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

On Mon, 17 Jan 2022 10:21:04 -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchset:
> 
>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
> 
> Sound cards may allow using different main clock inputs. In the generic
> fsl-asoc-card driver, these values are hardcoded for each specific card
> configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
      commit: 85f856f790b5fd427cb31b3f62755713174da0aa
[2/5] dt-bindings: tlv320aic31xx: Define PLL clock inputs
      commit: 6045ffd366283236f0de79c8a0e98ae766e9a8f9
[3/5] ASoC: bindings: fsl-asoc-card: Add mclk-id optional property
      commit: 55915f20ad9ae92015bf7b2c4ac854e5b720d63f
[4/5] ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
      commit: e6ec5a3936ee0c01f46e1d09dc758bb762e06dd9
[5/5] ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
      commit: d4c4e2861560ab1cbf540bbda5bcdf4c92b17110

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
