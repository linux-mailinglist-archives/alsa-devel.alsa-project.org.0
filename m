Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A483869BAD
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 17:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B22868;
	Tue, 27 Feb 2024 17:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B22868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709050264;
	bh=cN+V1mjBJaEyjI2HaATBxgd/1peblTgEH/q3L/Z12ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BokJwOuLKPVOSipsQNEHxe8siWZuGHqCl6Q8F6ZFUCk8qd2zLl405VvZ+vBx87W7x
	 bSEq6Ls2eWU0XyEEliOyyJHB9mePDTpjOc21KcnSJGQQY6hoXOmOiSJwAdtDRlD/oC
	 v3YlOkYjkPQ1N9jnuQuALczWRTR4uxA6k52d8V1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 381CBF805AE; Tue, 27 Feb 2024 17:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 914ABF8059F;
	Tue, 27 Feb 2024 17:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C8ECF801C0; Tue, 27 Feb 2024 17:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CB41F80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 17:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB41F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Kh/nTfR1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3B3A614D7;
	Tue, 27 Feb 2024 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688D5C433C7;
	Tue, 27 Feb 2024 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709050219;
	bh=cN+V1mjBJaEyjI2HaATBxgd/1peblTgEH/q3L/Z12ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Kh/nTfR1g7N/a4Z1HS9yyw7PCkABwUuz4oRVzyIoxnXWQpZ2aiiMog3OwwGtxW5Iv
	 SlrooLi9nUTXV8f8eY86kjjrB/RRQiGmZTAyHPbNZg0e4JvMzb3TP5HWifH2hKq+tQ
	 WhI96RDzEQ3pMzNTez5jUYCket9p6M3rUU52wfVIZT5wVwk9wGEiMQL80+KTtpHCDx
	 thOXQT9rSzV1wqi/RKPnNODUK31ALXGM20UVoyWKvUHSgkeRSygGLKF++GFkbVqZsg
	 Ch8rT9GKKZbansHF4ZlUfDqo8CzE800H47arHb4sgTeKHVKTaYXZOA87xwVDgvmSVM
	 vlAj3QWh3zgcQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240227100042.99-1-rf@opensource.cirrus.com>
References: <20240227100042.99-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Prevent bad sign extension in
 cs35l56_read_silicon_uid()
Message-Id: <170905021816.83159.8702222315975677755.b4-ty@kernel.org>
Date: Tue, 27 Feb 2024 16:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: QJQV4IVBWB3ZPSKJZ5W26Q32I72GVBC6
X-Message-ID-Hash: QJQV4IVBWB3ZPSKJZ5W26Q32I72GVBC6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJQV4IVBWB3ZPSKJZ5W26Q32I72GVBC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 27 Feb 2024 10:00:42 +0000, Richard Fitzgerald wrote:
> Cast u8 values to u32 when using them to build a 32-bit unsigned value
> that is then stored in a u64. This avoids the possibility of a bad sign
> extension where the u8 is implicitly extended to an int, thus changing it
> from an unsigned to a signed value.
> 
> Whether this is a real problem is debatable, but it does no harm to
> ensure that the u8 are cast to a suitable type for shifting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Prevent bad sign extension in cs35l56_read_silicon_uid()
      commit: cb9d8a2c6cb7cbb0fc919defe4fae741bfcae9de

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

