Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165C337993
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19C7181C;
	Thu, 11 Mar 2021 17:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19C7181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615480763;
	bh=dYVRLS5VWyX7gUG8Qu6LM+nvJxKlncbsX9vvCiH5n6c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amydkCUpdFsPgYPabJvTatwC4KJIO+Tqkjkrn9flbs2wO4jSpu5MbABcz9wWUPtXb
	 YwD+yQdpXzpMjBa6a/cUvHbvbHEIq2K4PvTRcqqDJBYCR/oMUXl2SZCeXDN3Y1E1pD
	 DpJvIKPOEaaU/RdT2iulZ4iiJGzV3eARN81tePRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE79F80256;
	Thu, 11 Mar 2021 17:37:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57731F80256; Thu, 11 Mar 2021 17:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D62B0F8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62B0F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TynJDyYJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58F4264F9F;
 Thu, 11 Mar 2021 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615480660;
 bh=dYVRLS5VWyX7gUG8Qu6LM+nvJxKlncbsX9vvCiH5n6c=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=TynJDyYJwdun1XTklSWx6zrN0N1SohDKb4A1N1d2Tmln9pdMPFGolSENcL96TgdoZ
 GUxO14zs+Oi0RXf/9XuTuZUQyHeNuqmnBxwLlozaGyy4x7wp4KDNHXZoOzkuYRK/+R
 Wg1X0piNwK+YTX3M5PQ13YwIlV4c2NJZp9IcDKXRTGvJlrueTuQyKeVGF4fPHYzxQe
 jq9Qw9l0VzjWFtQUtU6jzmrAjltr/hi6tGvDPZ6dw0IQwRUa0zfLSz/yA9DB+stik0
 Ubf8TJwLE+inEMzQph+w7WCrLgc0j6rX9NIrgCUgUR8F7c+zIOgjy9EaMn79nZJv8r
 r0Lbioz+Ux1hw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 judyhsiao@chromium.org, robh+dt@kernel.org, bgoswami@codeaurora.org,
 agross@kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com,
 rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, swboyd@chromium.org,
 linux-arm-msm@vger.kernel.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, bjorn.andersson@linaro.org,
 alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20210311081805.20424-1-srivasam@codeaurora.org>
References: <20210311081805.20424-1-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-Id: <161548058820.3429.7412298596711968916.b4-ty@kernel.org>
Date: Thu, 11 Mar 2021 16:36:28 +0000
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

On Thu, 11 Mar 2021 13:48:05 +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
> 
> Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common up lpass dai ids)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
      commit: 9922f50f7178496e709d3d064920b5031f0d9061

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
