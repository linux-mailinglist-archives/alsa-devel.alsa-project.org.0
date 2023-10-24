Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFB7D5369
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 15:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E19793A;
	Tue, 24 Oct 2023 15:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E19793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698155879;
	bh=8jvIMLGisAcUgtRBNwIN/hemzPipfyGWCOmlGRRca60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fdpYPbqsjm/KyJfp6nYiLZ3/OSVQgXSVdXIe9XgiF9twcg0ZmU/qaX8C8XQBdcejt
	 0aWmsyfrE8Ma3846lTWOE5ioAYLMdTeNiSG1kSyaA6XFGy4+VkbE/duYIwd0bE3AM8
	 lrwLupJCOwOmI+4PRTVYqXN56dPaGzoSZS1SCxlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 546FBF805AE; Tue, 24 Oct 2023 15:55:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 429A0F805AB;
	Tue, 24 Oct 2023 15:55:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0CB5F80578; Tue, 24 Oct 2023 15:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC8B1F80224
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 15:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC8B1F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XbFIkH1M
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8954CB82487;
	Tue, 24 Oct 2023 13:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29C9C433C7;
	Tue, 24 Oct 2023 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155723;
	bh=8jvIMLGisAcUgtRBNwIN/hemzPipfyGWCOmlGRRca60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XbFIkH1MxZ31QF+UmkqPQgoR+l+Jr5YkvCH9oicW3/7GU/wIzoW0Khxi7Iz6H7SAk
	 q6cdH2boSDYKN8Sjj4xhwuiC34jQSi7DcoT4Xh7XDjNLZuXVlVtQjeAvf8ToiLd5T5
	 Sn0N5sZNJl++46kVuPmjo3WM/2Yx+5ZAusCkuMw8anZiBAVMc7+dpwxtPN5YXO2S0X
	 5hH8QN2X0b+ekvP6AiaYZsjmqjTjljZw4hRMC0x55jCEqzl7b63kSljt8jlHv08Ff/
	 h5lCWsafPdfF0s0NR+PKiYNvAIRvce88+nhrOouowBqORxx+/m7KqszvDuXmUF27OK
	 qzzAJukUyBuJw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Marian Postevca <posteuca@mutex.one>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231020062822.3913760-1-Vijendar.Mukunda@amd.com>
References: <20231020062822.3913760-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/5] ASoC: amd: Add acpi machine id for acp6.3 version
 based platform
Message-Id: <169815572028.69390.10419908653780701208.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:55:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: OBJHYIQEDKIJDKQJWSYZNV2ZHA757WQX
X-Message-ID-Hash: OBJHYIQEDKIJDKQJWSYZNV2ZHA757WQX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBJHYIQEDKIJDKQJWSYZNV2ZHA757WQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 11:58:11 +0530, Vijendar Mukunda wrote:
> Add acpi machine id for ACP6.3 version based platform and configure
> driver data to enable SOF sound card support on newer boards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: Add acpi machine id for acp6.3 version based platform
      commit: bb98b592cfd387eccc9430d4cd5ebc1678775a88
[2/5] ASoC: SOF: amd: add support for acp6.3 based platform
      commit: 848c0d34f70c4c9f6f166ec891d309936a26aa14
[3/5] ASoC: SOF: amd: increase DSP cache window range
      commit: 4dbee5104b7858e39d94b2512ab99b82b8feb894
[4/5] ASoC: SOF: amd: refactor acp dram usage for data bin loading
      commit: 135e0d49cde383395afcaf285d6304be9230a06f
[5/5] ASoC: SOF: amd: add option to use sram for data bin loading
      commit: 145d7e5ae8f4e553478232fe3095379b60fa5496

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

