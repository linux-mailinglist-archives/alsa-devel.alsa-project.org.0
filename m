Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72A84D110
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 19:21:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14209F6;
	Wed,  7 Feb 2024 19:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14209F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707330098;
	bh=LjIOymK/Vy7FWS4jPhrrgivRkilFwO4SrSSN6Yk03O0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WgN/1MK0fK1fCdKl3IocmvhMzY2cdkiWZ1E+GbyUhJ2lIUF5KHrzzitmz6UA6LeIz
	 rZZXToTu/iYrshWxrLEaTmdT5WjmLIPhoWiLpuhqVmUKC9UWC8DJpU+CLh+0bzFI+n
	 R/ikjl9ANfniqI+g82Boe1J5BxNJEiQijs8OzMEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A60F8057A; Wed,  7 Feb 2024 19:21:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBA2F80570;
	Wed,  7 Feb 2024 19:21:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93EC9F801EB; Wed,  7 Feb 2024 19:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3499EF8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 19:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3499EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R4B2I9D2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B14C5CE1ACA;
	Wed,  7 Feb 2024 18:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FE1C433F1;
	Wed,  7 Feb 2024 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707330056;
	bh=LjIOymK/Vy7FWS4jPhrrgivRkilFwO4SrSSN6Yk03O0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R4B2I9D2oMeFxgpEY8JHVhpzgKwGXmaytr3RXBAbpdg2bPNlM+xKKtviP0UL4A5aX
	 gnSdirr8I40o4fhtDJzPXSJBugu7Ry4dYBLZCj9z8D2dYjQOmNdcpqvZZYix+GL60v
	 KsOMAi8XtqlpTpeYOyTZjRqtRl1Mz2/gXWsDmU/xCFqf4+8RVfyflRD5nBmo8F47P6
	 OfNp3YEM+aNayezAsQwhmxC7aF+Wzlc6V3behshMS9eNX5rw8K4C4hEgUUhMJMyBNS
	 jnVKllF6S4QqS/2BK7Vlcit5s39ye2RbShBUsDEJyWvyBf4y4VuXhMAZhVD6UO6l7w
	 6wdoLNAYdCLDA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240207112624.2132821-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207112624.2132821-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix dynamic port assignment when TDM
 is set
Message-Id: <170733005311.1096695.171681514834542195.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 18:20:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: XHGS6ZTR2GXBF3LYYBDTAKZUMCZKVL3L
X-Message-ID-Hash: XHGS6ZTR2GXBF3LYYBDTAKZUMCZKVL3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHGS6ZTR2GXBF3LYYBDTAKZUMCZKVL3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Feb 2024 12:26:24 +0100, Amadeusz Sławiński wrote:
> In case TDM is set in topology on SSP0, parser will overwrite vindex
> value, because it only checks if port is set. Fix this by checking whole
> field value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix dynamic port assignment when TDM is set
      commit: 44d3b8a19b91cd2af11f918b2fd05628383172de

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

