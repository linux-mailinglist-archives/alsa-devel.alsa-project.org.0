Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E542B5523
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C15C174B;
	Tue, 17 Nov 2020 00:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C15C174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569847;
	bh=xq62QE7/u63IXnVdwILr5LgN6HXfl7A05MOWRxR9rQM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGrht2tomaKau+EF5ALItP8iIn29ZcYEdDTVM/B08jz2NtH15NzfqxkWl/TFGyomf
	 2qwpuivxfGk1VFfYTmiinqfB0f64SglDG2cXxr9WwUVfCYEouzwW8uewQ6sGjNCXUb
	 YyUe4lifzi1PAYOMaq9kH/AqX3CQ76aNv1CgSfw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D94F804FA;
	Tue, 17 Nov 2020 00:33:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E852CF804F3; Tue, 17 Nov 2020 00:33:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1805F804E3
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1805F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ryoK4Lwc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D008221F8;
 Mon, 16 Nov 2020 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569624;
 bh=xq62QE7/u63IXnVdwILr5LgN6HXfl7A05MOWRxR9rQM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ryoK4Lwc59YFEyyt3FAm+7RwQG1ifZTE2mCd5UeCHc/FFGCNsJZA12xS8yUPG80vf
 yHgNh1KWRxg1x7ImzybvPfzH8fV0H2Mlh7ZetMEE8OkyMUdgPg5aGAMf96XfMCGgQx
 QCBOElpU7MScukLx7NG95ocbJdav4f4iVYfU48Xw=
Date: Mon, 16 Nov 2020 23:33:25 +0000
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, bgoswami@codeaurora.org, rohitkr@codeaurora.org,
 robh+dt@kernel.org, perex@perex.cz, plai@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, tiwai@suse.com
In-Reply-To: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
References: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
Message-Id: <160556956526.29683.2121148120940564064.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>, Pavel Machek <pavel@ucw.cz>
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

On Sun, 15 Nov 2020 10:26:50 +0530, Srinivasa Rao Mandadapu wrote:
> lpass_pcm_data is not freed in error paths. Free it in
> error paths to avoid memory leak.
> 
> Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-platform: Fix memory leak
      commit: bd6327fda2f3ded85b69b3c3125c99aaa51c7881

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
