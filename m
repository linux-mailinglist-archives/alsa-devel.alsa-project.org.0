Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D539777632
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37DE832;
	Thu, 10 Aug 2023 12:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37DE832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664497;
	bh=URIRhXf9AnRycvwsSgiqBp/GGHZQwVsQ4fh/7ONCwNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hMc+t/0dglWBwdj2iLA3AGiia2u3ZVD6zMQnYWFMD0v9vw8BPOM41BzriII/CxKTt
	 lQ+N8LpF6i1dBX3kR5cVrU2Ysv8kvsAPzRiQfFvirsvXSBRRCgXSyYkbIYFwueH8X+
	 G1lznPYKuHbf962q54c8odiHEqSBtnRfOLuiN+GA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88422F80551; Thu, 10 Aug 2023 12:46:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF6B7F80553;
	Thu, 10 Aug 2023 12:46:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F82F8016E; Thu, 10 Aug 2023 12:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D556AF800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D556AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZMy8S1PY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA38D60C2C;
	Thu, 10 Aug 2023 10:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8645AC433C7;
	Thu, 10 Aug 2023 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691664380;
	bh=URIRhXf9AnRycvwsSgiqBp/GGHZQwVsQ4fh/7ONCwNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZMy8S1PYkhkA1HoZGvDuoD2S/s76SRvOvsS62dUbfmx7fd7yz7NWZwb/T0ZBy96tV
	 KIuV+yzS49K9XBSHyfCsHhh/6mj8VLKQMPP2TBiMJ0X09ns8wMrBVkC9cMbCEV4EBG
	 AEFBehTRtqAkyTLyeLzBlPMk38VXgD9ncDgi20VDKLKufBctuZjIXiFNWWWgPHRVOa
	 7Wh0DgebWvebVG850aH3cJ4BP6xTUPKaLk/WooSvYLZ3zIwoB1eZokj1RTQS0WR/eD
	 EF8RLiER7pX2mS8eiLHmD73sLHLOZNVPUbkj5ABqw5d1YuAnV+xsjMetg/DdPfWc8t
	 RzM9pKJ0Q6wEg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 adrian.bonislawski@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com
In-Reply-To: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
References: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Update the basecfg for
 copier earlier
Message-Id: <169166437825.20959.1425083664715520318.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 11:46:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: UR3XSZ7IQGXMJQYSVR4D6W2RDXHC42FZ
X-Message-ID-Hash: UR3XSZ7IQGXMJQYSVR4D6W2RDXHC42FZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UR3XSZ7IQGXMJQYSVR4D6W2RDXHC42FZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 12:23:43 +0300, Peter Ujfalusi wrote:
> The sof_ipc4_update_resource_usage() call updates the CPC value in basecfg
> and it must be done prior to making a copy of the copier configuration
> for the init message.
> Other module types do the resource update as last step or in case of a
> process module at the correct time, before the memcpy.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Update the basecfg for copier earlier
      commit: e6475ce253187d2e68867102fddd57341ebbf8eb

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

