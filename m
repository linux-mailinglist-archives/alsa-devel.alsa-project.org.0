Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422AD3A6FAC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 21:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5763167B;
	Mon, 14 Jun 2021 21:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5763167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700679;
	bh=YkjBzaYQqVslcwFlFmdUZmUuJIrU93d/ciBUzYyyyz8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRRBpdkxBxQY+1SE15GdlFzMPINsNkWPtJNxYe9wCk9ZB06jR+dJG3i2xyPjWEeK3
	 9UvMRAq4HNMjgLfeTgkGMaNbaQ0DgFhNrAvWcb3FrLnem7d116I28OjI++9YIUovTQ
	 SnlKH2HrgqoIjeDXJoNVVVJjF6I87RlI9iuhsTYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F811F804E7;
	Mon, 14 Jun 2021 21:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A76AF80424; Mon, 14 Jun 2021 21:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 344FCF80424
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 344FCF80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T8RPq4We"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC0E4611CA;
 Mon, 14 Jun 2021 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700491;
 bh=YkjBzaYQqVslcwFlFmdUZmUuJIrU93d/ciBUzYyyyz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8RPq4WeGUCKsqhc15G349HkYbxWxvMReLKrkk4aV84zFI9hQpQJMIW7w/Pcd3iTL
 vogvUEoVQEXVz77lCaDzV83BUGltnZSpdUAYSWjVV+kg+N4+Z16WmMcCh2uUG48/nx
 DfrqpuM9zNBf1Df+T4UZD2ux4kIiN6Rc2oZt2hU7VM3V2VioquySVlXTKM5w2x/6yP
 Btn04SdjZj6IwPoADpfwfZ6PBnYZfz6fMg32Rm4r2GP2VucUZnTiGZ2aJ/uTPUh7N4
 i3+ilXgqbtvjmU0zDjt2rWvo3GAwNXfE/Fh29hPcBvjhYg9Lmo2qI4f9SxCBiuo8W3
 oXzSF6Do2HpWQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: atmel-pdmic: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 14 Jun 2021 20:53:43 +0100
Message-Id: <162369994010.34524.16386719671018487251.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210611035351.3878091-1-yangyingliang@huawei.com>
References: <20210611035351.3878091-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: codrin.ciubotariu@microchip.com, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com
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

On Fri, 11 Jun 2021 11:53:51 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-pdmic: Use devm_platform_get_and_ioremap_resource()
      commit: 92570939c8b952272f630f807f8ddfac58411869

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
