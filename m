Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C76B0A39
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:58:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B44183A;
	Wed,  8 Mar 2023 14:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B44183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283908;
	bh=j9Mhwz/qVbBK/bmvufxQsilCLcYcZBe7yhhQn1n+LiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=liaI6tlXbUFeR/ALvPhvImUMQmrLG1xWVS9OUhtPyr5OQRNi/f7WZHWtAvsuJ1slX
	 qyZEkN559e6xSqgeJfrFKMMm4+JcVoJYpqCftnKoWaagUyfzfHOEXwxwbrDAC03h+V
	 DQntIy59260/xZwgTQXwpY4OtFo1bejbCnVPNh8I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DE7F805C6;
	Wed,  8 Mar 2023 14:53:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1183DF8057B; Wed,  8 Mar 2023 14:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA6B9F8056F
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA6B9F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LJvHx9LU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 38901B81CD1;
	Wed,  8 Mar 2023 13:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852CCC4339C;
	Wed,  8 Mar 2023 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283580;
	bh=j9Mhwz/qVbBK/bmvufxQsilCLcYcZBe7yhhQn1n+LiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LJvHx9LUPlFekT8DgO487HeJkGUn1MAa2VOsaCskTukTXluQ1BNg8L61rQPMXo/nb
	 ASAoPMTfWPJRggddo/MOsWzhLv3ewndw/Bae7tOZd1p+eo4jJFcz8UdUmmGlO7a6JB
	 DrVxz/E1Z04MsTcMhTLjFniWx+VgvNrxs9CTsaUdYnmENPlskWgON8eG3nIE6zK5+d
	 SFjKTj2LRXNkJAawgF/opL3H4t9WCh+2u+vc2cwhLY8SVDoEcwJNyef9bKfCxuRQ7K
	 kj8/jvN6bLZUmjMIBKBJqW0/YHPiaXAfD58FllihkpretNIclLJJ74C17T+DlJrVwi
	 1EuIpAufqnDlA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307110846.2265-1-peter.ujfalusi@linux.intel.com>
References: <20230307110846.2265-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: process pending logs upon FW
 crash
Message-Id: <167828357822.31859.5790787159246591803.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: TB7SQIYRR6RYBV4IXHK6IF7ARJQ45RDI
X-Message-ID-Hash: TB7SQIYRR6RYBV4IXHK6IF7ARJQ45RDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TB7SQIYRR6RYBV4IXHK6IF7ARJQ45RDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:08:46 +0200, Peter Ujfalusi wrote:
> If the DSP firmware has crashed, some log messages may be pending in the
> mtrace buffer, but not consumed by the driver as no IPC notification has
> been sent by the firmware. Check the buffer status for all mtrace slots
> and ensure any pending log messages are processed before DSP is possibly
> powered down and the log buffer contents is lost.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-mtrace: process pending logs upon FW crash
      commit: db97cc0f7459a2bee68e6e8bf0b2f7a286137fa8

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

