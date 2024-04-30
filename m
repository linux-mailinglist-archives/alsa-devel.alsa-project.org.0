Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4088B79AC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:32:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 774B0B70;
	Tue, 30 Apr 2024 16:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 774B0B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714487542;
	bh=TpIld0LnjkQmQ5PsI5skb5CrdOEKjutEJsH7FAf0+NE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ulkuR/69BUpyM+fg5zXGWfzefEw48M67UZeTYVAvM50x/nxBoAr4xuqOYnt5sO08N
	 k6atnHUMxqFrkKh2Yamj62ph1UxZHQldU0qw6wFyY2NLApPQltMKDiv41NOb3SqoaW
	 tiFFoo9B5MkrZlcygyClNrAfyVUt7geVPk6kop2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5A98F805A1; Tue, 30 Apr 2024 16:31:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E463EF8057A;
	Tue, 30 Apr 2024 16:31:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0EFEF8028D; Tue, 30 Apr 2024 16:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A280DF8023A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A280DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fhfzw95x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47E3D614DD;
	Tue, 30 Apr 2024 14:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04429C2BBFC;
	Tue, 30 Apr 2024 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487491;
	bh=TpIld0LnjkQmQ5PsI5skb5CrdOEKjutEJsH7FAf0+NE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fhfzw95xZd3KJTF+cCGdHv5EaYCh88EHjU8X8xTwZ8XiZqYVfYcPkaRQIohdggJPy
	 WmRAfI/LaTfKGjSQP1hyncVMwFyA8Sjw0pWDoNgp8LVjWtUZGhTP2JpzjCw+8n2t0u
	 5+CzBUAJRvmzeeENLs9h3wUE0UFAXZw1yWN1kf4qwal+onpYkR8VfpWkNVFuJuJcH5
	 ueJ88sdZ8zG2RBw5pmuOTlQnkkwi7n7dHsuWoZlax1sN3te04Oix8U3fOq8PrYZBXY
	 uI3BLckXTXKzLTAz3frfU+05s+09aa9IiXJ0W8BH1il+W7oBRKNKP75YtSy44fXAiS
	 LAcE/5vF+PgEQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240426134150.3053741-1-jbrunet@baylibre.com>
References: <20240426134150.3053741-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: cards: select SND_DYNAMIC_MINORS
Message-Id: <171448748960.1870439.10234664957673529561.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: R2ZLUGNLFFOKCHC4KNGPY6LBWEAT2BSZ
X-Message-ID-Hash: R2ZLUGNLFFOKCHC4KNGPY6LBWEAT2BSZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2ZLUGNLFFOKCHC4KNGPY6LBWEAT2BSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 15:41:47 +0200, Jerome Brunet wrote:
> Amlogic sound cards do create a lot of pcm interfaces, possibly more than
> 8. Some pcm interfaces are internal (like DPCM backends and c2c) and not
> exposed to userspace.
> 
> Those interfaces still increase the number passed to snd_find_free_minor(),
> which eventually exceeds 8 causing -EBUSY error on card registration if
> CONFIG_SND_DYNAMIC_MINORS=n and the interface is exposed to userspace.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: cards: select SND_DYNAMIC_MINORS
      commit: 6db26f9ea4edd8a17d39ab3c20111e3ccd704aef

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

