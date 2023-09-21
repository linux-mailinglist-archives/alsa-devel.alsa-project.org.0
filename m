Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C52807A95C0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C622E88;
	Thu, 21 Sep 2023 18:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C622E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313981;
	bh=q347k/pyc8NmfMJuquk5xxZvVF94p+jePeMVtuzGJuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VLnxsSDGKRQ2AFsHwYGcwjryYhvBYMYoZbdLQTncGGrXOP9aQVM8xMQv1ZNU22KeL
	 lZ1G8SzmUfkgBGqeDlv9JjrLAopH9V2L7kZhebqNKnfSRuPericRD/p46NbBZjzawz
	 z4Bx4gu9Q+5JU2pVP9aTwnZLwQd80l5debo4Y/3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CD0F805E3; Thu, 21 Sep 2023 18:30:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD35F805D7;
	Thu, 21 Sep 2023 18:30:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1094F80558; Thu, 21 Sep 2023 18:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D982F8057F
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D982F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R31+SoLZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 44E1FCE228C;
	Thu, 21 Sep 2023 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0165C611A3;
	Thu, 21 Sep 2023 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313818;
	bh=q347k/pyc8NmfMJuquk5xxZvVF94p+jePeMVtuzGJuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R31+SoLZXBxF0386VaQhXrBMqA3w3uu+2XjAFw15RAN1k789Y399JVwONJqOH8l3f
	 RhFY1yur5fVXcIIH70rJY7ukh1B2NLZAI6uFteQvgNRZmOSEZQjgcaz8AsPiz2PUun
	 Q0Jfc1qe5GejwNaEMZKBmQa1ZZW6RJMXityZq5HZvvIsBnCbRfH6ErxM/tQPSoUqu2
	 LHvXfhFkFmXp2iNUsgSPHiphFGedBairZDeLmZVkOloAyfL5kYNpIXxiBr07LGvKcI
	 l888QhupJkFuav/pi+C8rjGUw+ICz73YttNTioL92Vjo+JF3hzP3ADfVmsjm7YGjUG
	 XxUH1Voh9NCLA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20230919091136.1922253-1-yung-chuan.liao@linux.intel.com>
References: <20230919091136.1922253-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi: Adding Es83x6 codec entry
 and HDMI-in capture support in MTL match table
Message-Id: <169531381647.61074.5518980519586307796.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: BUFK6XBFOM3ZPQFJ4EMGJK6TJAU4E7YM
X-Message-ID-Hash: BUFK6XBFOM3ZPQFJ4EMGJK6TJAU4E7YM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUFK6XBFOM3ZPQFJ4EMGJK6TJAU4E7YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 17:11:34 +0800, Bard Liao wrote:
> Adding Es83x6 codec entry and HDMI-in capture support in MTL match table.
> 
> Balamurugan C (2):
>   ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
>   ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL
>     match table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
      commit: 381ddcd5875e496f2eae06bb65853271b7150fee
[2/2] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL match table
      commit: d1f67278d4b2de3bf544ea9bcd9f64d03584df87

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

