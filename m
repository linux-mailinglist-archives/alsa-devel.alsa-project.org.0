Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5842CA8E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 22:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93545167F;
	Wed, 13 Oct 2021 22:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93545167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634155294;
	bh=jnF9fcRu7yXZHVCLu2T4kmJ5wS9Wn3iOmYmY9ymBctk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Smn2ySlGttgoRHJI2wYBEJt45afzylRY219dWSU+l5txEnYqxJv2qNLHd6fUp97yy
	 Bk3jAwo36YTKLnzLY9UAhgz2p0pbL1REm7pr7nYqrvF/zmUN+jUrvMdBbiHVZ1jAof
	 F+Kkq2mjL/9bcztCGytqMYgXE1TW+8LJlTtFdzQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 689A0F80290;
	Wed, 13 Oct 2021 22:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 755D7F8028D; Wed, 13 Oct 2021 22:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB14F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 22:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB14F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mlU91my6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2105611F0;
 Wed, 13 Oct 2021 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634155209;
 bh=jnF9fcRu7yXZHVCLu2T4kmJ5wS9Wn3iOmYmY9ymBctk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlU91my6+As/ZlrtRFPb33MOJr04ueUWqpj04zpTzp9jpFLNwk65SvrefXTyGzguV
 dA79iV3/WT45uvvq6bwLVQDU81/0INNX94+hQ2H2DgIX2+0PgZnpY7f7vYVl+r1guF
 +4mxdNE36lW2F+IFgmKYSCchYbph6yMn3JtzdlyD7o3+4r9VO8e23VMvVHLWMbAIl2
 FC+IdC98SMG64v1gMcoqJm3hiZ9zXlklN4FAo3qTxLcHHgEbnis+TIGNwjXJ4Aa7QF
 b5TkXUsF1OVRD/XDVK/lzFvwhciXu2Q0s+bb11VIN/FuCVGRc/EMlqvB/e6vvK0qWn
 5/OJro8dxL9dQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: amd: vangogh: constify static struct snd_soc_dai_ops
Date: Wed, 13 Oct 2021 20:59:49 +0100
Message-Id: <163415517073.1358186.17967517863564230911.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012211506.21159-1-rikard.falkeborn@gmail.com>
References: <20211012211506.21159-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On Tue, 12 Oct 2021 23:15:06 +0200, Rikard Falkeborn wrote:
> The only usage of acp5x_i2s_dai_ops is to assign its address to the ops
> field in the snd_soc_dai_driver struct, which is a pointer to const.
> Make it const to allow the compiler to put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: vangogh: constify static struct snd_soc_dai_ops
      commit: bd6e4b992bb0580232e900762c131d95a73808b7

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
