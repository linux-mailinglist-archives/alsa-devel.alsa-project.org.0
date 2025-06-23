Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4CBAE4979
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 18:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09AA760199;
	Mon, 23 Jun 2025 18:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09AA760199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750694471;
	bh=/XfB/j+cPABLGx5W4G9axzM4iG9aT2NRr5DMyD1JrgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AaXcYRsIQ6L0hae8r9q+AQYfIyp2SBkcqvcxhFWUx+9bSHfCFcXS8KOjp6Mcz5csI
	 G5DRRSXdNcoQdkLXaEU1T7+Gv8TJePmfJoHv1Ep9v1+H7VCfYfgiLHKVRRSxxmfU3b
	 CuGFZDh2Iw3hubdP6LzgUoMXqGRzm9TQItvm0Jwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F8FDF805C5; Mon, 23 Jun 2025 18:00:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A9A8F805C5;
	Mon, 23 Jun 2025 18:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B97EF80424; Mon, 23 Jun 2025 18:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2F01F80087
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 18:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F01F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Th8Fp3aS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E76C7614B4;
	Mon, 23 Jun 2025 16:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43558C4CEEA;
	Mon, 23 Jun 2025 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694427;
	bh=/XfB/j+cPABLGx5W4G9axzM4iG9aT2NRr5DMyD1JrgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Th8Fp3aSp+rD+Xjx69NGZ2eQwj5hmhmUtl68Mdwju8t7fD7yjia6PK5qJIg9Rf/lD
	 v2MuXQq+XCyX/SzQpFFxpHOPh+oxQnZIM9qYnozCBj/M3IHbKJgEwCFZYwGarSeaQ7
	 gxL2uTJHwCjXrfKj05kxJ3S/ZqQRtpAgdCmk20DNgozgmkhK+K9suiYdh+KDL87aEq
	 9rrp1sb1mXHxsXItA/cWyqb/E9urQrQgg78KY9+oQqPIdls1hLjEVzcGpCwKZ4a818
	 nZKPI3TyQHl8fG5TQfZZz9lzUcN56Rphg6yhLvQ8e3ov8xIIoUq2ZH2PdCHRUsewvp
	 2y5xwpsBg/u1Q==
From: Mark Brown <broonie@kernel.org>
To: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250621180223.14677-1-yuzuru_10@proton.me>
References: <20250621180223.14677-1-yuzuru_10@proton.me>
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41
 internal mic
Message-Id: <175069442578.140181.10389639011596283594.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
Message-ID-Hash: WVKCTQ63TKHUAJF6ZQK5BN2MB6X5PKFJ
X-Message-ID-Hash: WVKCTQ63TKHUAJF6ZQK5BN2MB6X5PKFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVKCTQ63TKHUAJF6ZQK5BN2MB6X5PKFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 21 Jun 2025 18:02:28 +0000, Yuzuru10 wrote:
> This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
> allowing the internal microphone to be detected correctly on
> machines with "RB" as board vendor.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
      commit: 7186b81807b4a08f8bf834b6bdc72d6ed8ba1587

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

