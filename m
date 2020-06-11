Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8E1F6B0B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 17:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DD61695;
	Thu, 11 Jun 2020 17:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DD61695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591889455;
	bh=fLkyOBJQDjmnRQSyH8H/HsxFUNXTfAnE6ogJem2ztkU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTDuman8B570PSoVPAqN23GaeFGmgk6J/XO+at/kjSABmi25JCg9iZncGiACtAviV
	 SVv1kqRofByo4XWlytRCcGPLJ5sxWjpnSVIFsA+NqGa3/GZHlYYeom7hduqN8RSIa+
	 xsxtoc49dkJvRudMwbSAoCSflx2nx+co93IEtinc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7881DF8028D;
	Thu, 11 Jun 2020 17:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 729D4F8028C; Thu, 11 Jun 2020 17:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 380EBF80149
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 17:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 380EBF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xX9SUKIi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C188206C3;
 Thu, 11 Jun 2020 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591889337;
 bh=fLkyOBJQDjmnRQSyH8H/HsxFUNXTfAnE6ogJem2ztkU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xX9SUKIiphda5w11zEjEpTM339FbXhZIMbbKcXbFsgeupaAdlUDPYbeLiZvfSu41K
 NvpShiP+V6p2mDBLoxvaDMsVWMsqjv1p6qqzcxbwNnIfOGiArYN0fTP2oBzv3Myl4V
 QSAseghuNGr2k1vVb6kaf5wDFwsiIzdBvLH7qstQ=
Date: Thu, 11 Jun 2020 16:28:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
References: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/8] ASoC: qcom: q6asm: few fixes and enhancements.
Message-Id: <159188933509.47193.8263889711751900487.b4-ty@kernel.org>
Cc: lgirdwood@gmail.com, vkoul@kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

On Thu, 11 Jun 2020 13:41:51 +0100, Srinivas Kandagatla wrote:
> While trying out gapless playback, I found few issues with the existing code
> This patchset has few fixes and some enhancement to the code to handle
> multiple streams per asm session and also handle buffers that are not aligned
> to period sizes.
> 
> I will send Gapless support patches once compressed gapless state machine is fixed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6asm: handle EOS correctly
      commit: 6476b60f32866be49d05e2e0163f337374c55b06

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
