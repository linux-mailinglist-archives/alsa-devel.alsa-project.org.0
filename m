Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6837D875D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 19:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9767DE5;
	Thu, 26 Oct 2023 19:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9767DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698340333;
	bh=pxnkdIlXjGbj0R9REeTamfZwwcR9rdS0B2bEwp165H4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tJBKgZ6JitmxbCvgKrw8HMwaDaqP8A2oCyhY9NcpzpagH4wT/ckOHJbI7qPjefZU/
	 MSvneEW6Y5cTschzapA3EDWMelLaDxkmtOmwV55UojYKaNjm4MhN0V5L5R5LeZXD36
	 7n7IyslgALD/2AUJNhlSMdPMNZH7qw4IfpsGg56o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E52CF80571; Thu, 26 Oct 2023 19:10:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD22F80578;
	Thu, 26 Oct 2023 19:10:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3CCF8019B; Thu, 26 Oct 2023 19:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 474F7F80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 19:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474F7F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J9OmEuaT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E9A2AB83461;
	Thu, 26 Oct 2023 17:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67392C433C8;
	Thu, 26 Oct 2023 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698340218;
	bh=pxnkdIlXjGbj0R9REeTamfZwwcR9rdS0B2bEwp165H4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J9OmEuaTEt2edm5kYh6st4RPPgw+qSTWLz3Kx0Xsd90Ab/YIDsUnNr6jC/CTfJKKB
	 Gsewp9IB5N47fxa8NgZ3F3+HdSMUE3oFImmZcs2dpw1qUC/Yc3HGc/a5vr8+3kZpRe
	 twjcFIetZwkTsV9L01auQZ6EaVr3uRhFvTBGm1rbSlUj3PMFc+W12MBwzHUM1RCnDh
	 +QOkKgigHCTXkX7wC2tLiaQkCvoovIh4R/+puSdqKe+0yUtfa2pXBgB1lzbsPl4wo3
	 g4oegqH5gtR9dM1ujqjspDNf3tyBZOkDH44I9lRtkK4gtTn734jaaT4qlpX8Yoj8jF
	 Ya6vfwg+nhu4A==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nikita Travkin <nikita@trvn.ru>
Cc: jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
Subject: Re: [PATCH 0/2] sc7180: Add qdsp baked soundcard
Message-Id: <169834021081.149939.3520512411729712585.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 18:10:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JHRFXZPP5J6X7EQU5QOA23L4PYPTFIAM
X-Message-ID-Hash: JHRFXZPP5J6X7EQU5QOA23L4PYPTFIAM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHRFXZPP5J6X7EQU5QOA23L4PYPTFIAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 20:33:45 +0500, Nikita Travkin wrote:
> Some devices, such as Acer Aspire 1, can't use lpass dirrectly, but
> instead must use adsp core to play sound. Since otherwise the hardware
> is, usually, very similar across the devices on the same platform, it
> makes sense to reuse the same boardfile.
> 
> This series refactors the sc7180.c slightly and adds the functions to
> control clocks via adsp instead of controlling the hardware directly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add sc7180-qdsp6-sndcard
      commit: 5443d186163c6ab0084a5b23c901e0f9ba792463
[2/2] ASoC: qcom: sc7180: Add support for qdsp6 baked sound
      commit: 4531f512e3ef147f07d47bceb256c0af5ab130b7

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

