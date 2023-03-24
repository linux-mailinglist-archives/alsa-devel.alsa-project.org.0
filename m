Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6EC6C8637
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 20:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BA1E87;
	Fri, 24 Mar 2023 20:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BA1E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679687629;
	bh=OOIq79glHbDyn3NOGSr+CYyWZMQwvP3Vqubh/mt7bWA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AlUBmqoHOVUkSNQ1qXCK79ROxE+nV2hMqI1oD4DwIVkXHkUTvsuTaVulfPgRWoXVu
	 82B9+NSlvYNZDle/OV7QcXrWeKguoeXUUN21kMdKwwc+MmGv2oxdDUjcMj1EaX9YCy
	 dJheIoGg6aGnwkNNoA1aytKnx2daLtEUrbxJwKIs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCA1F8027B;
	Fri, 24 Mar 2023 20:52:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0FE5F802E8; Fri, 24 Mar 2023 20:52:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9068F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 20:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9068F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bpwwZWDo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C87B4B82422;
	Fri, 24 Mar 2023 19:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3882C433EF;
	Fri, 24 Mar 2023 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679687565;
	bh=OOIq79glHbDyn3NOGSr+CYyWZMQwvP3Vqubh/mt7bWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bpwwZWDo5Te3rYYDGM6yY5WiM5KVzh8JP2o/KoxzdW1f7JPXQJDiHcknRDdRwvRt7
	 eoRBX4gOii5uIT0Mngy6apTc7EPNIYGQ/QP15ficQKxwpnObKKRla/hJ2QdOENVMm9
	 ndW9RndLXF3ByP/hpgYNyQ3NB1wRdN6SQNYlX53Kc7iv407V3hso/sDkpo52hpl+0l
	 cykk6skmt6pUtSqwFYq7ZoHEEND3G55tC7Bu5ESO4gkw2k1DgJNBSkW6SKvfBkj3Y7
	 SajgV03MkRfFttTPMMzlt5s4Duq89avhP/sxXr/jh7DScKIPyG+juLDh8s31OQImh5
	 JKo2BDCwFUpdw==
From: Mark Brown <broonie@kernel.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
References: <20230324145535.3951689-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] ASoC: cs35l56: Remove redundant return statement
 in cs35l56_spi_probe()
Message-Id: <167968756243.2700247.10054205791284149281.b4-ty@kernel.org>
Date: Fri, 24 Mar 2023 19:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: SM4DVIUR3GMIMI4PO2JTISF42BMFYUTE
X-Message-ID-Hash: SM4DVIUR3GMIMI4PO2JTISF42BMFYUTE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: error27@gmail.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SM4DVIUR3GMIMI4PO2JTISF42BMFYUTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Mar 2023 07:55:35 -0700, Harshit Mogalapalli wrote:
> We have unreachable 'return ret' statement in cs35l56_spi_probe(),
> delete it as its dead code..
> 
> This is found by static analysis with smatch.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Remove redundant return statement in cs35l56_spi_probe()
      commit: 283771e8eefcbe4a0a84c6a00a0b7a210bbc5846

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

