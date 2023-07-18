Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72554757B83
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6254AAE8;
	Tue, 18 Jul 2023 14:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6254AAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682261;
	bh=V6di/B4ZAfW2u2f1Bzd8w/Tf9RIgqyJ/kQdBxgkubrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ArQ7M22KR28dqOkQ2AJIJvBOCLZT15qVyD4Kih7wy/kJkX386obqMS8ZdeNOMO7tV
	 ZXUz+1DfQXtZ8I1lVXB7jqrvYVuxTF0Z64XzVoCbujhoMcpqyNcDF9l33gV15Lt17U
	 ltBZVopboi0dXSbPI1HXBwHifyVsAjgPHISDgj3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 788D2F804DA; Tue, 18 Jul 2023 14:10:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E2FF8027B;
	Tue, 18 Jul 2023 14:10:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F3A8F8047D; Tue, 18 Jul 2023 14:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62A31F800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 14:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62A31F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sf7vWdX1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61016614E5;
	Tue, 18 Jul 2023 12:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E9CC433C8;
	Tue, 18 Jul 2023 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689682199;
	bh=V6di/B4ZAfW2u2f1Bzd8w/Tf9RIgqyJ/kQdBxgkubrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sf7vWdX1a6624BUSaOUhW9eyplHm+fnqZkg4twslS78JkwOQjs4AI4P0MNA4tp5BY
	 uSj21FEn4oy+HJhNXXMh5UiQ/f/Q3MJh0pXIDwiXcZhokn+IavrW0DWKUpMPctGwzo
	 DwSWIq7J+TxTes1Gyh6KeN8c6mhb0tjWwlFQfHQOnhyEJ4vhmVcc3fE0GmV60z45DM
	 /6iPmt5QHi3Hvvu1HUfimDE7qf8EluKib2ono/CFu3vzFOuD5neB7jSRZAQk98UzeE
	 SQbLnv1fFt+YlLxGNgOsN/9OsJENDouyQ8i3L/wyCOPuqAbmYh4Nqt4dHgzJLKfOiu
	 e2SU37V3ixjJg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 ssabakar@amd.com, akondave@amd.com, mastan.katragadda@amd.com
In-Reply-To: 
 <20230713125709.418851-1-vsujithkumar.reddy@amd.corp-partner.google.com>
References: 
 <20230713125709.418851-1-vsujithkumar.reddy@amd.corp-partner.google.com>
Subject: Re: [PATCH 0/3] Add Probe functionality support for amd platforms.
Message-Id: <168968219772.40723.11230865441248631321.b4-ty@kernel.org>
Date: Tue, 18 Jul 2023 13:09:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: X3TAA7GPDG3EO6QMN3DVIVEF3SLH5JHK
X-Message-ID-Hash: X3TAA7GPDG3EO6QMN3DVIVEF3SLH5JHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3TAA7GPDG3EO6QMN3DVIVEF3SLH5JHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 18:27:06 +0530, V sujith kumar Reddy wrote:
> The Patch series consists of probe functionality support for amd
> platforms.
> 
> 
> V sujith kumar Reddy (3):
>   ASoC: SOF: amd: Add Probe functionality support for amd platforms.
>   ASoC: SOF: Add acp-probe id to sof probe client driver for
>     registration.
>   ASoC: SOF: amd: Add Probe register offset for renoir and rembrandt
>     platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: amd: Add Probe functionality support for amd platforms.
      commit: 1a74b21ce59f4343e8bf64ec4c20bcbbaea96c5f
[2/3] ASoC: SOF: Add acp-probe id to sof probe client driver for registration.
      commit: 5e1c5df5048b320adffcb03e0cdfc6027364ed30
[3/3] ASoC: SOF: amd: Add Probe register offset for renoir and rembrandt platform.
      commit: 8278aa8edb4037ca5050a1b0bf32b38ef9fa59bc

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

