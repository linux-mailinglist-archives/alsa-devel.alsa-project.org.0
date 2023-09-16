Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDF7A2CE5
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21E1CAE9;
	Sat, 16 Sep 2023 03:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21E1CAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826754;
	bh=zT62z2Z6UE52rrmOXIbJsKZfUvjdayZ1ZZhteFroU/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmw/CJ4rg+hncUjSWr/sk8ClmMOZ7lUfW9xzyAuFaELrpzFqZIN5++xN2FMxZDk54
	 RBpqYJSa8+SvUWr4iKU+QsVMlVegn2VnycAvDrYqcjEa4Z9zj30Zqds4Xyk9lhfGzw
	 cdqw8Vk3+bY3hJK95y7XQrW+lZ1uACCUtL6NrT+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20258F80246; Sat, 16 Sep 2023 03:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 989FFF80431;
	Sat, 16 Sep 2023 03:11:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E498EF80425; Sat, 16 Sep 2023 03:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1AF8F80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1AF8F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iRmrlSUQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F0BCB82BF7;
	Sat, 16 Sep 2023 01:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E65C433C7;
	Sat, 16 Sep 2023 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826692;
	bh=zT62z2Z6UE52rrmOXIbJsKZfUvjdayZ1ZZhteFroU/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iRmrlSUQM3DfAqweUfGCWKGp8n6jI6cvI2bwTVK+0pqeA1B2aDZ2PF1lUPsunrebA
	 n7KmhE91BRrEQRxUXabIAmYuxT9TG+yZTyTdPkgtaYuz2tP3qIwFXQdb4vFohpqsBY
	 T/K8ZbrV0gbD5gJOQ1HtkB6DraUWKI/UFnzLl9Z6vOQ8Zv91RQ7X8VCSi7+D+cbect
	 25JT0arpZ4Yv9+vwCBPEGBeIRmcfWBMIbhHZnejEoVp0jfLLDJ1LXZvKoo+Kfuq1zK
	 XAnEnTZ8bbXQDap8yKMiNfwOzlyux+A2rVDDxSqVzR8Vg36NNQc244cn1rDNzPB/Yk
	 d4UBBNu87qoHg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230915082207.26200-1-tiwai@suse.de>
References: <20230915082207.26200-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: amd: ps: Fix -Wformat-truncation warning
Message-Id: <169482669140.606223.9253593129279338010.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: WGS7S26MS3ET3ZLF2FJLBIVNURZHUAJ3
X-Message-ID-Hash: WGS7S26MS3ET3ZLF2FJLBIVNURZHUAJ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGS7S26MS3ET3ZLF2FJLBIVNURZHUAJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 10:22:07 +0200, Takashi Iwai wrote:
> The compile warning with -Wformat-truncation at
> sdw_amd_scan_controller() is false-positive; the max loop size is
> AMD_SDW_MAX_MANAGERS (= 2), hence it fits with the given size.
> 
> For suppressing the warning, replace snprintf() with scnprintf().
> As stated in the above, truncation doesn't matter.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: Fix -Wformat-truncation warning
      commit: 925819c7969cc1453a3e8125787942d6127fa002

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

