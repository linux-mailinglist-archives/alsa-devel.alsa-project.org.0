Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1652860470
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 22:11:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 484581DF;
	Thu, 22 Feb 2024 22:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 484581DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708636265;
	bh=NY3nPMwBkNXlM/F8y8MivKQEcCfg8riXNkDU5m/CF0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Be6j9l3qFydntxFjgYoCJpXHorK9APRWeBqqp0c+OIe0Ck4c+wExrQX4IDF6CA9C9
	 igqwyPDoqQIEFsLjbZAlfNR5XMHTl8d8h0unHJ/WDMMA6lQ66cCnS4T7V8kfZfO9pQ
	 vZvTj4BTBQJSniX3/VLmv1IbiggR3wtwxM6MQPJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35EFAF800ED; Thu, 22 Feb 2024 22:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA66F804CC;
	Thu, 22 Feb 2024 22:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1108F80496; Thu, 22 Feb 2024 22:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E232F800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 22:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E232F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=skaHKa7q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0C1763331;
	Thu, 22 Feb 2024 21:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFFEC43390;
	Thu, 22 Feb 2024 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708636218;
	bh=NY3nPMwBkNXlM/F8y8MivKQEcCfg8riXNkDU5m/CF0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=skaHKa7qy9RyzpAVUG/gIq2AVWAQR7nQciFWl7s/TRDYkSX9SR0RxQRlwkjBa8+Q6
	 VmU9nz9qFgyT6GGZbLVodGgSOEZbd6ULlz3/ljyAbxihYnynvo0JuvzBLH9X1yknMN
	 zQA3rYqNw+w+9CkgYtYc0NVGJoMYGypk+LD+o0kWe+MNr3At+BrFhIAZmWDOklq63H
	 v5dSbqi1RaVKtKrRnbmqQNhAtxseHHd5LK7Mj6rby4ldmFOvJOQriAkGLm749mCgSt
	 WRCIGaPVJnOZ+/SBfj8C+HBICxqjVkNU0SBIDERSVSMic8ATGlpU6rlDw5trRPKkh2
	 CY4Z8z7SLfj9Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wmqxjbcg.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmqxjbcg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: tidyup strcmp() param on
 snd_soc_is_matching_dai()
Message-Id: <170863621805.109182.1532761313772288224.b4-ty@kernel.org>
Date: Thu, 22 Feb 2024 21:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: BMM3U6WV5L4YI4T4GWTJMMZLO6JK475W
X-Message-ID-Hash: BMM3U6WV5L4YI4T4GWTJMMZLO6JK475W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMM3U6WV5L4YI4T4GWTJMMZLO6JK475W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Feb 2024 05:51:11 +0000, Kuninori Morimoto wrote:
> snd_soc_is_matching_dai() checks DAI name, which is paired function
> with snd_soc_dai_name_get().
> 
> It checks dlc->dai_name and dai->name (A) or dai->driver_name (B) or
> dai->component->name (C)
> 
> 	static int snd_soc_is_matching_dai(...)
> 	{
> 		...
> 		if (strcmp(dlc->dai_name, dai->name) == 0)
> 			   ~~~~~~~~~~~~~  ^^^^^^^^^(A)
> 		if (...
> 		    strcmp(dai->driver->name, dlc->dai_name) == 0)
> 			 (B)^^^^^^^^^^^^^^^^  ~~~~~~~~~~~~~
> 		if (...
> 		    strcmp(dlc->dai_name, dai->component->name) == 0)
> 			   ~~~~~~~~~~~~~  ^^^^^^^^^^^^^^^^^^(C)
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: tidyup strcmp() param on snd_soc_is_matching_dai()
      commit: b1724c00f0d9224c50a4fab6a85be8e2155a9a1b

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

