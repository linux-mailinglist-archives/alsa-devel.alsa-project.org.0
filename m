Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5B69A3A4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:55:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5A2EDB;
	Fri, 17 Feb 2023 02:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5A2EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676598959;
	bh=N5dU7vSeJJk7hHS+VAJUWrF+nBsAniJz+yjge9/eNtk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nRk6UfvYlpM+DsjcUBdnvjIVju/EtXMBlV8QUYdepKWkuj322cRnP+KUm4yk6Zixr
	 Y/Hy6kW+KwL3SKKavg3Yq95bkRcdHvS6+VnoFas+y+A7FNVzrjghZ9DQ8eG4Gzd+/R
	 UscvEKnSB+GIymF6241xt4Y7IQhhO2ZFzzK1sn8I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6ECBF80496;
	Fri, 17 Feb 2023 02:54:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64541F801C0; Fri, 17 Feb 2023 02:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C69E2F800E4
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C69E2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uYmLPg0J
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14DA9611FC;
	Fri, 17 Feb 2023 01:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB43CC433EF;
	Fri, 17 Feb 2023 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676598851;
	bh=N5dU7vSeJJk7hHS+VAJUWrF+nBsAniJz+yjge9/eNtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uYmLPg0J7Rbdg/Hh33bGQHW6nvLgU9rOnqeSMRTv9N29+P3EgiFWYO3qlmg5hmFFU
	 ttf6gHK5fBMusYySydkmkrdUjRLgGz2SAdQHfrQpo7KAIBn2j3StcseHjqYuMSLyFs
	 lPheSJ+Etkc2wnDQ+s5llhHwAtSMIgfrAlNRiKLJccy6pP5RRtjmdMruiYZgtTHQBc
	 zxQXiYOYR5Duxdr8NhXXWAk3Yy5N02brMZ5TxjfckqMAa4gbnGiGt7agPOCNV/lWMI
	 GUSqjmO1Uj9K+fKKU0bCtfChymzsP0F/IWLnaQXJxmmrQUKUTUz1+ZZcgn5slLyz5s
	 VLGZ4WyHwLh5Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230216162340.19480-1-peter.ujfalusi@linux.intel.com>
References: <20230216162340.19480-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: hda-dai: fix possible stream_tag
 leak
Message-Id: <167659884931.51394.12529347002057479214.b4-ty@kernel.org>
Date: Fri, 17 Feb 2023 01:54:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: QCVZS2OCWDOCJPQIAT5WCAAF6DA3LTMD
X-Message-ID-Hash: QCVZS2OCWDOCJPQIAT5WCAAF6DA3LTMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCVZS2OCWDOCJPQIAT5WCAAF6DA3LTMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Feb 2023 18:23:40 +0200, Peter Ujfalusi wrote:
> The HDaudio stream allocation is done first, and in a second step the
> LOSIDV parameter is programmed for the multi-link used by a codec.
> 
> This leads to a possible stream_tag leak, e.g. if a DisplayAudio link
> is not used. This would happen when a non-Intel graphics card is used
> and userspace unconditionally uses the Intel Display Audio PCMs without
> checking if they are connected to a receiver with jack controls.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
      commit: 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d

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

