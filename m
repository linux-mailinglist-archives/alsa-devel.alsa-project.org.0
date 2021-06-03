Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC839AA64
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 20:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1151716;
	Thu,  3 Jun 2021 20:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1151716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622746008;
	bh=0Iofu5y3yhdX3O5oSpp1e5/J4wQqZIC+DnVs7f+HKW8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNzSoWf+mdImCBCavEad6I5/SrfI7Q3WM5CVvJ7MGfdA2/sW2wDGAXr8s+MLCQOzN
	 N23MgdXQ6SUKvtLoAdW3H6yPvU/RrzBTxPNXbq0SEQ1jUZWZIVVsHWn0mpHf3x4zP8
	 y8hZtEXzFxBRKPUSK5ysNyfofCq8GEBLzAiweZ24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE99F804E6;
	Thu,  3 Jun 2021 20:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19BF4F804E5; Thu,  3 Jun 2021 20:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FE0F804E3
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 20:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FE0F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EfNP2vQe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6317A613F6;
 Thu,  3 Jun 2021 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745788;
 bh=0Iofu5y3yhdX3O5oSpp1e5/J4wQqZIC+DnVs7f+HKW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EfNP2vQezPPicA0tJJ31s854sWmHHe1q9gHQXoJlWBs0ZkVyUpSOB1FX7ifyzK0BI
 AoI0nUshYXTkSR41DhrNTFw0kVQTkP2sZ6yIsml0nh5wC9TMiv3Bk2OWxvPmh6c1gN
 6HGkh+lxJsdtpAYv3HrcZsocaydUSe1SXkTYmnP4pxqOB7RPPOAeV1eZr/SAdL6XzZ
 ht/OAg9BZ/8x9exenFfPNjL1AUAcQnyX69kuwX0ZFQarCZX660pzDMiEKI3yQ0hk7P
 jEUoGa8sjHc68iIN82Yz+P4pnmv3C6wkvpOxBf+XpQzvzJswKJXkshnQgYXo9HzzTp
 k+hqIwP93tkDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Yufen Yu <yuyufen@huawei.com>
Subject: Re: [PATCH] ASoC: img: Fix PM reference leak in img_i2s_in_probe()
Date: Thu,  3 Jun 2021 19:42:04 +0100
Message-Id: <162274557552.14795.2836643143905262375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210524093521.612176-1-yuyufen@huawei.com>
References: <20210524093521.612176-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yukuai3@huawei.com, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 tiwai@suse.com
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

On Mon, 24 May 2021 05:35:21 -0400, Yufen Yu wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img: Fix PM reference leak in img_i2s_in_probe()
      commit: 81aad47278539f02de808bcc8251fed0ad3d6f55

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
