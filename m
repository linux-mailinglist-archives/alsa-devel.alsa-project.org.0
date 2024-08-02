Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876B9465F5
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 00:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C779D4743;
	Sat,  3 Aug 2024 00:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C779D4743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722638713;
	bh=/eVmcksdoa4kQw5S2+wVUPx1PaMX3q1iFd1MtgTYtXM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DR/Xz1B50A1/zJt8asCg0B/WXEfSDd9RJR0SmKe9j1DiIS9RYunPbJv8xgcgMuF4a
	 9dlQtKFJq/pnnOPhKclwfTo673+5VzlYJyX94cHEc5MvBy1zkc+SAyJvnFxJF2uyCZ
	 AdWB1oZ7qfdaduXV+d7gwr9VCT8N4xxmasyN/QCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF85CF805A1; Sat,  3 Aug 2024 00:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6B4F805AD;
	Sat,  3 Aug 2024 00:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951A6F800E3; Sat,  3 Aug 2024 00:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 718F3F800E3
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 00:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 718F3F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ojgRO6N5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65BA262B62;
	Fri,  2 Aug 2024 22:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D828EC32782;
	Fri,  2 Aug 2024 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722637341;
	bh=/eVmcksdoa4kQw5S2+wVUPx1PaMX3q1iFd1MtgTYtXM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ojgRO6N5BMItB/nYMai2Kn/KR9U06/FwsCs738VezxjlaQnVp5KZ1XJVsXt0fnSPS
	 +vS3mdb+fhV0K6kjiGEvbgF0hocL4ACGcSOAoeko3wMrfT4LAsofwiTqwMbe9l+MRi
	 uxczxvRrKnfUyW9ocPxkLrqKDIMdMh8SsTrgTYO7Sj3hynmuEBoL4VsUYcJgfttyi0
	 E/eMnUl+ruGlPiRlzvSyYu/q9oZKYDYlLjBzqi+P0lpMxVyMv4tgH0ds1M3GIj5zNu
	 BTZeEXKZeOu68yZgpS+SuQ4Pb24i9YchQP/tiJRuccUsLEYf5n+SQx4sVdA1/Rdp5/
	 pQNkqBmZXm7Iw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
In-Reply-To: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4 0/5] ASoC/SOF/PCI/Intel: add PantherLake support
Message-Id: <172263733961.144413.228232614375148648.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 23:22:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: R34FKCD26K66XX2A3KI5DDOM5ZUBLFZD
X-Message-ID-Hash: R34FKCD26K66XX2A3KI5DDOM5ZUBLFZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R34FKCD26K66XX2A3KI5DDOM5ZUBLFZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Aug 2024 14:40:06 +0200, Pierre-Louis Bossart wrote:
> Add initial support for the PantherLake platform, and initial ACPI
> configurations.
> 
> All the dependencies required in the initial versions are now
> available in ASoc for-next branch.
> 
> v4: topology name simplification for rt722
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: soc-acpi: add PTL match tables
      commit: 6a965fbaac461564ae74dbfe6d9c9e9de65ea67a
[2/5] ASoC: SOF: Intel: add PTL specific power control register
      commit: 42b4763ab301c5604343aa49774426d5005711a3
[3/5] ASoC: SOF: Intel: add initial support for PTL
      commit: 3f8c8027775901c13d1289b4c54e024d3d5d982a
[4/5] ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
      commit: 77a6869afbbfad0db297e9e4b9233aac209d5385
[5/5] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
      commit: 2786d3f4943c472c10dd630ec3e0a1a892181562

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

