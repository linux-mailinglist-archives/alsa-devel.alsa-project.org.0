Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B4785D3F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD9AAE9;
	Wed, 23 Aug 2023 18:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD9AAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808146;
	bh=/LkJgfupVFpt632Mz933PLJZ5tfycTZOgNLrJ7ORzfQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ztnv+IaZZbSmInCWQTwxSI0jVTQuQnNaffdymDGXDb+UQVmXsTf+5jhfxxa8DurbJ
	 xuA2d7SaZzoZLuRmAdQnv0Y5FrZqs+3un2ICEoaPAjHpul/a2mL4vlChGcKOBQr34T
	 Juq3GRC1Hw4gof5wjLfaFMWlQWlSc+r5iYsp1dTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E89F805A0; Wed, 23 Aug 2023 18:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D95F805AB;
	Wed, 23 Aug 2023 18:26:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AEE6F8058C; Wed, 23 Aug 2023 18:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC22AF800D1;
	Wed, 23 Aug 2023 18:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC22AF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZaPeVXdA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8811360B51;
	Wed, 23 Aug 2023 16:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E64DC433CB;
	Wed, 23 Aug 2023 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807987;
	bh=/LkJgfupVFpt632Mz933PLJZ5tfycTZOgNLrJ7ORzfQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZaPeVXdAFgGNOMa0XzJEJL1TckG07teK2plhNb++TYdzCisVcTd2rXZ7jbfV+N4rm
	 Ao/T4HcPN+4q4/GsskdLRHz7xVe1N6C7jsd2Sm5V3hnz85Zfn9NufofWugnb0frnuy
	 MDi+Ut8Q7Fe3WLZY3znSJsguge9zGLzeb9KUUUw8eU8N/9bfjAStiLb02GO6Fz+9dr
	 JSWm/Bw++a9iQKDzfsoBWxD5ly1/aKeOHYLg7/O7HY7oLfdkelvHuxWoHo7sy67h6f
	 dGQL/uwqbP3Nlt9voV7C2ZiT8q4QpFt+V9xxaQPa3TNU2b++RpAh+NpBw+8w1YBdw4
	 +pELbNIBKCwCA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
References: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/7] ASoC: SOF: amd: remove unused sha dma interrupt
 code
Message-Id: <169280798403.53791.13433879724804047736.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 17:26:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: BZB2HC7IQDEEX3G2MBVTBTJ3U7UCDK3Q
X-Message-ID-Hash: BZB2HC7IQDEEX3G2MBVTBTJ3U7UCDK3Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZB2HC7IQDEEX3G2MBVTBTJ3U7UCDK3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 13:03:33 +0530, Vijendar Mukunda wrote:
> During initial development time for RN platform, when SHA
> dma gets completed, SHA DMA engine used to raise the ACP interrupt.
> In ACP interrupt handler, SHA DMA interrupt got handled.
> Currently SHA DMA compleition is verified by checking
> transfer count using read poll time out logic.
> Remove unused SHA dma interrupt handling code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: amd: remove unused sha dma interrupt code
      commit: aa836152420af94d014ddd677a5f95544abef4f6
[2/7] ASoC: SOF: amd: enable ACP external global interrupt
      commit: 0a1428141f638fc6fba863de40f0dc7ea91a1d47
[3/7] ASoC: SOF: amd: add module parameter for firmware debug
      commit: 60eb816ed850b33f5410b1223c5d4d935a6ceb79
[4/7] ASoC: SOF: amd: remove redundant clock mux selection register write
      commit: f3b2f8b7158026e7a0ab67f5e36c195cdb4c1bf8
[5/7] ASoC: SOF: amd: add conditional check for acp_clkmux_sel register
      commit: 0d9e4cf5b66e0ffca3d8cf8e9a111d4793877afe
[6/7] ASoC: SOF: amd: clear panic mask status when panic occurs
      commit: 3d02e1c439b4140215b624d423aa3c7554b17a5a
[7/7] ASoC: SOF: amd: clear dsp to host interrupt status
      commit: 38592ae6dc9f84b7a994c43de2136b8115ca30f6

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

