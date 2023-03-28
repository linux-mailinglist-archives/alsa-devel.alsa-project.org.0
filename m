Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A116CC729
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 17:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E7B1FE;
	Tue, 28 Mar 2023 17:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E7B1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680018858;
	bh=Czsqs77qTKp69tt1YlQhbRR69dd/LFM95tDt12Xd6/w=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/sDlJ6+D0WIqUD1lH9cx2mZO9iULCl9UPI+Ct/g/MjkLdBTS84RkW7LVOyXD3CUh
	 Hio2k/EbSOUBkLE55LyWLTr6F8CBKn8AL/Gbn7WoVQD+TdP2tJ37Oc1A1WLp+HyXy+
	 zJzwKhf7KWBXSAgMnPBifb/UWqB5PpDrAtTsPu5A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67643F80423;
	Tue, 28 Mar 2023 17:52:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D6B3F80272; Tue, 28 Mar 2023 17:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39A00F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 17:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A00F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CsM9zvkG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 413326187D;
	Tue, 28 Mar 2023 15:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1747FC433EF;
	Tue, 28 Mar 2023 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680018747;
	bh=Czsqs77qTKp69tt1YlQhbRR69dd/LFM95tDt12Xd6/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CsM9zvkG4StopJR15M7YAm8E1RksC5qq9QlMqFMngi8/eZXtkPNaeqO7ozxvHBhgA
	 Vpl5DDUWKQflJ4J5WpNia6/q4+PKgEdnnyMtxvMVvaezAdIwsC/+WP1Ldq+bX4thPI
	 mXUMubBlrWHZfPiHx7pEzIGjOl2a3Z5Y9DMjf/Zhx9/AgzMLglsaqXrOFSN2TadGFO
	 Tm18JiBlJfAxwxAaR8qwbxl1ddwzRho4N1O5NQ5PfrLIhCz5Wof/nhGAqha7I39XaF
	 R0Jm9yz6PGvsMGyY1gLmgkQyarB17zPWKamyxNJrlTHwq0DHl9+Xy27sBvmSA+xcZx
	 BjYuaPTIbIx6g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>,
 Richard Leitner <richard.leitner@linux.dev>
In-Reply-To: <20230328-max9867_dt_example_fix-v1-1-cdf31c3fdfc8@linux.dev>
References: <20230328-max9867_dt_example_fix-v1-1-cdf31c3fdfc8@linux.dev>
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max9867: fix example
Message-Id: <168001874582.43606.10998197986023512559.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 16:52:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: OJKLBMCJMCPIGABARC4A5LNNJGUF3UF6
X-Message-ID-Hash: OJKLBMCJMCPIGABARC4A5LNNJGUF3UF6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJKLBMCJMCPIGABARC4A5LNNJGUF3UF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 13:25:14 +0200, Richard Leitner wrote:
> Remove the common clock node from the example as suggested by
> Krzysztof Kozlowski in [1].
> 
> [1] https://lore.kernel.org/lkml/45d306d3-8efb-12ac-0a83-f01ca2982b0a@linaro.org/
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: maxim,max9867: fix example
      commit: d23d50de4ad9a960b752b8b7f4ffce32e05a8971

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

