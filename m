Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650B83743D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 21:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D27857;
	Mon, 22 Jan 2024 21:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D27857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705956305;
	bh=jHahJBNOqmpxsRa3jIC+1XUQhYkCmY2XrppesnzXsns=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RK+JLMGbv+9BuuZOS+s9/VCzymHqNc0PT8mBXRSjNisT1u/xiffxYbHLSpuZIZmw7
	 JEGGPjoJ+X57NhAdRNXu5Jzo5u4k/XshtpDGqSfwCJ9Kh9thimR0TtUAJiODr7CCs6
	 k+HiuQ1BI51yCpvOwBNuh6WJG+yMn/FrMo3qsNjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B40DF805AE; Mon, 22 Jan 2024 21:44:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1315F8057E;
	Mon, 22 Jan 2024 21:44:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74D01F802E8; Mon, 22 Jan 2024 21:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70512F8025F
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 21:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70512F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PWvoqp4K
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBB5E61A8A;
	Mon, 22 Jan 2024 20:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF45C43390;
	Mon, 22 Jan 2024 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705956262;
	bh=jHahJBNOqmpxsRa3jIC+1XUQhYkCmY2XrppesnzXsns=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PWvoqp4K/BSNf38aC031IAIAGvnawluui5ppROC72eOoP60pdyF1a1GwutIp0XJun
	 QhmRWGJjkX7a0NYQQL8DLh+Ia5f5+X8L8ctO9WaZ8uIG215wxpE27CvYw4EilCUN3L
	 E9H+xcKGmq32P79671o0+eXHdOm3vVIi5pIenMcYURyq0Q4soYwq5Hjuw43lRjz0Rw
	 EjR3S5UQr9grqDMROnI3/eegu7gSW3xG5eqL1XGUnbbAyOYK6wOdiUfCEhCcdaybKt
	 IDqTL3GZe4+rY7rbVlbXEJ3VTQenQ12EPtMjRjav90PSAkruylijxR3Epy0W2AxU3H
	 tV+SWwIVLeu7g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
Message-Id: <170595625937.145475.18065779265515755326.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 20:44:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 74UMQEQOX5ZMAMGOPZ2STXXBYTYDL7SX
X-Message-ID-Hash: 74UMQEQOX5ZMAMGOPZ2STXXBYTYDL7SX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74UMQEQOX5ZMAMGOPZ2STXXBYTYDL7SX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 Jan 2024 14:43:28 +0900, Chancel Liu wrote:
> Support SAI and MICFIL on i.MX95 platform
> 
> changes in v2
> - Remove unnecessary "item" in fsl,micfil.yaml
> - Don't change alphabetical order in fsl,sai.yaml
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
>   ASoC: fsl_sai: Add support for i.MX95 platform
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
>     platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
      commit: 52523f70fdf9b2cb0bfd1999eba4aa3a30b04fa6
[2/3] ASoC: fsl_sai: Add support for i.MX95 platform
      commit: 2f2d78e2c29347a96268f6f34092538b307ed056
[3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95 platform
      commit: 20d2719937cf439602566a8f041d3208274abc01

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

