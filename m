Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0561656A58
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:01:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72DD73C0;
	Tue, 27 Dec 2022 13:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72DD73C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142464;
	bh=9UO0u0YE/X0JRi2NrzH12RftroDggzBoi0U4dy+j8Z4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uUbC2egPfNXigG2qrsyfU+SfVPcSOqlOs06Zh/CeoZjfvfC3vj4+PIvJfhJ6QnRdy
	 VQ8SnJ1SCw9SHhZKEhGaR8S/OpuncUnKZXR7PpnUDbCzMgTjHoZeJr8pzdSvMUF9y0
	 LFKUJ01feLt0y2wdH5tZMdcvYhUjVEGEpG5hm8qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E85E6F805B0;
	Tue, 27 Dec 2022 12:57:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B720F8058C; Tue, 27 Dec 2022 12:57:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FFBF80587
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FFBF80587
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ahGyD+G0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 165986105A;
 Tue, 27 Dec 2022 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE26C433EF;
 Tue, 27 Dec 2022 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142244;
 bh=9UO0u0YE/X0JRi2NrzH12RftroDggzBoi0U4dy+j8Z4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ahGyD+G0oq24GFRQJsUurbEgmB698wUJQLf46I5UATmFotHyB7xQaXgsUAxcjEuzz
 dzMXBg/yqjHyzbD0XwMV07GRThqV4zJKzR+W2R5sUU7QOiGnyUMwV9FS/JH0MuLXUw
 TNAjTDo2qw6bQDwqXYKHFmxW6BRRAoYU4pYcjZg/0xesqQd/intshER2OhSgGX5jsw
 rYX2H/VUM2khfPIccYrjbjkT9h/osYXMN/wxnYUOUCU9pHwFTNSbgrVP40kWoYrm8k
 JtfmoLDvd4eKWthnHE0M1paymbs2In4rdY+rB13y+DhLttHtnlBe8H+o9BxjvsjLHm
 b1frMm9AahY4Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221216115350.28260-1-peter.ujfalusi@linux.intel.com>
References: <20221216115350.28260-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: IPC3 topology: Print the conflicting bytes
 sizes
Message-Id: <167214224262.82924.4835724530620803921.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
 seppo.ingalsuo@linux.intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 16 Dec 2022 13:53:50 +0200, Peter Ujfalusi wrote:
> The error "Conflict in bytes vs. priv size." is too brief. With
> the printed sizes it's a lot easier to find the size issue in
> for binary control if such happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: IPC3 topology: Print the conflicting bytes sizes
      commit: 8a0eb06e0c9a613fce989e9d94de3f290b81e356

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
