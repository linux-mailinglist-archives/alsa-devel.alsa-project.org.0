Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D665337A243
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635EF1788;
	Tue, 11 May 2021 10:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635EF1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722204;
	bh=RSHOPfuP6d2uabLkKal2d2xhCS9VMtr0Me6iKlfK9QI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxrO52yjDs+0IFRV3gaUdFYYnWM2x3TqSELA+uO/KxHmfoLIv2eZHp/AgRxgm2P/w
	 gUxjaNkt99bD/vDoyaQXF6xgE1JJ96K/cojJJBv2QnDFI6/7s+3XEBZL/2urWrv1FH
	 R+XGbiRSU/Dtt5yoxEYYxmFx+oRcFqswlGCeHeys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63075F80245;
	Tue, 11 May 2021 10:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C6F3F804EB; Tue, 11 May 2021 10:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 497C1F804E2
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 497C1F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o6lgLnQ7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19751613C3;
 Tue, 11 May 2021 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721705;
 bh=RSHOPfuP6d2uabLkKal2d2xhCS9VMtr0Me6iKlfK9QI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6lgLnQ7iUAGp4hTfiKvleNPFOX6SocVgNfLcLUhfnKbdy8bEc1KDawBabJrpzs5F
 mNONJjUMthoW4CVcg7NAs1Y9slD2NfyjsXeUA6aIfw4cbVBWU3/y7Mdz7MwsFyjXc0
 5J1HPLdk9Cl9WugljW6ohDoOlYrTbA//1Gfr+HqGGycKynIqIuWCDzlPcFPbI9ImuZ
 PAElxqQkfkq+te1/dj2YzlHIpU1jq62etl9FTR9F5NTniGg5MqIu6DDQtD162ONkPs
 sMLsWTH8dAaCp8AALjCSP1/YDFMly088umRvdAOcUrwaZHIrfFgGl/NwDPFSyZdsXI
 rG2QAeocThQYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] ASoC: ak5558: Correct the dai name for ak5552
Date: Tue, 11 May 2021 09:26:04 +0100
Message-Id: <162072058170.33157.387118407952488972.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620470807-12056-1-git-send-email-shengjiu.wang@nxp.com>
References: <1620470807-12056-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Sat, 8 May 2021 18:46:47 +0800, Shengjiu Wang wrote:
> Correct the dai name for ak5552. The name should be "ak5552-aif".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak5558: Correct the dai name for ak5552
      commit: b23584d6ce0212b9ad6cb7be19a7123461ed9e09

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
