Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7C7CADA0
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 17:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5772E852;
	Mon, 16 Oct 2023 17:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5772E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697470521;
	bh=ReLBlkdX/Ih5s92nu5iD07eefwL3bPoRMnTYOk9amZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WpgDA91z2PDPCX9MjOXNjqt5SUmHTeU+dq7dU6VvSx1Tj2LbuhnVFPk7/BFwYjcSm
	 uctU5w4ThOIJOCy7WYBuOx/yfyzvwaEhhy2p4bbE4spa6nZG/kKT3Wamw2luLTTuxy
	 H4VWLX9J0XqEnlVoIjHbi9/XqmQ90nA5iYhwsD1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F7E7F80564; Mon, 16 Oct 2023 17:33:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF1FF8055B;
	Mon, 16 Oct 2023 17:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 360BDF8032D; Mon, 16 Oct 2023 17:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D757FF8024E
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D757FF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YwQ2Blf0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4ADA3CE17E0;
	Mon, 16 Oct 2023 15:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC103C433C8;
	Mon, 16 Oct 2023 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697470404;
	bh=ReLBlkdX/Ih5s92nu5iD07eefwL3bPoRMnTYOk9amZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YwQ2Blf0JX3WRi+CsGYYqK+p3IfDkg4CRhEaIuGeSvR0S14R+Y7SJHvYyk+IkTFHt
	 m+Wz7pA8uSrYinvoDUimMJFSZxk4EeWM5vniF9VnzEypA16j8ardzeW5wL/5b51eSU
	 rfPVeuWw31RPYENCGvCBtcE7DVaddwsopMBWfC/a7PGQl93l2aM3t6r5txboT/dudS
	 xzwp2QpqBZR+6ddwDT+0nFyHY/2fvOugNvOL20249udCTifgyc6L3uvTuL1pd2MYhN
	 a9V8BV6QyNQmb8XaZnCRdUzerR4gebGzGpikomjLjVVCGbYvzF1RE+ZsxULK9MwpJh
	 D9TCFXwWaXhKw==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
In-Reply-To: <ZSRvh1j2MVVhuOUv@work>
References: <ZSRvh1j2MVVhuOUv@work>
Subject: Re: [PATCH][next] ASoC: sigmadsp: Add __counted_by for struct
 sigmadsp_data and use struct_size()
Message-Id: <169747040242.42352.2081584730958275030.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:33:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: I3MB2I3KHKUCJOPL66NRJYFEHJG47LNG
X-Message-ID-Hash: I3MB2I3KHKUCJOPL66NRJYFEHJG47LNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3MB2I3KHKUCJOPL66NRJYFEHJG47LNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Oct 2023 15:24:23 -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() and size_sub() helpers, instead of the
> open-coded version, to calculate the size for the allocation of the
> whole flexible structure, including of course, the flexible-array
> member.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sigmadsp: Add __counted_by for struct sigmadsp_data and use struct_size()
      commit: 4f88c72b2479cca4a0d4de89b4cbb6f1b37ee96d

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

