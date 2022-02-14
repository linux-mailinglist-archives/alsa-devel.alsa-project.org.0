Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420A4B5623
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 17:28:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B391913;
	Mon, 14 Feb 2022 17:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B391913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644856124;
	bh=4OKuG2LEadxl8fctPRW0BKh8+ifLIIssXuNLgxWqWro=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcchxlUp/VADi962unCWKBuewp6ZQoI+VzW1SWbdKc5Rj13WuIgN/EZbch70ppPtG
	 8nsOwp6ehWeUtBu+mXvGTiqhHKNCMsyMPq8vuNXf57k3Vj/IJaXj58wWFJiTl1ZXiW
	 DVG83tPITUlIhzA/y9Vz1jagf2ko/boPtlGdxbis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 227EBF80430;
	Mon, 14 Feb 2022 17:27:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA598F80310; Mon, 14 Feb 2022 17:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68580F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68580F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uOtYrzcA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE672B811D8;
 Mon, 14 Feb 2022 16:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418A5C340E9;
 Mon, 14 Feb 2022 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856048;
 bh=4OKuG2LEadxl8fctPRW0BKh8+ifLIIssXuNLgxWqWro=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=uOtYrzcA/YsfJA6XweiY/nP1P/mXNGDAyZO/UTBB8rvuilPXUJSLKlAmnE8p6ICkh
 RS7F2VIZiixaCuNIz5LUNgNKDvjWbtBrxrus2rAFWSBTR4gmSMN8X0xfYUl7Dhe8aI
 UhY+nMa/WFlnU4ShMhzobZQmP2K+L86gpdnpFlbzWL1fVva94CAqv+Y1qniV4/2Zod
 iocqggfX4q5RJgZSrY/52XdTaHLjOjkEMIV2IfhbNhOykBguVyTu7JZkjVWIhYD6b8
 bZkwrL6b0T4pkZrTdtthkRGVE25eaphC0kxLd7AhohMTGEFxhrSAx93FkYdggP3kfT
 1fEA2CPcdh+5Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, judyhsiao@chromium.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 swboyd@chromium.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org,
 quic_plai@quicinc.com, robh+dt@kernel.org, bgoswami@codeaurora.org,
 rohitkr@codeaurora.org
In-Reply-To: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH 0/2] Add Euro Headset support for wcd938x codec
Message-Id: <164485604498.2890761.7849400676064736149.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 16:27:24 +0000
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

On Sat, 12 Feb 2022 17:54:30 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add switch control for selecting CTIA/OMTP Headset
> 
> Srinivasa Rao Mandadapu (2):
>   ASoC: codec: wcd938x: Add switch control for selecting CTIA/OMTP
>     Headset
>   ASoC: dt-bindings: wcd938x: Add gpio property for selecting CTIA/OMTP
>     headset
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codec: wcd938x: Add switch control for selecting CTIA/OMTP Headset
      commit: 013cc2aea0f62f864c8497b8497299bed4a248fb
[2/2] ASoC: dt-bindings: wcd938x: Add gpio property for selecting CTIA/OMTP headset
      commit: 20ea94bc5317475af70f003075e7988715457d66

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
