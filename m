Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3826D9BAD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95960EEB;
	Thu,  6 Apr 2023 17:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95960EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680793528;
	bh=GtLftkpEi/qKGhs+BerPf/zyoGW6Q7axIKhNYx47xGg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bLsdNG8dou3MLl1KN30t5DZ3FC4MWJXTDGcSQ1InqkSix0d1+eKoEHAv7QYkH+0lv
	 3UrY471U9Y/dvlsCViD6hvcuPPLwRC5kocvFyn2p/LKOdxGGasuMi0Dgvr0l4DMErw
	 CCZ9vCcFGEW4Sl9Mq/tCbjChD6zNpstfoNW67UOI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B07F8051F;
	Thu,  6 Apr 2023 17:03:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA49CF80246; Thu,  6 Apr 2023 17:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDC87F80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC87F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uzSdRsWm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 527C062B71;
	Thu,  6 Apr 2023 15:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14862C4339B;
	Thu,  6 Apr 2023 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680793418;
	bh=GtLftkpEi/qKGhs+BerPf/zyoGW6Q7axIKhNYx47xGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uzSdRsWmwiqxw90Yw83aDk2AdlqbAwjyB0Dys9Y/2R5XcpVYLATzxYnVTa0jirAoz
	 LTF/vS1J3l3TULj+K0mi9mn7qtX/7ej0yQL5iwNcUPjazZYOMiTX10i11hKEuLPGsT
	 /1OuUaD6VWi5yxQX0f02bk46GUTRs37DK/Hg691kL3DrY8mppgPK8BhbS3Ccl3/73a
	 bwExKzN4wH0h9TheVQM9uChFWhivaeaeREkr9uoAsQcv7+46hEBnTduGknGNnLwo3E
	 OHF4TYbbjq63LalQjZPZ5kNw3UnJjiS9jR9E5oZ4m9pTPLlcmRykLT5iAVsSJeyIXx
	 l511BVWglh2dg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cuqvswc.wl-kuninori.morimoto.gx@renesas.com>
References: <877cuqvswc.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
Message-Id: <168079341780.66286.16252350598256964192.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 16:03:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: AOEOLOQTC4G4PFWE5WGDFT3Z3ZJNRN6E
X-Message-ID-Hash: AOEOLOQTC4G4PFWE5WGDFT3Z3ZJNRN6E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 =?utf-8?q?P=C3=A9ter_Uj_falusi?= <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOEOLOQTC4G4PFWE5WGDFT3Z3ZJNRN6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Apr 2023 22:57:55 +0000, Kuninori Morimoto wrote:
> dapm_connect_dai_pair() handles
> "Normal/Codec2Codec" x "CPU/Codec" x "Playback/Capture".
> 
> (A) is "Codec2Codec" case of "CPU"   widget x "Playback/Capture",
> (B) is "Normal"      case of "CPU"   widget x "Playback/Capture",
> (C) is each          case of "Codec" widget.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
      commit: 3456aeb02a28e82235d45da434752e6f441427f0

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

