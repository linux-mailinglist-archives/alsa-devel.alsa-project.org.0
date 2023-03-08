Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B61336B0EAC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9671836;
	Wed,  8 Mar 2023 17:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9671836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678292820;
	bh=aHFxHOJzkcRsKiUn0iY0FhjezjCTiE5nq1HBxVyU+lo=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TsIQ9HMqvcKcDzBuXOeZCh3hUC+zjU/eVefPCsatsKBIT2kujeyt4c3DSm3oVFYQp
	 Khgl72TV12w/SB7KxYHdk8r/9TlOi3MCygeap6Q51DaFqWqN5RnXabLD0Zmj/7V0QF
	 N/6Y4j4IuyrH6kuggcUo4TypuPBdPlXR/1ODBiAA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F31AF80236;
	Wed,  8 Mar 2023 17:26:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A039CF80431; Wed,  8 Mar 2023 17:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F85FF8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 17:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F85FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ITv5QCcb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CAF93B81D7E;
	Wed,  8 Mar 2023 16:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41BCC433D2;
	Wed,  8 Mar 2023 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678292750;
	bh=aHFxHOJzkcRsKiUn0iY0FhjezjCTiE5nq1HBxVyU+lo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ITv5QCcbfQak/XrMcQYuH4gRxBDi+z6aQx7iy9v01AekCBqM6rJ+6UXbZyBKSxIIS
	 IyszoklU51wWM+Bok+FjZrQPHhjNKBHWJX5rNd0U8Jp7RiMDyjU38PdylbdFS38YvN
	 0v5FTDJNTuWCTjJaRo0c96bSRgVTWgMxqihd2meQVmFcj42d9eoSOXtz+sXNpft+QB
	 wIvF86H0TxyEEwQ83oVD88s9YsrjJyZXxMEFaC0By2+WZquDDFpYCSpwpeQx8TWaOC
	 YkWgVbwEWl0KGsIuzVD9il+48P7QORRteTUDTd0uEKBdYtGOrHr05TBVV64d99n9p0
	 jANfwQDSwGq3Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
In-Reply-To: <20230308125503.3917903-1-emas@bang-olufsen.dk>
References: <20230308125503.3917903-1-emas@bang-olufsen.dk>
Subject: Re: [PATCH RFC] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Message-Id: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 16:25:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: F65HLRSIUP35B2FQR3GZK7KBVITR3MBL
X-Message-ID-Hash: F65HLRSIUP35B2FQR3GZK7KBVITR3MBL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 linux-patches@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F65HLRSIUP35B2FQR3GZK7KBVITR3MBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Mar 2023 12:56:12 +0000, Emil Abildgaard Svendsen wrote:
> Currently only one stream is supported. This isn't usally a problem
> until you have a multi codec audio card. Because the audio card will run
> startup and shutdown on both capture and playback streams. So if your
> hdmi-codec only support either playback or capture. Then ALSA can't open
> for playback and capture.
> 
> This patch will ignore if startup and shutdown are called with a non
> supported stream. Thus, allowing an audio card like this:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: only startup/shutdown on supported streams
      commit: e329f27a234cf64d8068029fe5e3112c3d86744e

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

