Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE449FD6A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 16:59:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1191707;
	Fri, 28 Jan 2022 16:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1191707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385591;
	bh=I6A4BBJmtFNGYfY78duMBHkLQCr0djtkeEScL1vltss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2uSB+yo+3GnpgxGpeyRHnbiHRdoZ61KbiRGY1EHcKi4pN6bmyaXssEUsSFBWRNe0
	 5PthsOGm2Qoz0HXrdWuuEHRvHcT3nLjwebmUvVrRiBaMlbEoWxRozm/CwM3QsWNz8Y
	 VZaSdca46cRYqMlKD3qL/dq0y01PLs4dimJcI0JQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EEE8F80240;
	Fri, 28 Jan 2022 16:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B213F8023B; Fri, 28 Jan 2022 16:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5953F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5953F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uxFmIBry"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF7B61EB0;
 Fri, 28 Jan 2022 15:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0D4C340E7;
 Fri, 28 Jan 2022 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385517;
 bh=I6A4BBJmtFNGYfY78duMBHkLQCr0djtkeEScL1vltss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uxFmIBryjr1ZV/KyebvQMJQU+bWY32fswAF28YtL/G/IHgGGWI/hlsqjnfWZ6+8gO
 E2z+rs3/R1ES+fCALYc2CsCDNuhzXJlyqQLUDe7rX5cvzpGJIx21TFd3B3EEmYyKyY
 AtodREZQ21a1bDt4Jy+/0TvrrTUtDEeT+BUZNLB6zXjsRwSd+RJhGghhUYRGZRn4b8
 wRMH5oBmqIyqFCYECp4BNmtI+XR9wsMPPOEr1ULJFELfmbAXtockQw2/lnZmeTjITn
 ryoE50AVvLXJJBKveUrnPg8sOMc8ReGYBB8ocurmVlIX7GH8R0ucXmJk3KXHCZqosy
 Wftc6pCTjL2+w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: fixes for Qualcomm codecs and q6apm
Message-Id: <164338551575.1711238.8376590607688196814.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
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

On Wed, 26 Jan 2022 11:35:45 +0000, Srinivas Kandagatla wrote:
> Some recent testing found few issues with wcd938x and lpass-tx codec drivers.
> WCD938x was accessing array out of boundaries resulting in corruption and
> system crashes along with not handling kcontrol put return values correctly
> and rx-macro had incorrect sidetone registers offsets. One final fix in q6apm
> to add a check if graph started before stopping it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/4] ASoC: codecs: wcd938x: fix incorrect used of portid
      commit: c5c1546a654f613e291a7c5d6f3660fc1eb6d0c7
[2/4] ASoC: codecs: lpass-rx-macro: fix sidetone register offsets
      commit: fca041a3ab70a099a6d5519ecb689b6279bd04f3
[3/4] ASoC: codecs: wcd938x: fix return value of mixer put function
      commit: bd2347fd67d8da0fa76296507cc556da0a233bcb
[4/4] ASoC: qdsp6: q6apm-dai: only stop graphs that are started
      commit: 8f2e5c65ec7534cce6d315fccf2c3aef023f68f0

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
