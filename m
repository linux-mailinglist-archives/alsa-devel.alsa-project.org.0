Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 980962F35F2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 17:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14BFB16E9;
	Tue, 12 Jan 2021 17:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14BFB16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610469813;
	bh=ozTM9TbpL7jJfB6jEgL1Di/HoDnUbq7AO4YD0p5hmCY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAhR0PCIApCEmUIFmy5XWoTYHZU6yVF6ehTJq4gLPmzP4vQezEGY+oZP+CTPEsJvo
	 A3Kh6aTlasrRnNS/gClUH8n1OafA/imF5w7L1FlitdISeAMMzlws/1KavVlODq00jL
	 MXUC2S/hRAq9T0c9/A6+2Cy3WUfYJ2cR+BnLGe/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 829A6F800EB;
	Tue, 12 Jan 2021 17:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE6CEF8026F; Tue, 12 Jan 2021 17:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24BC7F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 17:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24BC7F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JnmS99in"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EADE23107;
 Tue, 12 Jan 2021 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610469754;
 bh=ozTM9TbpL7jJfB6jEgL1Di/HoDnUbq7AO4YD0p5hmCY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JnmS99inSurWuTlVM3a9rq4AMXtR1a6ugO5Bcsj1uNRp8HgIA6vNEVgu+eZ36TJSC
 dSF6tJ2ebUN0SCi4ANJ4oyMxAD78OjcBEJLs58nCRNQKcR26zmKvnVb6z82t0kmmEX
 2vFVVjHjreVeDBi4hy0GF716GDn2M0sD0WvOGHpf+UlVdBtXGcAgqZ19cWw57IF8wm
 xGmEBwm0daamSeAQKGLLjrmYf8K9y7e7Sjm69umPxYl/ZV+i+oEMQMgNUX/86gsnb8
 8zoilLl+hEv2n6Lw62BOEjTulSHHo4ioTlPH+LD+2mOev5VceArmOJocL97tl7ha7C
 BXrXMoBgkd/dg==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210105155640.3725238-1-kai.vehmanen@linux.intel.com>
References: <20210105155640.3725238-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: add mutex to protect the dsp_power_state access
Message-Id: <161046972100.805.12166738575132877085.b4-ty@kernel.org>
Date: Tue, 12 Jan 2021 16:42:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

On Tue, 5 Jan 2021 17:56:40 +0200, Kai Vehmanen wrote:
> There could be more than one thread read/write the dsp_power_state
> simultaneously (e.g. hda_dsp_d0i3_work and sof_ipc_tx_message), add a
> mutex power_state_access to make sure the access to it is mutually
> exclusive.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: add mutex to protect the dsp_power_state access
      commit: 8b66d7c58c11cf3b1a1cea738582367a96cdaaf8

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
