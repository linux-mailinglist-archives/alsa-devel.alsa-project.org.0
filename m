Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98F56A983
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 19:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A955822;
	Thu,  7 Jul 2022 19:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A955822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657214729;
	bh=PJWosiBSr/Jo2n5fQ5/FKsus3qGeZ8zXjOaJiRvPKhY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+Q+9BCk20EMBVLmBikvdzxIpD3SdDS5lbv8vbKlKv7sEhtKp7/FXGXufFKpd4l+f
	 kjHJpj/GHbDtaPBLGS/9K1gHxH+oPMSs1GKAg7dM613TI8mOHGN81LW/WxYhMOw3m+
	 9ic+OiL8XzFqSl3+4sQVucYDGDOqcXryRx0L3xhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5C0F8028D;
	Thu,  7 Jul 2022 19:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1369DF800C5; Thu,  7 Jul 2022 19:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7E7F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 19:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7E7F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EICthTyf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA9EEB822AC;
 Thu,  7 Jul 2022 17:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72576C3411E;
 Thu,  7 Jul 2022 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657214660;
 bh=PJWosiBSr/Jo2n5fQ5/FKsus3qGeZ8zXjOaJiRvPKhY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EICthTyfj4eOlgLgxPHvd8oUs+GkQRoBCa7JqXrRG+Y52cMsA8M1I0RlZY4n13f4K
 TOlIirKsI34gIbYOHZw36vEcOyQbLCIj8QuV4iu+rX3qlQ8dQN+TnNGi6zfKM+n/WD
 4rYPjXHVQGZfUAIZJlgqwGdqbtYcvPVM5t5ztF8JNVhIOTjAjBpOrWXUrMbdaiYnqo
 fiQVEWxEzcmHOSXlVp9361dZRoKM2jM8C6RPg0xLpGrDKDfzP7udtFKORnpepx7BnF
 ONawH5UnjQhARG/1l0UB6iwpQlYM7rvwEDmRRSFMkjzQZpVHdRgaHss6rYgLuTTrOk
 r6tQcIve+hnRg==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz,
 festevam@gmail.com, tiwai@suse.com, shengjiu.wang@nxp.com,
 shengjiu.wang@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1657192806-10569-1-git-send-email-shengjiu.wang@nxp.com>
References: <1657192806-10569-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_utils: Don't use plain integer as NULL pointer
Message-Id: <165721465817.2940958.17759682147989552170.b4-ty@kernel.org>
Date: Thu, 07 Jul 2022 18:24:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 7 Jul 2022 19:20:06 +0800, Shengjiu Wang wrote:
> Fix sparse warning:
> sound/soc/fsl/fsl_utils.c:125:31: sparse: warning: Using plain integer as NULL pointer
> sound/soc/fsl/fsl_utils.c:125:42: sparse: warning: Using plain integer as NULL pointer
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_utils: Don't use plain integer as NULL pointer
      commit: 050237e6b0bea0fafbf7d3d57e717c6fa1e4e819

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
