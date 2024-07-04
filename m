Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2A927BD4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 19:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77D514E8;
	Thu,  4 Jul 2024 19:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77D514E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720113654;
	bh=y1eAcALUBJtOcY/yRjb+HRjFX6xnxr1k9+LVlC7sRV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m+sUsBlXNEjt9ZnYQZ2jL3b8Tng/z5JjPZ7QGfNjv/4V65JLxyR87fIhSg0wKkGFw
	 eqmI+F69vgOl2BNHf7hA0nykbQ/51d5R1FP5VB4vV02Vwec5gpsTx6Umj5cWOs1irl
	 spGscT/saXALD3dPll5W+aLi/p5Gq1Ky54t5idAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE4E3F805B3; Thu,  4 Jul 2024 19:20:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EACBF805D7;
	Thu,  4 Jul 2024 19:20:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672B2F8025E; Thu,  4 Jul 2024 19:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0053BF800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 19:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0053BF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NWm+2O5t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C1E2627F2;
	Thu,  4 Jul 2024 17:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1DEC32781;
	Thu,  4 Jul 2024 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720113543;
	bh=y1eAcALUBJtOcY/yRjb+HRjFX6xnxr1k9+LVlC7sRV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NWm+2O5tpmSwLbY5UOhSgVDcz415Se9L5pCVje9uQwZyioO39y3rWLkbbQdc0+/DZ
	 5IgK5tyum6yRNy320ETN/sqON2ubCzv65AOuq1KFmzRjk07Rj7QrrZ1NuNHXvEm+Ot
	 /wU4G+aH84/NlwAKU/QKglX7nyt+kRu0qGSy7IjPX8Qs14ge0gBmPJuRmSbAPVqkjy
	 FSaScg4sSk9q1+aM0oE2786dTsleVMsMZvXqr1YB4wh7desxUyCngyBuEAE5I7Da+f
	 IbCJSTZlgxJ8Tb2DKNUr8Hb4/buHZNqcxA6HBbUo+scP8aOecd3wnVhrHpvKsU70+6
	 lqajMp1vz+Y7w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
References: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of
 periods by MAX_BDL_ENTRIES
Message-Id: <172011354202.90743.11488058235913274313.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 18:19:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: JQQKGYNNR6IUXK2WSITJ2K5FVXGXKTSF
X-Message-ID-Hash: JQQKGYNNR6IUXK2WSITJ2K5FVXGXKTSF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQQKGYNNR6IUXK2WSITJ2K5FVXGXKTSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Jul 2024 11:01:06 +0200, Pierre-Louis Bossart wrote:
> The HDaudio specification Section 3.6.2 limits the number of BDL entries to 256.
> 
> Make sure we don't allow more periods than this normative value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by MAX_BDL_ENTRIES
      commit: 82bb8db96610b558920b8c57cd250ec90567d79b

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

