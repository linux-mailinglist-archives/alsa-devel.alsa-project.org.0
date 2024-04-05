Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE089A793
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 01:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C892D45;
	Sat,  6 Apr 2024 01:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C892D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712359257;
	bh=g/rg8hX2kW3QsCPiDjAfOeFUbjgmiQ/na7CgdZOszU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0Sa+eoL65oMkd1IbxVxxVvqP4+GaHf9jsU2n1WWwbo1fDm1lsbzUGzXXLwTpPgMJ
	 LX7LhFNECBkdVk+5D1ii4a4OXBXB1Knb/3hKxanJ/XHkCrZSXfs/oTUKEOwWRYLLAG
	 URjdYbQjzc7qtWpZUVWAchwc8YQ+np7IMQMI1RDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0FE9F8057B; Sat,  6 Apr 2024 01:20:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5158BF8057B;
	Sat,  6 Apr 2024 01:20:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0757CF80238; Sat,  6 Apr 2024 01:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80AD8F80007
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 01:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80AD8F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LBvlOjTV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FAD961283;
	Fri,  5 Apr 2024 23:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F9BC43390;
	Fri,  5 Apr 2024 23:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712359203;
	bh=g/rg8hX2kW3QsCPiDjAfOeFUbjgmiQ/na7CgdZOszU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LBvlOjTVksE+FjM4+dIKfd8jdbcMpZiLqoUd+uGX3xq9apvFvo8oZsCBeDqC85FW1
	 /KC3QH6GsAEdDDmgaPG31M8PJiAUJSws7yP9kovAKmjJK/i/MVZDP1vJLCBMS6U6kp
	 j28fAzC5X1AT0qhDjBq+Jip12NOCEoFtkn14Fpn7jHLw73YAtSVPJ7JvTXuns/KcsC
	 UnKeIUN786gONCpr8E3OP+nwH0xzru1E4tdsdKs5n0dqSdUiXW8UOUhlkI+SnHNpvs
	 fv37O6i+v9pMpbeUmqq5CCNn7I1inPo/pcaknP9Kz5nrKnJhcxlma/VC1iCjL9ntyG
	 YjBQl7IjPaG+w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: improve and extend HDaudio-based
 wakes
Message-Id: <171235920219.198289.1128617567514278392.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 00:20:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: XP3T64XKRQ2G2YVEJE6T2Q7UAQJ5XLPV
X-Message-ID-Hash: XP3T64XKRQ2G2YVEJE6T2Q7UAQJ5XLPV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XP3T64XKRQ2G2YVEJE6T2Q7UAQJ5XLPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Apr 2024 14:03:53 -0500, Pierre-Louis Bossart wrote:
> For LunarLake, the SoundWire in-band wake detection is reported with
> the HDAudio WAKE_EN/WAKE_STS registers. In the existing code, these
> registers are only handled for HDaudio codecs. Now the same registers
> have to be handled with care as shared resources.
> 
> The in-band wake detection mainly used for jack detection. Without
> this patchset, the SoundWire headset codecs signal an event that would
> be ignored and not reported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
      commit: bd5863f9ef12e26c2cfdce9c0adbf0222c731a3c
[2/4] ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
      commit: ab9182441ee5a94dd6f47743ed1b7b6b07b63cb2
[3/4] ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
      commit: b69480edf4eb71c6f754e3c4020e8dd72a330558
[4/4] ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for HDaudio codecs
      commit: 35b5806e2edee1741f6bd2de2a5c149a876c4a60

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

