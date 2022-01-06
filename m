Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D004486B2A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D445A19FD;
	Thu,  6 Jan 2022 21:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D445A19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641500970;
	bh=AAcqZiHkbGXIszcYuW9CrI5KI51itS0JI9XIaGI3/R0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H99QRJQgmQO8YuN21Nxj7dekjQlKSDkM+vO0lwbANqwStZHvwyFOAIFLmWFTlLphy
	 UJCS7+NweA6QWA6BpXdcxvWs8M0WRrGx6iNMspwYcs+5BfZIFPXfvbHY9RbBUWYXSx
	 vCLmRl9+ahXmE5+lAbtIZtg2jO/Oey9SYEeDxQPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A453F80158;
	Thu,  6 Jan 2022 21:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E179AF80161; Thu,  6 Jan 2022 21:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCCACF8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCCACF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QlSrKt2P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB8B261E17;
 Thu,  6 Jan 2022 20:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074E9C36AED;
 Thu,  6 Jan 2022 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500890;
 bh=AAcqZiHkbGXIszcYuW9CrI5KI51itS0JI9XIaGI3/R0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QlSrKt2PXNHMmqFbLpaqXkS5xUHppUORFKOzb21q2zpPlZoUNEeiw5C0M1Cq5MfRj
 sDOmLa4WOfx9rdqQzURh5YpJmw5bURozKKiXH777FAnBg6nteGLoq8rdw1mX3YmZPU
 4tcPFI63u/ThxbzKpWn6qrI0NWTUWjJrYez0ZoOIQbivLvqV3KzORf3cZnGcsX2i4v
 Q5ZwA18cvK+jJ3UCquSKdwmfDpbhPpTUsJZ6OHtqWblVKhX+tRAxIgXTif/HfS3tTW
 Cxe4EUimM9UyEBn1idRTE9EykQQDpCbch8Z3mAbVu7wVxYVVYrTEOngcIspndwhxCU
 CAS64mIO7xoJQ==
From: Mark Brown <broonie@kernel.org>
To: Qinghua Jin <qhjin.dev@gmail.com>
In-Reply-To: <20220106092847.357035-1-qhjin.dev@gmail.com>
References: <20220106092847.357035-1-qhjin.dev@gmail.com>
Subject: Re: [PATCH] ASoC: topology: Fix typo
Message-Id: <164150088874.2243486.7338777476299923707.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, 6 Jan 2022 17:28:47 +0800, Qinghua Jin wrote:
> change 'postion' to 'position'
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix typo
      commit: 00ac838924f73b51e82994c7fc870f0a994e4d34

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
