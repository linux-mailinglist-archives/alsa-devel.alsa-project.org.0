Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC09337995
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:39:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28BC3186B;
	Thu, 11 Mar 2021 17:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28BC3186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615480776;
	bh=pHFXEHpaYQNlJR1V5PQDUmn7CRQ5pNsHtX4fcNTco64=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQl0fDAY87YRlBwFRcBodVFwfacRK8I519jXqU2GPyuqbzB2WpOLu/7odDzL0e9rV
	 KZ8HByN+X5xNpFRJ4A7x3WR6t0RnbQNLWHLmRbkVaidOVijRxbcqh/GO/tVuvVsosm
	 IUUUkleGjrca27C0yhpW1piFbQu6Ex3dVR7biBqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0672FF8028B;
	Thu, 11 Mar 2021 17:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC01F8010D; Thu, 11 Mar 2021 17:37:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88ADEF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88ADEF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uTaA31Qv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4016C64FA3;
 Thu, 11 Mar 2021 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615480667;
 bh=pHFXEHpaYQNlJR1V5PQDUmn7CRQ5pNsHtX4fcNTco64=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=uTaA31Qv03qaGKoRKBAYaR389BGa6nMcaRXpBnpCmasmiUYhp+R1yFt4mSuLXj8e+
 X8R1AGh5xMAmnugDelpl214NugXqdzmrZkPv7d2lS70ydGqvyPnSVKUPZlT/g9JOVm
 EBZWo1qAncz8XLCCAY/QNsWl4i0VqFeKAJtxepi7eusZLazj8yrtZtJWxzaVkczUX0
 XJ1XnF5PxXoUAUWXcogFtkJiygAgNILMUpi2aB5IBcmHo15206Ybkb0DPQnFWnpgOj
 XsUo0/RtWoexiZq3SEO5kvCHK231HWm6B1lfGVWg2w32efnKSCW6AAza8UHbIM/bK5
 dSyRwfrtoLKWg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bgoswami@codeaurora.org, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 srinivas.kandagatla@linaro.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, judyhsiao@chromium.org,
 alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20210311154557.24978-1-srivasam@codeaurora.org>
References: <20210311154557.24978-1-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-Id: <161548058821.3429.1675752758306184936.b4-ty@kernel.org>
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

On Thu, 11 Mar 2021 21:15:57 +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
> 
> Fixes: cd3484f7f138 ("ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY")

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
