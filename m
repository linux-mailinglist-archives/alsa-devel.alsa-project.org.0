Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F57878F2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 21:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E081868;
	Thu, 24 Aug 2023 21:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E081868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692906333;
	bh=7ntHW0TzCJOF0wdTLQxh7yzDZs9UUicASFpuhEDg7UM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2gNCfsUYrNkvDkIOM8zqR/j6m13+msATfPGOKU1f8HDwSQrTUrLDKSHgJhmqrlnI
	 Z/AByKqeAOvntz7r9J2RoUvcK8F4tLa6TKs72db++FoA6Nr62jIIqE8eFnBBsj0oRP
	 MeBc+cGlKePh7iCTxZdk7CZaKLab/cXj55v0aOts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11FF7F8055C; Thu, 24 Aug 2023 21:43:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA02F80549;
	Thu, 24 Aug 2023 21:43:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EBC9F80158; Thu, 24 Aug 2023 21:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FAADF800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 21:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FAADF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iburKgk4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 834B766EA1;
	Thu, 24 Aug 2023 19:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7946BC433C8;
	Thu, 24 Aug 2023 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692906220;
	bh=7ntHW0TzCJOF0wdTLQxh7yzDZs9UUicASFpuhEDg7UM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iburKgk4nHgoYhPAf0AIE0qdORiLgHHb0gfXYVFb+O6kNpvXuKQmBMQechisjlTcB
	 uPWD7IKayVL32Csy2Jr+sfX9SMQc6lfWLxHESzEewN/PbrC+M0Zz0ZQNmFG7a4rQOW
	 Cb0Gfbj5qb8+5FyvIyreqxHRwrh0ihnzZwW2kYbfQnAY4+C5XhS8yiTxIAkrCfOotn
	 NifJoUB7bySOYe8Kjtjil1p8EC9iFTrSWAOJwrfAe5Ndv30Yk+1FapQBsoYnOjEQO4
	 uiwUKd0W0qgv57VE9VPQiQzdtdv3ZnAgcxlX3NxuuxbbAgpg10BLvYppI8gI8zD5m4
	 ZRlpWs6X2msgQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230824103902.1606288-1-ckeepax@opensource.cirrus.com>
References: <20230824103902.1606288-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Use new-style PM runtime macros
Message-Id: <169290621912.2974920.15839421305684121647.b4-ty@kernel.org>
Date: Thu, 24 Aug 2023 20:43:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: KQFFDKBQJWRX6KEXSMCVIQCL6ZLQZMLB
X-Message-ID-Hash: KQFFDKBQJWRX6KEXSMCVIQCL6ZLQZMLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQFFDKBQJWRX6KEXSMCVIQCL6ZLQZMLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 11:39:02 +0100, Charles Keepax wrote:
> Update to the newer style PM runtime macros, no functional change.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Use new-style PM runtime macros
      commit: 2b59332ead54870ed0f1a8b122a1d640a4865fdc

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

