Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622E6C589A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 22:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48A9F11;
	Wed, 22 Mar 2023 22:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48A9F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679519667;
	bh=b0tqNz5qRvFuUe9O+wh3yQl6MkbGVlBusNKdzOJHp30=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MxmqGuLcr0dcQcKjmZvqv2z/0lK1uQ6oSweSmTyphF6T3Pd9FYJdWMGtrdwBDIl7y
	 /aAmOiFckz+dxNk4VsjZvXhhFYk0Npd8tUYu7r/jwLWBHq2fsk8Tajp1/FiJrCvZQD
	 y50wfqsUY2x1JWTOPbdT1Du1PaZ6EpVLrDo1rHdk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E1B6F80254;
	Wed, 22 Mar 2023 22:13:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C79F8027B; Wed, 22 Mar 2023 22:13:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAA7F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 22:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAA7F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EbVnFg6w
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 28C6DB81DF0;
	Wed, 22 Mar 2023 21:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3BDC433D2;
	Wed, 22 Mar 2023 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679519602;
	bh=b0tqNz5qRvFuUe9O+wh3yQl6MkbGVlBusNKdzOJHp30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EbVnFg6wzQzrw5PA2DgIsl63Kh4iZgFYIFD5v63bM/D9fkO1fdIJ1dy6L/D1EIdS6
	 0yB5uyopq0rvkcyf51lpd+1430XuHdZjY+4Dzv8iU0zxbAV3CRU/dpXjnMAnyeIuFy
	 LYMMUlYesgoPKX0AGhUErVBUN/6aGg5dX8rjOX+oqvLyajLuS/5EwBUZkaeOGYmkeN
	 bXnfGW3Cd1CpYiD4TO2oY6qLnhC+d+v39eiYh8+WpilQPAzAhw170+taz0YJSW2FKs
	 jSChYSiADPOcXPKOFEaWxido9ROIJnLYZuYxF0hHWAxKnxsdgXz4OnO16STuAVCI1C
	 8K130uPs6beMg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jyri Sarha <jyri.sarha@linux.intel.com>
In-Reply-To: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
References: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4/intel: Add missing mutex_unlock()
Message-Id: <167951960011.1349664.16227769838319076312.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 21:13:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: DYSPB7GB3BZ3S4NSAOXOX74DSIQIRKPC
X-Message-ID-Hash: DYSPB7GB3BZ3S4NSAOXOX74DSIQIRKPC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, rander.wang@intel.com, error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYSPB7GB3BZ3S4NSAOXOX74DSIQIRKPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 20:18:30 +0200, Jyri Sarha wrote:
> There was a missing mutex_unlock() in sof_ipc4_widget_free()
> use_chain_dma if-branch that caused a static analysis error. The
> branch should not be used in a normal working configuration and if its
> used its an indication of a bad topology. Add missing mutex_unlock()
> and a warning print if the if-branch is taken, and another warning
> print to a symmetric place in sof_ipc4_widget_setup().
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4/intel: Add missing mutex_unlock()
      commit: 935d31fdda2c69324b3eeb648a73fdedf4131474

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

