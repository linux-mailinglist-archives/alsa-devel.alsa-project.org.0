Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2205BFAD8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016EC1640;
	Wed, 21 Sep 2022 11:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016EC1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752364;
	bh=ofsoQwLujMqNHbDx5gQiRXiSxruzrBVrQ2FYpxBtOtY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuB0hdIcSOOwPVTnZJ1DIUFJvOZpklq9pQm5Jnk0Ku2enzkiR9doE3TES0HBD6r+m
	 /wMTbaMQyBbvItCoeRJn++xUfsLgCm8jWxcPqhYyN50cLCJHQyK4xNkuWu8CR+84Ke
	 Yw2rzxzTicnbNVLm+aNyJ87iJVa0lz3vs+wfIfVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD533F804CF;
	Wed, 21 Sep 2022 11:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE94CF804C2; Wed, 21 Sep 2022 11:25:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61D8DF80169
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61D8DF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V3OxNHyS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5907C6303E;
 Wed, 21 Sep 2022 09:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DC5C433D6;
 Wed, 21 Sep 2022 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752301;
 bh=ofsoQwLujMqNHbDx5gQiRXiSxruzrBVrQ2FYpxBtOtY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=V3OxNHySGxo6GNs4UsSKXA1PK0RrRykgstNijVQ85SVx3MH+czYSpCCjE2G/m0p0Q
 DTVqVUiM9uDvJ2xYdCkrMwUOV1rF6g1zTWZtkHqlh49Q6K9pJrvq2EDtsrhocsqS7b
 2RFUeU5HcZYr3G8ibbGx2OnWoglYb0MQrSxTv0r1ECCXc0oCiWUiv9MzuofK65IDHi
 36pUolgtw34tasP0VE2YuPUAHOZSIDYgUETgsYcUhi/fuu998E/BXsFnHUOV2RVg3v
 SYD7ZsqQcHzLaN4luPB6QONAc2mp3s9gVG33yo+OYax0lJm6twBsGE7OTIYcVdf1ZE
 i5Cu3TKYAZpVA==
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH 0/4] ADD SOF support for rembrandt platform
Message-Id: <166375227653.526450.11920634048868931636.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:24:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Vijendar.Mukunda@amd.com
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

On Tue, 13 Sep 2022 20:13:14 +0530, V sujith kumar Reddy wrote:
> This series consists of
> 
> 1.Make ACP core code generic for newer SOC transition
> 2.Add support for Rembrandt plaform
> 3.Adding amd HS functionality to the sof core
> 4.increase SRAM inbox and outbox size to 1024
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: amd: Make ACP core code generic for newer SOC transition
      commit: 4da6b033f5454ccbac2d5795d7edfb3f2a777104
[2/4] ASoC: SOF: amd: Add support for Rembrandt plaform.
      commit: 41cb85bc4b526bb228579c04857bc58213e5f9b5
[3/4] ASoC: SOF: Adding amd HS functionality to the sof core
      commit: ed2562c64b4f2cb434420f7d2818d0388250ac1a
[4/4] ASoC: SOF: amd: increase SRAM inbox and outbox size to 1024
      commit: 40d3c041e2f871b3d2d78c8e360224f788ac17ab

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
