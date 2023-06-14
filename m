Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0FA73083E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 21:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDF4820;
	Wed, 14 Jun 2023 21:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDF4820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686771044;
	bh=7m3hfSGiNnfmTIPp+MPP09OpEHqRrip0hvIJ3f3iA8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HOvHuLympPU+cCJ08P0qcpK6DdlehwqiXQv8EAvxLV5rqAjvleIbXi/rFFSUapaCD
	 X6MEdY7P9CylW1OURO7YeRBOZSx47jJ/0/i+HIIerHq9mB133TJFW6Pej42aP2qVhQ
	 1SZHPr5GaBqgklv+A1DOL856RyytOrLwCShnNKcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F083DF80149; Wed, 14 Jun 2023 21:29:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE2AF80132;
	Wed, 14 Jun 2023 21:29:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E906F80149; Wed, 14 Jun 2023 21:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CE76F80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 21:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE76F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=grovb+BA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7D2C614C7;
	Wed, 14 Jun 2023 19:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2FDC433C0;
	Wed, 14 Jun 2023 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686770977;
	bh=7m3hfSGiNnfmTIPp+MPP09OpEHqRrip0hvIJ3f3iA8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=grovb+BAQFPV/R/2vglASB9Kv0WMtGfvLgtAA7Iqlv3WW+rzkMtxy7xk7ylwv+tJH
	 rfapsy1lsfEjWrr8tjgIrXy0kktU/w7KD90ntRaAZNl1cCJKkZStNlWEp0swbDjVuu
	 5EHS37L+wpfrTofBn0NgS//CzcE0Gauul54VvMogxfcwb4Jq5sf3bXKSGkTkmZQSkd
	 hypRhN6fiyubRIkHIcLOAX3ea2P7kaFUWJMu+grgvw36+SaKNgftWkQ3+Q5Ii87M/r
	 k/RP5x5COisKM8AEnvdQHSoMMBItwjqP7zs6rPz0rWYq+l9woGmWYfOFbE3hRaXAEy
	 20XTwaHF+cSwA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87o7lihpvy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7lihpvy.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils.c: share
 asoc_graph_parse_dai()
Message-Id: <168677097648.246397.18213553654555334390.b4-ty@kernel.org>
Date: Wed, 14 Jun 2023 20:29:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: AVDVOXWF5MQ5GAMLA4WVBHLG74QPG2SP
X-Message-ID-Hash: AVDVOXWF5MQ5GAMLA4WVBHLG74QPG2SP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVDVOXWF5MQ5GAMLA4WVBHLG74QPG2SP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 00:02:57 +0000, Kuninori Morimoto wrote:
> Current Audio Graph Card/Card2 implements asoc_simple_parse_dai()
> on each driver, but these are same function.
> This patch share it as asoc_graph_parse_dai().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils.c: share asoc_graph_parse_dai()
      commit: fed4be313a55e9a19fdabe99d1ec373e25889e2c

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

