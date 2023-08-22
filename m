Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCC7847CD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63083A4A;
	Tue, 22 Aug 2023 18:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63083A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722178;
	bh=iERAvK+2vhOf/y7Xi5SAN53Ugl5OjAiWwXiWTviJZ4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ra6jOEj6xQiK8w1IuhuGMY7Sq7ramg8sr7IJo2yn2uHxWX40pbByoM4ZMHRY9dLzR
	 ptDaoc/kj1uEA/SykxVLhpb8oxgaofV8a7BSJAB4sFyWPZXn/fgPQBaWJoZRqrJ0QO
	 OGp0N9y74D05Yt+B+fUqIHRexJWNJgU9uxIofAFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D0FF805B0; Tue, 22 Aug 2023 18:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D29F805B0;
	Tue, 22 Aug 2023 18:33:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26FCBF8057B; Tue, 22 Aug 2023 18:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57196F80551
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 18:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57196F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MjHvPb/P
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 430A965CA9;
	Tue, 22 Aug 2023 16:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD108C433C8;
	Tue, 22 Aug 2023 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722012;
	bh=iERAvK+2vhOf/y7Xi5SAN53Ugl5OjAiWwXiWTviJZ4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MjHvPb/PahKYzD+PsZbe0mh8RH71KCp5n2uLkBmWx88GOBkWCfabs6P9QSegbvV0O
	 WbMqQwT9JXhX/8z+PlHkkYd5oj7w4DVJ4Do/5VAYF+PHpmkCrGphj1TuxLhZ3ta6o9
	 3J4j+DhakPNrjcCXiO+Iby6A5yIl6Ke8qq7n3xxVvxg9RKiz3IjapMOQ23iXcZ33UR
	 eKMEK1lCrpfNX5Pt+wiCMeMWGg9rszAoy261DJ9IRXuqXPA/QJhe1FMMJTHseG82vJ
	 Af68c8Mw+xDkFZGyNDmw9LMVtZ87K4t1xJk6XNmLcVmZ5k70XegU4SagtnClFRvuQY
	 8qt0zimQG2hmw==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <878ra3ubid.wl-kuninori.morimoto.gx@renesas.com>
References: <878ra3ubid.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: pxa: merge DAI call back functions into ops
Message-Id: <169272201062.71502.6717309510084152766.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: QMLOZGYOUZH73GD3GYRCN2ZVKTKFT6SM
X-Message-ID-Hash: QMLOZGYOUZH73GD3GYRCN2ZVKTKFT6SM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMLOZGYOUZH73GD3GYRCN2ZVKTKFT6SM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 01:11:23 +0000, Kuninori Morimoto wrote:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge these into one.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: merge DAI call back functions into ops
      commit: 2cbd5304ea393f0ca3aeebec2f6554a32ac02ce3

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

