Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956426C827D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 17:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC73E8B;
	Fri, 24 Mar 2023 17:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC73E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679675895;
	bh=ZzpnTGboktZbFpmxNKK8XGDPF3NZZL+niF6PLMRCzuc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WTQIaeguFJ0gTjX4plYsqFUb8pB2Q1rckcREV42IBhfArWpcjAuDu4nOKOKwrclAE
	 eoW6UOoPrMk9jGTlcBfIMSjb85GaUdQxb4eEXbe5eCwXLPkb3nL9Nns68EHhGj+UBy
	 3JiP3LTuqn9jHza8YK+WPnMaLjRJjtn/kTpee/CY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7210F8024E;
	Fri, 24 Mar 2023 17:37:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E776CF80482; Fri, 24 Mar 2023 17:37:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF20DF800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 17:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF20DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hYztDE5Y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F39A62BE1;
	Fri, 24 Mar 2023 16:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C387CC433D2;
	Fri, 24 Mar 2023 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679675835;
	bh=ZzpnTGboktZbFpmxNKK8XGDPF3NZZL+niF6PLMRCzuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hYztDE5YXxSn+0NPDw0ouv/7HF9buBX2B+KijgzODUI6Z0BEGoKN6Kyj7uduj2olN
	 Vo2SQF0tH2DRLXMX4NczW05TyaYLcnaMYGtIEAmhKyCBputMiggyiIOZ4OcpRXorHk
	 CeYDV7aX3UcX4Amhc6SqCi8ntnOfz+cH8OHZ2sd0SJmz820A39oGxEAR7Qiq8ZZXsY
	 cnZD4r0DIWz3o92YyAB9ad2UaI328Y9gExIDfWm2qcIfe+Wq/I1AS03O14RQGC4PuS
	 Lf1PIMfte061akRlaRAIhJeLljPCIepxtg1eE4w44bOhUHLNGpcH351xvdc+CxLlrd
	 c2lmfD1+x2GNg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/4] ASoC: remove unnecessary dai_link->platform
Message-Id: <167967583379.2616375.6522996550461207982.b4-ty@kernel.org>
Date: Fri, 24 Mar 2023 16:37:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 4XYHQZZ7ZRCMYIBB3SR33DOEHGQ5XLCX
X-Message-ID-Hash: 4XYHQZZ7ZRCMYIBB3SR33DOEHGQ5XLCX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XYHQZZ7ZRCMYIBB3SR33DOEHGQ5XLCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 22:53:12 +0000, Kuninori Morimoto wrote:
> Current ASoC will ignore already connected component when binding Card.
> This will happen mainly "CPU Component" is handled as "Platform Component",
> which was needed before.
> 
> 	static int snd_soc_rtd_add_component(...)
> 	{
> 		...
> 		for_each_rtd_components(rtd, i, comp) {
> 			/* already connected */
> 			if (comp == component)
> 				return 0;
> 		}
> 		...
> 	}
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: fsl: remove unnecessary dai_link->platform
      commit: 33683cbf49b5412061cb1e4c876063fdef86def4
[2/4] ASoC: atmel: remove unnecessary dai_link->platform
      commit: 2f650f87c03cab72e751fc739f42a1e257bdc6b9
[3/4] ASoC: ti: remove unnecessary dai_link->platform
      commit: 3b0db249cf8fe0027e2a4161d27a8566d82fcd80
[4/4] ASoC: soc-topology.c: remove unnecessary dai_link->platform
      commit: e7098ba9b3785d626326040d300f95fec79aa765

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

