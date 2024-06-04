Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB008FB173
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 13:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51DAA868;
	Tue,  4 Jun 2024 13:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51DAA868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717502107;
	bh=yJsKvIpOvhSJFjFDzdGRI3kOnJRBx1kUm/4dwBlOq4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DlLL+6pJNErQHR8eFHcyRRVdhaDYFV5jx0048Ll/SZYJz0oAYIuBe2xaJbfWRqEaA
	 PWiloK/jVgGU8dlcDAE91tfRqBCb4t1aaNBRsxK0n5EVnbx6c/YexfaZa3Rx14Qxfa
	 0F7Odirzx5luFhtRH1GuDZjAphENqDnoMxEUFiYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D63A6F80578; Tue,  4 Jun 2024 13:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 546E2F805A0;
	Tue,  4 Jun 2024 13:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BA7F802DB; Tue,  4 Jun 2024 13:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43FE2F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 13:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FE2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dxdEBGd/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B9DD6119D;
	Tue,  4 Jun 2024 11:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA72C2BBFC;
	Tue,  4 Jun 2024 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717502061;
	bh=yJsKvIpOvhSJFjFDzdGRI3kOnJRBx1kUm/4dwBlOq4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxdEBGd/EjK5q+GKPU0fUg9u30TPAnyhliaupQKC/VYT2CGQUzASR2k4FPGtfOFPa
	 U/thJG0kwtoQtuuLGypvc7sqOuoXaksOZgOjiRRyAF+2r0JbhMJpCW7hEU84RFg/hm
	 4SjBA/BJZpV2rO7q2qP15/PgVJCdz83x8OJMM9fs1aF2+i58FINDDe2vtWvFLQvc/+
	 xHRAeJC6avCdvlIs0vU1iR14TTIJedI9ULs3Mkw1xxZKOlFEf8bJ28CdWXUPv9PGmn
	 uWVPNmmzvQ5TJiKHWfZ3L0rHEOe4n5yKVv+uaGa8/gDXAYrkRzYrf5KgvWrRmy6s+1
	 1AhXX+mtNpiNQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
References: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
Message-Id: <171750205882.24919.10241558031542040630.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 12:54:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: J6NCLSGYRRLAFHDTT6YOJBBXKVBYD6FI
X-Message-ID-Hash: J6NCLSGYRRLAFHDTT6YOJBBXKVBYD6FI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6NCLSGYRRLAFHDTT6YOJBBXKVBYD6FI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 31 May 2024 01:30:54 +0300, Dmitry Baryshkov wrote:
> Not having linux-arm-msm@ in cc for audio-related changes for Qualcomm
> platforms means that interested parties can easily miss the patches. Add
> corresponding L: entry so that linux-arm-msm ML gets CC'ed for audio
> patches too.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
      commit: d3cb3516f2540e6c384eef96b4ffeb49425175ed

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

