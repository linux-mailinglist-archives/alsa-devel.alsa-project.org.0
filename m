Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CE7FC081
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:48:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01FD2A4E;
	Tue, 28 Nov 2023 18:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01FD2A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701193682;
	bh=Jo9EsDSCjneP8yPCQ8BXu+v6U8MY3xlaH22NdamxrzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FMRQ2F0Eg3xxCTw/sv7KLem0vxfVfmT6y7mN+MyGf2hG7hzUJvwZ8V0GW6jtD8bc1
	 c9jXnt3hkGqSfMXqKsPMtCmFqbDs8GF/uwdFq4sSrKyiM0DMJi85ocFrL1CvzT1ZMp
	 5Qk9Ep9Gn+94FcT7+bnGgEoE0ibfyfZ+5fLgnvT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 172DCF8057E; Tue, 28 Nov 2023 18:47:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40626F80571;
	Tue, 28 Nov 2023 18:47:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 324C9F80236; Tue, 28 Nov 2023 18:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B88AAF80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88AAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HB5kI84I
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D988061839;
	Tue, 28 Nov 2023 17:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6A0C433C8;
	Tue, 28 Nov 2023 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701193643;
	bh=Jo9EsDSCjneP8yPCQ8BXu+v6U8MY3xlaH22NdamxrzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HB5kI84IPnE+DSGWv9yip2CYEcz2LQOmgZGX9TiUiq77lyWNAB0kaWjP6i4KUQStU
	 BSRVgx+hg2VINsSuD4mojZtctMfv3MUMm3sYk0nnT/GEA1eWOmduL2SXWP/tAXliFE
	 PXwpyG48SovgsUSKFWO3n7PKGMYmeZ46pmcBJ02+0MbTNh4CTkdiorA+9+8LUdhPsm
	 5v+eFzPRi1nAhX0tmL/bhj6ujlzQOdaMEPaS1AyXM6uAwPqbIqunmNoUesUOT/1Qeh
	 a1LE3JYaC6p2LmqwNeBFNPuL1wM1BsuIvWReX4pXDY9me8dlp2KJLKq51urMNNFAD8
	 2z7b2/uIpeJpQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Tim Crawford <tcrawford@system76.com>
Cc: productdev@system76.com, Jeremy Soller <jeremy@system76.com>
In-Reply-To: <20231127184237.32077-2-tcrawford@system76.com>
References: <20231127184237.32077-2-tcrawford@system76.com>
Subject: Re: [RESEND] ASoC: amd: yc: Add DMI entry to support System76
 Pangolin 13
Message-Id: <170119364236.61148.8501011233065061682.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 17:47:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: SGKLWTB2SXX6EEZWXUYCDZN245KJHJ3B
X-Message-ID-Hash: SGKLWTB2SXX6EEZWXUYCDZN245KJHJ3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGKLWTB2SXX6EEZWXUYCDZN245KJHJ3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 11:42:38 -0700, Tim Crawford wrote:
> Add pang13 quirk to enable the internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
      commit: f7d292b6d3f739cded858d1dd3e809dcef678857

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

