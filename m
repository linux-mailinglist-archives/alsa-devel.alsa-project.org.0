Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AB88C6EC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298F92BDA;
	Tue, 26 Mar 2024 16:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298F92BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466971;
	bh=agEcVGdM8wAa/MuNJ1xB5axg6+1kvzUJBvDyitG93bM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OlNVkV6fT+vfiYFudvxmFviyjjwhiluDfLZzafXy6N8QcDzUNLhkO6v/Y5bHMo2BR
	 tm7YDl6dFWvdSKokvCH/0RthaU9WdkqXlf1nKP3wT2gy99ZZSeXmzMAj1WQwWB473o
	 ygapmy2MH406MkDC67Mr1dpWkRpMmQEo7FR4NKos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C341AF80636; Tue, 26 Mar 2024 16:28:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC14FF8063A;
	Tue, 26 Mar 2024 16:28:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A399F805AD; Tue, 26 Mar 2024 16:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73677F805E9
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73677F805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YNNmG1AW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3004F612BE;
	Tue, 26 Mar 2024 15:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2737C43399;
	Tue, 26 Mar 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466884;
	bh=agEcVGdM8wAa/MuNJ1xB5axg6+1kvzUJBvDyitG93bM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YNNmG1AWalo64y8yqNe+zTnJ19j4Rr8+/eTf/WYnn6Cb9w9dqHs+wDKcIYB3QkLfO
	 rsxjqIivzwevjbxb9sZPQSqB6VqppcCvWIqW198sh0EHGqrn4PqQ7hgZ/Pjc8yFm/8
	 8qahKLafzwASLmsm18JoGh4MCZAqSNUN7rINCKWQklLIlEFkHsv/Swqf7CeRHHCjq0
	 s0AdD1bAwllsLiCvWOSk0TNuCcSyOAlJLxFCT4gGUVUcQrdbFfm3c2UU2kfNEwJlec
	 LOG4aQxUQKiKb2aDjpEOBVe04Y0Ceopq0m60YpsjFuYFfHgvX6q+OW0zbopkWKWwUL
	 gSRpp3vvcZTdg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240320083012.4282-1-zhangyi@everest-semi.com>
References: <20240320083012.4282-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v1 0/2] ASoC: codecs: ES8326: Reducin powerconsumption
 and
Message-Id: <171146688339.132239.2751297207448370941.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:28:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: XRISB7JUPIUZWSGJKQFQIC4EWPILNDM6
X-Message-ID-Hash: XRISB7JUPIUZWSGJKQFQIC4EWPILNDM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRISB7JUPIUZWSGJKQFQIC4EWPILNDM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Mar 2024 16:30:10 +0800, Zhang Yi wrote:
> We changed the configuration related to hibernation.
> and delete the REG_SUPPLY to cover mute issue.
> 
> Zhang Yi (2):
>   ASoC: codecs: ES8326: Reducing power consumption
>   ASoC: codecs: ES8326: Delete unused REG_SUPPLY
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: ES8326: Reducing power consumption
      commit: 39938bb1bb23fd70f1c75ce9f52d92185403b89a
[2/2] ASoC: codecs: ES8326: Delete unused REG_SUPPLY
      commit: e6913c6ef83c80aa7569c9e08204542222fbf542

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

