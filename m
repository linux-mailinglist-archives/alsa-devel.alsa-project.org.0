Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926944F93FD
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2486C1948;
	Fri,  8 Apr 2022 13:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2486C1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417194;
	bh=NbBmhmOEh0jvqB0emglK41o3wKsbI3NM+mo49ZJS+ss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQWQ/6Id1a3UQJj2yPB0YtA5vJJfYqaxdgr2vYMXouQP/RwOfhKq9Lix1CyN8tGl5
	 n2SfFDkKQNIZL3VhiQnly+WSYYdwejnUQL0ADMlwii4ECSYlkVaKKXITBsAqH8KoDx
	 zEHtuXAjzlDR/KuRylp7u3X66O2N+kBa/9oXoTvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B30AF80524;
	Fri,  8 Apr 2022 13:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B25DFF80520; Fri,  8 Apr 2022 13:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB32F80518
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB32F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="exWJsFiX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C358B82A16;
 Fri,  8 Apr 2022 11:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC52CC385A3;
 Fri,  8 Apr 2022 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417060;
 bh=NbBmhmOEh0jvqB0emglK41o3wKsbI3NM+mo49ZJS+ss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=exWJsFiXBcf/WaNq/JWzLHOoZsHl7rlXepjq7PqZAD0v9b28PpI8tJbqiKN7eP27Z
 COzsKAxwyhccmHsWgeR4A7I6w2skRBGa6xYQTRSIVBLrpx+iz2X2oBm6EGkKB9ZnV5
 OUtnEhuWOGdNE7EbPFDXf//+7hCvlKsZGoW8aAlpEp7mU/TdVtSl6Ta2m3fik1PZ1X
 mtaYi13UcZVIQLfYeJho6Fj2T8Ieglwr4XGkZUbOVE0JvT8rgNtAvG0UsaIW0mdLxk
 pxse0XeqHVhfnmrpe+5vv+lzwxy6UjcOU1dk3X+CfIf3t1KuAYBIUcJhIZfRQykdk4
 rxqyEQ992gf5g==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220407094313.2880-1-srinivas.kandagatla@linaro.org>
References: <20220407094313.2880-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: do not switch off SIDO Buck when
 codec is in use
Message-Id: <164941705855.1295287.1090953205506531438.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

On Thu, 7 Apr 2022 10:43:13 +0100, Srinivas Kandagatla wrote:
> SIDO(Single-Inductor Dual-Ouput) Buck powers up both analog and digital
> circuits along with internal memory, powering off this is the last thing
> that codec should do when going to very low power.
> 
> Current code was powering off this Buck if there are no users of sysclk,
> which is not correct. Powering off this buck will result in no register access.
> This code path was never tested until recently after adding pm support
> in SoundWire controller. Fix this by removing the buck poweroff when the
> codec is active and also the code that is not used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: do not switch off SIDO Buck when codec is in use
      commit: db6dd1bee63d1d88fbddfe07af800af5948ac28e

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
