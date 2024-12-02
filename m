Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62049E03DB
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 14:43:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75D9211A;
	Mon,  2 Dec 2024 14:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75D9211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733146997;
	bh=prWlyL7+S1iaFRc2HgQ/xlg4WwK3MVaxar+O2eGaNec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FdH4S8h973Mwar48oTbBWBfTdom7Kep/LuAfz86ijHkL2MHKFQIN8/rntzmHTeYB+
	 RAqP8vRADlck9+aj+FsUsGVelgZC/fBmMgWxtUiXTFxfjhkh2ntEdgfLUjGVl/n1i+
	 KC/Jazbf4RPhzJlykJ3soHo6eXt49M5Mx8ouK7xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E7EEF805C5; Mon,  2 Dec 2024 14:42:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57712F8047C;
	Mon,  2 Dec 2024 14:42:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5E7F80448; Mon,  2 Dec 2024 14:42:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD6AAF80073
	for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2024 14:42:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6AAF80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r/DI1lsX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35D2CA40CDB;
	Mon,  2 Dec 2024 13:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9506C4CED2;
	Mon,  2 Dec 2024 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146219;
	bh=prWlyL7+S1iaFRc2HgQ/xlg4WwK3MVaxar+O2eGaNec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r/DI1lsXNjNz0WMRskDOyKfwAL5dRHhvqCscdErYbmgD5A0eLhFLbb6U9YUY9Nfmm
	 xjlxmtxtfuSQTHCch8WHmQmAQcLdRWSYMttoa+FVQlNO/3zsgO1abTDd8FX5BL8KaC
	 Z+/kvlqN69uIUTfzEWNJfjIIVV1flE61J0JHyJd+GyNjfoaYxraHgtCeebMueCfxcG
	 nRSQg2f8W2uxe8sJuQK96/GGNBmnyYnxIOxAPbIhlIiLTnUsXvd823wcFTx9NJPlnS
	 hWOIrLB5YxCepA05+nzz+Fq5dhTkoTz7309A4Fa7MRaJA1GHgr4+SEZhqsi5pFc4Io
	 BSYWfwObPUYAw==
From: Mark Brown <broonie@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
 Marek Maslanka <mmaslanka@google.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20241128151239.1666582-1-mmaslanka@google.com>
References: <10062d09-34c8-4e53-b5d7-f96a5b19f6f8@intel.com>
 <20241128151239.1666582-1-mmaslanka@google.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: da7219: Remove suspend_pre() and
 resume_post()
Message-Id: <173314621641.54037.6152466859833367470.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 13:30:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: OENMAATVJVW43HCHSRPAOPJCLUJ7SMBS
X-Message-ID-Hash: OENMAATVJVW43HCHSRPAOPJCLUJ7SMBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OENMAATVJVW43HCHSRPAOPJCLUJ7SMBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Nov 2024 15:12:32 +0000, Marek Maslanka wrote:
> The presence of a plugged jack is not detected after resuming the device if the jack was plugged
> before the device was suspended. This problem is caused by calling the
> sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function on resume, which forces the jack
> insertion state to be unplugged.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: da7219: Remove suspend_pre() and resume_post()
      commit: 04c319e05d0b08cc789db7abccce0fcb13dbab16

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

