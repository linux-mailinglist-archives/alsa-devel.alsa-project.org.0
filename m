Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3826FBF67
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B1B1151;
	Tue,  9 May 2023 08:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B1B1151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614451;
	bh=5qWLa6CWjjjsCeBM3UJ2nY7uwlPNtQ93pmOVp0ZbX4c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HR2fGTpspmptzE4r41aI7Gwbz7g3YvTaJxqTP669ND29HnRlyM2rMmonmbySciYfA
	 VCr4KqPapVGRPfS4tQCymjaqr9aXmBtIl0LFQzMxWrkGtUDWYSuLzCz2/qCvuhPgf7
	 TyJK9lmdfBEXMP1cOS3QC3j/hDmRGWkw17kR5xqE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE4BF80534;
	Tue,  9 May 2023 08:39:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A34FFF80549; Tue,  9 May 2023 08:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8B35F80534
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B35F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SzwPwe1q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8EF161011;
	Tue,  9 May 2023 06:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F92CC433EF;
	Tue,  9 May 2023 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614332;
	bh=5qWLa6CWjjjsCeBM3UJ2nY7uwlPNtQ93pmOVp0ZbX4c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SzwPwe1qcAbipOpmCte6/VE8rNsE8VnJhMbfS9uMyH5J9y4y5J7l7HNbCr0pTgsLw
	 zhH7ffANAOD9Opco+cPYl2Q9nigpqg+tvjHsOeZK7/ukw0I8cKiGalwJOA6WGQcI+G
	 6Dv7gnwqD3zbbpL+oMLkfZNLf6CvkIiB2e3v5G2SuUDY+rWd/1BuBW2m/dWjT+o/Ui
	 oWyanyN6r0ryyJdtOKVkqHFfrU9nztyoWCcolsXELR2de1U7KKzaQjN4Zltm7wm3wQ
	 f2UBEZ0hhcP5jdEGHT76Z/oi1d03h5Wgn6mHqypyHC5jYtx3ciXrkiQNrHgX1oKUIM
	 bvgnF81NP4Byg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1683273322-2525-1-git-send-email-shengjiu.wang@nxp.com>
References: <1683273322-2525-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: MCLK bind with TX/RX enable bit
Message-Id: <168361432593.303059.2652847583267849734.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 3V44H3YEGEHFIAYGACF6YTRZQTZV6BBS
X-Message-ID-Hash: 3V44H3YEGEHFIAYGACF6YTRZQTZV6BBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3V44H3YEGEHFIAYGACF6YTRZQTZV6BBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 15:55:22 +0800, Shengjiu Wang wrote:
> On i.MX8MP, the sai MCLK is bound with TX/RX enable bit,
> which means the TX/RE enable bit need to be enabled then
> MCLK can be output on PAD.
> 
> Some codec (for example: WM8962) needs the MCLK output
> earlier, otherwise there will be issue for codec
> configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: MCLK bind with TX/RX enable bit
      commit: 3e4a826129980fed0e3e746a7822f2f204dfc24a

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

