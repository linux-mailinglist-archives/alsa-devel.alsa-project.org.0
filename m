Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB136BEEAA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:42:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F33F02;
	Fri, 17 Mar 2023 17:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F33F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071350;
	bh=WQLhDoE83LR1URBYukpI1wB0LYsmm4dfbGKiP6k7bWY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NLJYttKDtR5F39phNfCmKQIxSmuHGSLy4lsSpoUjorvBJOiwIPezbbNlUEsT3aakc
	 EM8VXB9rAgQd6MVyPBDz/9nXd0JK2l/uk407CKygTQDx8ezTXEzH5BHkHQCooWMO+8
	 BmbzV/jDmIwOzveiD3LYHdhZINkqc9B7qAr8mJ3U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6BBF8053D;
	Fri, 17 Mar 2023 17:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1680F8052D; Fri, 17 Mar 2023 17:40:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53276F80520
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53276F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gQdQLcoy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3292860B3B;
	Fri, 17 Mar 2023 16:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B991C433D2;
	Fri, 17 Mar 2023 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679071247;
	bh=WQLhDoE83LR1URBYukpI1wB0LYsmm4dfbGKiP6k7bWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gQdQLcoycL12EHWJNC+UY9uamIEB44b7FZpMpSpxk17Ea5m1kV4I+JU73P4MSla2S
	 0Gnfhn/989ielVd8ZfqVOQ8KcAoHeSpQ+FHPrg7HxXA0MGwCvMwWAlsR4OkdOkLz8p
	 UnPIk5fU9JXstq4H2vJrm0xUiJdlxCxAmXmflRIjtxfQYNJxtEupfixEtGmdZd5Znt
	 rmON5WjGcbQMYz2LlICjmoPXONWLMmOqr9QF0XEWC8wP0wtfpdWIDrviZmQLIrLrn+
	 ZjGsQKJyZxCsCa5tym9r3DVQAxqeaABtkyiSjYYrLwHeKFKCy+nykHWJBlD7n9slmy
	 b4P7V8JMcc58Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230317063524.8280-1-peter.ujfalusi@linux.intel.com>
References: <20230317063524.8280-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Initialize in_format to NULL
 in sof_ipc4_get_audio_fmt
Message-Id: <167907124596.46507.8812715114949719569.b4-ty@kernel.org>
Date: Fri, 17 Mar 2023 16:40:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: Q4ZXZ5AVVZK5QDSPSA5PW7VL5AE2XVX4
X-Message-ID-Hash: Q4ZXZ5AVVZK5QDSPSA5PW7VL5AE2XVX4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4ZXZ5AVVZK5QDSPSA5PW7VL5AE2XVX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Mar 2023 08:35:24 +0200, Peter Ujfalusi wrote:
> If the available_fmt->num_input_formats is 0 and there is a failure during
> the output format parsing then a kfree() would be called on the
> uninitialized in_format pointer.
> 
> By initializing the in_format to NULL, this error can be avoided.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Initialize in_format to NULL in sof_ipc4_get_audio_fmt
      commit: ef51cd1ebab63bb92bfef050fbf12b2265f5c7a5

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

