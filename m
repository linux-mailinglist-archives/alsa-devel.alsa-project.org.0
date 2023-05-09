Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95CB6FC2DC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 11:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E1431102;
	Tue,  9 May 2023 11:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E1431102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683624843;
	bh=YkP+9nzJf7FuXgkUkk5HPDzH/zBWnTOgyTpPE8pO4lE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bxB+2zHEZtTeDL07UmbjMYu8XoumL8pDnguJrxzhorEvvyGEfCPsV8IBHlkXsDgyr
	 HXiW4c5cvwSMZngJjU0bGmegGXcCY/6WkEjim7B03ridJQY599CSqVG2EV+9Xd8OIU
	 wi29KT0WBcYAefxcC+rrCC9hSLmbUjyy4gsFkB3o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE721F80310;
	Tue,  9 May 2023 11:33:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC40BF804B1; Tue,  9 May 2023 11:33:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 64C28F80217;
	Tue,  9 May 2023 11:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C28F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uiiun6tj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1476162E8E;
	Tue,  9 May 2023 09:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDACC433EF;
	Tue,  9 May 2023 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683624777;
	bh=YkP+9nzJf7FuXgkUkk5HPDzH/zBWnTOgyTpPE8pO4lE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Uiiun6tjTocEOD3UZ+N6NlWAsbsJVSQzEYquYHC9uTm+n5UZa8Rmmq2Cch9VEf1YH
	 VVaMgZDhzRM+WhF/LzowhK4b64QLO5yIiUXLlu3pJsoNDuP7EaS/NWiFFJBt12wqli
	 arN/Wq+9tQEBERrJ4SGclVUhh5w0nJd14plnig1GHpsnR5waJCDhdqzSzTbEppgqGX
	 qvUrMPGYRZdeHW9TSQxhFjt5QrqS11XgT6x/5Q5MM1RHuAr9QEPK8GC48/yVY/qNxe
	 Av7DJ5zzTW/3kA4hmbUWvTvlWX1poGm7TJW/3zwN7WOgOmRjpbRtwW1zhmS3CO8j01
	 zMq3dnTzcsaLA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20230508070510.6100-1-Vsujithkumar.Reddy@amd.com>
References: <20230508070510.6100-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix NULL pointer crash in
 acp_sof_ipc_msg_data function
Message-Id: <168362477289.305930.16081039230793204822.b4-ty@kernel.org>
Date: Tue, 09 May 2023 18:32:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: OFOFIRIQOY7EF4KETT7RS74CMQJJKZTK
X-Message-ID-Hash: OFOFIRIQOY7EF4KETT7RS74CMQJJKZTK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, ssabakar@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Paul Olaru <paul.olaru@nxp.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFOFIRIQOY7EF4KETT7RS74CMQJJKZTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 May 2023 12:35:08 +0530, V sujith kumar Reddy wrote:
> Check substream and runtime variables before assigning.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Fix NULL pointer crash in acp_sof_ipc_msg_data function
      commit: 051d71e073614a72ad423d6dacba37a7eeff274d

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

