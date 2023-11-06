Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC57E22CA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 14:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618C2A4E;
	Mon,  6 Nov 2023 14:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618C2A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699275934;
	bh=owObuKCcgXmEq70pl4Bog7WiL0JeLtAQhOmCUT7KEHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aZpOd0WY30Ebjtz6a+cPZ3IaSUKa16ijN5eba2us7NnyYyyVCvrDuNCt3VK5EPyge
	 PfWtsOPP6dBH8bI+R6GOS0WeOz7DOSN18jSrvTKwVrdAqkQgVDQOvX+JABUiIG+Ab/
	 MRVxsXew7ANSBEId0/GAdEbla9Qw/txdAF/u06o4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E102F80580; Mon,  6 Nov 2023 14:03:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB607F80578;
	Mon,  6 Nov 2023 14:03:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B7FFF80169; Mon,  6 Nov 2023 14:03:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8201F80169
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 14:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8201F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MCGPBk8R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2848ACE0B29;
	Mon,  6 Nov 2023 13:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFBFC433C8;
	Mon,  6 Nov 2023 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699275814;
	bh=owObuKCcgXmEq70pl4Bog7WiL0JeLtAQhOmCUT7KEHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MCGPBk8R+dedAi85lfupC3BaR0+vHAP+hU9XzYPIkTiGwtDlQZTR/Ne4yrrnKwSUa
	 YxfJJFbnP75dAcFNCkcgWQYdC7QCtEbVRiuPsmLq5hFUAyyqPwOrT5bCUmWrxFiAwS
	 2+BeTT/ORjK8iBij1MEzDgT4xhJeOimzXWvfwwqwRxoute9VYK0rIEttvfvmBmMa7h
	 qgYP4tp5seMFNTSMfvWd3w0UmpUfPtw78Jfq9/4VSbul4eHwMB8EaU8IkUazYck7pD
	 LCxKRWFc/BYAQp9aB2F+uNOrC6lWzakoYEjsAEyJcrDM5yd1TR1F28oEBRtH/ivV3L
	 NgMxkmkYv7KuQ==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231106104013.704356-1-jbrunet@baylibre.com>
References: <20231106104013.704356-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
Message-Id: <169927581290.3037292.1560531691981321378.b4-ty@kernel.org>
Date: Mon, 06 Nov 2023 13:03:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JDSUCGHWDIWQ3FC47ZPUHBEHS4CRPTAQ
X-Message-ID-Hash: JDSUCGHWDIWQ3FC47ZPUHBEHS4CRPTAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDSUCGHWDIWQ3FC47ZPUHBEHS4CRPTAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Nov 2023 11:40:11 +0100, Jerome Brunet wrote:
> The HDMI hotplug callback to the hdmi-codec is currently registered when
> jack is set.
> 
> The hotplug not only serves to report the ASoC jack state but also to get
> the ELD. It should be registered when the component probes instead, so it
> does not depend on the card driver registering a jack for the HDMI to
> properly report the ELD.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: register hpd callback on component probe
      commit: 15be353d55f9e12e34f9a819f51eb41fdef5eda8

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

