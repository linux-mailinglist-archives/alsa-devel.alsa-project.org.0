Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29326923AC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 17:52:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4927284D;
	Fri, 10 Feb 2023 17:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4927284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676047944;
	bh=/MMgWxBJujfafO8l8heeRjmnV5hXbYw4NeNMhuLPRpk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LlcnKV4Tq4o3X1NxVTchAfEFEhAMYof9kJq5iE7MICwxr+6aJJ1vLwj9MHXs3F/lm
	 KriXiUKyKW37GMbASy1eNsZeE9x8wmLMYXoyU+BznWgDWZIujZkrw8H970UjBP2Rkb
	 DWYj+apmfS626oAvE2Yk5cEW2FJDFnlnKTHL4PUw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFCBF80269;
	Fri, 10 Feb 2023 17:50:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E4AF800E4; Fri, 10 Feb 2023 17:50:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 463A1F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 17:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463A1F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jEhg2t2R
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9C39FB82542;
	Fri, 10 Feb 2023 16:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA3C433D2;
	Fri, 10 Feb 2023 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676047835;
	bh=/MMgWxBJujfafO8l8heeRjmnV5hXbYw4NeNMhuLPRpk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jEhg2t2RsRvJVS7X5FU9WslVPOB+pf4mij4WWQDYyKKSHP+lKrspf+6IHqJ6kf+r2
	 RVRDyg3lCdaYuVyXF/RtbmIQOLqLqxKMUThOmiBS+uBXPebcS6vD2mOtdvjmI/rDdh
	 tDNYpg3g0cO3/TUcfHre0ZBuqd8Ik7BcgwgY7N3egAiIOV4YcQ9AcX9+5rgNPrGpew
	 /UXy3BR6ACVOaI8uQj3oaZPFLrzAxY/cCzoituK81Zn5XYwfYWZyn8eLDxySaPZbOc
	 QvnD3/p8ZbQpDmhNK7vF8Um236UmUpKdqDMNmDrKnse3BZLNc8qvW3/roYA7DnOAE4
	 XWgV3SXsiwo1Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20230210082141.24077-1-shumingf@realtek.com>
References: <20230210082141.24077-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712-sdca: fix coding style and unconditionally
 return issues
Message-Id: <167604783303.559421.12101263230670034560.b4-ty@kernel.org>
Date: Fri, 10 Feb 2023 16:50:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: VPB2437DIVRWHCW4WPOWEURJFHIRHIJM
X-Message-ID-Hash: VPB2437DIVRWHCW4WPOWEURJFHIRHIJM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPB2437DIVRWHCW4WPOWEURJFHIRHIJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 16:21:41 +0800, shumingf@realtek.com wrote:
> This patch fixes
> 1. coding style issues
> 2. check if the setting was set already in rt712_sdca_mux_put callback
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: fix coding style and unconditionally return issues
      commit: e093e74b819b38074f07289da9933f9c413337ab

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

