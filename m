Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6043BA5B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3AA1727;
	Tue, 26 Oct 2021 21:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3AA1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635275312;
	bh=1iYw4lIhjrHBv1FHjuNGWwXkA/++TWK5/5GGig2CxhQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBdAnodU1lhxbkYfAGFMjg2nRUYuC/foZbTUJvvbbtxDLio2fsoCVdwrg/LRIBekI
	 4iSia81JwuzmRi2ZdMGRdrWekiXBQ1ThiAprarIUBc01YX6P+3HyyXR5ksc/0V/W1d
	 iuouqzuFNmM5vQRLb5tFeU1e6Z3jrXPK3IIFwXtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4189F804E3;
	Tue, 26 Oct 2021 21:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 160AEF804AE; Tue, 26 Oct 2021 21:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 566C5F80269
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566C5F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HKvmFoN7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C23F461078;
 Tue, 26 Oct 2021 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275209;
 bh=1iYw4lIhjrHBv1FHjuNGWwXkA/++TWK5/5GGig2CxhQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HKvmFoN77WOr9TwR0bIyIY4Uv6Mg43Q/Q5+/MZHWqYqk0/lEazOGS/GvNc3Vo3NTt
 oCjx5nhfqR/oH7VdtJkF/o7cVqHGZc/S816PeJmZ5kuMAgA3DBvC2cgCY/dUWVxv64
 ic4c8EQYu/72TquDamqrmvqVl8FwUc+tnlxRcf6Kl6lH1CW2H+H8W+noZxfHZG0ZZc
 Bxf6A81dbFfAK4Xh+ERttCo0yHX78RkcBU+zbJqvy9JmNH0gU/lPa6hHua3zUyu/TP
 mJuX719SDprXrhxfx5wKx2FQ/zFvKnIP81IxvzCQ0LZt4kfMb7aki4s44gGy90VZ1l
 5WlpqEbhyMFYw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, bjorn.andersson@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v10 00/17] ASoC: qcom: Add AudioReach support
Message-Id: <163527520652.2033755.3359869966618651702.b4-ty@kernel.org>
Date: Tue, 26 Oct 2021 20:06:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

On Tue, 26 Oct 2021 11:37:58 +0100, Srinivas Kandagatla wrote:
> Am resending this series as I ended up sending incorrect patches for v10.
> 
> Sorry for the resend noise.
> 
> This version is a respin of v9 fixing a build error in 12/17 patch.
> 
> QCOM SoC relevant non-audio patches in this series has been merged into
> the Qualcomm drivers-for-5.16 tree, as this series depends those patches
> an immutable tag is available at:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/20210927135559.738-6-srinivas.kandagatla@linaro.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: dt-bindings: move LPASS dai related bindings out of q6afe
        commit: e1b26ac90287d513699edbb8cae009ec89fe79b7
[02/17] ASoC: dt-bindings: move LPASS clocks related bindings out of q6afe
        commit: e44cfc9d82d8189ea15556052eb9d8640804f954
[03/17] ASoC: dt-bindings: rename q6afe.h to q6dsp-lpass-ports.h
        commit: e3008b7ccb1dedcea954505ff964a53641d2b980
[04/17] ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
        commit: 95b6cd57e9e8210fca315270ac05ce66fc536703
[05/17] ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
        commit: 9ab71ac372407acc93045931ed9da867b9415360
[06/17] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai compatible
        commit: accaa13167363f22835fe904c3ccee8bd624423d
[07/17] ASoC: dt-bindings: lpass-clocks: add q6prm clocks compatible
        commit: c04f02d63d0d9c794df889d396da14f735a270eb
[08/17] ASoC: dt-bindings: add q6apm digital audio stream bindings
        commit: 96d0232564c3b16e9a4286f183e1e6d317521a5a
[09/17] ASoC: qdsp6: audioreach: add basic pkt alloc support
        commit: 44c28dbdb6195b2a92e1fcb2946d1e987658f8b5
[10/17] ASoC: qdsp6: audioreach: add q6apm support
        commit: 5477518b8a0e8a45239646acd80c9bafc4401522
[11/17] ASoC: qdsp6: audioreach: add module configuration command helpers
        commit: 25ab80db6b133c20adb9ee39ce5cfdf347c92d5c
[12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
        commit: cf989b68fcadbeeea1446e50fd8b2f24a0f1275c
[13/17] ASoC: qdsp6: audioreach: add topology support
        commit: 36ad9bf1d93d66b901342eab9f8ed6c1537655a6
[14/17] ASoC: qdsp6: audioreach: add q6apm-dai support
        commit: 9b4fe0f1cd791d540100d98a3baf94c1f9994647
[15/17] ASoC: qdsp6: audioreach: add q6apm lpass dai support
        commit: 30ad723b93ade607a678698e5947a55a4375c3a1
[16/17] ASoC: qdsp6: audioreach: add q6prm support
        commit: 9a0e5d6fb16f5a92a8e7e7626666665d0ff79474
[17/17] ASoC: qdsp6: audioreach: add support for q6prm-clocks
        commit: d07568686793f840b4144b19e0a52020b5c7bf94

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
