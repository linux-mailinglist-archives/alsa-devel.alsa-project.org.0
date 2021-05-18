Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0B387DB3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62924175B;
	Tue, 18 May 2021 18:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62924175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621355723;
	bh=yYE3C83ZCcen1JqtN6SbUMBER9tKZM+sb+rFDEm69H0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryFR1ahe2UVlGxDnT3BICOuGe579+b9qaa41cmv6vY3wMmzmhCtCARtlBFkboEM39
	 BSTDIvznigA/7Xswz3upmbZAvKD0iBJI0kVMIgY6aNBGM1WncOtnMdNmejwtqaCdz4
	 Yk0rD//n6wcliCYzsYfm0y29eiL6HOX7BoUXZLf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8462F80482;
	Tue, 18 May 2021 18:32:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D396EF8014C; Tue, 18 May 2021 18:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 576CFF8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576CFF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mkVP+fRp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C85B561209;
 Tue, 18 May 2021 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621355567;
 bh=yYE3C83ZCcen1JqtN6SbUMBER9tKZM+sb+rFDEm69H0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mkVP+fRpjaBmmd34MdGpnv4vm3hnQRlibsdJCq6/jxAEqdFanLOI3Hi3rjjTgM8Ug
 yeGvtT8EGjrX9GbS7T/7U1gVYnwP9ry9T8LFxH1CaOm6fMURT5tuC7/YkGbEhzdOEE
 +wQY1AzmmIis8LFhHlTnLeYH7yF+trO81WnrdbPYxeQcx4XbTd/RgkmPVHmaYFyFub
 8+zus0zqjNjstug/1Z0WLujmXwwAcaZRNC533TE3PmhGmk0/QETmaRq4+MW9UYE2dS
 TGAYCYBhYJ3We+pqdL16dCsnYNnkeQ5+MHBqBaUg9/IY80592ZrF4Hb2YhPWeGPkzk
 3Ko0FL8v3tDEg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: hisilicon: fix missing clk_disable_unprepare() on
 error in hi6210_i2s_startup()
Date: Tue, 18 May 2021 17:31:34 +0100
Message-Id: <162135531446.37831.10556462554575862274.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518044514.607010-1-yangyingliang@huawei.com>
References: <20210518044514.607010-1-yangyingliang@huawei.com>
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

On Tue, 18 May 2021 12:45:14 +0800, Yang Yingliang wrote:
> After calling clk_prepare_enable(), clk_disable_unprepare() need
> be called when calling clk_set_rate() failed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hisilicon: fix missing clk_disable_unprepare() on error in hi6210_i2s_startup()
      commit: 375904e3931955fcf0a847f029b2492a117efc43

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
