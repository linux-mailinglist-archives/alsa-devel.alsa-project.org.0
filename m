Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923E77D347
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA60BE7E;
	Tue, 15 Aug 2023 21:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA60BE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127238;
	bh=XyQKCBCEqFhZRGQy+OURocnnnDKkB2ubMUqg+Nmjvtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DIAUubri31xyLfgseKKN5jIKlxmuhfNc8j9XsEH+CKeSH5M7Fnl5lmbfzWf0xZe8e
	 gadDj4NrzjGbY/F/oOi5IdeyI5ygPw3j+V6QXEhWr3DYIW5UHqEKqXJIDth8sTtv2y
	 NBa+7FHX30a6KWV7b/n3d7GM1ASq7NY2+kE8e738=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD318F805BB; Tue, 15 Aug 2023 21:18:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6959DF805BB;
	Tue, 15 Aug 2023 21:18:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1920FF80564; Tue, 15 Aug 2023 21:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE1ECF80536
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE1ECF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o34kBNVv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 094A566073;
	Tue, 15 Aug 2023 19:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9538AC433C9;
	Tue, 15 Aug 2023 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692127073;
	bh=XyQKCBCEqFhZRGQy+OURocnnnDKkB2ubMUqg+Nmjvtg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o34kBNVvtjaVyC+NfENPtdbsaXhdRTI8y9dH8SN17cpZ1VU65nyiRMvNo2T9vQ7Bl
	 SyIwchTMY4n7/9kqeybiirj0Oh1XLUzIr4K0kEOCo5IQBnxKa1YHGK106AvKlqe7qw
	 a6U7FbSfImQPpvL68XV/jl5Pt6zFylQWBdUBYr3YdVI0eqOrACKRbjkYZTQ7ImqsKW
	 xYon4K8JtrFHdWrXSyoFRMzmuZ6mfEKUlrSRD05v1vHA6R6knrwR4NxdT+fGFHZxXh
	 IwApc5MJHDyju8VoGwxNw4Y/lL+SWwlt2xt4cPGKArg1oDw7rl5C6T13pti1EJb2xx
	 RN9lfDwB/B4yw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230815124826.5447-1-rf@opensource.cirrus.com>
References: <20230815124826.5447-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Don't patch firmware that is
 already patched
Message-Id: <169212707233.68178.18277945930655781707.b4-ty@kernel.org>
Date: Tue, 15 Aug 2023 20:17:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: GKBPLVENPYJZ4H6KGBJGVQWSE3WHZB4P
X-Message-ID-Hash: GKBPLVENPYJZ4H6KGBJGVQWSE3WHZB4P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKBPLVENPYJZ4H6KGBJGVQWSE3WHZB4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 13:48:24 +0100, Richard Fitzgerald wrote:
> Use the FIRMWARE_MISSING flag in the CS35L56 to determine whether it is
> safe to download a firmware patch.
> 
> Richard Fitzgerald (2):
>   ASoC: wm_adsp: Support powering-up DSP without trying to load firmware
>   ASoC: cs35l56: Don't overwrite a patched firmware
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm_adsp: Support powering-up DSP without trying to load firmware
      commit: 62ddad4238a0250aa9cedade127c39aac9d26d45
[2/2] ASoC: cs35l56: Don't overwrite a patched firmware
      commit: 67bd793ba5e0984ecb7ee4407c2f79d159e305ff

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

