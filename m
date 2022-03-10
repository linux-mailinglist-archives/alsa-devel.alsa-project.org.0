Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA54D45D0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:36:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148B018C3;
	Thu, 10 Mar 2022 12:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148B018C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912214;
	bh=WtWqp1zh7HKXHx43sjkkCIalwus0c8mchJ4umFu1M2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oF8fYPLeWusbEWxJslimuOvwa2ysHIknzc02iFkRM37UuRPWoD8cdGC4t19FSZ9ba
	 fGOTpVf4cSY8Z57i5R3zrZU90dwD+JMxavMDRGNJjkvImOF2F+I3KKH86lgpCf/abu
	 MuhHPeb0BSUonq4lczwvKhnVYBMwWunXaXWFmGnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A4D1F80137;
	Thu, 10 Mar 2022 12:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1080AF8016C; Thu, 10 Mar 2022 12:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86717F800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86717F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NO10ZZBQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2A0B6164F;
 Thu, 10 Mar 2022 11:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E944C340E9;
 Thu, 10 Mar 2022 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912113;
 bh=WtWqp1zh7HKXHx43sjkkCIalwus0c8mchJ4umFu1M2Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NO10ZZBQnY/9FYIpQteL0JNNsk62jRduaDYXBVvLGtK5k84pdUucTogd2xgULpx3s
 TrtLbHktrZVFFw8Hb2jsrb3ox1HQ3u5Qe4D6eCxYOx05aL5dVUGGBJVG4fd56vcTie
 7GHxYNdqqnl1HPv8OQ7OsEj+dq4m9kJBNH/MemN997b2DBf5q5J110vHDDn85mTa6U
 S8fjvBXUoyBqFYUBQRYbhllBs74GrAwDum8UXwmsd1BsdBsjJF76usrciyNbCgCO6c
 0ali72WaDCnNQBfydMyyR6tfU8MqsMN+oV5AuwcPLBEK//JcEJofIQFro9L8G3xyJc
 l4ZjhlP4HRnQg==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
Subject: Re: (subset) [PATCH v2 00/18] Clean ups and preparation for IPC
 abstraction in the SOF driver
Message-Id: <164691211197.13798.933742544852366041.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 8 Mar 2022 08:43:26 -0800, Ranjani Sridharan wrote:
> In preparation for adding support for the new IPC version that has been
> introduced in the SOF firmware, this patch set includes some clean ups
> and necessary modifications to commonly used functions that will be
> re-used across different IPC-specific code.
> 
> Changes in v2:
> - Use guid_t instead of u8 array for uuid and the helper guid_is_null()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
        commit: 7a976552a4f264f777be236c0c83263975512f1a
[12/18] ASoC: SOF: topology: make sof_route_load() IPC agnostic
        commit: 2b4b383f85baa493039a1fd80ca3f428f9504a54
[13/18] ASoC: SOF: Add a tuples array to struct snd_sof_widget
        commit: c7b655ade96a282a4304d68dcb120fcb61f19db2
[14/18] ASoC: SOF: topology: Modify signature for token parsing functions
        commit: 38a9a06794fe052dab57177f0320f44124e6cef9
[15/18] ASoC: SOF: topology: Rename arguments in sof_parse_token_sets()
        commit: e0974a382e7c4e0962edebbd8e0d3185c928ea85
[16/18] ASoC: SOF: topology: Rename arguments in sof_parse_tokens()
        commit: 5f8333f62fcada65a85aac53c6a39eb6c4f0bb4e
[17/18] ASoC: SOF: make struct snd_sof_dai IPC agnostic
        commit: 839e484f9e173309d599e1281eb7221e07f41814
[18/18] ASoC: SOF: move definition of snd_sof_ipc to header file
        commit: f535880b2d32fcb85d99a81483d44c8df23d23cf

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
