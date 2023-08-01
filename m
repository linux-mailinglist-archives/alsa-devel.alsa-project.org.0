Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0276B530
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 14:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73263E7;
	Tue,  1 Aug 2023 14:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73263E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690894348;
	bh=H4u99nnJ3hxpt8jAH1/glvCHocmwrYqfl5e3KPQYcXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cpwm3zBXZQ1/Ev+6TXlChxvhxFoCHF0l7rUWHzl4kJHk/gQfImh+Zh0+pV19vzQ+g
	 Kzt18sIbzYs/8WLlKYYsSUDrKA9v5tPiOoabDJdnlRdZoPq99RqBiGXNHIXRePcffO
	 eFD61CY8DePC4LsHiu7CiB4fjYsbxqmG0wSEd7ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 370C4F8016D; Tue,  1 Aug 2023 14:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27E27F8016D;
	Tue,  1 Aug 2023 14:51:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA3FF801D5; Tue,  1 Aug 2023 14:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50107F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 14:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50107F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DrJ5Z2vw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EEEE61583;
	Tue,  1 Aug 2023 12:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5902DC433C7;
	Tue,  1 Aug 2023 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690894283;
	bh=H4u99nnJ3hxpt8jAH1/glvCHocmwrYqfl5e3KPQYcXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DrJ5Z2vwflEqiKxoZoTQ1vSNjjdvRwFsQfuoY0ytcjn7VCYPVV+1Toi9ik5h5KK4r
	 zP8frjZME+08LGXxwXjAijSLU0AKFb+tp0gU3kCTpACdKs432GoGHDwSCv3Hrkynaj
	 kqcqZmeEYUVJnNxj+004NjV0vID4ZNZN+yxYIsY3PqDoj3QoKi/jbTmCG7mowE+f5y
	 7zSzvLsHHagHqPHz8o/YUb7rQVdPwnaINIz/j9Je7HM5j4WkWpPsuxsl0ufuqh2BVU
	 oGTbEEgDYy/Hdv3xR3QcwW+FmWNr+SR/GFjK0bydetz5tjUsEZjYQ2obmFNFmLUTAA
	 yCTAYO9wpPH1A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC/SOF/Intel/AMD: cleanups for GCC11 -fanalyzer
 checks
Message-Id: <169089428206.43850.2574740654929620237.b4-ty@kernel.org>
Date: Tue, 01 Aug 2023 13:51:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: FUR2NSAP5AB53BPV3SCAPL6S4DAFBSOL
X-Message-ID-Hash: FUR2NSAP5AB53BPV3SCAPL6S4DAFBSOL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUR2NSAP5AB53BPV3SCAPL6S4DAFBSOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 16:37:40 -0500, Pierre-Louis Bossart wrote:
> GCC11 provides an '-fanalyzer' static analysis option which does not
> provide too many false-positives. This patch cleans-up known
> problematic code paths to help enable this capability in CI. We've
> used this for about a month already.
> 
> Pierre-Louis Bossart (8):
>   ASoC: SOF: sof-client-probes-ipc4: add checks to prevent static
>     analysis warnings
>   ASoC: SOF: ipc3: add checks to prevent static analysis warnings
>   ASoC: SOF: topology: simplify code to prevent static analysis warnings
>   ASoC: SOF: imx: remove error checks on NULL ipc
>   ASoC: SOF: mediatek: remove error checks on NULL ipc
>   ASoC: Intel: bdw_rt286: add checks to avoid static analysis warnings
>   ASoC: Intel: atom: remove static analysis false positive
>   ASoC: amd: acp5x-mach:add checks to avoid static analysis warnings
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: sof-client-probes-ipc4: add checks to prevent static analysis warnings
      commit: 390e7066db29b985c5142513955797c1166b623a
[2/8] ASoC: SOF: ipc3: add checks to prevent static analysis warnings
      commit: e44222c213678d6ef646d72cbb9a2eda52f6dc22
[3/8] ASoC: SOF: topology: simplify code to prevent static analysis warnings
      commit: 55cb3dc271d81f1982c949a2ac483a6daf613b92
[4/8] ASoC: SOF: imx: remove error checks on NULL ipc
      commit: e302f8d9f799af57a61a7456451c28f2647e9751
[5/8] ASoC: SOF: mediatek: remove error checks on NULL ipc
      commit: 8cf5286216dcfb942f0e4d7c23ebe06c2ebc1bed
[6/8] ASoC: Intel: bdw_rt286: add checks to avoid static analysis warnings
      commit: 64778b022e629b8ffa97d23a9adbf670aa3bb1d8
[7/8] ASoC: Intel: atom: remove static analysis false positive
      commit: 71d76768fbe72aa70dd61d5714a5579dc4ca61cb
[8/8] ASoC: amd: acp5x-mach:add checks to avoid static analysis warnings
      commit: 871861f6ad6d43b49caade3f42b9d40ca1413e79

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

