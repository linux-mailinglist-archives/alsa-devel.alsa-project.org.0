Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACC2AE1E9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 22:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740361720;
	Tue, 10 Nov 2020 22:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740361720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605044401;
	bh=Dnn9xhJQuhx3Vu8Th8XlsV0/yj6/XXQ3FI+0tcVaL24=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rndPEIxIupd+5oPtM99sfRdcgyhzf4M+SBj3KNcDaLzH9bsp0eKXOB7L9RuWU6oXQ
	 OKLDMfr2rj32niG2UqDvv7Unkwfg+l8u6umyML62HT8xGnVoTluatS5oJOmBaVPgaj
	 9jAYnUsdTU09qi4PqAkJIbZTVf9rAJ+KVJovyfyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCFFF800AE;
	Tue, 10 Nov 2020 22:38:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C60F801D5; Tue, 10 Nov 2020 22:38:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6BCF800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 22:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6BCF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nd7qsKYf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BACBE20781;
 Tue, 10 Nov 2020 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605044298;
 bh=Dnn9xhJQuhx3Vu8Th8XlsV0/yj6/XXQ3FI+0tcVaL24=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nd7qsKYf8nStOia/h2+74tunlWUmQC4lvIYBfAa65hF2aNPnKwik5AG8THdg9mq/D
 auTCgg1v5m6f/rcptmgwKZiQtN3r7vDZJYfeifVSCdOwKDz9ndjcRL9uU98baG65mA
 PKnt49STGhSd4nT3CXRcSh49Apuaan29LR4lozRE=
Date: Tue, 10 Nov 2020 21:38:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Patrick Lai <plai@codeaurora.org>
In-Reply-To: <20201105125154.GA176426@mwanda>
References: <20201105125154.GA176426@mwanda>
Subject: Re: [PATCH] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
Message-Id: <160504428419.41991.2200034841116895694.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, 5 Nov 2020 15:51:54 +0300, Dan Carpenter wrote:
> There are two issues in this function.
> 
> 1) We can't drop the refrences on "cpu", "codec" and "platform" before
>    we take the reference.  This doesn't cause a problem on the first
>    iteration because those pointers start as NULL so the of_node_put()
>    is a no-op.  But on the subsequent iterations, it will lead to a use
>    after free.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
      commit: 4e59dd249cd513a211e2ecce2cb31f4e29a5ce5b

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
