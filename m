Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D227F5C86
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABFFE74;
	Thu, 23 Nov 2023 11:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABFFE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700735895;
	bh=YJV1iTKu6qPVsvyoYVWKMbnX3fgFVStil93e7chH+c0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I8ObRO0g5rrbLh4wwchEE7QQAESdKM0t2oWdLHXXN/gC4iZ4aOniNrrX/1Y9ClSK9
	 /xBTPWeOWAfHzsw+HTq3BYCSJgjKBfpi7lOQPO62RscJmhtzysO5Vz5Wq5MFn1aAHl
	 0giJ15rHc1ANpTozf3f0uJO4CjMlFkTLsR6HZ/6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D3CF80564; Thu, 23 Nov 2023 11:37:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBFAF80558;
	Thu, 23 Nov 2023 11:37:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ED64F802E8; Thu, 23 Nov 2023 11:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D7C1F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7C1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ToKrq8Ve
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6238CE26C5;
	Thu, 23 Nov 2023 10:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78887C433C8;
	Thu, 23 Nov 2023 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735815;
	bh=YJV1iTKu6qPVsvyoYVWKMbnX3fgFVStil93e7chH+c0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ToKrq8VebgxJYQoU3Uy6NHNhbYGYHQhLdaROjeNY784kt9VR+IDqJl/f7ZirUFbVn
	 SQwk+omW31fjS72+nlQezRXwfaTw8nR2UDNC++WicNJZg6uzW9tJu1Hipj453M6EBh
	 1FUc1Ope7A5VXVozj3FoI0GCMSBN99KkDzL57018+SqQfFV3bEWfehNfhUc5+Kv+Co
	 f7S6iHywU1pvPyilVBDZEVJkJ8v3+6BrIPYEoaJeUTOzJUClwEmLRBSXgPhLQtrSZM
	 EGt5yuUGsEi8zbQhkiJfCjQRyKYf0FkVi7msxOetGyBHLu7p/Gt58Fi5lW8c7wsuVK
	 CFwJ3nKjprupQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, paul.gortmaker@windriver.com
In-Reply-To: <20231122062712.2250426-1-mpe@ellerman.id.au>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
Subject: Re: (subset) [PATCH 1/2] ASoC: fsl: mpc8610_hpcd: Remove unused
 driver
Message-Id: <170073581102.2204618.3021059947930734828.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:36:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: OMTBMN45JFMJZGRN6PIR4FHKV5KWDZEN
X-Message-ID-Hash: OMTBMN45JFMJZGRN6PIR4FHKV5KWDZEN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMTBMN45JFMJZGRN6PIR4FHKV5KWDZEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Nov 2023 17:27:11 +1100, Michael Ellerman wrote:
> The mpc8610_hpcd.c driver depends on CONFIG_MPC8610_HPCD which was
> removed in commit 248667f8bbde ("powerpc: drop HPCD/MPC8610 evaluation
> platform support"). That makes the driver unbuildable and unusable, so
> remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl: mpc8610_hpcd: Remove unused driver
      commit: b1cea462a79316bd619173f1ded8b28202b5ce3a

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

