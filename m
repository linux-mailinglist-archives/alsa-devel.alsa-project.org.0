Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93C7671FE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 18:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623F9845;
	Fri, 28 Jul 2023 18:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623F9845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690562235;
	bh=DoVwk5cw4lHeorzGw8TinHHfK83bjvPZo1PlOG1eoZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qvwFS9sikaJlLAXMK20pj0hB94Pltq6ZFgup5tcbJdIUvdYtNz1t4h+Eb8AGAQIhE
	 XZJoaUw1SIDT+Q1ZscGNzDCDMy0S6cOFtpQVNbteNd7LVAYU+oXL8VgiMPsdFEx55d
	 GBwIj/o8IqKoA8+EAVlqe+WeHNrwcWtE0+2f7QNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9697BF80549; Fri, 28 Jul 2023 18:35:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF6B8F80548;
	Fri, 28 Jul 2023 18:35:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C650F8019B; Fri, 28 Jul 2023 18:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2911F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 18:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2911F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iBVanlns
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F34AC6219E;
	Fri, 28 Jul 2023 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D2BC433C8;
	Fri, 28 Jul 2023 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690562118;
	bh=DoVwk5cw4lHeorzGw8TinHHfK83bjvPZo1PlOG1eoZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iBVanlnsFj/wWIQupGmfXwv38rePffMDw9duJTNhoGjp/yiz18q6e5BcufHfGtgh2
	 2N244UZ2chau5lMu7XQ8jTAC1s2cYly8XbF8Zy9GTnEvmF73kZE9YcC9SUSvc2jtA+
	 pzosk9DlCMwjOnksou7E8IpSWQsuyw5LGDwlwjtFA8jGZcb8QgJzClc4f1pXeZ4dwh
	 5gYtUGQBb7lx+mPpvBYh2AET5Qyn5GzER6N+3M5l6uI8PzeYzO+C+Z/40xX6Rcinz+
	 cymDQ7AcaoZ7CwOBUv4eP/wZVrmAJuY/sguf7a806Ct9ZClvJiqffRQ7KrXS5X6TB7
	 n9JGg+2gV6D4w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Justin Stitt <justinstitt@google.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
In-Reply-To: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
References: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: refactor deprecated strncpy
Message-Id: <169056211617.208880.10400351966983316793.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 17:35:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 4WCMUJTBE4AUR2YYTBDZ4UDMGEFSHR52
X-Message-ID-Hash: 4WCMUJTBE4AUR2YYTBDZ4UDMGEFSHR52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WCMUJTBE4AUR2YYTBDZ4UDMGEFSHR52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jul 2023 22:26:41 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ always the case for `strncpy`!
> 
> In this case, though, there was great care taken to ensure that the
> destination buffer would be NUL-terminated through the use of `len - 1`
> ensuring that the previously zero-initialized buffer would not overwrite
> the last NUL byte. This means that there's no bug here.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: refactor deprecated strncpy
      commit: 7eb10bfbbae6025cb7b4bba3db0c1281eac05862

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

