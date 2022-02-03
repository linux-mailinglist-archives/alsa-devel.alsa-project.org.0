Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A44A8790
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 16:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E91816FA;
	Thu,  3 Feb 2022 16:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E91816FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643901669;
	bh=fkmhh2nZS2bagIZM4kmtINyEqgLkLtHyNbDGIR19QK4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqFaBVG1Bj5+dgExEXK2HzEa9MRWu4bGX1N33JNSOFA9vc+zWGCr5qJC/IXof4SJ8
	 XsDpKm0CQU2YoeRSmtSMP+65SHxPoZP3o5CwgamzYzS5cjQjMOcUbwukAOKpR6OqWD
	 sqflcm0cgfeMdod64WsDe1SIz8GUWwxSTDthFL7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAE2F802E3;
	Thu,  3 Feb 2022 16:20:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7813F802BE; Thu,  3 Feb 2022 16:19:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE5CF80159
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 16:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE5CF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DC9ynJZa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D68C160A3D;
 Thu,  3 Feb 2022 15:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA348C340ED;
 Thu,  3 Feb 2022 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643901594;
 bh=fkmhh2nZS2bagIZM4kmtINyEqgLkLtHyNbDGIR19QK4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DC9ynJZa+R+9SOT/YIloZ9GcbI/zr64/t3eSSVzxeuznNUMa26bSiCkkw9HH2YgyG
 zFlhNwq0uxgIeliXGw9FtAlHzJYGDad/DOydDYO6VyGJjnADCoPCclltYruIF1v9D0
 YepaWy1Ry4Bj4A0l7OW5mIQG2ZLYb/3YMTVbW3tb6LBcs4I0AJzVlOZvimOQXebDZL
 fCqlOGwwdK8INjcHiwGwcybJcqNDWw1UsE6gWgPgmhLDZFFyN8770HHK3zRQmO735H
 HhalisnBmwCMNH0Zm1tvaN3uZL9Hyz4fqh3dj+o+cG9HvrXYGsJZrq9IAAVCK6/1e6
 J3u8IaCMCd/4Q==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220202164545.30457-1-ckeepax@opensource.cirrus.com>
References: <20220202164545.30457-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8962: Allow switching between analog and digital
 inputs
Message-Id: <164390159261.786717.3589990399602455425.b4-ty@kernel.org>
Date: Thu, 03 Feb 2022 15:19:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: martin.kepplinger@puri.sm, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com
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

On Wed, 2 Feb 2022 16:45:45 +0000, Charles Keepax wrote:
> When the DMIC_ENA bit is set the analogue inputs are disconnected from
> the digital core of the chip, in favour of the digital microphones.
> Currently the driver will always enable DMIC_ENA whilst the GPIOs are
> configured for the DMIC function, this means the user can't currently
> use both the analog inputs and the digital inputs in one system.
> 
> Add an additional DAPM mutex that allows switching between analog and
> digital inputs into the digital core.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Allow switching between analog and digital inputs
      commit: b5083c0c948ac7f52ca700af219cb491735ecd4b

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
