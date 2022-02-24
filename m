Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0C4C3974
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 00:02:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B75D1AD1;
	Fri, 25 Feb 2022 00:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B75D1AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645743729;
	bh=ZWXXupdP+z3mMoHFbYDrLkme/FSZI7hGTF3wCfDqx2A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsl+dvn0KvBtR3dLsoORt+20zQpwuL4OoNrNgb2PoBm3QmXC2MaadxEO7aillL2rX
	 ZWkEhWQoMncr5nEdX7c/dS/ycKrgICUFZjn4Lod7x/yRNxxe7jNCtC/ATUb3U7MFxN
	 nIrT170psHhSN1l5E8WZg7lM2n9fwUAl2cFRpc9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A27F80543;
	Thu, 24 Feb 2022 23:59:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 594F9F8053A; Thu, 24 Feb 2022 23:59:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4220F80539
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 23:59:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4220F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lUgCHjGc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13E80B829EF;
 Thu, 24 Feb 2022 22:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580D6C340F1;
 Thu, 24 Feb 2022 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645743552;
 bh=ZWXXupdP+z3mMoHFbYDrLkme/FSZI7hGTF3wCfDqx2A=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=lUgCHjGcT5ghuhQ5FB9JeIgBRC0AxcVfo4ZO8RZf4mrGLD7f+ZmLCamAYqXM6eXSt
 4LLDUD61kkQeq4kc42PWHLqkGkBYSVt2EZq8S2jnKiLgj3TActUoz7GYvfXX4gMhhD
 sP13NEyK7EKgd5cuLhaTk/1b263jDSpQ1HOVhu/j1S9S87rwleiuFoNi80O5lmW2yU
 mvGVhJvLFVqx87L+SILSTFt0ljsmhbEVEr0bvxKGCMeWKVP3TFut/Rtenc49R3HyqO
 EmoToMsHwQpMIKbacPeBUzLFQoIa78MIuNkiyXY4ElGLA1rGjjsbMrGLCPLjfGftVr
 pKnY9OSbQTe4w==
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, perex@perex.cz, quic_plai@quicinc.com,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, swboyd@chromium.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org, bgoswami@codeaurora.org, judyhsiao@chromium.org,
 tiwai@suse.com, rohitkr@codeaurora.org, lgirdwood@gmail.com,
 bjorn.andersson@linaro.org
In-Reply-To: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: (subset) [PATCH v15 00/10] Add support for audio on SC7280 based
 targets
Message-Id: <164574354907.4011497.12699483058167321693.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 22:59:09 +0000
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

On Wed, 23 Feb 2022 21:08:55 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for Audio over wcd codec,
> digital mics, through digital codecs and without ADSP.
> 
> Changes Since V14:
>     -- Split common wrapper function to separate wrapper for each handle in platform driver.
>     -- Update cdc dma buffer handling with memremap with ioremap.
>     -- Remove redundant error prints.
>     -- Update irq flag.
> Changes Since V13:
>     -- Change bulk cdc clock voting to individual clock voting.
>     -- Remove redundant code, conditional check and prints.
>     -- Fix typo errors.
> Changes Since V12:
>     -- Fix arguments type mismatch.
> Changes Since V11:
>     -- Fix kernel robot issue on arguments type mismatch.
> Changes Since V10:
>     -- Split bulk clock voting to individual clock voting as per use case in cdc-dma driver.
>     -- Add missing codec dma clocks.
>     -- Update rxtx lpm buffer size.
> Changes Since V9:
>     -- Change individual clock voting to bulk clock voting of lpass-sc7280 platform driver.
>     -- Remove redundant clocks in lpass variant structure.
>     -- Add mclk for MI2S based headset path.
>     -- Remove unused lpass variant structure members in lpass header.
> Changes Since V8:
>     -- Fix errors in sc7280 lpass cpu dt-bindings.
>     -- Move to quicinc domain email id's.
> Changes Since V7:
>     -- Fix indentation errors.
>     -- Bisect patches to avoid interdependency.
> Changes Since V6:
>     -- Split cdc dma regmap config macros.
>     -- Add write dma reg fields for i2s path.
>     -- Add helper function to distinguish rxtx and va dma ports.
>     -- Optimizing clock and reg name in cpu dt-bindings.
>     -- Update buffer management for cdc dma path.
>     -- Remove Kconfig fields of machine driver.
> Changes Since V5:
>     -- Include MI2S primary node to snd_soc_dai_driver in lpass-sc7280 platform driver.
>     -- Move dependency patch list to corresponding patch.
>     -- Add support for missing cdc-dma ports.
>     -- Change if/else conditional statements to switch cases.
>     -- Add missing error handlings.
>     -- Typo errors fix.
> Changes Since V4:
>     -- Remove unused variable in lpass-sc7280 platform driver.
> Changes Since V3:
>     -- Remove redundant power domain controls. As power domains can be configured from dtsi.
> Changes Since V2:
>     -- Split lpass sc7280 cpu driver patch and create regmap config patch.
>     -- Create patches based on latest kernel tip.
>     -- Add helper function to get dma control and lpaif handle.
>     -- Remove unused variables.
> Changes Since V1:
>     -- Typo errors fix
>     -- CPU driver readable/writable apis optimization.
>     -- Add Missing config patch
>     -- Add Common api for repeated dmactl initialization.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[02/10] ASoC: qcom: Move lpass_pcm_data structure to lpass header
        commit: 74190d7cd3e8ab5123206d383dbfe125a4b7bb19
[03/10] ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
        commit: ddd60045caa59d4b3d4b2a4b48fefd4974198587
[04/10] ASoC: qcom: Add helper function to get dma control and lpaif handle
        commit: 16413d5c5a2ed81d8fece1c5fe0b85752ecdbdf2
[05/10] ASoC: qcom: Add register definition for codec rddma and wrdma
        commit: dc8d9766bc03efee4d1b6dd912659858fdf981de
[06/10] ASoC: qcom: Add regmap config support for codec dma driver
        commit: b138706225c9ce9fac7a4955df31d8f68bb1d409
[07/10] ASoC: qcom: Add support for codec dma driver
        commit: 7d7209557b6712e8aa72ac1ce67a3fe209f5f889

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
