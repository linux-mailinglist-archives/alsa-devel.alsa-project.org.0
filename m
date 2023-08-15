Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B312377D33B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DBD6A4D;
	Tue, 15 Aug 2023 21:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DBD6A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127167;
	bh=H4VEbHIybE4aqWpXjIZwsQHIPrM4Emib0GTd6wPDsFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Asjnw36zwXWm5spelwVa99R8PMfmonh/4JvAVVt3d69+0mroIogSY1TbD0WwSU90B
	 GgKuWA37ClhpZ6yin4zdhQRlFEhLveGg/PSa8X/tV2Z8HrhsU4/f56DfZ9DF6SN6IY
	 /fLUIMYczojalRur0ByfLDrryTlnhKmCUnRQPOko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BE1F80549; Tue, 15 Aug 2023 21:17:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E9ACF80551;
	Tue, 15 Aug 2023 21:17:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BA1AF80553; Tue, 15 Aug 2023 21:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C98FF80549
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C98FF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MJYCOFkm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8424C66073;
	Tue, 15 Aug 2023 19:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4866BC433C7;
	Tue, 15 Aug 2023 19:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127068;
	bh=H4VEbHIybE4aqWpXjIZwsQHIPrM4Emib0GTd6wPDsFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MJYCOFkmxnHofXeP22JlcDVMU7kCv80wKE5bNQvQTLp/BedEgxSH6dJcGW7GJaIJb
	 slNdSFIonqYmkdK2/6Ji/b0NE6WiHVd4N6KuHzx41Lt1dlgA9IxhYIXYukZBG+JnpS
	 ooPkKSCoocCbI+KqiM/119WPk9gJ/awaTvHetKozIpGRdP7nfzrDr+ZqR6C5xZ0Z4C
	 XJiXDkZ9ICWpSlvV5fHAWIw8HCWtzqsZNYoqe1PPxV/Hvb07wA42kD2Iaqhy2FXlrI
	 aFnB+tCUkwBrevI76ydivlGbjXv82gWmaWogYDHM8r9B7q17Fo/N0Z3Jy8WeXywfLR
	 UuqHyBsFONwxw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230814234235.87268-1-pierre-louis.bossart@linux.intel.com>
References: <20230814234235.87268-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: remove duplicate code due to merge
Message-Id: <169212706702.68178.8183706637881431499.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 275PQEGXU7WAMFQRNIQBVHQXMFBTCXZ5
X-Message-ID-Hash: 275PQEGXU7WAMFQRNIQBVHQXMFBTCXZ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/275PQEGXU7WAMFQRNIQBVHQXMFBTCXZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 18:42:35 -0500, Pierre-Louis Bossart wrote:
> Commit 81113108491e ("ASoC: Merge up fixes") added the same code
> twice, remove the extra call.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: remove duplicate code due to merge
      commit: c5556d8651b4c58e0d9894be5a0188c9c90ce899

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

