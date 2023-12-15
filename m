Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5B814E0F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 18:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714E8E7E;
	Fri, 15 Dec 2023 18:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714E8E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702660320;
	bh=bb71eNv5ykDDBLYAbeoMWkUlxEzXqAvnDeM0adtsavQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WNO3f8UeATy3QXSteoSrCpJz+b/C9iI1VnFrho449VDzvdN6z2qzJh5x9HY8ZGL4J
	 zpUU7rQs78rlsJnorHvChZ3+xNMFNL1wbA7L4PxxWxjDmfEsvjgxSMTuVxgKBzLgSS
	 uwFworzAGFl/+IJ9ftCnm2Avea4HEnIiVUDIHrMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F193F80568; Fri, 15 Dec 2023 18:11:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1781F80570;
	Fri, 15 Dec 2023 18:11:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3B9F8016A; Fri, 15 Dec 2023 18:11:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03D00F8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 18:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D00F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t1DMIykG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8875CE3089;
	Fri, 15 Dec 2023 17:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0666BC433C7;
	Fri, 15 Dec 2023 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702660270;
	bh=bb71eNv5ykDDBLYAbeoMWkUlxEzXqAvnDeM0adtsavQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t1DMIykGAqdba93fDOiQwMt4uLI8Dj9nxIoyY4HAKpCngLHZgcKqdhxXm4AqYZi3b
	 3NpY8FliGO05yfRJloLMK5+Jd6Tf/3LXq8tQEKMSaGzZ7XLWRqmSrzRVyPrLtT6DGw
	 EtznZx1ncexJEObHBMsZDtLajcs2nhlW25G4nfuz9HaOxCmgkGE2DyeRUawvsIibEP
	 ayE5WrmLKW41bB32xPvKNenSrgTWi8zjJGTW2NIIP6ZF/L85qA0etOrknZDOpoGKVb
	 h1FKSgXW5TXBrIv+n0dl9RKBt0h5Ik3I1oLn55Jm3kgeW81o/ZllBnEKGUfG9nbO52
	 2DJmAyr1CDYLQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Gergo Koteles <soyer@irl.hu>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
In-Reply-To: 
 <523780155bfdca9bc0acd39efc79ed039454818d.1702591356.git.soyer@irl.hu>
References: 
 <523780155bfdca9bc0acd39efc79ed039454818d.1702591356.git.soyer@irl.hu>
Subject: Re: [PATCH] ASoC: tas2781: check the validity of prm_no/cfg_no
Message-Id: <170266026773.89698.17924199920946310411.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 17:11:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 46ZORTAHNWSB3VF2NU63M5OIZI226OJ3
X-Message-ID-Hash: 46ZORTAHNWSB3VF2NU63M5OIZI226OJ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46ZORTAHNWSB3VF2NU63M5OIZI226OJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 23:04:44 +0100, Gergo Koteles wrote:
> Add additional checks for program/config numbers to avoid loading from
> invalid addresses.
> 
> If prm_no/cfg_no is negative, skip uploading program/config.
> 
> The tas2781-hda driver caused a NULL pointer dereference after loading
> module, and before first runtime_suspend.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: check the validity of prm_no/cfg_no
      commit: f32c80d34249e1cfb2e647ab3c8ef38a460c787f

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

