Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA7B25403
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Aug 2025 21:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1BC26025A;
	Wed, 13 Aug 2025 21:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1BC26025A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755113772;
	bh=ouxbFcVrUS9hvxkMdGRbOfAKnaBDJG/JEQxiQR2jMWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qxw/Z7lnqN7M4aT1ZZWglPeBvWDKDK/r5pwtGtODH8us7QNOZsPwwqdQAZuaA5DlK
	 im5RLfLwBsLLMiUbmXVz4EmbjCWSxyCJyv3clObRka8cOL6J0sRoeU8/7APQx2114A
	 D/XnoTWPz5D6gIplR/u4iMfxAys/k+6CuhQcLL18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5AA3F805EE; Wed, 13 Aug 2025 21:35:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E00F805EE;
	Wed, 13 Aug 2025 21:35:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C123F8021D; Wed, 13 Aug 2025 21:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C56EF8012A
	for <alsa-devel@alsa-project.org>; Wed, 13 Aug 2025 21:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C56EF8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DmOBO6JJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F05C45CAE;
	Wed, 13 Aug 2025 19:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C1C4CEEF;
	Wed, 13 Aug 2025 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755113693;
	bh=ouxbFcVrUS9hvxkMdGRbOfAKnaBDJG/JEQxiQR2jMWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DmOBO6JJETxAhR0VJijHavL/SKMgHxEADMQxsONS1H1Zt09SSiRETXQfY+a7uRy1C
	 lYPfKF4GxN/+fh0dO7ooDwiMrWBqYN9k5wiZlBcCgCgJd5XO4ilR0RGXTQK0tkr2y+
	 JFpycRB7EGSjnmAd4AxlFDt+n4OO7b3k+wwpf+AkRp878rcps8ggcCqs5kR33ARA13
	 +rbdKe89aJ7WGsxpm25x21zTLUGs20cOPN8kaYGCZivYi4HcbXRbAbv249J6PQLUcD
	 t+uP+cEhZWgGZ353Sq5+2Akj5nJ1nKPqDoP+WbRPQ8RiVrgQ7FfhvYnMNPRfnZXZqS
	 VFr7sh4pOj7IA==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250813100708.12197-1-baojun.xu@ti.com>
References: <20250813100708.12197-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Normalize the volume kcontrol name
Message-Id: <175511369173.254480.2972663584944434542.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 20:34:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: T5QSPNNQTQN7LOQYJATA5KXU64BQEJVT
X-Message-ID-Hash: T5QSPNNQTQN7LOQYJATA5KXU64BQEJVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5QSPNNQTQN7LOQYJATA5KXU64BQEJVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Aug 2025 18:07:08 +0800, Baojun Xu wrote:
> Change the name of the kcontrol from "Gain" to "Volume".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Normalize the volume kcontrol name
      commit: 47ed64db8c17eb16541098add865178fb7e68744

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

