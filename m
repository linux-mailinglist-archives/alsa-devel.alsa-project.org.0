Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DC331311
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:12:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD87818FF;
	Mon,  8 Mar 2021 17:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD87818FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219977;
	bh=/XCkUwvD3uSx0tUge8GRpyBkUWc+6WbOCiH17QZEkLE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJn5Egg5ENUV0ute1Y67KMNqEoJF0LVeBQNeHa2vAAjiSFP64y9s1DgS+J5cIUcBz
	 LpGF+8lDnIx/oG9qjpOkzmLGrF3IgXv8Nu8WI1dFJbxbpubRdDbTgIT2zvyUuewnFP
	 PCFjJGy6FSGC68mq3YZNUj0+Xj5x+K/T+uemObzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3390AF804EB;
	Mon,  8 Mar 2021 17:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 284C7F804E6; Mon,  8 Mar 2021 17:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D959F80482
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D959F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EWdGtKQC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E82C265227;
 Mon,  8 Mar 2021 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219718;
 bh=/XCkUwvD3uSx0tUge8GRpyBkUWc+6WbOCiH17QZEkLE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EWdGtKQCXleYF8OiUA4tuOsg4wHFg342IOMNqUybg8Du+k8vCHHI1S8rtELzykktW
 tV3N60cI/fjtuKDDo2SB3L/VmufTlWeNwV5hzMdPPgTVvpOe/R3YNtsJ9R3IIps9iz
 ybyQCgWbBQ7GANfSaDjCYOoM3uDBmdxcu6nAOF1kh7nQPaNAvBCxcsX6Q2qkFthYiU
 8LYlYA8upDstnNBBwvDoqdqfWEmLlbIcSOLB/YIrl2dBwX8zwWf45Lf/cclKFxE90w
 Vj/MTQ3XX7CiPtkdtJzDpoeaTceVtZkg7b6ifRHDhDMcc4LreR/ZnU7zJzuSsilU/1
 n5M3PE82hfbYA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Tang Bin <tangbin@cmss.chinamobile.com>,
 paul@crapouillou.net, lgirdwood@gmail.com
In-Reply-To: <20210307072133.10832-1-tangbin@cmss.chinamobile.com>
References: <20210307072133.10832-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codecs/jz4770: Remove superfluous error message
Message-Id: <161521960849.9621.2430171026353883713.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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

On Sun, 7 Mar 2021 15:21:33 +0800, Tang Bin wrote:
> The function devm_platform_ioremap_resource has already contained
> error message if failed, so remove superfluous dev_err here.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs/jz4770: Remove superfluous error message
      commit: 0f76a915201916dd3a21cebd7d528ca4b3112eb5

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
