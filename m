Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C7896D2C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 12:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C722CAB;
	Wed,  3 Apr 2024 12:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C722CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712141483;
	bh=zEs09Pf70wWA8RG+pKCKh6egma5W4v+1joh1kjYqyIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q7EJ1509rKoWLdOSlP8XA2WQNz84BTGj8DAktQMl3r2YKhzZ7XygZ1FALqSv6SFQu
	 1PpEikPzxOnNfPLprQZEoFJGhrLrqcNp1ZzwBhwj1ZnKUl+58SI7d8+xO5V+vVD9yq
	 ZH9duqvQfMojev88RzjbA/mofmwGdQNK9ZOVXE9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD76F8058C; Wed,  3 Apr 2024 12:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA6BFF8057A;
	Wed,  3 Apr 2024 12:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3237FF8020D; Wed,  3 Apr 2024 12:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 731A8F80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 12:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 731A8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ow/ufA70
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6F73CE22D9;
	Wed,  3 Apr 2024 10:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EC2C433F1;
	Wed,  3 Apr 2024 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712141444;
	bh=zEs09Pf70wWA8RG+pKCKh6egma5W4v+1joh1kjYqyIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ow/ufA70icQL7tcZCl+EFjqELra4W9CscBHPaWEWvx/7W7++hxdoPnh2rBq4K8/d0
	 SOX7qS+UXgoMmsLF5mchzS58+pLtRwQnrpLm1opQnYLv86VwC0IfLVEJ4p49b3xPNd
	 OMowe6ogXQHimLQpAEF8RMtKWz2XpUu8Z0W1CEhQUGj03zgJmCNKAuphg+6O3EaKDQ
	 KYLK2aZUBnruUekRPCKQzoApIv9ImT8HT5tXI9NoZrCTAqu4DQBeL1v069AcqiZXxC
	 RD8lu8URcekNC4aq67bRNA0By0cGkzEkoHNHGYtBB91c+z/x6sKrfYIVE+vc+q30MA
	 Z3hn7zhZW44xg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: reg cleanup
Message-Id: <171214144388.677375.6241132080321241812.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 11:50:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 746CD4W5SQWASUHZ2KABHJ7W5AIBTCF3
X-Message-ID-Hash: 746CD4W5SQWASUHZ2KABHJ7W5AIBTCF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/746CD4W5SQWASUHZ2KABHJ7W5AIBTCF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 02:23:35 +0000, Kuninori Morimoto wrote:
> These are Renesas Sound driver cleanups for Gen3/Gen4.
> 
> Kuninori Morimoto (5):
>   ASoC: rsnd: cleanup regmap table
>   ASoC: rsnd: don't get resource from ID
>   ASoC: rsnd: rename rsnd_is_e3() to rsnd_is_gen3_e3()
>   ASoC: rsnd: R-Car Gen1/Gen2 exception
>   ASoC: rsnd: no exception for SCU
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rsnd: cleanup regmap table
      commit: 35aaed1bc3c32c52b7fda525cd7bd19998035518
[2/5] ASoC: rsnd: don't get resource from ID
      commit: 6e4e5432942a57f4c3e6a5a4a97a4d1a164dca61
[3/5] ASoC: rsnd: rename rsnd_is_e3() to rsnd_is_gen3_e3()
      commit: 0b8ef53e120981c218ba037dddda98f414af2207
[4/5] ASoC: rsnd: R-Car Gen1/Gen2 exception
      commit: 5be0e7f7f275aa5f05d8708db021cef0fed749d1
[5/5] ASoC: rsnd: no exception for SCU
      commit: 07f6232ff1c9909cd87e42020c91b265a58918da

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

