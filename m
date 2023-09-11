Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEAC79B69C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A86102D;
	Tue, 12 Sep 2023 02:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A86102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477133;
	bh=ZLQwBDO9oB7DwHjbeEilVGbTlMbMwI68sm9U3hUF8Q0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HfKly02dzFGqI4nv0fuwxAy1auUVM/hg6gE+SVL3AuF5f5wBd6cpbmS1lekdIOnIr
	 Ty7Rdr6XZH5elc88FC3qzurSuP3RD8tzZXhjhvfPLgYDLKb3g5cBkPW9q9LIBcI20n
	 Q8IzBJnWum4jwm7b8cBGsF/qZdoQx1qQ6GS1o3uQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A3EDF8061D; Tue, 12 Sep 2023 01:57:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C335FF80616;
	Tue, 12 Sep 2023 01:57:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60EF6F80600; Tue, 12 Sep 2023 01:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E130F805EB
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E130F805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pleTmCeO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E785B81A35;
	Mon, 11 Sep 2023 23:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10A8C16ABD;
	Mon, 11 Sep 2023 23:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476652;
	bh=ZLQwBDO9oB7DwHjbeEilVGbTlMbMwI68sm9U3hUF8Q0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pleTmCeOGpMp8OgSpvq2ZspmRywpezPrXCk/saOp8oLbJxHb1URIfoC2U+sXj6YQb
	 go7PMdiP3hem3qYezceAvWhuvcSVY5sHbCC4P3QuK/BjcBrG/53ifTGiH4LopCDjjb
	 9QtNWoKdiQoGZdy8AK89kia1vNZ5gciwl8DXLCMirJ+cEk0314moYlCPlZcf4ZJT2s
	 2bDllpNOWhsLOfbGSVC3AHO0AK2rX1Czs1VDy+CiD7Vda6nSQkH1324dK0dsJWBZR6
	 FMe6FnQj7cZWguglf1y8uLxO3OpQprUklkYJQRnrckKbKmcMzT+JmdDT4dXVqlUncW
	 i7rl6oIKaoT+w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Marian Postevca <posteuca@mutex.one>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230829220116.1159-1-posteuca@mutex.one>
References: <20230829220116.1159-1-posteuca@mutex.one>
Subject: Re: [PATCH v3 0/5] ASoC: amd: acp: Add sound support for a line of
 HUAWEI laptops
Message-Id: <169447665042.2387538.16679409837029670258.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: DJS7L4O3B5EQZ6VYZ2E6TOLBYCLER3OI
X-Message-ID-Hash: DJS7L4O3B5EQZ6VYZ2E6TOLBYCLER3OI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJS7L4O3B5EQZ6VYZ2E6TOLBYCLER3OI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 30 Aug 2023 01:01:11 +0300, Marian Postevca wrote:
> This series adds support for a line of HUAWEI laptops with
> AMD CPUs that connect using the ACP3x module to a ES8336 CODEC.
> 
> The CODEC driver must be extended to support the S32 LE format
> and the MCLK div by 2 option. MCLK div by 2 is needed for one specific
> SKU, which uses a 48Mhz MCLK, which seems to be too high of a frequency
> for the CODEC and must be divided by 2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: es8316: Enable support for S32 LE format
      commit: 2f06f231f0bfe74711fee14e28a8789a3de9bc36
[2/5] ASoC: es8316: Replace NR_SUPPORTED_MCLK_LRCK_RATIOS with ARRAY_SIZE()
      commit: a43c0dc1004cbe2edbae9b6e6793db71f6896449
[3/5] ASoC: es8316: Enable support for MCLK div by 2
      commit: 869f30782cdad0a86598a700a864e4a2bf44f8cc
[4/5] ASoC: amd: acp: Add support for splitting the codec specific code from the ACP driver
      commit: c680f57095411559e7605af689c7ce01f2281005
[5/5] ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
      commit: 54fcd9dd44b2c82a0262e29b288c2d0b36c6bba5

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

