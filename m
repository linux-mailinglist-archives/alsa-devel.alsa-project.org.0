Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91FAC7FFE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 May 2025 17:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A9760208;
	Thu, 29 May 2025 17:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A9760208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748531282;
	bh=B17gSMTmJonwWf7TxbUU/sxBJV9FHi9eQtKqckCJ7T0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=juDP3tCgVqvqnEE+RxCVn4oyVNYrk48vgRzvusN//1/bPFgvERAhGu/odX494SHXX
	 yOAI5Nx503p85+xIGti0hE6GJ2Jew9huVyX4d8ZNhaKeN7maZzZ3g2+8hUqR7z+ZP3
	 KKyxp7YXQ8hN7xaI4gGGDGz1y2OMCHyQOQAO6HQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48DB4F805E3; Thu, 29 May 2025 17:07:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F563F805E3;
	Thu, 29 May 2025 17:07:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12676F8025E; Thu, 29 May 2025 17:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A510F800E2
	for <alsa-devel@alsa-project.org>; Thu, 29 May 2025 17:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A510F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G6UXntf/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C7AD60008;
	Thu, 29 May 2025 15:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C83C4CEEB;
	Thu, 29 May 2025 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748531224;
	bh=B17gSMTmJonwWf7TxbUU/sxBJV9FHi9eQtKqckCJ7T0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G6UXntf/RHsHo+g2VtIX3F8n7xVnHbnYKT/eCtlBXnjccZryjUvBpG5ABWWvCpfe+
	 spayWeuRnLZeQGT8WuJU2ZACGUF/A8gvX5skpRLm5LjQc+la11Zz8CCD8HrapqJj4W
	 mA7PuHFU9B+2vlIXdYkNQSoS39Qfk5SLUb5RBsFbztTdB1U1fdChS7eRDcRz9VTZb8
	 /3Z9UAlhchQatLm0sk63Eg+USmjX8Yzo18Pjc6jalVrtBGDAxJkQhT/F9sRtPf0NQt
	 XaRdpftOmvjXEpaJhPJoYx9Fl/ZBMLieLAnVIQuPuDOQDOPus3YUJm4vbhM+o5BOwD
	 CoHZMyL69ivlw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, meowmeowbeanz <meowmeowbeanz@gmx.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, alsa-devel@alsa-project.org
In-Reply-To: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
References: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
Message-Id: <174853122256.49405.5926862101216384777.b4-ty@kernel.org>
Date: Thu, 29 May 2025 16:07:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: AVVRQUXAQGCIC47T4OEGO3WXEE6U7WZV
X-Message-ID-Hash: AVVRQUXAQGCIC47T4OEGO3WXEE6U7WZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVVRQUXAQGCIC47T4OEGO3WXEE6U7WZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 May 2025 10:56:58 -0700, meowmeowbeanz wrote:
> Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
> digital microphone support via ACP driver.
> 
> Fixes microphone detection on this specific model which was
> previously falling back to non-functional generic audio paths.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
      commit: df7996076b1e1ba8a0690542d0e40f703f2f9eb7

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

