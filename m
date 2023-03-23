Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438166C6AE8
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2A8EC8;
	Thu, 23 Mar 2023 15:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2A8EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581622;
	bh=M6Edg5DjVsm8prUJbJkzARqPmvj6mxfT7u619ddSojA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mNCmkqRtJBYNS7vwU9j0JeecKgw8joSSKx/YpMPkaasOYlnhwn1YOtrhGsERClZ0U
	 7aufW+xQotNxsa4YdjgyV6I/Dfvyz+IJKWhRNiWsn8vKwrv2A8A9PbudDqc4dnT04/
	 zVUhCTewo6LRVDCGadRfDSNE0OYnztxmx8+RBUXY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3739F802E8;
	Thu, 23 Mar 2023 15:26:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8030F802E8; Thu, 23 Mar 2023 15:26:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C23D2F80254;
	Thu, 23 Mar 2023 15:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23D2F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JYTOD1uZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27FAD62734;
	Thu, 23 Mar 2023 14:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFBEC433D2;
	Thu, 23 Mar 2023 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581560;
	bh=M6Edg5DjVsm8prUJbJkzARqPmvj6mxfT7u619ddSojA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JYTOD1uZKNXcfY8VFb6SK7++ItlPK5up7Gzype+kcNVqumPjCgW0dSKLWGGV/iFw5
	 zywQS3fyCzWEjb9eYXrq8eOtGD2bc/LRgNE8aGNd0rA8aCjbzJuPWcPmABIwYcfzby
	 BIHSBw/VVx56ipCOMzzTclvfH9SuL4xlqUa0Ai0dCwuInd70Cya/EncKX/C7SmUS7/
	 sME122FSz+8tADNb34utS7lF2UG5axYahPLU0lx88vI1rZoNR6wmKRpdRu/EaF8VvE
	 OAJVVuRZta1kXUHdqLXVT9vUNVI8pxzwIP8hpnA8kNDV/2ac5feWGaq56iqOC/M1jh
	 dUo5a6+WAgSQg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20230323090531.67679-1-colin.i.king@gmail.com>
References: <20230323090531.67679-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: SOF: ipc4/intel: Fix spelling mistake
 "schduler" -> "scheduler"
Message-Id: <167958155761.49176.5077860409181267820.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 14:25:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: O3GOJXSHWSFF5U7R6XZSRWU3VFGDWL2O
X-Message-ID-Hash: O3GOJXSHWSFF5U7R6XZSRWU3VFGDWL2O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3GOJXSHWSFF5U7R6XZSRWU3VFGDWL2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 09:05:31 +0000, Colin Ian King wrote:
> There are two spelling mistakes in dev_warn messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4/intel: Fix spelling mistake "schduler" -> "scheduler"
      commit: 056db840115653659d86a3931a78b3c504edb2cc

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

