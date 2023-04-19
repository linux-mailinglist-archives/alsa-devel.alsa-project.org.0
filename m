Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3F6E7C71
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 16:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AAAEBB;
	Wed, 19 Apr 2023 16:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AAAEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681914265;
	bh=hGLCHDWc9KqI/KLynLW2oZ7LkA2U31ZnlMwgjeHw/Us=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jl5AkrH5MQN1bMgtgjSgF9GHqNzo2SJOzwYR+CyFxJ+esBPZHY1OhZpAiP2RL9i7X
	 Ts9/jeb9zx1oCbERUrYBOt9yUSAO/bXbEgLtBu6cdZm49QRoc5c48T2HtgrJu+ZoHh
	 ooca1V3H9OvyjgkQ1AZ+BWDD+Ftq7A0nwuJP8Uco=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4ADF80149;
	Wed, 19 Apr 2023 16:23:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31F7AF8019B; Wed, 19 Apr 2023 16:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7E75F800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 16:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E75F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q0wHmR5y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61174614FB;
	Wed, 19 Apr 2023 14:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C06C4339B;
	Wed, 19 Apr 2023 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914200;
	bh=hGLCHDWc9KqI/KLynLW2oZ7LkA2U31ZnlMwgjeHw/Us=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Q0wHmR5yZdj/zYEEC8ZE4V6Qb6n5jVpwDX7AwU5J+NOLsHXJAX3YhVihZKyLsqoRB
	 1JxE+bqsb3Flzua2d7hHGI0vs6YeFlbRWkcZZmc4OugkxKW5RfMMzrjzl6l1XzugLd
	 R2rcq+0ZAdbPumKZp2nHhlFer0HBFb6UoaW7dSsn4fvTYlI+JfhKEiGj0txSPEyY39
	 6MV1FCdYZ6+DfDS9dEbLjET5YpiZhuimFU/9qI7nldcJOyB4dey95U43CtZEYtQptZ
	 sJApFjBuxs7l3c6Yg4cW4vSWmiCiQ9R9eVbneFgcaGu0Zyq9HFZXv4aQgjGd+Er9v3
	 FrWiF2mG11BDw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230418094259.4150771-1-chancel.liu@nxp.com>
References: <20230418094259.4150771-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
Message-Id: <168191419838.83860.13145358537748043922.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 15:23:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: SA4MK5YM4BT3YLJJF6TNVQ4MYVVKDEJH
X-Message-ID-Hash: SA4MK5YM4BT3YLJJF6TNVQ4MYVVKDEJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SA4MK5YM4BT3YLJJF6TNVQ4MYVVKDEJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Apr 2023 17:42:59 +0800, Chancel Liu wrote:
> SAI on i.MX8QM platform supports the data lines up to 4. So the pins
> setting should be corrected to 4.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
      commit: 238787157d83969e5149c8e99787d5d90e85fbe5

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

