Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05658736E99
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 16:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CE6839;
	Tue, 20 Jun 2023 16:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CE6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687271161;
	bh=GyS9RRZCVtZIzBvzseTTQyCUHPb9F8QnBzeCuWXPLOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xr62iWJ92RGQawuxk+c9pV4VXztpkwpCiUGE91yPKy2U//fpJAQ82ElYkYiGZz0no
	 39cS62sltX10kte0Z85Pkvgc6YO3yhXylV5D6FnrkwmUi3xnLEILtCkhzZdo9UsPdj
	 qjpawW+JDEgB7GJ5/gt/vvGadJMdzI/ANEwF7o0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74580F80169; Tue, 20 Jun 2023 16:25:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA45F80169;
	Tue, 20 Jun 2023 16:25:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D637EF80169; Tue, 20 Jun 2023 16:25:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F96AF80093
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 16:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F96AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G9510GUh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58C726129A;
	Tue, 20 Jun 2023 14:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162ECC433C8;
	Tue, 20 Jun 2023 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687271098;
	bh=GyS9RRZCVtZIzBvzseTTQyCUHPb9F8QnBzeCuWXPLOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G9510GUho4pzffB58KeobG9qR3kcDO7Q7HoHfOB98deZqdM4Gi52b10vBX6/1FH6d
	 MMBSXve4QD9mIATluO6Hr7C5UqIdEm/bLHM6imLI/pO9pTFhrDK6maYtLWoxemLacw
	 vSXzreleQu1SD4a50TiIbJY9TOyxYR2nJ9Qcyv8C8Y7Wxk+Ou9glNhrHSQCUQnUOyy
	 qNUYjJ3CshKWXOjwEKHXHe61idZ6uYLv2ZRqt76xn+CL7zwZrQRg5yS2NalTH8hNZh
	 FZIfiE/l2e33+j+tfFhh43+9gFYjUOsZYLQqo89HYHrkQLJLfOVHF8jhC4nR5FA6HF
	 Ij9LBCY2XKvVA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
References: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: Use maple tree register cache for Everest
 Semi CODECs
Message-Id: <168727109779.80037.12724449564245383711.b4-ty@kernel.org>
Date: Tue, 20 Jun 2023 15:24:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: CE5GK6MW3R5EACTTJW7G3QXV7OQBQLRV
X-Message-ID-Hash: CE5GK6MW3R5EACTTJW7G3QXV7OQBQLRV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CE5GK6MW3R5EACTTJW7G3QXV7OQBQLRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 12:16:36 +0100, Mark Brown wrote:
> Several of the Everest Semi CODECs only support single register read and
> write operations and therefore do not benefit from using the rbtree
> cache over the maple tree cache, convert them to the more modern maple
> tree cache.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: es8316: Use maple tree register cache
      commit: 7ae8039f87918e2f108d352f228e2ccee03994bc
[2/2] ASoC: es8328: Use maple tree register cache
      commit: 9321015a5f40891e7cb094c6f68f6d4f67b5f3dc

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

