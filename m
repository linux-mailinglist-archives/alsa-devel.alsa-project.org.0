Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF94C4CA8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 18:38:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43D31EFC;
	Fri, 25 Feb 2022 18:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43D31EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645810711;
	bh=qVI0tY3mXIJAD7LbgficgjWoICY03B7IiXWloXU6Ens=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ux3hlPrjey9aawSRCQr3dKmzwTyvkdc98KMrrls2KbYVDb6LkfX04txxqcgGrrtN+
	 og9ecqL0cP9KFl6X6GYsWpdbSYQFORJ4FDbWQ9tqaWafa3zjBGUem1iri1no4U/bCs
	 zV5/LfmGFBEr+O3xkHGU4E8tFg3UCtf0A4759I/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE889F80528;
	Fri, 25 Feb 2022 18:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC72F80524; Fri, 25 Feb 2022 18:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09FAF8051E
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09FAF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mU1kqIle"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DD5261DD4;
 Fri, 25 Feb 2022 17:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A167C340F3;
 Fri, 25 Feb 2022 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645810557;
 bh=qVI0tY3mXIJAD7LbgficgjWoICY03B7IiXWloXU6Ens=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mU1kqIleufy7p1Q4BlouNh3VhI+wmYA+pAaGe5c4z/BuCepa4JrKL8xdGHsJKa5h4
 ACH9h0hB04CyTCbuFgbNXYkF4dn6pJjO8RjkV1EtBsKo+cbwpfG5wC3WiaVxbpLyvw
 vtSnnEQuAu5EKecWIP6AuBS2I45LSXxaieAg+0dPIu95beX6dF6ehjpJ3ggBvrgg5a
 nkGvixkgXGhxanZahY4E9jveqjk8zSVHE2vrNuHoXVDURRQXzPh4DD7bEdHoK3kVWy
 zwYsRKoBtoYG9+fihWZRQezOOfwTerS56L23Nz3C2ulPOuSdpqhy2M4KKc6qhWR6TL
 F3kcHDLRS7S5A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v2 00/16] ASoC: codecs: add pm runtime support
 for Qualcomm codecs
Message-Id: <164581055516.2548431.8597662663166708968.b4-ty@kernel.org>
Date: Fri, 25 Feb 2022 17:35:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 quic_srivasam@quicinc.com
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

On Thu, 24 Feb 2022 11:17:02 +0000, Srinivas Kandagatla wrote:
> This patchset adds support for runtime pm on tx/rx/wsa/wcd lpass macro, wsa881x
> and wcd938x codecs that are wired up on SoundWire bus.
> During pm testing it was also found that soundwire clks enabled by lpass macros
> are not enabling all the required clocks correctly, so last 3 patches corrects them.
> 
> Tested this on SM8250 MTP along SoundWire In band Headset Button wakeup interrupts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: codecs: va-macro: move to individual clks from bulk
        commit: bed17757521b8beee2b565ce7860808a6a6e37ed
[02/16] ASoC: codecs: rx-macro: move clk provider to managed variants
        commit: 70a5e96bad592145ba25365689a2d7d8dedb3bd9
[03/16] ASoC: codecs: tx-macro: move clk provider to managed variants
        commit: db8665a3e904f579840417f9414415c4dd54ac84
[04/16] ASoC: codecs: rx-macro: move to individual clks from bulk
        commit: 43b647d9940454263421f9a1c756680bdf1d443c
[05/16] ASoC: codecs: tx-macro: move to individual clks from bulk
        commit: 512864c4ffa70522b9c44d5b40c15273330ae9c7
[06/16] ASoC: codecs: wsa-macro: move to individual clks from bulk
        commit: e252801deb253581892ca6beba625d553d63d538
[07/16] ASoC: codecs: wsa-macro: setup soundwire clks correctly
        commit: 05a41340e56f716ef9f83006990f6eea153c5fe0
[08/16] ASoC: codecs: tx-macro: setup soundwire clks correctly
        commit: 31bd0db84c6010cd6cf38048570b51aaae26d91d
[09/16] ASoC: codecs: rx-macro: setup soundwire clks correctly
        commit: eaba113430d6c5e2c74fc8061fbd86efc000e99c
[10/16] ASoC: codecs: va-macro: add runtime pm support
        commit: 72ad25eabda0ac2b13ab8f418dc5d360aded172c
[11/16] ASoC: codecs: wsa-macro: add runtime pm support
        commit: c96baa2949b245da7e0d0e9e2a44cd4471c9f303
[12/16] ASoC: codecs: rx-macro: add runtime pm support
        commit: 366ff79ed5392ac518fd43cb44f82f63b87c313e
[13/16] ASoC: codecs: tx-macro: add runtime pm support
        commit: 1fb83bc5cf640c821910424cd237e2df1e81be6f
[15/16] ASoC: codecs: wcd938x: add simple clk stop support
        commit: 584a6301e1d548b2875a47b44f6aecb70a80ee53
[16/16] ASoC: codecs: wcd-mbhc: add runtime pm support
        commit: cc4d891f1876242400ef21d95ab9e9553e9d10b0

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
