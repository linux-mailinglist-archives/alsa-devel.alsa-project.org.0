Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115822F8423
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5DF1821;
	Fri, 15 Jan 2021 19:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5DF1821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610734875;
	bh=3rRDT+rU1u3GZvGDwrSbAniCXS09VSj6vZ/alOvP+cQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEnAzO9Fg+GbZFI/hcirnYMiLLYO15IwVsXzfPXMRCmVHrQIBaZVtN+zHzG2GokvH
	 u+wIs7xhkwO0wjGqV+ECP4NQee//lZQgcKX40jRpbdQTv/1ZcPiq56SyJ7gOWAuLKp
	 bte7BUi/u0GD3ZC8tInGmWXFaBqliqcpB/tIHAtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BEAF80254;
	Fri, 15 Jan 2021 19:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36621F80113; Fri, 15 Jan 2021 19:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F9C7F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 19:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F9C7F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="luOgCmD3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16925222B3;
 Fri, 15 Jan 2021 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734771;
 bh=3rRDT+rU1u3GZvGDwrSbAniCXS09VSj6vZ/alOvP+cQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=luOgCmD3g2dKfofk01BU11o3YgKeJEe3zxEpjOWvZE6xhZ2FNIp6iDzXBui8Ddpkr
 FTLKNceUkIIn1qaztis+xvtvdPg28RuRE4MNtn4YHszzRMJrJZroQ/ZOS5G8iqAQzk
 e0xICRheUSWsmLwKu6crP6LKCy6InUrnn37H69KQAXpor429zGr5ExC7WdTppkykhI
 X+kGcc3GOzhT1YWzszmzZVJ6vpRt+6T0IiLrKjn1jveDn1gAZ4YgfFJjrbrVGlzuqk
 yae8KH7K8lFIGxY2M46zqR1j7aI/nc8vXDrBRp+nbzcB6Qin0OOLwHEq8JzZVw7UsY
 vrIAZCrtmXJCw==
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: Minor code cleanups for lpass-cpu
Message-Id: <161073473698.12268.9934599691128446500.b4-ty@kernel.org>
Date: Fri, 15 Jan 2021 18:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Thu, 14 Jan 2021 19:43:23 -0800, Stephen Boyd wrote:
> Here's some minor code cleanups for the lpass-cpu driver. I noticed that
> it casts away const from the driver data from DT. That's not great but
> fixing it is a little more involved. I'll get to it later. There's also
> some questionable clk_get() usage that should probably be
> clk_get_optional(). For now this should help a little.
> 
> Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Cc: Srinivasa Rao <srivasam@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Remove useless debug print
      commit: 16117beb16f01a470d40339960ffae1e287c03be
[2/4] ASoC: qcom: Add some names to regmap configs
      commit: 03b49bf9a92b18bbfcc3b5eb206cca8447e9f2cb
[3/4] ASoC: qcom: Stop casting away __iomem for error pointers
      commit: e697df66876c182927899950971c3b4888df3e6e
[4/4] ASoC: qcom: Remove duplicate error messages on ioremap
      commit: 4e15f5060d34dd28591cf3af43d3086a4b76c965

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
