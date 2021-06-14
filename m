Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AA3A6FAE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 21:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272D0169A;
	Mon, 14 Jun 2021 21:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272D0169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700719;
	bh=PnHK/VR5cOpnsRVccuzXTfVuyVHxXtdD1FlUCiH5SLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYwtjObIvMLNQBr1oR1sJkaU+KheRt4MJDqplRggSLYZFI3wSOPvzL6uawlew+0Q6
	 Za1OjtAUJ2oiqS6m2VoEHKYNsrr44AfQ2D1JXjXqyhGjS9fjsrtoVJqpg5eB9vntPQ
	 EEwEJnePktNCfh0BAPunJGZIawvrHZjdKdzRx7is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C888CF804F2;
	Mon, 14 Jun 2021 21:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7061F804F3; Mon, 14 Jun 2021 21:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4BACF804D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BACF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JCv6KE1e"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C83DF6124B;
 Mon, 14 Jun 2021 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700496;
 bh=PnHK/VR5cOpnsRVccuzXTfVuyVHxXtdD1FlUCiH5SLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JCv6KE1exAGVCpty7wHJatW7A0B7P1MM4+B0iiwLOjf5FMS3jhQ0Eqt/8UY/Xj6Rm
 zOu9wjOEZv2Re/Xmgidnlw+qxmvYGig/BhqxkbOCQXqsLHmkGQqMO5BPkP/Uj8kHfF
 BXDWeHiDVdpSyREMRwJ5YZthQ+zcBPc/mzI6rF5nonCzGwBoL5dhDcTA3gyYOTnFqz
 rYyknQIC1pLozUVfVy97BFeLlgS4PmN66pVeQZjj7ZNrOH7yz+OGONAzn222pJTduy
 OapCgU/8NBNr5uo0/XicG4WXUuP003OajhSF/6zX+3NWz7QCi7fa+9zZ8CN4L+qSgN
 iSU1XzrbQvLMQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: bcm: cygnus_ssp: Use
 devm_platform_ioremap_resource_byname()
Date: Mon, 14 Jun 2021 20:53:45 +0100
Message-Id: <162369994010.34524.11074726668440482305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210611050235.4182746-1-yangyingliang@huawei.com>
References: <20210611050235.4182746-1-yangyingliang@huawei.com>
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

On Fri, 11 Jun 2021 13:02:35 +0800, Yang Yingliang wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bcm: cygnus_ssp: Use devm_platform_ioremap_resource_byname()
      commit: 3814c41778f3489ac103c9a045ae26c082d19be3

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
