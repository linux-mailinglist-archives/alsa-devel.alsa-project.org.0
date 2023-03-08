Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E36B0A38
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B10F149B;
	Wed,  8 Mar 2023 14:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B10F149B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283890;
	bh=RKlOKfdflVaSL+vC1j0jgRjXJ10a1RSkg6HbEdjp+mM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P015EbTGN9pVyB7aW53vWaRgCy8H5HwF7KyWX3m6sHZahXNeYI0Lf8nF4VydqKOdp
	 OMI0SSZvOHXMrT1L+Hqq9I3ZghEEwGHXJNT5MiIN18aZwOmO+F85u7NT1JJvc3SO8Z
	 CPSMLzNuBIfu8i2rT6dCKzuIdOdqFhA3A9R1NpLA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06461F805C7;
	Wed,  8 Mar 2023 14:53:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A39B1F80571; Wed,  8 Mar 2023 14:53:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CF81F80567
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF81F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZIdEj5ey
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F14CB81CB2;
	Wed,  8 Mar 2023 13:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8620C433D2;
	Wed,  8 Mar 2023 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283578;
	bh=RKlOKfdflVaSL+vC1j0jgRjXJ10a1RSkg6HbEdjp+mM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZIdEj5eyqXXw7x2wmw27zc/cuKSjgUhDFvYFCyWHqUoHSiqf4eiMa3dj8hxPbTkCR
	 a6A6Jc/xHW4jyNJypIpVUemrBIQTvbzw0zQph2Ive1IjAr05Spgx0OUuLLUtrQlJyr
	 /iRSaydeZBPggep11IR7GUOxX7PPeIxCNpf9ho/3P3LPHvwFbCcTVH/xoKOds1ndOq
	 P/Zr7xNa0Tm21G9uOAKd8f5y+2paiY/itY1JBPHJsODISn89u0RC/CG8kOQHMw3nhM
	 MbWTlGc6cOWgOevw+v5a+ljUS/sk9xcBCGqsneYNaUkskOaz1p9kU8hpnTLmFwFQ+X
	 RPvGy7OthDR6Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307110830.2178-1-peter.ujfalusi@linux.intel.com>
References: <20230307110830.2178-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: don't allocate blob if it
 will not be used
Message-Id: <167828357647.31859.2408884578134591077.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: DKNZV6R2AJBTHI6AR626YXWAKQ4DDFY5
X-Message-ID-Hash: DKNZV6R2AJBTHI6AR626YXWAKQ4DDFY5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKNZV6R2AJBTHI6AR626YXWAKQ4DDFY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:08:30 +0200, Peter Ujfalusi wrote:
> A copier blob will be only used when a copier is connected in the
> topology. An ALH copier in playback direction that doesn't have any
> source means the copier is not connected in the topology. Thus, we
> don't need to allocate the blob.
> The patch doesn't do the same test before freeing the blob because
> the blob is null and it is fine to free null.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: don't allocate blob if it will not be used
      commit: 3c50211f2d534a5b766b1ff3c6cf6f7bd0bae753

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

