Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DC702B2E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5919311C;
	Mon, 15 May 2023 13:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5919311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149162;
	bh=p0nhVFjvB9qqIfxtKaQ1sz7UN86csj7sPmTqD+GtZfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ePXariNMYN9nULvYsVQhi0mW62K5RxnpT6Iy9Wwfy2H/KB2H+pf/6R5rx7Nn00yX6
	 suCAWlqFP03eBQw/MB91yGgj9NQ4OBBVVHyIl4AAKHd87RLwu5KoDannM0rKjvdL11
	 GWiLU5L+ViEM6IhNRwt/+sn41cjB5m9k+mQ1aD5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9E2F805B3; Mon, 15 May 2023 13:10:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2596F805B6;
	Mon, 15 May 2023 13:10:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9719AF8057C; Mon, 15 May 2023 13:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6185EF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6185EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=igqi8Nen
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B976615FE;
	Mon, 15 May 2023 11:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE68C433EF;
	Mon, 15 May 2023 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148982;
	bh=p0nhVFjvB9qqIfxtKaQ1sz7UN86csj7sPmTqD+GtZfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=igqi8Nen0pC29oAUKc0DsUVuj0Ksaz9E1kv2dB4Nwf/Zhgr1+dOKnvWXhAl8kW1Fm
	 z79ou4FM2cHEDIEGqBPYjPRxZvs6sG45BaowFRwwJ9QZBtk/g3vmbgjqnq4XWv+nJR
	 W32TaFmhJu51v5jnKVi/HF0sQcMAWpgzvfVSDBYa0V6W91pNJozl+btxUaBOYcQv5R
	 C0sAjkwL5pYXy4xLA8SIFF8O2qJEvQ+SWL0FsrR+l3sLO70r4IlpED7oRQHX7gxjLM
	 cEMHzk4Vv2QBlw+xPv/6RIZnBIao9jytIMz/bG1+/G8QIZjZDf4w6FhNtbK8bivlWi
	 8uCs/LXrJaRHQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com
In-Reply-To: <20230512103315.8921-1-peter.ujfalusi@linux.intel.com>
References: <20230512103315.8921-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Various runtime pm fixes, improvements
Message-Id: <168414898109.394037.2967681837025779257.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 2M4SS3J7XLEW4VBJNBAHJ7DXI4KKOEWU
X-Message-ID-Hash: 2M4SS3J7XLEW4VBJNBAHJ7DXI4KKOEWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2M4SS3J7XLEW4VBJNBAHJ7DXI4KKOEWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 13:33:12 +0300, Peter Ujfalusi wrote:
> Three patch to correct error path PM runtime handling in few places.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: debug: conditionally bump runtime_pm counter on exceptions
      commit: 3de975862f985f1c9e225a0d13aa3d501373f7c3
[2/3] ASoC: SOF: pcm: fix pm_runtime imbalance in error handling
      commit: da0fe8fd515a471d373acc3682bfb5522cca4d55
[3/3] ASoC: SOF: sof-client-probes: fix pm_runtime imbalance in error handling
      commit: bc424273c74c1565c459c8f2a6ed95caee368d0a

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

