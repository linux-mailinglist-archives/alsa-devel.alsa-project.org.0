Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA46EAEB3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3419E89;
	Fri, 21 Apr 2023 18:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3419E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093304;
	bh=olAei+3Bj12+sx51dP8raLfgimjnDYB4wxf/W91AUiU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nO0oy/Rl7z1S8TyGU5LkjKpEiz8p6MJGhWxcWDShGv5jF0XMYYhE9KHQHLiK79iAc
	 DeSLn3ZeGakTt/9JvPkoRrW8KFLssXIIsyMpAsVUUCsXdlTvD4+jwX0G9narY4fi0H
	 zDDUFPMotFC0enV5Zhg7KXbkx+Fc7R3xZm26fxnI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36893F80510;
	Fri, 21 Apr 2023 18:06:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2226F8052E; Fri, 21 Apr 2023 18:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDE84F8019B
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE84F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d7ImUvbT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABE686518E;
	Fri, 21 Apr 2023 16:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F103C433EF;
	Fri, 21 Apr 2023 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093195;
	bh=olAei+3Bj12+sx51dP8raLfgimjnDYB4wxf/W91AUiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d7ImUvbT8JfzurCWiAM1Uw3OoB0/5l0dQWPucFiyFXrpxpKNNrLqa4tW15926Vilo
	 R3BOc5P1AUPwS2s/DRxObtZFE7oMZnr/pc+gQYKKUhD9hOTxF09KWSq7WiQEjlIkt3
	 03Hp7mIiOKnstJPGKg9S+I1Ws34T0JI/4vDMl2OMdVPALyoBP3BoAvFg/gRLDr3FXb
	 7H7aoC7ieUCtMqQ4wEOH4uwjwkOTTE0RFK30NV1hSLrtF27acSzmC1U/KHnrncmWNS
	 sNBpoHQk6sXkWEP+6qnfByMLBF34gcru2n85bp5agWPBBi5Y7eeQ3Q639hTsuDS/2y
	 H0liw45ozas9g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230420104714.29573-1-peter.ujfalusi@linux.intel.com>
References: <20230420104714.29573-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Split the set_power_op for IPC3 and
 IPC4
Message-Id: <168209319324.108546.13733500206221228087.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: BNNKOKVSYB4ZMX6ONFBY3OC4JMSJPOO7
X-Message-ID-Hash: BNNKOKVSYB4ZMX6ONFBY3OC4JMSJPOO7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNNKOKVSYB4ZMX6ONFBY3OC4JMSJPOO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Apr 2023 13:47:14 +0300, Peter Ujfalusi wrote:
> Suspending to S0iX with IPC3 requires the PM_GATE IPC to be sent again
> to stop the DMA trace. But with IPC4, this is not needed as the trace is
> stopped with the LARGE_CONFIG_SET IPC. Also, sending the MOD_D0IX IPC to
> set the D0I3 state again when the DSP is in D0I3 already results in an
> imbalance in PM runtime states in the firmware. So split the
> set_power_state ops for IPC3 and IPC4 to avoid sending the MOD_D0IX IPC
> when the DSP is already in D0I3 with IPC4.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Split the set_power_op for IPC3 and IPC4
      commit: 996b07efe49620325332081afdb0dc0bd6fe5cd0

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

