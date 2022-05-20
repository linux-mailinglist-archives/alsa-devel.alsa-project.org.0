Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7A52EAA5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AFBF1728;
	Fri, 20 May 2022 13:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AFBF1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045682;
	bh=5eKqLMOdZtjukCQAuo4Z/Gy+jeKCAi4xtVHmgrj5cgg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ab/lrSlpr4pcjZamyMFA3djLrR+bEnFefBZe5ZqghvzMnAocMmjMMHtD9jzvhG1oH
	 4L0Q73Vw8Cn/7GAND0kBjJm4trV+IISNwZ/0iXqnSppFxry07+SiE0Jk4oKdJACh46
	 iQEzz+Al8WwImRYjQg4d61IUD+p56zQElNyO4UbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C15B4F80534;
	Fri, 20 May 2022 13:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB64F80526; Fri, 20 May 2022 13:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B58D5F80519
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58D5F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vP+WVx1M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 993F561CD1;
 Fri, 20 May 2022 11:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE79C34117;
 Fri, 20 May 2022 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045523;
 bh=5eKqLMOdZtjukCQAuo4Z/Gy+jeKCAi4xtVHmgrj5cgg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vP+WVx1MjIb6BNh8H6jwWU5TKkur/1WliBndJHz/RSV5gsNFtkN8NOUzneQM/irn4
 NQKW6JVHgxl7Yaayzjmxkoe5YODatQmTfehpptfz/Ft9HaUNe1Sf1l7SO7FI3aXHMi
 3lBRApxbOtqE7OMPCafAPMkk06y9ln5rT9ntj3DZwVKnRChW5zCocoKTPs+yKuMnIl
 fgO/txet7EOr6GgSGBad/D5yKpV6cgmcsSBD47dub8vnv/fqBY7RalnZ9noF4r9qP+
 KcBtjqtkiRsbRMxFewQUAwgW0zMRhx9wTHwOBtmcExt3856ycvan5quDjeOWdhxNrZ
 JeAGASdeoBsQg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220517173715.468894-1-pierre-louis.bossart@linux.intel.com>
References: <20220517173715.468894-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH RESEND] ASoC: SOF: sof-client-ipc-flood-test: use
 pm_runtime_resume_and_get()
Message-Id: <165304552169.45439.8283908201602877006.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On Tue, 17 May 2022 12:37:15 -0500, Pierre-Louis Bossart wrote:
> Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
> pm_runtime_put_noidle() pattern.
> 
> No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-client-ipc-flood-test: use pm_runtime_resume_and_get()
      commit: b1378b259c0c0300cf62dd7117bf550edce0f9cc

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
