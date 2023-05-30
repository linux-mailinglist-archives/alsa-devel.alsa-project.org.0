Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A64B716B63
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 19:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302F620C;
	Tue, 30 May 2023 19:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302F620C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685468634;
	bh=rJRQG+7pp2ythOpT+U1Yxy5qJud46ffW3tXHC1cJQ18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cbc2XWcFfJzFXAb92q1jgb2bSbxzJPw3Zy41S1o88C4O23Q31z+ChmkQ5hENeyf+B
	 +A3M1YmeUaucxsVwFf7tW+NwM4G75c4KoIscwil4RbBTfdXzzBskdu/VU9Y4Uz9Gjx
	 KyzcFQ7Lb0vlBH1oj0iyTo6TRMnWZs8XV28ttQos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9DD1F80544; Tue, 30 May 2023 19:43:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B74F8026A;
	Tue, 30 May 2023 19:43:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7145EF804FC; Tue, 30 May 2023 19:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 685A3F8026A
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 19:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 685A3F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g/eaa+Vk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EBD86316B;
	Tue, 30 May 2023 17:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFE6C433EF;
	Tue, 30 May 2023 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468435;
	bh=rJRQG+7pp2ythOpT+U1Yxy5qJud46ffW3tXHC1cJQ18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g/eaa+VkSqVBJrewcVGbIIwnK1as5OUVU/bykCkf6EDM8TzirjbIbfYJrY0MA+7yL
	 akc7keX6WJeHG4v2XTGtgGYbW+92NXga8PTIUotdvYlZu1kdyemGhqj1r39zEw2z3A
	 LZnRjYZhmIygPHWUG1ip2I0DzYzEkFJmxUHeF7xdw6mt0A8MXTKFRGx754hzpIPcpa
	 qnE/H4R1RR3u8r474THGPb9dsB/xrn11RZO6td7yKJcr4u9LU6w2xAojrbFXqIMSyx
	 8EQTvGntHhmbjf1V3On6D9OuKFBLvBiHKqDfC6g43RL34JsZCsGqN9CxxZM7I679Cn
	 a7GALizRryUhA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Min-Hua Chen <minhuadotchen@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230519211636.3699-1-minhuadotchen@gmail.com>
References: <20230519211636.3699-1-minhuadotchen@gmail.com>
Subject: Re: [PATCH v2] SoC: ti: davinci-mcasp: Use pcm_for_each_format()
 macro
Message-Id: <168546843313.690777.2915258997696909322.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: AX6QNAQG3NO2Y2SDKLBNIV5NMSH5IJ3L
X-Message-ID-Hash: AX6QNAQG3NO2Y2SDKLBNIV5NMSH5IJ3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AX6QNAQG3NO2Y2SDKLBNIV5NMSH5IJ3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 05:16:36 +0800, Min-Hua Chen wrote:
> Use pcm_for_each_format for the PCM format iteration and fix the
> following sparse warnings.
> 
> sound/soc/ti/davinci-mcasp.c:1336:26: sparse: warning: restricted snd_pcm_format_t degrades to integer
> sound/soc/ti/davinci-mcasp.c:1358:26: sparse: warning: restricted snd_pcm_format_t degrades to integer
> sound/soc/ti/davinci-mcasp.c:1438:26: sparse: warning: restricted snd_pcm_format_t degrades to integer
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] SoC: ti: davinci-mcasp: Use pcm_for_each_format() macro
      commit: c3079282fdf7285b4133d6d1a7901b7923d6db09

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

