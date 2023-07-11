Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881A74F9B6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 23:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE9E1487;
	Tue, 11 Jul 2023 23:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE9E1487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689110620;
	bh=6Ah7bT014+0EnYhqIBI4z9U9khMOfEK4P7UjUPWCSxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WgXSMTIsszdS4KL+sEc6xhq8/KkD8rZjqGnAW2tPfV9nJrzFyJ2wAwDJ+wkl1Yo7C
	 ZNe2hTKuopTOpwtbxvbWqNuMF3TZPLcg/H30lYsoBA6xDnNEfZ368hLT3dZiYnj8aY
	 f6htwcv3Q06t3XV/W6Ocp3Z7FBMKjl4kr9cjiRJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E93E9F80535; Tue, 11 Jul 2023 23:22:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF886F80249;
	Tue, 11 Jul 2023 23:22:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A7FDF8024E; Tue, 11 Jul 2023 23:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49851F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 23:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49851F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CsB5o/cj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAF5C61602;
	Tue, 11 Jul 2023 21:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A1C433C7;
	Tue, 11 Jul 2023 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689110487;
	bh=6Ah7bT014+0EnYhqIBI4z9U9khMOfEK4P7UjUPWCSxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CsB5o/cj4RYIp4U7s5184O6v2lgE1SjlMobgfQJrlU0f+U7X1uYbfw16uCX10JyPa
	 g2AjVuf+P02lxL7Ba0tfPbxIzzbW1jG4BtFFX1oiF6Y0qjMer7eKpO3OJk2UiZSxfp
	 xTioBe/+6hDAml8RQ94yNjBMJp+CKdamWHIhmB645xYBbxpi94Ws8T+Yo3y6XSkvqZ
	 LfN0b4p8RSk8/WhX68UPsRFSoR3CdOFKJY7cWo7LnICjCxfF+NGkz/55IZnvTtNiGS
	 UV2NVOajHThFAXvZz7A7uEhzHd+m/AJ4ZOcx15w2/lQByutD6j88ZQzJ0262Pa5LOP
	 T4U87uMo2U0eQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230707221725.1071292-1-robh@kernel.org>
References: <20230707221725.1071292-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card2: Drop incomplete
 example
Message-Id: <168911048524.530041.17659227550480230737.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:21:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: LMBLFSUMISXVZQGANZ6I4WV2NLJN5A67
X-Message-ID-Hash: LMBLFSUMISXVZQGANZ6I4WV2NLJN5A67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMBLFSUMISXVZQGANZ6I4WV2NLJN5A67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 16:17:25 -0600, Rob Herring wrote:
> The example in audio-graph-card2 binding is incomplete, uses
> undocumented compatibles strings, and doesn't follow typical .dts
> formatting. Rather than try to fix with what would probably be a lengthy
> example, just drop the example.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: audio-graph-card2: Drop incomplete example
      commit: c65b21f8aeac86768d387a86dfcbec5980480b6a

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

