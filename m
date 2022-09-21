Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F15C0427
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 18:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C4C1E9;
	Wed, 21 Sep 2022 18:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C4C1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663777817;
	bh=qku41keVPTBGHRjATzfWRN7b4BXYlFcFv5gZIbFfuA0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kv7XKjeTW2DQcuqz770nDjYKsk5lhdhyT3lHmSSlWXWR5+Z0C7sreBC6Y6pQZxMg0
	 U0oQ7PmnXLlE7mp0d1mJT/2XG7uX0NyJwGFkIC86FqdC0IjvuCN8ZYkahyJHDe2vFA
	 8y/sG8bMmsc3+cq4NxHI8U/BTDl8w6WY9b0HioIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB24DF80169;
	Wed, 21 Sep 2022 18:29:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14766F80256; Wed, 21 Sep 2022 18:29:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9497F80169
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 18:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9497F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nCjSAtRU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BEFBAB83131;
 Wed, 21 Sep 2022 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8C0C433C1;
 Wed, 21 Sep 2022 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663777751;
 bh=qku41keVPTBGHRjATzfWRN7b4BXYlFcFv5gZIbFfuA0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nCjSAtRUVV68yifEWtS+73eg04l9Y16e83XS2HbFewVzm92cqhg6FRUp7imHrbveC
 1B2SfhGv8EnSAQqvC0eQodaJsSs4l42q8rXBmiHjBLd9VV8yHRI0Tau7zvAtoiPsJD
 isfy9Q4hcvCnZaC/HZEN6CQ18z5brCZ/zkvle92HEIBo0t7TmibtGpp7DwwHID77AO
 jXAZI6/h6hab7MB6wiPVtvchAQ57bFEhPo+qLbi6Au1qZp4xlYiStW2MOBy2UOz62L
 Ij6kpv+f/NTwkSl60EUvTuHgGGQJZ4E1iQlILOKnkRqITTSR/kUsPuVF7gTDJhwsMG
 yQ842zGFV4Atw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220921112751.9253-1-peter.ujfalusi@linux.intel.com>
References: <20220921112751.9253-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Free the ida when IPC fails in
 sof_ipc4_widget_setup()
Message-Id: <166377774484.591459.17927449774000563065.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 17:29:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Wed, 21 Sep 2022 14:27:51 +0300, Peter Ujfalusi wrote:
> The allocated ida needs to be freed up if the IPC message fails since
> next time when we try again to set up the widget we are going to try to
> allocate another ID and given enough tries, we are going to run out of
> unique IDs.
> 
> Fixes: 711d0427c713 ("ASoC: SOF: ipc4-topology: move ida allocate/free to widget_setup/free")
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Free the ida when IPC fails in sof_ipc4_widget_setup()
      commit: 61eb0add28023119773d6aab8f402e149473920c

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
