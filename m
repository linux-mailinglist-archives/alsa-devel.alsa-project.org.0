Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDC59A8BD
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 00:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1FAF1698;
	Sat, 20 Aug 2022 00:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1FAF1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660949400;
	bh=gr61zTXhKdKcoL+U9nYufVpT53h0XuUHqgUWQ/ZCDhk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRmTlYfG5P2SFj8H9ZVAIJNgpdATk/VjoUX4+UEquh44VybP2VnxISywIUqQiJlYO
	 vSMUJcQZ1MoXJnoUksEl1myBa0NcwnrnmzcKa+iwhbPPZCmG9e2izj5V1mjiGdjf5J
	 og2rm5kfluJYeUYz5O9ug2AbuBZEgxfNl4qBb5HQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC1CF80537;
	Sat, 20 Aug 2022 00:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EECFF80526; Sat, 20 Aug 2022 00:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D9DF8051E
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 00:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D9DF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H9LOGmLg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F0FD61831;
 Fri, 19 Aug 2022 22:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F755C43147;
 Fri, 19 Aug 2022 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660949267;
 bh=gr61zTXhKdKcoL+U9nYufVpT53h0XuUHqgUWQ/ZCDhk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H9LOGmLgCybT/7Njtw0vQgLu4tyWlpZKZpBtljeF1D2v0tJEm64oHQyJ9pKxsXbkm
 8DhQ276M9td/uMBrxJpVUNjfe/aDKnyKbAtPHcWUuTdcp3vse12eRjXX4mLVqDOpkI
 NLUyWC1F1APQlYNXp+HjeF+eGxpMofDvKHM904dkfV0wOqXQ0LG2nbMBJS1rHhvYNu
 0vJ7WrpdzsL+25kJoxuBqUomz+zq91FhP7Z0dQ7KVeNJwJASJotpgny/lP4PiH1Jwx
 EYvI74DbXB92Q7PNOzRFHzWlp/Q7+mjxCXZe0SuDEApcAuQWCXWBBpBFG8CSucvDqm
 P2y4aBOPMaa2g==
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>, angelogioacchino.delregno@collabora.com,
 lgirdwood@gmail.com
In-Reply-To: <20220818025113.17144-1-chunxu.li@mediatek.com>
References: <20220818025113.17144-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH RESEND 0/3] ASoC: mediatek: support SOF for mt8186
Message-Id: <166094926478.19151.18027354027835618602.b4-ty@kernel.org>
Date: Fri, 19 Aug 2022 23:47:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, project_global_chrome_upstream_group@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 18 Aug 2022 10:51:10 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> In these patches, we add SOF support for mt8186 which have HiFi5 DSP
> inside.
> 
> Chunxu Li (3):
>   ASoC: mediatek: mt8186: support DSP downlink
>   ASoC: mediatek: mt8186: add SOF support on
>     mt8186-mt6366-rt1019-rt5682s
>   ASoC: mediatek: mt8186: add SOF support on
>     mt8186-mt6366-da7219-max98357
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8186: support DSP downlink
      commit: 3c15abbed0ab99bac2e075ad38d43a7004778e91
[2/3] ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-rt1019-rt5682s
      commit: 4be34e1b70ac72415a55e02683cd847436424588
[3/3] ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-da7219-max98357
      commit: 9398381a3904d8849691fb3ec173b48f077c185e

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
