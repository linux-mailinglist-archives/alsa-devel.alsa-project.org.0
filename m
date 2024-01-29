Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645D841690
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 00:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8993AB60;
	Tue, 30 Jan 2024 00:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8993AB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706569783;
	bh=WpjL8udaT7mXrtLXoK5bhYoyhAJ9SBcm4G6f1hxbSHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M8OMuj3zcbLmBSJpcmOK8b0T/qZDPm/bm1Tecga+2Bmlv8ogx3XwNvWqW/Lu4RZQ5
	 +OKnYiMZY5GXJsLBUQr+wWMkPLXOts7rfQs5wfxSKx+p3tPQuzUmmzrrEH74ih37jc
	 X3YzA8JrZSa6gJJ1jBFNMS0MFoHN3C05KfxaIP9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F31F805A9; Tue, 30 Jan 2024 00:09:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D1AF80568;
	Tue, 30 Jan 2024 00:09:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 968F1F80563; Tue, 30 Jan 2024 00:09:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1D8FF80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 00:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1D8FF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=anLwcBlC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98397CE16D5;
	Mon, 29 Jan 2024 23:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D3FC433F1;
	Mon, 29 Jan 2024 23:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706569727;
	bh=WpjL8udaT7mXrtLXoK5bhYoyhAJ9SBcm4G6f1hxbSHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=anLwcBlCjDMudDdNwqvbnuDC2vP3itrRiNfhTotMkEkk60RnXXHAt2WQe7pCakLR6
	 dbyaIOq5G2SedbBJVC7z2OJ/UK6qD1hlQtQSoKURysinidt2IQo4Bu43CbWKfofgf1
	 BrBnk3T2qhkccJL4gjgR5Vrvz3sHM9IBkoz1iS9Hm6J4cgq57dnpVL6jdQ4/IhCtrE
	 i3FVc37/efg4+coVrpI4q8zus6+s1eQGdW2Z3zvwRnYmsWo9K10GrHD0JeSeZP/OrL
	 5U54Amqkb+eIaDdckXN3HWbVQ8t3PW7kbcJVvA1cZ7awnjRkVkVynX/sMMEVvNuPOe
	 1Xp98gfVtDGpQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marian Postevca <posteuca@mutex.one>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20240128172229.657142-1-posteuca@mutex.one>
References: <20240128172229.657142-1-posteuca@mutex.one>
Subject: Re: [PATCH] ASoC: amd: acp: Fix support for a Huawei Matebook
 laptop
Message-Id: <170656972577.167619.10975309830352021265.b4-ty@kernel.org>
Date: Mon, 29 Jan 2024 23:08:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: GWBF5LYB6HPGERF3OJ7E4RPEO7V66SYA
X-Message-ID-Hash: GWBF5LYB6HPGERF3OJ7E4RPEO7V66SYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWBF5LYB6HPGERF3OJ7E4RPEO7V66SYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 28 Jan 2024 19:22:29 +0200, Marian Postevca wrote:
> Previous commit that added support for Huawei MateBook D16 2021
> with Ryzen 4600H (HVY-WXX9 M1010) was incomplete.
> 
> To activate support for this laptop, the DMI table in
> acp3x-es83xx machine driver must also be updated.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix support for a Huawei Matebook laptop
      commit: 5513c5d0fb3d509cdd0a11afc18441c57eb7c94c

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

