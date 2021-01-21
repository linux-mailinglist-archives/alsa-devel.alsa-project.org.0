Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8A2FDDA2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:08:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3AC183C;
	Thu, 21 Jan 2021 01:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3AC183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187732;
	bh=WJMenhoY3ig/CdMaKFzwT0Oyk6Kf5z+W1dJpEuH1Gyo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sReSHEdjPCtI4d8ZL4MQRfi3ryZWxE1CuJX2SvXly6rrihQwEV6nGSPmUj3WNj0aY
	 9+oTGKKb6fA96cobgf0eVCf0g+VgEKh6wTm/whQWmh/VvXxMy3g3XUaB7s+tzItJX9
	 QXcFmve8kg0iHlMn0D/cVSbCCsKOxEqeI+jVW9KE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 928BEF804C2;
	Thu, 21 Jan 2021 01:06:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16154F804BD; Thu, 21 Jan 2021 01:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4D5CF80253
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4D5CF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DdGNMy5h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E8EE23716;
 Thu, 21 Jan 2021 00:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187591;
 bh=WJMenhoY3ig/CdMaKFzwT0Oyk6Kf5z+W1dJpEuH1Gyo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DdGNMy5hdei+bvBte/gZcpfZ2rD45Iq0ksNyMEmNQqM1B0W4mW0w7xJrEzgVUtTSl
 O+4sZHSLHBEM2VGsVOri0owCnRRivIFpYAV+I7E4KQ5YNrEk0glk3Ly08RaRAEwB7I
 0Dk8UerKwBnkEy5oYN4gOKThLP4ZHYMi44yzN7fY2xH7Fcajik03az4n8wbpovdYp0
 dKSli41hgmIlSB511aRAn7KhguRjsWZovDie9Vb1wACxc5wl7n3Z25Ge2lfWymFbNZ
 VeMXIr9XZLxq8JpVvHAO0bV64khXqItt9WzvZ1qGcYa0jTfg/XKEkQA4eN5b2sGgXe
 gfd+pfuV9ac5g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
References: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: Fix broken lpass driver
Message-Id: <161118753483.45718.16793872451068502751.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, lgirdwood@gmail.com, stephan@gerhold.net
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

On Tue, 19 Jan 2021 17:15:25 +0000, Srinivas Kandagatla wrote:
> LPASS driver is partially broken on DragonBoard DB410c on 5.10 and
> its totally broken on other Supported Qualcomm SoCs.
> 
> This was due to DAI ids being over written by the SoC specific header files
> in the dt-bindings.
> 
> Idea of having SoC specific headers is not doable when we are dealing with
> a common driver. So this patchset attempts to fix this properly by creating
> a common dt-bindings header for lpass which can be updated with new entries
> if required. This patchset also add an simple of_xlate function to resolve
> the dai names and different SoCs might not have 1:1 mapping for the
> dai_driver array with dai ids.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: lpass: Fix and common up lpass dai ids
      commit: 09a4f6f5d21cb1f2633f4e8b893336b60eee9a01
[2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY
      commit: cd3484f7f1386071b1af159023917ed12c182d39

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
