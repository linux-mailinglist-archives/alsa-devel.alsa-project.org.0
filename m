Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EC950985
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 17:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CD423D2;
	Tue, 13 Aug 2024 17:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CD423D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564499;
	bh=IjWYqvVozMU5xDb4PvFiGRW9tuYNkqmyRRFkJ2XA9nE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WqFAwoQydHoVA0R7RxT7xyu2P8MDe5TWsQ7hORk59poPnKo6xaDcZgVUAQGPQQZK6
	 3mTvMavpQPi7AvHpy6iJvNdE2kggpm0tHgTeJ7N3eg925/0huCn+l15teYsHr6G9iA
	 uTB3p4uQ8ceXmhhuKQCDvYs8+ewKgEnkYF8UzpuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13DB7F805D6; Tue, 13 Aug 2024 17:54:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF2CEF805D6;
	Tue, 13 Aug 2024 17:54:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBBA8F8047C; Tue, 13 Aug 2024 17:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6E77F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 17:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E77F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=urTqw7Fx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA528CE140D;
	Tue, 13 Aug 2024 15:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2F6C4AF19;
	Tue, 13 Aug 2024 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723562373;
	bh=IjWYqvVozMU5xDb4PvFiGRW9tuYNkqmyRRFkJ2XA9nE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=urTqw7Fx3BrW36RwafkTtFLwboqOd8JmA+uleBl5yfSLbyapeVyeqXh9yHQobaZ1f
	 tK9BQBwCk21H0M4rC4il842m/GbJo3ayEpSE+U5Wku7PwTYfNNlWvQCYhlWr5ZcoLM
	 gyluLp7NjnuVtc/yRlCrGVxOqJ17O78NRxWXhBszyD61XwRZkOEwzrpGvaFKObERUB
	 1j16KIWTr9y4o8FOYbLdDLeylZfWMPbzrLqU+2K3ka5tIqA+pjcjg8WN4RRQv3TCab
	 tNagbceOOkFmHfAyJzFfaDr9Gw57W5A24FuTsnscYLcw8LRQ30A+/twSYmn1pqkIn3
	 yYkc0xcIMfAbA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
In-Reply-To: 
 <5b906a0cc9b7be15d0d6310069f54254a75ea767.1722951770.git.christophe.jaillet@wanadoo.fr>
References: 
 <5b906a0cc9b7be15d0d6310069f54254a75ea767.1722951770.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs43130: Constify struct reg_sequence and
 reg_sequences
Message-Id: <172356237111.72636.8665526019609243174.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 16:19:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: UM453KFWZXR3MAW7QKYUVBAJP7PJULJ6
X-Message-ID-Hash: UM453KFWZXR3MAW7QKYUVBAJP7PJULJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UM453KFWZXR3MAW7QKYUVBAJP7PJULJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Aug 2024 15:43:00 +0200, Christophe JAILLET wrote:
> 'struct reg_sequence' and 'struct reg_sequences' are not modified in this
> drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   54409	   7881	     64	  62354	   f392	sound/soc/codecs/cs43130.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Constify struct reg_sequence and reg_sequences
      commit: 86297bb30ae094e14a3a6c62b870a2f301a180a2

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

