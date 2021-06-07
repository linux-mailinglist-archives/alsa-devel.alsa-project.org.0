Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329139E718
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A42481698;
	Mon,  7 Jun 2021 21:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A42481698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623092619;
	bh=BUGAoI+KqIWeSqshgoFKvoknfcZfg6rrVZ5THdPAqLc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4AfjwRKCxFPW0oR84CPp3mpW9f8vY1+67CHcHXZdM33z6r4oHGiNL8XJbpx2ltr6
	 IZQJ7ry4TRvnnTVHutSXZOs7dbCVpqiXqF2X0yBerk9zp1xILmEBg7N/Vk7C8GOGYB
	 YizcrBKq9d+2ebuFp8Di3E3/h+8GlUGzunGW+lCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F609F804CA;
	Mon,  7 Jun 2021 21:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAE68F802DF; Mon,  7 Jun 2021 21:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69344F8026C
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69344F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BXFoK3hH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B98561164;
 Mon,  7 Jun 2021 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623092477;
 bh=BUGAoI+KqIWeSqshgoFKvoknfcZfg6rrVZ5THdPAqLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BXFoK3hHKx/nBaxEkLMVoPl5nv2z2l1Hmk3O9qgDReAwaJL4v6VMOrrentpY7sz1l
 3GF6XyEHO03ZhOmRT2Iz4agrQowtYGHXUWYogvCU2BEpgJx9VxDHgm6Ia3Xoi37N+5
 8aTQywFvW4ls6zLSxxmzpKOaA5mpIIx3dJKoFFPrxw55rfCixkbSA0y239VbxNE27A
 LMuDoi7lgS4/1Q8fqa1L57bZfM6pqhQbiRZuCAa+a1dNSaMR0dpjsjMQEf76wqEb5z
 OTCg3NxsVHWb4QdGuUx+dKxqPlf8bcnHZtJyCWCGQdUYbVTmXX1e4YXBD2Hx4nk5sT
 yTTPnQ3zH+axg==
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [v7] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
Date: Mon,  7 Jun 2021 20:00:46 +0100
Message-Id: <162309220525.30523.13322673130433156811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604154545.1198337-1-judyhsiao@chromium.org>
References: <20210604154545.1198337-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dianders@chromium.org, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, judyhsiao@google.com,
 tzungbi@chromium.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, cychiang@google.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Fri, 4 Jun 2021 23:45:45 +0800, Judy Hsiao wrote:
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start.
> 
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
      commit: c8a4556d98510ca05bad8d02265a4918b03a8c0b

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
