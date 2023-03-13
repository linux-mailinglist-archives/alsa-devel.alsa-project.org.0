Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7836B8174
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 20:10:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702031457;
	Mon, 13 Mar 2023 20:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702031457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678734600;
	bh=ynFXEbosm1JzbupZkQXHMrHnDfdv4kdeqGKpYmNPUgM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rb8vcx4ao/YugUHUlNsuYV3NbnXgMEmKk6PCBsGrvGXWQAyufE6Qappd25X58Sj9S
	 usQMYFB942jiulJelIMg53R39AdZHAdWCRihADBAepuBaaaWzypeTMD0yNa7S4SsZp
	 qG12Oqr1jeOZKJUxf17JbgtmyOy+bbtCUhGLTa9Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC71F80533;
	Mon, 13 Mar 2023 20:08:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEFA8F80520; Mon, 13 Mar 2023 20:07:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA1C9F80423
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 20:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA1C9F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dGggmMgp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 59F07B811DA;
	Mon, 13 Mar 2023 19:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7B6C433D2;
	Mon, 13 Mar 2023 19:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734465;
	bh=ynFXEbosm1JzbupZkQXHMrHnDfdv4kdeqGKpYmNPUgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dGggmMgpVsvxSaMGI6bojk5dWoUkzdpU+87a5DLqokxbfPvDmVFT7zKAoKgLfc3zi
	 oH17nvftWFnV9dpaygM9xBMaAS2S0WZhMHS13vOJr+Jd/iJDDJB8DaBSYDjoiEitfp
	 56u/nsnlDpJax8+PYS84V0Q9Jgx5DulVdDPNdAUY88GrebTXc5i8Alo0GfREjzvwd4
	 oLfKIGexWlrZ9WAVBiwuOSXx5IP8cT9xwxXZM6lxk/OgGLTNCskUWId4GBO6G4/in9
	 sI911GfwX83yoG7JsDJ+W3UDNylE8wQDeMrtoeeyF0MIWpStzlLjIo5o1TypIKegyB
	 RosuM4H2/WvaA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230313101302.20950-1-peter.ujfalusi@linux.intel.com>
References: <20230313101302.20950-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: add support for setting up
 loopback routes
Message-Id: <167873446323.106067.2638717364208646731.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: G55GD4BWQVC6YKGUKJDWXQ7QHPDTMFL5
X-Message-ID-Hash: G55GD4BWQVC6YKGUKJDWXQ7QHPDTMFL5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G55GD4BWQVC6YKGUKJDWXQ7QHPDTMFL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Mar 2023 12:13:02 +0200, Peter Ujfalusi wrote:
> During route setup, playback stream routes are setup by going through
> sink path, capture stream routes are set up by going through source path.
> This is not sufficient to handle loopback cases between pipelines
> configured with different directions, e.g. a sidetone or an amplifier
> feedback connected to a speaker protection module. So, add the logic to
> handle such routes between widgets that aren't in the list of DAPM widgets
> associated with the same PCM.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: add support for setting up loopback routes
      commit: 8cd3cb17fcf216cb859f86a00fff428fbcecc1d8

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

