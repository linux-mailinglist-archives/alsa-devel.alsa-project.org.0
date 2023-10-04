Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E77B8636
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 19:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 689D486E;
	Wed,  4 Oct 2023 19:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 689D486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696439751;
	bh=OChQRgMpKKiJhEsPPPkrmvB+lR0zGT+Qobq2Mq6I6Qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LlsKVmczimRoXqPqKW5Uf0GcJJHoWyA3bFTpeJze495MwF2H29lTQgpI0Hny0fRy3
	 UuFZmMd4KD8lsd6uhCWUKo5DymT6wJBgx/VrVLGc2GM4Wlfa+ydDKC8ZJCcUYCU2vY
	 4koW5CX0yewoFvamPUHxbtRD7D73u5P2BPqYuY98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5069F80553; Wed,  4 Oct 2023 19:15:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4188AF80310;
	Wed,  4 Oct 2023 19:15:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF7B7F8047D; Wed,  4 Oct 2023 19:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 868F9F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 19:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 868F9F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FYabR7fW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 64400B81F87;
	Wed,  4 Oct 2023 17:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E09C433C7;
	Wed,  4 Oct 2023 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696439690;
	bh=OChQRgMpKKiJhEsPPPkrmvB+lR0zGT+Qobq2Mq6I6Qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FYabR7fWF3KDMfynzlv3jmlC69I/uZx0XOiLkUQk5nHGGn619LXB5sbiZmxdihmoz
	 xCUOowb4epg7Jab4A51ETsR7II1grYC5bEqpPcwq8WrM0bWrjbhl9Fsx0HSEyqNXxU
	 1A4YjYBHqxv08D8H1/8FZNozVgEwYyKyp521Epnp6x1WR5GattIBBKJo/MZOTCEvQY
	 51ei3kx8p0LV7Jq7ToHDoMZK7wmic31cGHdngCqtOG8LfW2QLsMinNSu7FtRrcFPXR
	 hFWmk2VVnqbH6Z1Z0viqW0pKrGvgpy3TlQZJz95ZxhXslQ0jq/ATMtwdK3wzzvwet2
	 x921jJ8fdQjjQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20231003232852.work.257-kees@kernel.org>
References: <20231003232852.work.257-kees@kernel.org>
Subject: Re: [PATCH] ASoC: soc-dapm: Annotate struct
 snd_soc_dapm_widget_list with __counted_by
Message-Id: <169643968801.45803.5943161279278436256.b4-ty@kernel.org>
Date: Wed, 04 Oct 2023 18:14:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: YL6N6JYU6C5XOY34BUUGPXUKO3FNQE5M
X-Message-ID-Hash: YL6N6JYU6C5XOY34BUUGPXUKO3FNQE5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YL6N6JYU6C5XOY34BUUGPXUKO3FNQE5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 16:28:53 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct snd_soc_dapm_widget_list.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dapm: Annotate struct snd_soc_dapm_widget_list with __counted_by
      commit: 80e698e2df5ba2124bdeca37f1e589de58a4d514

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

