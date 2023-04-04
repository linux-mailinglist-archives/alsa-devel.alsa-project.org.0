Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E953B6D63B0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 15:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD33A1FB;
	Tue,  4 Apr 2023 15:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD33A1FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680615976;
	bh=QbKOfwkYmEZxqJrLdeZwqiVVRzEx/YEVnqeq1gCUNSk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DBH8B4kOr85swZZ0AshUwTRAdAyqG9Kuf813RC6r9LN04CsmdJvY1+Ks7QZzmmoGq
	 2MudrlRVedaBqIjXlMhOmCnYEZFLLAHEhHsqfFoBuAqWT6TzADqU+6fVfdWUD+e5wr
	 kpIK9/3d4fdW6qJzIuTtJ0CSiHREq+H9Q9wNw4OM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59443F801C0;
	Tue,  4 Apr 2023 15:45:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C63C6F8024C; Tue,  4 Apr 2023 15:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AA00F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AA00F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tKx5Pde0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44C3C6342F;
	Tue,  4 Apr 2023 13:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35227C433EF;
	Tue,  4 Apr 2023 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680615915;
	bh=QbKOfwkYmEZxqJrLdeZwqiVVRzEx/YEVnqeq1gCUNSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tKx5Pde08Zpmg8iF4kGQif6ZA2f1mKakatyGHkxdyYv6RYyMf7G+Ve6nx9qcDKHr1
	 hPmgeUm2981qdUbGjZTRPfFuDPWuxU+Y9Dgv/q+TgwFZCFRIpbJ9tYDZ7XG7PS3a9K
	 rX40k2hUqZOuvRaNRQGYHiKuM1iUPfHasCdIoBcqzWHfXJuC56wkWMir9YHr04XZBy
	 jk1WVuJb9XVNcskPSkWHVVnRNN4W1gLL0NLTVFt0Fv4XnFAg6TKYYTvfRO1h0y2XLs
	 2PLoyeunKd8CC5OJcGky1s5D23tbnJevA8MiqJof0qYhckwx8jgoEOBvyA9gEPtNTR
	 diHuqaBT1wjmQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Zihao Wang <u202012060@hust.edu.cn>
In-Reply-To: <20230404084622.1202-1-u202012060@hust.edu.cn>
References: <20230404084622.1202-1-u202012060@hust.edu.cn>
Subject: Re: [PATCH] ASoC: tegra20_ac97: Add missing unwind goto in
 tegra20_ac97_platform_probe()
Message-Id: <168061591290.45547.6311977910704491174.b4-ty@kernel.org>
Date: Tue, 04 Apr 2023 14:45:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: UJASFJ6D2PGJH2OSSMG75EY2HCYCK3NJ
X-Message-ID-Hash: UJASFJ6D2PGJH2OSSMG75EY2HCYCK3NJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: hust-os-kernel-patches@googlegroups.com,
 Dan Carpenter <error27@gmail.com>, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJASFJ6D2PGJH2OSSMG75EY2HCYCK3NJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Apr 2023 16:46:22 +0800, Zihao Wang wrote:
> Smatch Warns:
> 	sound/soc/tegra/tegra20_ac97.c:321 tegra20_ac97_platform_probe()
> 	warn: missing unwind goto?
> 
> The goto will set the "soc_ac97_ops" and "soc_ac97_bus" operations to
> NULL.  But they are already NULL at this point so it is a no-op.
> However, just for consistency, change the direct return to a goto.  No
> functional change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra20_ac97: Add missing unwind goto in tegra20_ac97_platform_probe()
      commit: 194f8692302cbf31d8072f3fc2710fb04720d8a0

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

