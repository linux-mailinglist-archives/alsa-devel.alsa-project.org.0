Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA53A6F97
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 21:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13EC51694;
	Mon, 14 Jun 2021 21:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13EC51694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700594;
	bh=rHsL5zO3qV53Kq7tZnvcepUF9YN1NPGgwiK41SgDBH0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKO411dCaMkwemDxBVVp5Geu9x8X2Nr3t9t59rljT3CL86y7uMjqHP7m84VFHTDsL
	 mGR18GBwo9/NJHwB/MxxjNxp0eI6Ie0nFP7b8JsVkuwVI8tipeIZxDZtqAVPukQJ/i
	 1ciZxvFk6y81gIUQ6cBCN0UhmSg1q6FlryTQ23Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 689EAF804CA;
	Mon, 14 Jun 2021 21:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08531F804B0; Mon, 14 Jun 2021 21:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC77F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC77F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XpPn7BKk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3AC861246;
 Mon, 14 Jun 2021 19:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700483;
 bh=rHsL5zO3qV53Kq7tZnvcepUF9YN1NPGgwiK41SgDBH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XpPn7BKkmczHCNV9PTcTZP5wyFted1Gbw6E+R3Ai6nW+EJ8Oyd2i+PjZE33tXJ8BV
 6uj+e/LvozNWq+7RRKAD+AxUitN4SLXCjfhpvjOObsjVjiOfqSEapxgamJY3CdfAiI
 vIXv7U99SBanQRMf3sPoD8JPPA9JEXTixZWaNHhRksX2NOvicQSs2RxSLt3TLzLjZa
 fKbKK6vklApx+bahGb/QR9ELSXW9eA/PnI5SUhmcHPI1DdP/FC1Mpn09JGJwJJhkxy
 wZVzn4VXRi9Pg1jyj4c5HBgUgFnzNGlukiIqFWLDma7Wr5MZtOeupZplYaDD51zUnk
 U5tXHYpWdjFcA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: atmel-classd: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 14 Jun 2021 20:53:40 +0100
Message-Id: <162369994009.34524.9266310956959429482.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210611022115.3583765-1-yangyingliang@huawei.com>
References: <20210611022115.3583765-1-yangyingliang@huawei.com>
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

On Fri, 11 Jun 2021 10:21:15 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-classd: Use devm_platform_get_and_ioremap_resource()
      commit: 9494d059971c5120c60bbe4aae5cba00b20ed774

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
