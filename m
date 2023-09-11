Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E444579A97B
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:10:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696CA86F;
	Mon, 11 Sep 2023 17:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696CA86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694445045;
	bh=FNwiZky5nIsUMiFSy7nXej3Zdr1lH6C0uhWn5tULBJA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kx+4ORnWSSYtL7lws+Y507nfMA0M3V16iDWgYKyYlHocmYumsUzs8awifMJVwyz2v
	 DGjf57hfwf55/w+JwJ4A6NjYW4hhEauG3UVXDmsgJxpvTe1OS3URfseNuPmWnpWAbS
	 gPzbkk2gMe3sRVlqEdO0a7j9xP3QrwXxmdnlAo2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9406F8007C; Mon, 11 Sep 2023 17:09:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 607FAF80246;
	Mon, 11 Sep 2023 17:09:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE15F80425; Mon, 11 Sep 2023 17:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6646DF8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6646DF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W4KK5zpd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F39E5CE13FD;
	Mon, 11 Sep 2023 15:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9CAC433D9;
	Mon, 11 Sep 2023 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444940;
	bh=FNwiZky5nIsUMiFSy7nXej3Zdr1lH6C0uhWn5tULBJA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=W4KK5zpd/ADT2bDqknyYoxvk/UBZSsuvECcJt9r+G8PTNpzvtizrE3/EuY+83Fytw
	 Isa3oplxk0C/4PsNgkB9y8rWVuWbRVIp5YxgXjm6zdBZIFWH+1uAZd4oTCdkUPJ7Hm
	 ytWCdH8Uykj/H112g0kz8j4rJLKoY8HTikh355h/FLn7gJnYK0HddVzc3O473qwGTl
	 O29LhtzmzfhCcgka18u7i/hhAT4k4IZoO0bql7qtJ2mzQT9f6woVyyMNQsRs6PThF4
	 5W0v/uqrGSzdlWLpzCz7oTPRzx+Ex2xnnRYngfn7eTcz5DkohhK7Ov4ueSWe9sfQuu
	 0jl1qhHbYxMcg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Walt Holman <waltholman09@gmail.com>
In-Reply-To: <20230910185433.13677-1-waltholman09@gmail.com>
References: <20230910185433.13677-1-waltholman09@gmail.com>
Subject: Re: [PATCH] Add DMI ID for MSI Bravo 15 B7ED
Message-Id: <169444490120.1851820.5934729126873072182.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:08:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 7G3272MT7OYQJBX7ZLSJRUA4SWAHST7U
X-Message-ID-Hash: 7G3272MT7OYQJBX7ZLSJRUA4SWAHST7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7G3272MT7OYQJBX7ZLSJRUA4SWAHST7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 10 Sep 2023 13:54:34 -0500, Walt Holman wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Add DMI ID for MSI Bravo 15 B7ED
      commit: e616a916fe8431ebd5eb3cf4ac224d143c57083c

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

