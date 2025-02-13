Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC622A34205
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 15:30:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFA660256;
	Thu, 13 Feb 2025 15:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFA660256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739457031;
	bh=HUdrlX2MtZKsLwMOSsoa4AP7fbIIfr20YZg8Tm0wdYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Md6iiAarNfZQyR7P4cnJkPmffq2olmVsebPxAFj4+iMtZgHVaUwUrkmVIf2Zu3aZI
	 UeXLXjajYB7WGUjta+GOEj/zfjHpOrMBBebnCf/JReOkLacRqdwO/lLhwH3MeHc5m3
	 h88A7ZRHrL/7pge43ld0URlFhXSTdgwt+zBmcF6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD60FF805B4; Thu, 13 Feb 2025 15:29:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F764F805BE;
	Thu, 13 Feb 2025 15:29:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 344AAF80269; Thu, 13 Feb 2025 15:29:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A13C6F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 15:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13C6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TM1XYQBg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D945DA425B2;
	Thu, 13 Feb 2025 14:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B131FC4CED1;
	Thu, 13 Feb 2025 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739456973;
	bh=HUdrlX2MtZKsLwMOSsoa4AP7fbIIfr20YZg8Tm0wdYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TM1XYQBgWt5Zx3+B1g3byTwhgvV3eN9EnsHfNCXXJFQR1H4eYQAJik3H/N/lJGIa9
	 l/ony8uN3cDb7u3rIGm115wJoCZ0EqLbumn8ip/zT976urzefWUzxVHoTXvuJGxdpr
	 o50kQlcSm/AhDI7oRxA3rw1pb1tqFvPvAw6NLjZ4LG/eaz2wORLwnJLl5ngS3SYP34
	 HWXy30lsOrw/ovif2VKbvQqB8XDMDlbRNMjyuVIDCAAMRT19JgFh4H33P9k0Hd8d6b
	 36wameN+RBrq0PtKea4id1Texva6p6AU6MFCDrrBnxPLQyrhlRl3Prs++M3Qy6+QFB
	 7xRIik1A3bthw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
In-Reply-To: <20250213103652.1082203-1-Vijendar.Mukunda@amd.com>
References: <20250213103652.1082203-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: use switch statements for acp pci
 revision id check
Message-Id: <173945697146.151957.15841988796176463409.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 14:29:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: UEXZYDDPNOVXF75DLLD7KH5FYNOTC5F7
X-Message-ID-Hash: UEXZYDDPNOVXF75DLLD7KH5FYNOTC5F7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEXZYDDPNOVXF75DLLD7KH5FYNOTC5F7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Feb 2025 16:06:52 +0530, Vijendar Mukunda wrote:
> Use switch statements for acp pci revision id check in SoundWire
> dma irq handling.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: use switch statements for acp pci revision id check
      commit: 828c0aa63706410503526d0ee522b9ac3232c86b

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

