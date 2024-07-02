Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD59246EF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 20:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2F61923;
	Tue,  2 Jul 2024 20:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2F61923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719943489;
	bh=+V/1vASOgtMkSpHriCblfChzgeI4EF0vyr4JiB9hAdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PEzRrNG/+7dG7Kg+mDWsd+PDBYkNQoWV4PFdOnwXMf97fOfJ+8YvXoVO/oxA/czFf
	 yMlWRKhJSt0ww3mf3vr5LnoyDwPZ0nf2GlmHYdCMubRlSCtqXTjYj9RuZt65I7McaD
	 FpF8Y8pTaDSzGVOhfyfm2VMmhGUKO9MHNfJ08lSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF5C3F805BF; Tue,  2 Jul 2024 20:04:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E6CF805AD;
	Tue,  2 Jul 2024 20:04:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25EA4F80272; Tue,  2 Jul 2024 20:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C191F800FA
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 20:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C191F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U0s4h+AD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69592CE1BB9;
	Tue,  2 Jul 2024 18:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969C1C116B1;
	Tue,  2 Jul 2024 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943392;
	bh=+V/1vASOgtMkSpHriCblfChzgeI4EF0vyr4JiB9hAdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U0s4h+ADasx4Ery8ujuVrP5yR4QxNj749vMxx2KNEajkFWhOxtWRjJiUCzSosWwXe
	 I6VjYo6i9NB166vNlH1YDgpQcTHYjt1WnJnHDSMmyXrTw192F8Tdt/ko1A94u2SXp7
	 wkG/ja9BVv3fGnXhB2A71Bm+90ITeFSrsGMJdvzTO0mteUJhtpESi+EaaWekqzni5L
	 pxUmrOyeovbp4RQ8JVoJkIXkPVh7prwVEDhBV29ee7FieYLO5y5kyXmscXxzxkyf5z
	 7IdHM9gorzoA4HE9dvR2TM+9+omrwn1Z26hu3hOGIevuwAMhotRRoqAgf5SF2MXAsA
	 2VCm1TXNRLjNQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240701104444.172556-1-rf@opensource.cirrus.com>
References: <20240701104444.172556-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs35l56: Remove obsolete and redundant code
Message-Id: <171994339125.996226.7675778991183465328.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:03:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 5R7N52UHUIZDKJ4735J3SIX7ULZPE5XN
X-Message-ID-Hash: 5R7N52UHUIZDKJ4735J3SIX7ULZPE5XN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5R7N52UHUIZDKJ4735J3SIX7ULZPE5XN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 11:44:41 +0100, Richard Fitzgerald wrote:
> These commits remove various code that is either no longer needed,
> or is redundant.
> 
> Richard Fitzgerald (3):
>   ASoC: cs35l56: Revert support for dual-ownership of ASP registers
>   ASoC: cs35l56: Remove support for A1 silicon
>   ASoC: cs35l56: Remove redundant clearing of clk_stop_mode1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l56: Revert support for dual-ownership of ASP registers
      commit: 5d7e328e20b3d2bd3e1e8bea7a868ab8892aeed1
[2/3] ASoC: cs35l56: Remove support for A1 silicon
      commit: e2996141d6db0d8b353e1c221a37c8e1be109d4a
[3/3] ASoC: cs35l56: Remove redundant clearing of clk_stop_mode1
      commit: e5524e3316ac54ca04dde3bfef4565bacf72c594

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

