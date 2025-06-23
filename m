Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05853AE497C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 18:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E1260203;
	Mon, 23 Jun 2025 18:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E1260203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750694486;
	bh=hIn8HQlDO+pApqiZiANU0y9WNLKRLEwJhisgrOwz1mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bfANqqaxzZCPb/9NvmbU92CL8SnTXYCAuqwnOOaHFT0at065U6dUBzcbsTuid0qxs
	 oomsI9famvWXoxchzU8WUavxoXlqj4v3Co/waUlFSRnvGpNPBIW6GBqXxNi2i5yNIV
	 QBYfCazdloo5kb1VKG0arW4KWM4Re+9hYtWTZZZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DAB1F805F1; Mon, 23 Jun 2025 18:00:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0BBF805D7;
	Mon, 23 Jun 2025 18:00:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D84F80495; Mon, 23 Jun 2025 18:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ACCAF8013D
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 18:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ACCAF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rK3Vfo7U
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC0545C5F76;
	Mon, 23 Jun 2025 15:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1B9C4CEEA;
	Mon, 23 Jun 2025 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694430;
	bh=hIn8HQlDO+pApqiZiANU0y9WNLKRLEwJhisgrOwz1mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rK3Vfo7U4i7VY/RwH6myXTp1fUDq106EJfmM9IzbME+izSc12TBRPu+51FJq1yvfu
	 LJ69rJ27UwcnFmf4fSp1wD6Iabhve7neLADUr5oR/NfQFjQhgiWAe78WN0t4CdukL5
	 ewVH9V/dNal/qMeVdsqpno5WX2R2Va6GyNeZkGuEVrXx0sqEdryjEZBTPH2KTSSK3a
	 mbD5PIAsH6VsTBlrZdBqpYR8OKSNve4AV3dSuSiPKdO8GZClQc/zCyggnLvsuBcEP7
	 +1kaUJ/iQ/swlRqZw5lD81HJxnNyMxK8Gry62WLl5rKMSBcp7iTMMVIeKXNLdaskrO
	 n8RhNGIVC8Ezw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
 Oliver Schramm <oliver.schramm97@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20250621223000.11817-2-oliver.schramm97@gmail.com>
References: <20250621223000.11817-2-oliver.schramm97@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5
 15
Message-Id: <175069442786.140181.17086249250006921001.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
Message-ID-Hash: 3OH3GO3C4O4V5AVCY4ILZ4TNUVYOUE5K
X-Message-ID-Hash: 3OH3GO3C4O4V5AVCY4ILZ4TNUVYOUE5K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OH3GO3C4O4V5AVCY4ILZ4TNUVYOUE5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 22 Jun 2025 00:30:01 +0200, Oliver Schramm wrote:
> It's smaller brother has already received the patch to enable the microphone,
> now add it too to the DMI quirk table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15
      commit: bf39286adc5e10ce3e32eb86ad316ae56f3b52a0

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

