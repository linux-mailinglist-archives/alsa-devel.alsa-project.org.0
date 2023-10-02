Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD07B562F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06FD1E0E;
	Mon,  2 Oct 2023 17:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06FD1E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259968;
	bh=hF16LqSa4Syn4jn5dAWKbpzCRm2q1LVCGwoK56BnfY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WcCs+C3eQJfubBU/6eyLTwtee/ydGQwod3qZL51oOijLH33jtiAT2PdK2rIFbAe5Z
	 nPtkgiO+rq04r8NFs/x0Sz1QRygw5/HSLa1XlnR8B8pG5QV1y92RAsBu79g4ubbQDs
	 gq5xSLmTxlKHgD8sdGe5D6c80kOxe0xWG2DiUemo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9587CF805AB; Mon,  2 Oct 2023 17:17:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23725F80563;
	Mon,  2 Oct 2023 17:17:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 793DBF8057A; Mon,  2 Oct 2023 17:17:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FB3FF80568
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB3FF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=chvy6+gE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 94AFEB81181;
	Mon,  2 Oct 2023 15:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6901C433C8;
	Mon,  2 Oct 2023 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259850;
	bh=hF16LqSa4Syn4jn5dAWKbpzCRm2q1LVCGwoK56BnfY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=chvy6+gEVKMrMyTwo76gNnMqZNgcqeIh0iCT+slnWvKswqcF2RysWxQb0BQlS06dr
	 QVmasCtcr3hB+/LZ5OIXgt4k2tU3+/RsOUpEJsCKMXvU3t/BWJcdd9XBI4/1ZKeFmQ
	 1/FHkTlRsVFpuNYehLzlvpqT6f+5IrQjVDMFzKlakeDBZXnHWuia392P4RaI9QdS/O
	 3NIVUUDkY7aInCuLN1xAdp/qsGyapkLzIG6sZ7w3shP7pQn4MWFP0nnEKw21aptPfm
	 armmcBXB8HwZqMBOsYJAkZ2NsV2piwnHngfTEJtWrGjYcBMgHTxBpWyz3obqfyM12g
	 pHc6Srxhp+Kow==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, Zhang Shurong <zhang_shurong@foxmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_4F37C9B5315B7960041E8E0ADDA869128F08@qq.com>
References: <tencent_4F37C9B5315B7960041E8E0ADDA869128F08@qq.com>
Subject: Re: [PATCH] ASoC: rt5682: Fix regulator enable/disable sequence
Message-Id: <169625984853.65718.1048649527672207151.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 16:17:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GISB42NQUCUN3KHOXGK4FXVV3YYIR2XQ
X-Message-ID-Hash: GISB42NQUCUN3KHOXGK4FXVV3YYIR2XQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GISB42NQUCUN3KHOXGK4FXVV3YYIR2XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 30 Sep 2023 17:55:50 +0800, Zhang Shurong wrote:
> This will attempt to disable the regulators if the initial enable fails
> which is a bug.
> 
> Fix this bug by modifying the code to the correct sequence.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Fix regulator enable/disable sequence
      commit: 892fbdb203945d887ad2a109a3700b091a8e3b97

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

