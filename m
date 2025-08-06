Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB78B1C5FA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Aug 2025 14:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD3B60265;
	Wed,  6 Aug 2025 14:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD3B60265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754483844;
	bh=6SYLWigHb/uhY1qfbllUFwByFgGXUgdw9SpyK/xp9QE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQjPTGZ2N4dok/PvAipxR7WkMPFZiCv8PcXagWel1dNcIkFGWLabcAuq+2hUn8+L7
	 6pAjtsGk7A+rG93y1vNPAWzVy0BVVl3M08hqbMr1ztlAHvi47k2rfNM+1pUerEYvRw
	 WRhCCNreKFi73Nv5U/NysXscbEvVj5TwmGsbmGOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CB7F805C9; Wed,  6 Aug 2025 14:36:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5E4F805C2;
	Wed,  6 Aug 2025 14:36:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5176F80508; Wed,  6 Aug 2025 14:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA333F80016
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 14:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA333F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K2Ox/f4I
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3370144208;
	Wed,  6 Aug 2025 12:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6419BC4CEEB;
	Wed,  6 Aug 2025 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483466;
	bh=6SYLWigHb/uhY1qfbllUFwByFgGXUgdw9SpyK/xp9QE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K2Ox/f4IuqXjL167WZbkptv+L2dD5f913hdOQ13553XhwXUpcapGFS5oCOWLx/Ngo
	 2CdZW0UTNcZr7kON2Dx46Tiu1ruNunTMc/BzedWSmX/ImCTnizndC5YqD0MtVTGn5i
	 aUdQGjK+crRvyK8FnmX70JWd01+dILVdCFNVuAyf0P1DCCWW/aILkRyUQXu4ZxUi5J
	 BDs24FUSjDueW7wnHrcVxNknvxpHb2RBZUMt7fTD5OOH9RdebIBt+1X35N5vBhdlvJ
	 h/ptzvKEwUsOi7q7NJ9MW+OdLeoxA3lL9WBeupj5NTNJnzZqKWpTV/b7yJ9N2H6FpK
	 dUeQBOScJLcSw==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250801021618.64627-1-baojun.xu@ti.com>
References: <20250801021618.64627-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Fix the wrong step for TLV on
 tas2781
Message-Id: <175448346413.51650.7450659009173444382.b4-ty@kernel.org>
Date: Wed, 06 Aug 2025 13:31:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: QQMKSH52TAVCEGT6X6TVV47PKGUWRKKS
X-Message-ID-Hash: QQMKSH52TAVCEGT6X6TVV47PKGUWRKKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQMKSH52TAVCEGT6X6TVV47PKGUWRKKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Aug 2025 10:16:18 +0800, Baojun Xu wrote:
> The step for TLV on tas2781, should be 50 (-0.5dB).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix the wrong step for TLV on tas2781
      commit: 9843cf7b6fd6f938c16fde51e86dd0e3ddbefb12

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

