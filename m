Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844D59FAAF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 14:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E0F1622;
	Wed, 24 Aug 2022 14:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E0F1622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661345972;
	bh=d37TvzEEwV/Y4PGipJK/1XGqv3smEB6DxMlu5+fnV+A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+20GDPshH/O4LFhGDbGn3fIdGkWJtp4hNcvOGTKMmXBAsj9X4KHZTyoACLEZrflF
	 Z+DK9QFgifsdrya8weqoGHV/cj3q+B5PavQ/8mRs0WbLBCT8W9Py+o9XramHuGevVd
	 qEDOCp0cCxWaQARFECYmIzdcwR13n4XNOekf2Cwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675DAF800A7;
	Wed, 24 Aug 2022 14:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29408F804BD; Wed, 24 Aug 2022 14:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1968F800C8;
 Wed, 24 Aug 2022 14:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1968F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pEiH716i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B80476162A;
 Wed, 24 Aug 2022 12:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F93C433D6;
 Wed, 24 Aug 2022 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661345901;
 bh=d37TvzEEwV/Y4PGipJK/1XGqv3smEB6DxMlu5+fnV+A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pEiH716iUzx0z4CkedRKooX9m+2QGfaaBlPRgPyvrcvjyAm2bfZPg9kyoj4GRDsIW
 HkOpjMKDIKKJ7WURG+sB2E1FY7zfTZ7Jny9YaLzwxVXUlGDDU6y8/+GWPPaixtli0H
 t4lQ3yjtS/TkqzLxd9W+m4IgAQ9LJov5mVFeGEkfkArexirnufQ7jCOhaiEEOIyr/I
 oQuIqr+/hZa334npq348Cxk19Is7jTUYsIsEZy/uHEtKmKPUy1cpivmoRDGZTgfovl
 g9HmNgQNVneBckdPurpdQ6EWvUnWu0Xl7rTZGA8h6py4X/USE8F9JC7BC8SH/mzBr3
 I2y/L77R/6baQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, 
 Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220824013234.375738-1-yangyingliang@huawei.com>
References: <20220824013234.375738-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next 1/2] ASoC: SOF: imx8ulp: change es8326_regmap_config
 to static
Message-Id: <166134589925.62446.9609144399973742023.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 13:58:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: shengjiu.wang@nxp.com, daniel.baluta@nxp.com, peng.zhang_8@nxp.com
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

On Wed, 24 Aug 2022 09:32:33 +0800, Yang Yingliang wrote:
> sof_imx8ulp_ops is only used in imx8ulp.c now, change it to static.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: imx8ulp: change es8326_regmap_config to static
      (no commit info)
[2/2] ASoC: SOF: imx8ulp: add missing of_node_put() in imx8ulp_probe()
      commit: adc641f1dbce48914445efb79f302380ff10df10

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
