Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7A70E6A0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DC4206;
	Tue, 23 May 2023 22:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DC4206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684874434;
	bh=2PLqWR+i15J+SV534O/7WQhY4Oxjwkyn8L/Dppp68zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I+L8MC6FMY8gz6uPOC7NXcIEArFObWQE0XVWwZOwcDt+AmrtJcpLWh0HQisd7y2yx
	 Ibs0ND8BNS5kqwrzvAkrg4JbZ+Wo82v75nzqGt4E2brl51BlkI+oMqp2vOUyv6ZR9w
	 7YzR4NnK+EfgSYijHX/WXuBEblo/4xLzyAxdR9rY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F24BF80544; Tue, 23 May 2023 22:39:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A92F80249;
	Tue, 23 May 2023 22:39:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B827F8024E; Tue, 23 May 2023 22:39:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DF38F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF38F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SST6f6Ct
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3621561CD9;
	Tue, 23 May 2023 20:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61ECCC4339C;
	Tue, 23 May 2023 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684874367;
	bh=2PLqWR+i15J+SV534O/7WQhY4Oxjwkyn8L/Dppp68zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SST6f6Cta/7ajLms92C3ZvmWJnOkt2aYPPMhshGPYM8CoEtjsDFeRlNAX6243gW0L
	 IHA64M0/oXPGYlp5JifRs0InO/RAOqAuQw9eLaWkGRCzB1mf5QL1J8I6Rp4QUcwulS
	 qYcpm62yJCMS5Ylzl0z6Uum026RMSIwbWgQKK3f+9HGwtXP4oSh8dgkN/FvWBz6IMC
	 g4WNTcf5Miw/w83klKCbS8JMbu/FqvhyoNEepejm65jMsO7YItISUWDQWwnlDX/GUL
	 LfwDn/Xt/O/K4QNJUvaSeqX37BWdkJfewte+0IpY/AJXRFI9TgtJ3G1EEYxUwpgKb/
	 DotQ5K7EOeI/w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v1 0/4] Fixes and cleanup for CS35L41 HDA
Message-Id: <168487436612.287432.3938851801782775444.b4-ty@kernel.org>
Date: Tue, 23 May 2023 21:39:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 2YSCYVDB7IE7IUFK6IJWEFSNARY3EGEM
X-Message-ID-Hash: 2YSCYVDB7IE7IUFK6IJWEFSNARY3EGEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YSCYVDB7IE7IUFK6IJWEFSNARY3EGEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Apr 2023 16:25:48 +0100, Stefan Binding wrote:
> Several minor issues were found during additional testing and
> static analysis. These patches fix these minor issues.
> 
> Stefan Binding (4):
>   ALSA: hda: cs35l41: Clean up Firmware Load Controls
>   ALSA: hda: cs35l41: Fix endian conversions
>   ALSA: cs35l41: Fix default regmap values for some registers
>   ALSA: hda/realtek: Delete cs35l41 component master during free
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/4] ALSA: cs35l41: Fix default regmap values for some registers
      commit: e2d035f5a7d597bbabc268e236ec6c0408c4af0e

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

