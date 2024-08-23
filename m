Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E895D96E
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2024 01:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 150BE950;
	Sat, 24 Aug 2024 01:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 150BE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724454025;
	bh=W/CDtPs4vrEPcGRTjULwaMcukxhP03HdOs/6BCsQpoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XZPBns/bjgfx4MwCaalaT0jWzNsd9VMTKCBRUqX3P6qowBPhAtF+xWdxwx7dkJTAS
	 HBh9ow6btFGkWetJRritGPSJd7qlUJGJkvy76UxSHBpufAkokvfaQCZoXNWM3ec2/k
	 yS3IhPnNt2xUtTVDNRtv4TKO5t4e+SL+KAhjlAAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D3E2F805C8; Sat, 24 Aug 2024 00:59:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 817CAF805D7;
	Sat, 24 Aug 2024 00:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F0AF80496; Sat, 24 Aug 2024 00:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12F49F80107
	for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2024 00:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F49F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KXvNhq2a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 060F4CE1277;
	Fri, 23 Aug 2024 22:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60154C4AF0C;
	Fri, 23 Aug 2024 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724453829;
	bh=W/CDtPs4vrEPcGRTjULwaMcukxhP03HdOs/6BCsQpoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KXvNhq2aL2PwMIpKJAGFk+z6TOJGfl9HQt/+S/agmM6EWrG5FhLzfmCl3CFZi7G7V
	 iZnTQOCNUYsSD2TYcekZyU23Goy7UcdN+quYqdJHjVdVmZb7PPDit0S0CIqXC8nVpo
	 KnLCVq7R/ECVYAdDsH7wW3akvOsTgaMlmd3rrn45R9XZ4dqopm6Q9Qe7tVhGQt2oZx
	 Q21eBaUzbVPmc1A1fi2HDQQhEGGvsr5FByB3KQQE2iLgvtpoxP+GpxuMSAWG4Wuj7R
	 NYEQJHRKjZn5kCIXYVAP28ZNt1DiAX2IilZkDPlWJeNhE/DwY685jX4DC+S20olUe8
	 trzXu+35VmY/A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240823074305.16873-1-hdegoede@redhat.com>
References: <20240823074305.16873-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F
 DMI match less strict
Message-Id: <172445382681.842154.8004186993571993560.b4-ty@kernel.org>
Date: Fri, 23 Aug 2024 23:57:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 4UYLSYJBYIW2TTCAIC2SIG4N7B2KDWGB
X-Message-ID-Hash: 4UYLSYJBYIW2TTCAIC2SIG4N7B2KDWGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UYLSYJBYIW2TTCAIC2SIG4N7B2KDWGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Aug 2024 09:43:05 +0200, Hans de Goede wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
> 
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict
      commit: 839a4ec06f75cec8fec2cc5fc14e921d0c3f7369

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

