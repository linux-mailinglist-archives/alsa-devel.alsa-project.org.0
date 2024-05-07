Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBD8BE664
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 16:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BBEA845;
	Tue,  7 May 2024 16:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BBEA845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715093336;
	bh=rh9ZHphu6xhB7OxL8asZBjORtt/B3YfKbGwrlZBc6cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AUUh3bej6bHJgl4Xd8V4ZVkxPDFDE6gPyGGkaAoXKv3DQ/jVzqgYgx0DNk25qLKnA
	 +m0fW73clr5Ana45FDuxI0k6mCcxV+zS2Y4blYUyPOthUzY36B8RtZehcqxvkrWcJb
	 UImWejaTIEqKuB+4wJINBw8FYciXLciIbhwtYyX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E670F805D2; Tue,  7 May 2024 16:48:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF116F805D4;
	Tue,  7 May 2024 16:48:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5537DF804F2; Tue,  7 May 2024 16:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3820F8049C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 16:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3820F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UBu4+3nW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05D61CE139E;
	Tue,  7 May 2024 14:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7556C4DDE3;
	Tue,  7 May 2024 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092507;
	bh=rh9ZHphu6xhB7OxL8asZBjORtt/B3YfKbGwrlZBc6cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UBu4+3nWgiamZFHlRcnS2ATFNkDtDSETJcVAzEKOqIElti2qiwitwR8zvQEstP4Fw
	 DNPyQYbn+3m8DsBVBGGwCI06hLccmeCOhAUPQp+GdN/c60ctVDpHg54fVloDzVP3b9
	 O3wvE3KwR18gti9jOzw8ekjIrYoumbsXZbhAruI3BNFJkHMpLGW/rVbvG4QMIJAKLU
	 6C715L9YLPpBy5g+3dRM3RvldQ8pZYld9AdD9i4UWfqAkWeaKQ7BPKAOj408OV90kp
	 D82JKoThpkkeS7WwA0DTh9hirQrPfWVSTfLMIZKDvh6l36/4q5H0CqtJb86oUBoruU
	 CMFaNDr1ZzegQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
References: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: boards: Properly name input
 device
Message-Id: <171509250547.1985791.9610168876081651324.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:35:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: V4XMI2G26EXKHLUFWEBNVCGO7FACKAMZ
X-Message-ID-Hash: V4XMI2G26EXKHLUFWEBNVCGO7FACKAMZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4XMI2G26EXKHLUFWEBNVCGO7FACKAMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 May 2024 14:11:06 +0200, Amadeusz Sławiński wrote:
> Machine boards expose input device for use with userspace. Current name
> in some cases is incorrect, fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: boards: Properly name input device
      commit: 6490bec6d5bf1001032c5efea94bdf5b5104bce9

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

