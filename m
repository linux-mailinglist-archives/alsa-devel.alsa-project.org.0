Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698FB52A78F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E0E84B;
	Tue, 17 May 2022 18:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E0E84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803328;
	bh=ZV7cT0G8CUsxr13OFtkykb/tHOu5gBkiJsZlXDxuZ2w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sMF8xdpOch1q5Q2dN2CH/KBmdh3fWTVXF9a8GuPETLZftvFhNplQOGFTNmbqfYI6/
	 lSl1pemeqILBiLBlWQ9Yqo+UpKXyEN2CBajpf7gVVaa8uGUGWBT0DOGe3qMHKHc4OJ
	 nBrmpDNDuMFDg/cS28TFQaaAx6Vj34kQw+Gvm7Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A537AF8053B;
	Tue, 17 May 2022 17:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E20C9F8052E; Tue, 17 May 2022 17:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8095AF80527
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8095AF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XEJsmO0W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30B6EB81AB4;
 Tue, 17 May 2022 15:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6825CC34117;
 Tue, 17 May 2022 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803177;
 bh=ZV7cT0G8CUsxr13OFtkykb/tHOu5gBkiJsZlXDxuZ2w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XEJsmO0Wb8O6fqXj6nPeO7bMW84/dRJ5d9ky3HMKXCaFV3t5AGhXV2QYpMZ5M4K9f
 RoEQWO9gCiwCE+S0RpaXwIiW08q5Fi84cqMyZXNgEPLMnLQMfHovRntsgxzFHmtzXD
 61tfv+5ZGkyuu3gHlHT8hd2//T6KmvT/OtBzzY1BHuzvvtYz75eaUzMh8ix2K4NA8c
 MZzQUi4GoqAyw1grFZ9ggGUuzZQjsF7M9v5sUTdZBACNks6hT0svIE2QOQlZwC02KT
 6u2QPYM9Q3DfudRwLJfvnGvHNJpNcF9hX09tB2rXzyHJvPlS4MlVjuqmU+6fh51xVV
 RE6FSDWVVXZtA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, dan.carpenter@oracle.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com
In-Reply-To: <20220516092442.17027-1-peter.ujfalusi@linux.intel.com>
References: <20220516092442.17027-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc-msg-injector: Cap the rmaining to count in
 IPC4 mode
Message-Id: <165280317514.1635268.11611256133355625839.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
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

On Mon, 16 May 2022 12:24:42 +0300, Peter Ujfalusi wrote:
> If user space provides smaller buffer than the IPC4 reply then it is
> possible that we corrupt user space memory since the IPC4 dfs_read function
> is not using the count directly in copy_to_user() due to the nature of
> an IPC4 message.
> 
> Cap the remaining counter to make sure that we are not writing too much to
> the user space provided buffer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc-msg-injector: Cap the rmaining to count in IPC4 mode
      commit: c5003f08fe671fb1f18bca07e589c5cffeccbc9b

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
