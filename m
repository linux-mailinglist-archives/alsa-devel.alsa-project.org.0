Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1A7A0273
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 13:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AE0950;
	Thu, 14 Sep 2023 13:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AE0950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694690555;
	bh=g5Y+W+fEfFjASOlsvhwzFczRz/xSyswp99GTZRJ8t5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BzZzSt5n1AL/s6zNI3rt5YxPHECStgYqZgaWuqxY+bs48PXPRS4BFztXSjIYHD1S+
	 J9V1f6KSsXZjjavWWRiPM+Yjo6BvMeCs7I7e74u9hTR/Iw9xiKU8x376Wo+n+t1XHM
	 N97Lwz6cCdXOz9W3Y4VLJYxiRcKS8Hodt/21Z72k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C2C4F805B5; Thu, 14 Sep 2023 13:20:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED523F805AC;
	Thu, 14 Sep 2023 13:20:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0D13F805AD; Thu, 14 Sep 2023 13:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60810F80431
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 13:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60810F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B+PkzGir
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8245ECE2696;
	Thu, 14 Sep 2023 11:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7ADC433C7;
	Thu, 14 Sep 2023 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694690385;
	bh=g5Y+W+fEfFjASOlsvhwzFczRz/xSyswp99GTZRJ8t5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B+PkzGir/DRNMzN3QXhNTw8h3I+MqNEMR5BXHWXO0+5yDOVBmGJmv1qqDKGaZDgtx
	 f2iYaxPqZ6RFRs6TJw/7MlNLR2etIBUPka7uXh+2j86vfmyF6ItkCLl9g2AltCKs46
	 rYdLEkyC7VoqY4diY6PgF8JvYeglFHWSPdLSy8GUwhcW3qEl1ddBcitBouE8/XMFUd
	 sWIf586Fuknkf1RKi9B3ebZfV5v9VW/EztQJgV6i1PCUxhY3p0ePDxdNGWkGWxRAPp
	 dDEQNcg1CKIEIqVGj3cyBM7zbTaycQZv4fxdf5o5y3my1qh6Fp1JZT6P20nbH/GfZY
	 zja5yuER5gB5g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Marian Postevca <posteuca@mutex.one>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20230913210916.2523-1-posteuca@mutex.one>
References: <20230913210916.2523-1-posteuca@mutex.one>
Subject: Re: [PATCH] ASoC: amd: acp: Fix -Wmissing-prototypes warning
Message-Id: <169469038415.23670.15827539133366262566.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 12:19:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 2FWVNGHPT6K2VO4RDNMF5K4O4YHFVCBB
X-Message-ID-Hash: 2FWVNGHPT6K2VO4RDNMF5K4O4YHFVCBB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FWVNGHPT6K2VO4RDNMF5K4O4YHFVCBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 00:09:16 +0300, Marian Postevca wrote:
> Fix prototype missing warning for acp3x_es83xx_init_ops() by
> including the header acp3x-es83xx.h
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix -Wmissing-prototypes warning
      commit: cfaa4c32ccd3a4cb1140416a9ab51904e938d767

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

