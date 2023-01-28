Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67E67F75E
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 11:50:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DAAECE;
	Sat, 28 Jan 2023 11:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DAAECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674903003;
	bh=fJ2O0Xp8qig0PONRP8hnGCqbt209AFAWi6nCkqYVf1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nzwS1+YaGJR+2rQEoD+JazdtMDEPoeqfooRJVOBEv6irzRzG+h4BMWp3z6COZipuW
	 PLb6aOobKqO9C8/JxE19H0srDZKUxB7I1tCaxTESZsclEHyth8KXJ97WcwEpKrq1EC
	 SuC1bSGdGRwggVtNLeUBqQh0WAtvjNd89y6PYUYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D214F80543;
	Sat, 28 Jan 2023 11:48:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17460F80506; Sat, 28 Jan 2023 11:48:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1984F8025D
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 11:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1984F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qY0He4Gf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 71334CE08D4;
 Sat, 28 Jan 2023 10:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D723FC433EF;
 Sat, 28 Jan 2023 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902881;
 bh=fJ2O0Xp8qig0PONRP8hnGCqbt209AFAWi6nCkqYVf1Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qY0He4GfHO0oi8VHTrzCF4bIEppMFjWj0fG/Sw23OgjMpjTNJ40kCmGuY93vNMyyT
 fPQfrjBIHFXJZCVM57LxGdLsRO8OabwN+lt3m2c9YfZk1qeDcZLBhtTMEmUIM3VizD
 0AzECBBxT8bVa+s1z2EnYh8MPztqhujkVlSB0SJFvZI1eDKSRIFK4sPl+GzcR0fwDl
 eguFfLyNtvWO804ZVhcOzs7hjjFD9MwBeU5XQGVFmmLzHNydHeMrtNU2LeKdK7PUdy
 XOuD2Ok3i+sJKmtqGsTGxSts8IwKZ8t986Eyn3BsaFxp8u1vgj7Yx8dsBlMpUWT5/g
 RIA13LglLFrsQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230117121615.25690-1-peter.ujfalusi@linux.intel.com>
References: <20230117121615.25690-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: No need to unbind routes
 within a pipeline
Message-Id: <167490287960.2145828.3346973946324840661.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:47:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 17 Jan 2023 14:16:15 +0200, Peter Ujfalusi wrote:
> The FW currently ignores unbinding routes if the source and sink widgets
> belong to the same pipeline. So no need to send the IPC at all in the
> first place.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: No need to unbind routes within a pipeline
      commit: 9a62d87acee94919af1fe92f2412fff83dcbcda0

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

