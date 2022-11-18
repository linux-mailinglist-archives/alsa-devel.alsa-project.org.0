Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9262F6C9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 15:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62AF016CD;
	Fri, 18 Nov 2022 15:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62AF016CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668780380;
	bh=INdm7yKes323sfDAswEdv3qUK4alfukAMn2OU5qk69g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gIQIaMcx5gYDopuQVd7Yqkxz3NtNqBP1je4jrh3VuX5HnlUYmU1HCb9Kj+l3U2Ym1
	 mXZgQcSgmQ5gRsJTNxWCRvI3dsUJXSPuw413siv7RY8oHiWzjVLBDEKdU/JUwvo2g5
	 DltzjOVG0unBBQfVkeRCDhE53/Kc5xuLo/v1TfQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D8DF8055A;
	Fri, 18 Nov 2022 15:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44246F804AC; Fri, 18 Nov 2022 15:04:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A1EF800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A1EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VivdpcSR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24583B823B7;
 Fri, 18 Nov 2022 14:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8643AC433D7;
 Fri, 18 Nov 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668780268;
 bh=INdm7yKes323sfDAswEdv3qUK4alfukAMn2OU5qk69g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VivdpcSRHkmDj1qDk75AvXfEVpf8pbb89WEiRGc7FLuIZw7okbrDEh707IcKSqRAU
 VdWQIlxanBgp0hi+IPAKxa02n8lTSz1oD+8Kyw+OxECMjuE4waJAB4XhIW8RdGCM+0
 45yRtUtMa0D2bL0sSglD+DODzH3U/U/iUoHscA91mZevQUfyKER7MU5PiQCHfiGKXZ
 MqFrPGKWZuVCiZR8NLB3Q5nhHOMA/FlouxZEHu/6uTzRloEOPgAz4/pC4108ea0H92
 RT2tp5hCQBdRKYvyqnAQuJlzG/dUgzieww4qI9Jy48Xa4oHaQLfs61wRGNHfu9PwTB
 qUcTywYgNJopA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221117231919.112483-1-pierre-louis.bossart@linux.intel.com>
References: <20221117231919.112483-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_nau8825: support rt1015p speaker
 amplifier
Message-Id: <166878026715.872655.14557581753802780669.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 14:04:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 17 Nov 2022 17:19:19 -0600, Pierre-Louis Bossart wrote:
> From: Brent Lu <brent.lu@intel.com>
> 
> Add rt1015p speaker amplifier support with a new board info
> 'adl_rt1015p_nau8825' which supports NAU8825 on SSP0 and ALC1015Q on
> SSP1.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_nau8825: support rt1015p speaker amplifier
      commit: 13c459fa37c9f26e9bf884a832dd67598b5c4d3e

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
