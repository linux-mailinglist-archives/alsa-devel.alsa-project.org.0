Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27759756C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 19:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF27163F;
	Wed, 17 Aug 2022 19:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF27163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660759177;
	bh=UpT4SalvdR4WLHrTMa64BzqEXdI87jktLxsOmXVkBLY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcmYbGE5PuIJtXikppAKf99h7rCLOExJL5vWw3YgVcGuPL44hENxKF+3hudDLDPJH
	 MSP8brtq/ADmA0fsRlbUFGFPsuAMiJE21JK9A5nlIbkAguZt8mO3VdA8rEuXUfRDnS
	 SktI53yAMYC7WujO7q1fHBs8AyEvlnPdpGn98q/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3362F800E9;
	Wed, 17 Aug 2022 19:58:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 020A2F80130; Wed, 17 Aug 2022 19:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56FEEF800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 19:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56FEEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dizlNlSH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5DE61313;
 Wed, 17 Aug 2022 17:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B6DC433C1;
 Wed, 17 Aug 2022 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660759111;
 bh=UpT4SalvdR4WLHrTMa64BzqEXdI87jktLxsOmXVkBLY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dizlNlSHnqSb77WBJl/5tPzb7TdvXznK+wgOnFVnPEKrHiWylmVO4lSL433VO4nso
 31lXFICtbxogVBHaPRBJQ7kjKBJyqVFDsRFhPenJ9YpzaJ62WdCMv4YbEErsMiL2pS
 76Z1z+Ts9HQzrt/9438UTadj65IkOxztvmt+RH8XxbRcqMDP1yhUiG4indE3SUp00N
 KpF8luZd87cYiRAvj/F9XOLGyzZsi229+fhZVi7wkLG15FdgZQh5pD9O37fF90YKN8
 6lNtOWQYa5HuqGx3m110yUG6MUEjzwWOFm4vobuX6nXN98py3CWOYoLGiejJxdtYme
 digLIlTvqDGJw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 festevam@gmail.com, Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com
In-Reply-To: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
Message-Id: <166075910858.598125.7538229649159844439.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 18:58:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, 17 Aug 2022 13:24:27 +0800, Shengjiu Wang wrote:
> The FIFO reset drops the words in the FIFO, which may cause
> channel swap when SAI module is running, especially when the
> DMA speed is low. So it is not good to do FIFO reset in ISR,
> then remove the operation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
      commit: cb225ac125a9c82889f4796a6092dd0bed39720a

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
