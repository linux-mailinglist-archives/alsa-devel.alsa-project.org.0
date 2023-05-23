Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E270E7A0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BEE820;
	Tue, 23 May 2023 23:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BEE820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878356;
	bh=jl2wdJNruwvnUiqYoU0FPPH9cZQ8q3wjXa6NzeQjbhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lT8cVJ4SUbCoixm/dFP4ZseqGQ+u8IIAo0LWq8QoeSuacQ4ta735GxWlinIUiTiaW
	 pHF+7S+iWYMLc9FrslXLht5bMMN2hzpCSUd7PtAccxk8MvXTRXhRmC9u44wrgUdVVv
	 K8JisiyPqarfEZukSqbJYV20yR94LsV2how/mAOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E6A6F8055C; Tue, 23 May 2023 23:44:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E15F80551;
	Tue, 23 May 2023 23:44:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6445FF8024E; Tue, 23 May 2023 23:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5696FF80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5696FF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xy8yDNPA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D26A763576;
	Tue, 23 May 2023 21:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31FCC433EF;
	Tue, 23 May 2023 21:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684878247;
	bh=jl2wdJNruwvnUiqYoU0FPPH9cZQ8q3wjXa6NzeQjbhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xy8yDNPA1reeDezVtad/Tzl+j+ZfhB40u+jSOrLN9W8Umqs3LNLU/a32br+1jko3m
	 t6rYgkv+dviyyg9fbKJdeJsnVufiy8iHJGODeIJfAt1pCher0cb83zIRVU11elDXrK
	 5ql5XbvQwuMH36nT4/N9kuZc6634Yeq0CamJH4zvSFrKSHCjGU50ncF20Vy7lo7bg2
	 6UrraVdXX9lwiNitM5O43WITCDWJQMoC+CjJ8vHAglsoB8Ernfu+6Cqvcsivh5qtfj
	 XRVbxr3x43yHJT4jgcE+OC/wzKxKBRL4eLds2p4M9SMJSR/NIb0QGKzEeyJPS8aRLf
	 0CanQHNFThBAQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anup Sharma <anupnewsmail@gmail.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <ZFUFAmBJXvkQAG7m@yoga>
References: <ZFUFAmBJXvkQAG7m@yoga>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1016: Convert to dtschema
Message-Id: <168487824551.297010.16643781919959380552.b4-ty@kernel.org>
Date: Tue, 23 May 2023 22:44:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 4GRQEL4MELLOTV2H3PIMSPEQ5GCONQQF
X-Message-ID-Hash: 4GRQEL4MELLOTV2H3PIMSPEQ5GCONQQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GRQEL4MELLOTV2H3PIMSPEQ5GCONQQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 19:00:42 +0530, Anup Sharma wrote:
> Convert the RT1016 Stereo Audio Amplifier bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rt1016: Convert to dtschema
      commit: d8b44d8df4d932db3d88b2e79c67ffbd2c72e4dd

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

