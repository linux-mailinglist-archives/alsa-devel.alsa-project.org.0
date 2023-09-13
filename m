Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97C79F09F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F24886;
	Wed, 13 Sep 2023 19:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F24886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694627385;
	bh=C69XA7WhlnFGCOFGMTb5QDKicj6hLtK+9Kr20IL8P4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LI04QJb/b9INyJV7PYjpuXj0OpWqQoaT5Pa6/o8EPTpfDCInXrUXBAcr/dzY+7xs2
	 NV72QAYeANlII+8+310yC6NVDFqiCPsbJkfEd3YGdBqJlHnOSq+n874Zy9rDKtZEcu
	 MRfj05G566x7TAUbjfd9h/vtcWyTHCaekzSzFxFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64B17F80549; Wed, 13 Sep 2023 19:48:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19EA5F80246;
	Wed, 13 Sep 2023 19:48:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 467A0F801F5; Wed, 13 Sep 2023 19:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D47F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D47F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JUEWMTyA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9AAF1CE2382;
	Wed, 13 Sep 2023 17:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAABC433C9;
	Wed, 13 Sep 2023 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694627202;
	bh=C69XA7WhlnFGCOFGMTb5QDKicj6hLtK+9Kr20IL8P4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JUEWMTyAew0CYabud9NhLZvJlGPjv1y/e2NNN95RAQicKEpm6NXCVijFlNqp/Ab0Q
	 gsh+0ltas9250WlXXupFNGTQghBTWk+fNRtKklquF6b+MVyAwaNxqoKgcsO0i6RxN9
	 FltuYHu3jK6IV9ebTncvGo7deftNOWM+bIvLetqPsYGJ6qqq8dC9KiJBeLisAlf18j
	 4iKOjE2GxpJepr6iNgoIkTSxHi1eKjAAidGIx0Z9pYOrAuvfkhIv1eb3DiaiADHff+
	 /aUMY0w3S7gJX31TRd8d10Jfwag9pnI9xNBj52ki2ZuarAYfsoPxISpY35/3PlI6H4
	 hvrtn+Ynv/RQQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, perex@perex.cz, arnd@arndb.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org
In-Reply-To: <20230913091325.16877-1-peter.ujfalusi@linux.intel.com>
References: <20230913091325.16877-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hdmi: Remove temporary string use in
 create_fill_jack_kcontrols
Message-Id: <169462719996.54382.1348437312266956494.b4-ty@kernel.org>
Date: Wed, 13 Sep 2023 18:46:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: CNQX7MCK4VVSCASBV66WJPSRGIY2BRVM
X-Message-ID-Hash: CNQX7MCK4VVSCASBV66WJPSRGIY2BRVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNQX7MCK4VVSCASBV66WJPSRGIY2BRVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 12:13:25 +0300, Peter Ujfalusi wrote:
> There is no need to use temporary strings to construct the kcontrol names,
> devm_kasprintf can be used to replace the snprintf + devm_kstrdup pairs.
> 
> This change will also fixes the following compiler warning/error (W=1):
> 
> sound/soc/codecs/hdac_hdmi.c: In function ‘hdac_hdmi_jack_port_init’:
> sound/soc/codecs/hdac_hdmi.c:1793:63: error: ‘ Switch’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
>  1793 |                         snprintf(kc_name, sizeof(kc_name), "%s Switch", xname);
>       |                                                               ^~~~~~~
> In function ‘create_fill_jack_kcontrols’,
>     inlined from ‘hdac_hdmi_jack_port_init’ at sound/soc/codecs/hdac_hdmi.c:1871:8:
> sound/soc/codecs/hdac_hdmi.c:1793:25: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
>  1793 |                         snprintf(kc_name, sizeof(kc_name), "%s Switch", xname);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: Remove temporary string use in create_fill_jack_kcontrols
      commit: 67a810b6f37a7805474add2d003034a288b94fa4

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

