Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D149C8540E9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 01:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A5BE7D;
	Wed, 14 Feb 2024 01:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A5BE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707871799;
	bh=skhRkO7Uxedf6QXw1VE3CGUkjfOGv90B45ezzdW27i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G4qQTFmJTG1a+4Ya+DDIxEaQM4wmFCkvnw89b4LYfgicQDF5UQot62YaT9JLO3tCi
	 yggiPOCLTIPbltksN5N0T4Y9KvbjC+JsxQTKElRkAs4ZYAjEaGDgf4Ddu3HKjgRuxg
	 kdZ9DfLunulYc3W1kx+aK/0JhiSe+msaLJ29exm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C941FF8025A; Wed, 14 Feb 2024 01:49:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E18A2F805A0;
	Wed, 14 Feb 2024 01:49:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD437F8025A; Wed, 14 Feb 2024 01:49:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28795F80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 01:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28795F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KEsCu6C7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B2F461756;
	Wed, 14 Feb 2024 00:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5829CC433C7;
	Wed, 14 Feb 2024 00:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707871741;
	bh=skhRkO7Uxedf6QXw1VE3CGUkjfOGv90B45ezzdW27i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KEsCu6C7n5FsKmERkVh90tkAZ+hICu0JUarOA5kI2oFSV+HuPT81zP+bKzRmbNa+R
	 BCuX/grdeBd7VsZflmy4+6LUnk1L7ogUlFzMQOwRgWwsjN1YLsLkVToMjystqIZfEs
	 3naLHLd5T+6clrX0dBYOwWWt1B2mzsfVcvwkFJ7FySdhLnBcTnOy1NQW+uQ2DUqNcj
	 x1hDBaL4EMeWRKKJNDTaGW5ejmkEIH0mw89rWqdt3KTHq3DyiqSGl42UjGBoIBXcvE
	 /cbxGPm90ihDmyg6L/jDdqMMN+h8H/4bpM8Jml1fCShPcenEpq87npboI3my9kolk5
	 pNoC3d7jmE9Ng==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 neil.armstrong@linaro.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <20240203-topic-sm8x50-upstream-va-macro-npl-v2-1-f2db82ae3359@linaro.org>
References: 
 <20240203-topic-sm8x50-upstream-va-macro-npl-v2-1-f2db82ae3359@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: va-macro: add npl clk
Message-Id: <170787173909.1088332.13543091218086927386.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 00:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: PUAILG2BB62IIBOQ32TY4QJTKTR5NAU6
X-Message-ID-Hash: PUAILG2BB62IIBOQ32TY4QJTKTR5NAU6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUAILG2BB62IIBOQ32TY4QJTKTR5NAU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 03 Feb 2024 21:43:05 +0100, neil.armstrong@linaro.org wrote:
> New versions of VA Macro has soundwire integrated, so handle the soundwire npl
> clock correctly in the codec driver.
> 
> Introduce has_npl_clk and handle the sm8550 case separately because
> it has soundwire integrated but doesn't have an npl clock.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: va-macro: add npl clk
      commit: a6eb64e7e32c7a6a502a19c20e3f04818091c2dc

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

