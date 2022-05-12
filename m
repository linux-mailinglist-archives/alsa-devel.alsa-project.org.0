Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47675252A1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 18:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3F71AC6;
	Thu, 12 May 2022 18:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3F71AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652373211;
	bh=xh0dzvzjouPjkfWDaavilhb4zB9wsz2ZUVj1FOb1X4Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeJILnfYnFdiQMABUCHEgWvbXOYKiZBIzq8BuN7l58SoiqOK18PPQPK5b0+J24kEg
	 Hqops6XUfhzBBcwH8ix59R28P12q0SOCBqFiR/AkIqppX5IHn3R8UiroLig9uY0fZB
	 bcXxqr5yhFibiqNdE5Jm5yPzQdljPL4GRV9NCeWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B3AF80245;
	Thu, 12 May 2022 18:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43FCCF80245; Thu, 12 May 2022 18:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2534F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 18:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2534F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h73JvsOL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEF1D61FB4;
 Thu, 12 May 2022 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841E7C34100;
 Thu, 12 May 2022 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652373112;
 bh=xh0dzvzjouPjkfWDaavilhb4zB9wsz2ZUVj1FOb1X4Q=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=h73JvsOLfTfwsA0mGsIfgLLc0a2lK2kMgdDflt+e/UFhtrn6msq+/4nz8OyqyxU8/
 dW5dndF7q+MbSPg479IG8fb2jyArWU30mEsVHZjRW72JE+RbbDp6wBPeWUKtX0Rj+s
 pxK+/r0wuKp4+0sSeZQxmcgYqRAddwCvb9EWqsWNxra6wXqXwG+7HyiYnZycZGaLiv
 5gWOnASCPSVFPSx1o7+SG5POZMjqWPozfeBDpANCO/cNIfLE0tjowuuzyexh/rEno0
 jCwHkavFEW/SH7Ua0mgvzPK7ySxIqK7DmeJBGI92ub7sg/8SCXMxtGyEEZzMe3Fwxi
 6ExAVwM2iFZfA==
From: Mark Brown <broonie@kernel.org>
To: linmq006@gmail.com, Takashi Iwai <tiwai@suse.com>, lgirdwood@gmail.com,
 krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
 s.nawrocki@samsung.com, alsa-devel@alsa-project.org, xc-racer2@live.ca,
 perex@perex.cz
In-Reply-To: <20220512043828.496-1-linmq006@gmail.com>
References: <20220512043828.496-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Fix refcount leak in aries_audio_probe
Message-Id: <165237311026.1053236.8801361926991753274.b4-ty@kernel.org>
Date: Thu, 12 May 2022 17:31:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 12 May 2022 08:38:28 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> If extcon_find_edev_by_node() fails, it doesn't call of_node_put()
> Calling of_node_put() after extcon_find_edev_by_node() to fix this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Fix refcount leak in aries_audio_probe
      commit: bf4a9b2467b775717d0e9034ad916888e19713a3

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
