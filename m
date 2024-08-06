Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1619497C0
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 20:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60D9E80;
	Tue,  6 Aug 2024 20:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60D9E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722970442;
	bh=6jxvk6q4X3fsFfH3j2Y1KkDUo3CAllzioPD8AKzLmuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5iCtpfu26tfy494zAuaKXZqXxZXrkWwD7s9npOJsD65krtACsq9J+HvSc9WpeTuX
	 oqCi9nujfTFmhIollKXiM9DUlHRLZOyQ/6WW+FlX7Z9FHQx7jrlQiAoecFWV6pTV5X
	 xJf/4iZYVmRTsnddKrRRLwGbjvTyR5R42zfOWLkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CDB3F802DB; Tue,  6 Aug 2024 20:53:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 177D9F805AE;
	Tue,  6 Aug 2024 20:53:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F9F3F8047C; Tue,  6 Aug 2024 20:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6BD3F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 20:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BD3F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dg71MR8W
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77372CE0E8B;
	Tue,  6 Aug 2024 18:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C9DC4AF0C;
	Tue,  6 Aug 2024 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722969870;
	bh=6jxvk6q4X3fsFfH3j2Y1KkDUo3CAllzioPD8AKzLmuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dg71MR8Wh+30wmZ7fsrDPLaCggnXaQNLUB5R0dY9WlTGNn0VmccOt1Dqb7MMnhk3r
	 UIWR5PIb+BHFa5unHl8FVKLmQFqk4CF5G3r8T8Hbxgd4mIGXkUtKO7n3JxTFsW84I4
	 0r+qYA0TdX5t/8X2cK0zW+A94bgdL0P5W2AESPHaNGwudO/7um5ah4ZBtnhOoKyn4Q
	 oLXEwjPAFvxZpWFpZcKfWLU9QyrGdo7O6JRHjziLNsnE0G7r7pmkpLgdwQB/Nz8JZQ
	 T1DRtPXZx8p8fBMeQGBSE6lGIJBsKDKz5GeVwj8Xi+y+Y8sBDNlzQ1jCSUSDhSZB/k
	 ctx5id6JltH7w==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240805102721.30102-1-simont@opensource.cirrus.com>
References: <20240805102721.30102-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: Extend wm_adsp so cs35l56 can suppress
 controls
Message-Id: <172296986941.432413.5644373888144309517.b4-ty@kernel.org>
Date: Tue, 06 Aug 2024 19:44:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ZNN3VOIEERQCYA6NZ6IQ75JIRKS2ZRZ4
X-Message-ID-Hash: ZNN3VOIEERQCYA6NZ6IQ75JIRKS2ZRZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNN3VOIEERQCYA6NZ6IQ75JIRKS2ZRZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Aug 2024 10:27:19 +0000, Simon Trimmer wrote:
> This pair of patches extend wm_adsp to add a callback that can be used
> to control whether ALSA controls are added and then tweak cs35l56 to use
> it to suppress controls made from firmware coefficients.
> 
> Simon Trimmer (2):
>   ASoC: wm_adsp: Add control_add callback and export
>     wm_adsp_control_add()
>   ASoC: cs35l56: Stop creating ALSA controls for firmware coefficients
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm_adsp: Add control_add callback and export wm_adsp_control_add()
      commit: 45b4acab4cac79503663f0a4be9eb3752db04d4b
[2/2] ASoC: cs35l56: Stop creating ALSA controls for firmware coefficients
      commit: 2c3640b82213cf2beb7c1cc3cfce2ecf5349b0de

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

