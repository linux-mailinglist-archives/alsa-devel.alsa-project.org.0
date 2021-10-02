Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7A41F8AE
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A3516ED;
	Sat,  2 Oct 2021 02:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A3516ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633133926;
	bh=SqkMJsnkHZDT+eZzsrisFKTL2JeLsdSMMioQ/miBr24=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qf2oCyHu1cBC6c7saEidEUNTzD8Tl62n24UPSVKAKW6BcdJ5kh500HrBlv8QQ9zXD
	 jzWlPWRUnMYID39NmawVglMTCcZewF9zx0ohNJUlLjJT2wcwoTx3bV+P9JfMdmFUdl
	 jZBHDTMOKdv1/DsphwxeIWvgMZl87z3Cmc9KNRzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8432FF80165;
	Sat,  2 Oct 2021 02:17:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57424F80301; Sat,  2 Oct 2021 02:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE1DF80227
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE1DF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+GLco18"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6CEE61ACE;
 Sat,  2 Oct 2021 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133812;
 bh=SqkMJsnkHZDT+eZzsrisFKTL2JeLsdSMMioQ/miBr24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V+GLco18UbSCDYlixqfJ9E5tda0Fa/sW5GEE6hFZwJnfxEfOUVMC9i5tm3nE8tW5d
 de6aoIagpe8OLsXHUlTfV1lYmvS1rvszVC8BP6oHp7XDwF4T+XMEOQPOI79Y/lpf//
 2+EFtyujN+k52GqtZ03Vd4uo4KfWYJKf8++qJeiaMvrfQ5attEOXoocz3R9BcEGYRw
 k2pWIh7XAvSVUPO3qbywCECoobcJGiSSZBz4Lzy6WhruFBjFg/guTQb/Fj5b14tJ6X
 C5XpJzVz/WsO7HF8nUIXbQYNWa0MvSPqiC+Ha+1PYliM/ox9LCx4hoyZXiJ6J6/vOW
 Zdt+3LfuHF89Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Subject: Re: [PATCH] ASoC: mediatek: mt8195: move of_node_put to remove
 function
Date: Sat,  2 Oct 2021 01:16:27 +0100
Message-Id: <163313339131.45396.13424331817826400710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001031601.3953-1-trevor.wu@mediatek.com>
References: <20211001031601.3953-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 1 Oct 2021 11:16:01 +0800, Trevor Wu wrote:
> platforms->of_node and codes->of_node are assigned in probe function,
> and of_node_put is called at the end of probe function, because of_node
> seems to be not used after probe functon
> 
> In this patch, of_node_put is moved to platform remove function in case
> of_node is used at any occasions after probe function in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: move of_node_put to remove function
      commit: bd8bec1408ab2336939bd69d93897bf19d0325ed

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
