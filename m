Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB523AB6DF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3A3A177E;
	Thu, 17 Jun 2021 17:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3A3A177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942266;
	bh=CTtyfFQGWWovOtDS+qRZsuHugOAENWrHm4AEZc6unu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oH+DtyX5Xqqxfqzn8PSp5VYTLgCEHFOBAeqOZIKFgxF74ArZMDAyUfixp1Z7pf/BU
	 fQRwd4mf0II/F7JBj2cN+QyaSMHom3FpV+kt4IFWJ9O+XNVv4Y6jccjrCci4MD8bbu
	 ss0ltB8l4FAxAGzTuGTEG1oW2Xttb+/mpm6Yn1no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96CD4F804DA;
	Thu, 17 Jun 2021 17:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 869CDF804D8; Thu, 17 Jun 2021 17:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38D0F802A9
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38D0F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qxe1zkqK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D674060C3E;
 Thu, 17 Jun 2021 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942113;
 bh=CTtyfFQGWWovOtDS+qRZsuHugOAENWrHm4AEZc6unu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qxe1zkqKtDabjy+ZL2MWvHHi0JxpH/YBPg6BO59pdSrx7QfNxKwAvIrjYcCJ0tLFJ
 G0KLsmTFrDkPYSyficsVgAb84jqh50l50rEMUnDXjCKzDCQpm4KYhAkCIsHIEQIv+o
 6hJ+6jfcy3l/KBGXPdb6ld0Iinm9emyjhDPuY3MwLMQvCxP+Raqxrx3OQnKF2mTh3j
 VbUMrmojWEojC0LZzHaOCA1wQ0Z2JVCg9lilmo+BWp947YEen9B2Ektp/YkbaQlsWv
 wnhxTwxYeaeLXMuZuV3zXgjtCFtVxFcH7SWn30WTkQ4fZ5rEwh32buyBn1XnBRDbCL
 PR//6WMnqYX0A==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: spear: spdif_out: Use
 devm_platform_get_and_ioremap_resource()
Date: Thu, 17 Jun 2021 16:01:17 +0100
Message-Id: <162394075659.19104.4524131228561652515.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617032900.600124-1-yangyingliang@huawei.com>
References: <20210617032900.600124-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Thu, 17 Jun 2021 11:29:00 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: spear: spdif_out: Use devm_platform_get_and_ioremap_resource()
      commit: 114bacc75c2189a6ed7ee208545e8d6777c94aec

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
