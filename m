Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3F311218
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 21:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7191681;
	Fri,  5 Feb 2021 21:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7191681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612556247;
	bh=XAtadadCpRq6P4yhkJk4lpQlLN9eZMiK5JUUHEYeSlw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcnmWfcEiCtFCQ3wK8KdEF9SV0OhH0L68IwFsQ40w6RgOhB0FImcosUjeK2lC9W0I
	 0RaPbWqEDUf1EpUMTliikoxZAk69omoYVVZWw7ouqmZ842Y57bm7/lERZAdteEsoXP
	 InLgXzVSdlz+nK6HRgWeFNfH7SJKKE7sQq4TYR8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E12F8023B;
	Fri,  5 Feb 2021 21:15:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE92AF8015A; Fri,  5 Feb 2021 21:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 378D1F80152
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 21:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 378D1F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pCCYzfCD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0913A64FBB;
 Fri,  5 Feb 2021 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612556133;
 bh=XAtadadCpRq6P4yhkJk4lpQlLN9eZMiK5JUUHEYeSlw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pCCYzfCDko0bbjxyMMxTdEjkbgwbiMGFWRCJUaejNW1cptfTLfnAlCniWcsN5IbqU
 ZTtvnlhoiayT5U8JpzgedLxOpQq9Aeu131kULWnjjEYCrz9H1/mDKQacC7p4IPo1ws
 Go1o5tKFQxJXNnUNckEigwdY+4PVFMMzXTkzANt+71hbt2d8O1mvqnEbaSicH0UBSu
 GW+16lQWD/AeXIYX029V18ItLf/IvjBwkeREc5pB52+mGCbrXfTxypeMmstvav2J8A
 XrJDGTokTP2anmX4laHTvWDtP2QRWCFwsj3F+POF6bEPnzEWglRSv47GMOvsvQd58C
 9yZQeJYmtKGlA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, Jun Nie <jun.nie@linaro.org>
In-Reply-To: <20210201132941.460360-1-jun.nie@linaro.org>
References: <20210201132941.460360-1-jun.nie@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass: Fix i2s ctl register bit map
Message-Id: <161255607745.56562.7339154592413993847.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 20:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>
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

On Mon, 1 Feb 2021 21:29:41 +0800, Jun Nie wrote:
> Fix bitwidth mapping in i2s ctl register per APQ8016 document.
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and
> dmactl registers")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass: Fix i2s ctl register bit map
      commit: 5e3277ab3baff6db96ae44adf6f85d6f0f6502cc

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
