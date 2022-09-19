Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C45BD7EB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 592AE84B;
	Tue, 20 Sep 2022 01:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 592AE84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629133;
	bh=igYKGEMkVWZdVGm2ELsEz7si+LPkcjdSY2Z7eWGUFJo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7McEM8xLFYD9drRTjDXPQ8hNHofh1ET0hyhzGbwf9IcRio6PkgiRVpN0ZAmtFLgj
	 6mwnliwoWDriJSU9PC9cLS/510XWmoqfqF/1QCFh9/IP71Ic/g3OAfOJcZTofDWVOS
	 CO4b7YiVIJyINYCJVkNWDum0PBB/9+xwvS1TX6sU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F18AF80563;
	Tue, 20 Sep 2022 01:10:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0D0F8055C; Tue, 20 Sep 2022 01:10:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFAA0F80553
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFAA0F80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Alk8/hF8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D07661AA0;
 Mon, 19 Sep 2022 23:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4589C433C1;
 Mon, 19 Sep 2022 23:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628992;
 bh=igYKGEMkVWZdVGm2ELsEz7si+LPkcjdSY2Z7eWGUFJo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Alk8/hF8nfIlempZVl9m7mGDOD6fET76tus9iC7WtCzClw30IsM6huQt9WG6OiNw1
 cF2l+5VfLNJ/j8fMc8kg1nYdXLuzC+O+O0JsRZOz4PlejLV0JwP1qNqlknypzvGV4l
 6bwAZnPZeArHaXjfSWeEjmReX7gsfUlrx9Q4nmBeLZVYWMMLkR0TGIGq8/8qSo+By8
 njwsTDKNvT0QhFv6XioyODHk9p4pJj4JdQZNlPYy4/Vzq9MW/itgoG8UBkxr8ph4Am
 r2mwth4rvmd6MqnbeFpJOt5FeXXElWpjQNa+5uiadIt7eg08PMqOTC+rM6TUSMOB6a
 N7HNmM6OiVGgg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062027.152815-1-ye.xingchen@zte.com.cn>
References: <20220916062027.152815-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: amd: acp: use function devm_kcalloc()
 instead of devm_kzalloc()
Message-Id: <166362898954.3419825.40424963961525082.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, baijiaju1990@gmail.com,
 akihiko.odaki@gmail.com, Vsujithkumar.Reddy@amd.com
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

On Fri, 16 Sep 2022 06:20:27 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: use function devm_kcalloc() instead of devm_kzalloc()
      commit: f047199e6f3115896fee25ac8809e1a9a8c948fc

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
