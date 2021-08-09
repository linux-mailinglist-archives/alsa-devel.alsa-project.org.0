Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE93E4624
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 15:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860C3167E;
	Mon,  9 Aug 2021 15:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860C3167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628514493;
	bh=rEqpI+98X4LE1B1t+KYLHnIXl5RlP80YLG32eZNXOmI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgaKfuelwnHUviCG3XQdRXyZN6mP5cvhyyxRhyHn9tuZX/407KsJ9WQyGNbHKJspv
	 9dvi5lzgMFHHg+kS+lT6WWpF4r0bydSmO1EVKln3hvrshO0WwTMj09/sGZP3Glvv7H
	 hyjQ2TBr+4Zu5lvzn9zHmuZWLytLTvFGAPE1u2aY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9D7FF800CB;
	Mon,  9 Aug 2021 15:06:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9C40F802D2; Mon,  9 Aug 2021 15:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9346BF80105
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 15:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9346BF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cu+4tcj+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 568FE60EC0;
 Mon,  9 Aug 2021 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628514395;
 bh=rEqpI+98X4LE1B1t+KYLHnIXl5RlP80YLG32eZNXOmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cu+4tcj+XnrmFi/P7Ieyo7BZGQvQSh3FkJUTbhEUYkkselfWLN3mcrT/KPcdT9Q/S
 i/JxpQUTbx+5x4T9bduFoK7sywtyojgwar9HgG/OxUI8Kgbp3wg9NAKI8wSo6cjTPO
 4Lpmx0q3WYGpSJeT/6yiwQPwZlfAdbv5d+rA7WLUxzW+kUIObNgaUPjXu0vW0hjoBM
 oGCZY3pmh5UC5m/gZLAbKxvliRlpHk9WUH82buBbE2hly6tK9JK7eg+H52c7WEQPjh
 sebU95EvUlYJK9+xU6ab2/ypTS5eiXa2cBtEpynB3s6u3hVSnilb0N9iI3p2PNhezF
 Dw0Fbyk/d+1QQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v2] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
Date: Mon,  9 Aug 2021 14:06:07 +0100
Message-Id: <162851391370.50969.18431436313519006594.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806114116.895473-1-vincent.knecht@mailoo.org>
References: <20210806114116.895473-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

On Fri, 6 Aug 2021 13:41:16 +0200, Vincent Knecht wrote:
> This patch adds external codec support on secondary mi2s.
> It is used for headphones on some devices, eg. alcatel-idol347.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
      commit: 1e2c7845421b785282c098712a81556a2b8917a5

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
