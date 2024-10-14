Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A799D48B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 18:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD6D83E;
	Mon, 14 Oct 2024 18:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD6D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728922995;
	bh=Ww7Z1YzEp0c+2omPjLxtyFIUrzn4ytPdKFXuvTYte6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ieUc3MTkv3ZMTYepGQKAwDiJ8kheS7GsqNolOBse2wQRvlXL4sWQ5PljOrjZMihCm
	 /FSzpuFTU2kqftj3eK0IzEzMvznZowP0Npdy3Je5MRmNrKVjr/ionkoHyk3b65F3aG
	 JbKV0gqz6bm6fX0zzYzS+zmyLN9e0I+W7OpzdYos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 996EBF8016B; Mon, 14 Oct 2024 18:22:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53365F805B1;
	Mon, 14 Oct 2024 18:22:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89BD5F80448; Mon, 14 Oct 2024 18:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FC9AF80149
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 18:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC9AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g1UYvt4O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 837E05C554C;
	Mon, 14 Oct 2024 16:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76E4C4CEC3;
	Mon, 14 Oct 2024 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728922953;
	bh=Ww7Z1YzEp0c+2omPjLxtyFIUrzn4ytPdKFXuvTYte6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g1UYvt4OxCWyVd7VtHVjEbvgv97uo4OS7xMt8Uf1CZ1kd0QD3lxeAAcjYwcP1D5fB
	 kFPm36Q8+Pyd0lWx6Um2PXGLGvg+KZQ/n7D1Lo9brPVf4Or0f3yLh8JHHbdMbzdKSx
	 0/hmMwXwdvaAE5Sb1F0p7aRt9/QeGKPdDWjeQzdbw/3+KIJcePUXIHp9cGucG8S7+i
	 jL6GPjd2p/rJMRVHnqYydQ/Z6TNuxf7T+aR5kOCjZPUvoPTsEE3mbNmzHQ5jmgtLAF
	 swQG4gM5Iui3HipG8QE4gS8BD4CX9GbdtNd5j1ujM9q7eqV5v+Rj92yBbyegvtmFiY
	 tP7S3LwmGNK7w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <8631337239d744088d56caab2d8f39cb@realtek.com>
References: <8631337239d744088d56caab2d8f39cb@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt-sdw-common: Enhance switch case to prevent
 uninitialized variable
Message-Id: <172892295037.1407.5654941576598918739.b4-ty@kernel.org>
Date: Mon, 14 Oct 2024 17:22:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: HWZ63FB4UWI3YYFJCXA3E3ATXV7DIPL4
X-Message-ID-Hash: HWZ63FB4UWI3YYFJCXA3E3ATXV7DIPL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWZ63FB4UWI3YYFJCXA3E3ATXV7DIPL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Oct 2024 09:55:20 +0000, Jack Yu wrote:
> If det_mode is not 0, 3 or 5 then function will return
> jack_type with an uninitialzed value.
> Enhance switch case to prevent uninitialized variable issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt-sdw-common: Enhance switch case to prevent uninitialized variable
      commit: c6631ceea573ae364e4fe913045f2aad10a10784

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

