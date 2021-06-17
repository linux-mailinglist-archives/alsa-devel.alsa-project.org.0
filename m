Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8D3AB6D6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6EB81768;
	Thu, 17 Jun 2021 17:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6EB81768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942202;
	bh=AinlTQZr6X/55gFUN/lRhGZfX6qM3L9BtodIV1cZqaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgBDY8KZ0UxJrnvHYAFd4nej0KQO+4nhfH1Rh6BhmmlFu9UPTsgXZC7MuMgpVahpQ
	 E7W7Wu0ziDjZnhWDG+OTKycCl1ImxPATs1kOgNNjpSwz3M0k+vN8fBoNiU6u44FSO2
	 fNQmLRbWr95ewY0bAjX+6w0zbAzALctob45K8Fbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E236F8025E;
	Thu, 17 Jun 2021 17:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2727FF8028B; Thu, 17 Jun 2021 17:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2804F80171
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2804F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h6XXfPlm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 958A0610A3;
 Thu, 17 Jun 2021 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942107;
 bh=AinlTQZr6X/55gFUN/lRhGZfX6qM3L9BtodIV1cZqaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h6XXfPlmv0IjQN72CwphklPPjvwIIqXOlSsY+qU6qhHrP+SIs8/j1YCddIBqVhtLl
 st/7M4wdw7q7KeRqLyoKLxf+iK5h0cebXBqTGebMroEzImmirRGw+dspeLCpgwiy+J
 Vvp1EoTX4HSb/UoVw75MqOT4f9BHJMCG3Aa0FBKt+VN8/z0YNNTslLxNhvjsAjmw4M
 6k9VSCh/3WsDtcUkSOnAV4wKUG/Dje3/dGdA383oMShVgRPGjG+JieT3JBXOQyOWA1
 AF1VYLwGrVrqVZx/NDKwrz0C7LPFRTY3koWXhTsIPFqJndPH1ifL9MPi9Q9mSJy5mr
 LJOax19YbF3Tg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: sti: sti_uniperif: Use
 devm_platform_get_and_ioremap_resource()
Date: Thu, 17 Jun 2021 16:01:15 +0100
Message-Id: <162394075660.19104.11973616551623311701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617033903.613727-1-yangyingliang@huawei.com>
References: <20210617033903.613727-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: arnaud.pouliquen@foss.st.com, Mark Brown <broonie@kernel.org>,
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

On Thu, 17 Jun 2021 11:39:03 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti: sti_uniperif: Use devm_platform_get_and_ioremap_resource()
      commit: 06e6d9044022e1be17757b2db5826115bc634868

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
