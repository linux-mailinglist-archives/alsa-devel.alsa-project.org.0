Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D134F9D65
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 20:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A1718E2;
	Fri,  8 Apr 2022 20:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A1718E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649444292;
	bh=149hZWeq+g56B3wWXpoGYNPuJSl1G0KTxvCS0gaI4u0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6pUcOjIm6yHh7a427Vj+fVz/ZIQS7EgYImok0is495mWVa9xT1X3DsIT9bf7WiY9
	 En6z7A6l+DTtWPrkoAkOHsLbAhLQ9Xu4WDsWOi9XaLwAIBBIE6iTTcRAMlzRTJ0yS1
	 ij3FGaBgfNqUK9cW6ART90A/waktqi56lIXOLwZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED22F804CC;
	Fri,  8 Apr 2022 20:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AB73F804B1; Fri,  8 Apr 2022 20:56:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17482F8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 20:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17482F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s2DUjNiW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D309B826CF;
 Fri,  8 Apr 2022 18:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68C7C385A3;
 Fri,  8 Apr 2022 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649444192;
 bh=149hZWeq+g56B3wWXpoGYNPuJSl1G0KTxvCS0gaI4u0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s2DUjNiWa1DALn3pqmwLPuHWWTWlViHwPs4LIFxnOuzJeqZGk1tcqogev66n3jf3M
 jAq13vJUgSeh8C0CIlGSZ+E0M7fHwPjKexwY/uP/91F0EJ7Mydxabc+7Ze2DVfgPIX
 M8GDpyDVCXbw+gCzksMrZ9CkYlIWhZvidnf1qWy1ziYM85/K3nNYablBRxnuHCkXJj
 pOiXvIJ3BXljq7le6j9H9HamO9LywbUTovtKkx3yn72CLwCb4hu1jd2Oc+GYoplqMF
 3zEbTsN03rY0coDVnzy0Gp0EzciqOHg9550z7e41hmxgOOl25tKUj8IteJ+Nbz2QLy
 CdEsXl1BJre3A==
From: Mark Brown <broonie@kernel.org>
To: 13691752556@139.com
In-Reply-To: <20220408141119.958-1-13691752556@139.com>
References: <20220408141119.958-1-13691752556@139.com>
Subject: Re: [PATCH v1 1/2] rename tas2764 to tas27xx
Message-Id: <164944419152.1442858.649390696709348398.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 19:56:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, raphael-xu@ti.com, navada@ti.com,
 shenghao-ding@ti.com
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

On Fri, 8 Apr 2022 22:11:18 +0800, Raphael-Xu wrote:
> rename tas2764.yaml to tas27xx.yaml
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] rename tas2764 to tas27xx
      commit: aecf03614d5ded3f930143cda2ba3d76d09b107d
[2/2] update to support either TAS2764 or TAS2780
      commit: 239556a34385706562a481f452ce0963fb569cb8

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
