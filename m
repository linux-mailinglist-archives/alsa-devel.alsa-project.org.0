Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FD6B98B5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 16:14:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A6B113FB;
	Tue, 14 Mar 2023 16:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A6B113FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678806845;
	bh=yv4FI4B02uLnb08SzovGDGxnb9cvpDmnaLQJnv0Qfds=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tq21Syfj+iNlc0Gt0O5F9sKOY3cRqyfmTvn34UalHLu2NXAMtjGYhw3VOgBVDvlzA
	 R/pzZ8vm/l6JCShk4CFrDfKla3f+oOlr+QI3QC+Xb0+imG4FnwrzxbkiBDSYQvEeng
	 QCkUiPylvWxF80GYUDRHewNubfriSOUXdbEYJq3k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D28F80533;
	Tue, 14 Mar 2023 16:12:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2331FF8052D; Tue, 14 Mar 2023 16:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29CB1F80425
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 16:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29CB1F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=St337z/L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C36B1617EC;
	Tue, 14 Mar 2023 15:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09439C4339C;
	Tue, 14 Mar 2023 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678806746;
	bh=yv4FI4B02uLnb08SzovGDGxnb9cvpDmnaLQJnv0Qfds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=St337z/LLkvfgiXeAigSEpV7Hd4L1l7MxgECORg5UqxURJcfaMZuNxTuAqJ8rZ9HK
	 dvabSJt8OqmH6aW5n4osh2rqLQcn4IFJ5DE3M/Bgr2OOefKAnymh7GnjIYLfjsXh/N
	 WstqxfET4Zf8zDbh/0Qpb3o1cjGddtJTrXBalDQDIgIPQY3SmMq5QXdqh5JRpxIZ1h
	 V8iD78QR4FBSQ09Lb6AvbPQZqweAffkZukclZJXxUoxqRw/C1X/HYEKs6AYoG125ti
	 iX8p1BYjpi5PV0W8Jese4+BQQWauFlUUuefTfL2me26/wrA4SrKAfWRBCTahEj0Rlb
	 oWrwZ3KIQae/g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: SOF: ipc4: Add support for formats per
 pins
Message-Id: <167880674476.43040.18055233228007297300.b4-ty@kernel.org>
Date: Tue, 14 Mar 2023 15:12:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 5MOI5E7DSDUQK3TVGCPPBLXTPBT36ZOC
X-Message-ID-Hash: 5MOI5E7DSDUQK3TVGCPPBLXTPBT36ZOC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MOI5E7DSDUQK3TVGCPPBLXTPBT36ZOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Mar 2023 14:48:45 +0200, Peter Ujfalusi wrote:
> The modules in IPC4 can have multiple 'pins' on their input and output and these
> pins can receive or output audio in different formats.
> Currently we assume that all pins are using the same format which is a limitation
> that needs to be lifted in order to support more complex components.
> 
> This series will extend and rework the format handling to allow different formats
> on pins.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: rename a couple of tokens
        commit: 3f738e4a126c9ee082d814edeb7416697f9e2b37
[02/11] ASoC: SOF: Use input/output pin consistently
        commit: bb79f2a608245cd92b3183d77aec6902e51de950
[03/11] ASoC: SOF: ipc4-topology: Add a new field in struct sof_ipc4_available_audio_format
        commit: e63a73f94fef0cf592aa7bb55f907007d747af4f
[04/11] ASoC: SOF: ipc4-topology: Do not parse the DMA_BUFFER_SIZE token
        commit: 594c1bb9ff7365b90cb4d325deb8c38ddda90557
[05/11] ASoC: SOF: ipc4-topology: Parse the SOF_COMP_TOKENS only once
        commit: 171d5ccedbb6277a8f9a3eae36e4f465ddc3187f
[06/11] ASoC: SOF: ipc4-topology: Always parse the output formats in topology
        commit: 8abc9ab956b5756693710e1e09557e0189f01bef
[07/11] ASoC: SOF: ipc4-topology: Modify the type of available input/output formats
        commit: 7ab6b1e8302cf7a9bc8808c43b3e751e4148a351
[08/11] ASoC: SOF: ipc4-topology: Modify the signature of sof_ipc4_init_audio_fmt()
        commit: 9c560549e32bc2951c67106c59587f9f7bf6b70e
[09/11] ASoC: SOF: ipc4-topology: Remove the ref_audio_fmt field
        commit: f534a94c3d765bcd5bdf10271a265883be2b4030
[10/11] ASoC: SOF: ipc4-topology: Add new tokens for input/output pin format count
        commit: 4fdef47a44d6ff735902dfe740918f23932225ca
[11/11] ASoC: SOF: ipc4-topology: Search only pin 0 formats
        commit: ad70f2f0e6e38675d7805482d2c625fca5756a2e

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

