Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1C30C3EA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1AF172F;
	Tue,  2 Feb 2021 16:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1AF172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612280239;
	bh=8RZE4kmI/Rwh/V6PZg/jIICmaP1SJ5gy/78kCN3vvbQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3XkrovqCrx/+IsAGO0EVxKA4lStpVJ8NIEnBS7dauorQOM+x0csTfDNBIN1+cE0N
	 36+RRxKt/iudKbTf9xMSH7W3E3Wxfb2CN4+QCCpLZsrcK1E/tGkjAIVPZr5sHpjDdr
	 KuSjPdviOkKCvAug5G16KeYW5ZzcAcVAhn6dirwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A346CF801F7;
	Tue,  2 Feb 2021 16:35:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8436F801F7; Tue,  2 Feb 2021 16:35:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36323F80152
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36323F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pE6vmN63"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6488764F68;
 Tue,  2 Feb 2021 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612280140;
 bh=8RZE4kmI/Rwh/V6PZg/jIICmaP1SJ5gy/78kCN3vvbQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=pE6vmN63LdtZ8mHWuOqqSsGaEPkduFJy0WaHqrzkEx40UPniEJeSbrPfQbZPqKQAp
 LvGsLDikOdWsnI4aZpbqrLmDfBix/H9b8e/5ab5tXeoI9bhSvjwQEz0weCGDTrodFd
 USIVRk7xPuRjdRZjIknuT/DfwH9TKmY4qJxl1Cl+pb6almvclqY9CzR12fMaCMTjE/
 /XUAswbYf+PNZw7zqY5Om9+Pa/sH3ep2xC/B8nz/EHxM4MrVHf8SAnq0T8G4/V7Nnf
 yfXzh1iDJU/BCt3BPZr0hLxhDK+xYbNFe9YZN4RAVOfkG5p+oZxefL6jNNW96kmmUx
 /RvLu+Mq9r62A==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 agross@kernel.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 robh+dt@kernel.org, rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 bgoswami@codeaurora.org, swboyd@chromium.org, plai@codeaurora.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
In-Reply-To: <20210202062727.22469-1-srivasam@codeaurora.org>
References: <20210202062727.22469-1-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
Message-Id: <161228008450.11888.13128911236969601728.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 15:34:44 +0000
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

On Tue, 2 Feb 2021 11:57:27 +0530, Srinivasa Rao Mandadapu wrote:
> Had a typo in lpass platform driver that resulted in crash
> during suspend/resume with an HDMI dongle connected.
> 
> The regmap read/write/volatile regesters validation callbacks in lpass-cpu
> were using MI2S rdma_channels count instead of hdmi_rdma_channels.
> 
> This typo error causing to read registers from the regmap beyond the length
> of the mapping created by ioremap().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
      commit: 6c9123068815ed0bc1e8fa5a5029eef5ee3866c3

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
