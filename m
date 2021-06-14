Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7793A6FC6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 22:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A7E016C5;
	Mon, 14 Jun 2021 22:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A7E016C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700980;
	bh=XUs/RkVRsS2DQDgtBGGjpYSxuKspJssz3WM2g5+NX30=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGPuWFmnuli3Lv9tQwcAsx3UCgE9wnwBqt1Vzc8CRfXOd0TNi0znJFhE9UpSo61/h
	 AlnpOIUZDAVMGx/BaV9jLdSqTF320HeVALEKEL/uO5/OAtwCv7slMXjqimO6t6pRKp
	 Il4uQGChhw60wXx8iygAm/9MlQJcCpUzDjy2DpmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA268F8055B;
	Mon, 14 Jun 2021 21:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90F29F80557; Mon, 14 Jun 2021 21:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB9EEF8053D
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB9EEF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZkLVUUCv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CE9361350;
 Mon, 14 Jun 2021 19:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700532;
 bh=XUs/RkVRsS2DQDgtBGGjpYSxuKspJssz3WM2g5+NX30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZkLVUUCv936N695noEQhWEoB4DK78vl7uecaP45/ucPL0Fj0IHfG+Cjem4rPSTMTL
 3qghGLUkK7UjjXpElI9/xxuBGBz1y7bm6dtjVbSPrvuvGqP7ovnDwoiwyKVgBo88wD
 LtuKAkKXZTYfuuJNZMVzypD6rrzyZeMI7capRDKopJJJ+U7GIPqeUXnThJ87ZAsE/M
 p6jk/8dbS0izYlUmizuOx3pqu/lfIYrDH9nRk5TX2Q8g200WrCIr4HLyJjmHwnq4UF
 dp3jTShtlYj/OWhiNn5nItHdftOAZedftG53JcZi3geVade/gOTSR58YLb7VLYdEFH
 fYlyAPtvOO5Jg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: axi-spdif: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 14 Jun 2021 20:53:57 +0100
Message-Id: <162369994009.34524.11852681325461893856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210610133120.141405-1-yangyingliang@huawei.com>
References: <20210610133120.141405-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, tiwai@suse.com, lgirdwood@gmail.com
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

On Thu, 10 Jun 2021 21:31:20 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: axi-spdif: Use devm_platform_get_and_ioremap_resource()
      commit: 68912ebf4d4e50ac4fd41fb9879de9a6b832f7c7

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
