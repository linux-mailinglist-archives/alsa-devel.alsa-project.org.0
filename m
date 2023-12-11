Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545EC80DA85
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 20:04:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260CE112;
	Mon, 11 Dec 2023 20:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260CE112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702321470;
	bh=yWThp71BPUxv4/KM7FUZO9Ix5YZfhhJSOKJIqpWflWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBvxPQW9xMNbXODDmkdR48VMMeVocRJhJgp3C8UXxPPZHxHC/T5+sngt/3iAYgN+q
	 jm5M8ZFLXf3bn6SU7xYWSGZHQhlEPHF4B8iw408j6xAkgnz8SMD0SOmlpBRxbYPfmN
	 Xzkb3r4IUzbkZD5EMDdOZzhAFgAKbwU/2A78tIOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28EDEF8056F; Mon, 11 Dec 2023 20:03:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB05F80578;
	Mon, 11 Dec 2023 20:03:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA209F8016E; Mon, 11 Dec 2023 20:03:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F882F8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 20:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F882F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I80xyihP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 663F7B81015;
	Mon, 11 Dec 2023 19:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A17C433D9;
	Mon, 11 Dec 2023 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702321428;
	bh=yWThp71BPUxv4/KM7FUZO9Ix5YZfhhJSOKJIqpWflWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I80xyihPgIMqLZmWx2BnpqcTeeXB+Cy4P6BrjX0yfeAXpVK0Hh6je/ke4PGAJP3n5
	 oZdu58WMnhSZ05nbgw/I5vFe5QhjxcRUwVkJokZaw5a9optQmkv/b+fgaUimIGfWPe
	 OvycWmswcZI2+xdAk3w3n4VH4oTTU6OlUkJ6hrqvQsc5rLX18Eew5f1fxdwbSstAEk
	 q9tMNbIOJK5gxVFmYjt/GuRGp0XyTLBFGk26hxCIIQznl7YQH7w0t8NDWGxdB13pOc
	 pQEImgMubtAtBpqBTJFXyRsqB6sYQn60ZMfSLkFS9C5a0q705tFmxj16GTLY//U29u
	 I7k0/aDrWFjyw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com,
 ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231205115715.2460386-1-rf@opensource.cirrus.com>
References: <20231205115715.2460386-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-mtl-match: Change CS35L56
 prefixes to AMPn
Message-Id: <170232142629.117554.17625573039640052470.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 19:03:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: PWYJRGNRKU2UKA4LW5SGYQBD2YPDSLR7
X-Message-ID-Hash: PWYJRGNRKU2UKA4LW5SGYQBD2YPDSLR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWYJRGNRKU2UKA4LW5SGYQBD2YPDSLR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Dec 2023 11:57:15 +0000, Richard Fitzgerald wrote:
> Change the ALSA prefix for the CS35L56 to "AMPn".
> 
> This keeps them consistent with the CS35L56 HDA driver. It also
> avoids coding the chip ID into the control name, so that other
> Cirrus amps with the same controls can have the same control
> names.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-mtl-match: Change CS35L56 prefixes to AMPn
      commit: 02a914ed475dd928c7b2b6c9d1da9b0b27fa724d

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

