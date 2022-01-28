Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39F4A0488
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:49:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B8F1747;
	Sat, 29 Jan 2022 00:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B8F1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413749;
	bh=5apkettzIiX+OPI0gdZmyvbdiXBJsgjX2ch0UKkff2I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ux4QK1fvEw262AMiZn4IZ8BtIk5nSczD8sCM6kBIu5UUg4whq36vGDVVyGEDr/jlQ
	 e65hUIi4lmqjpWcn35hXWXqFfQHYxlD0CrjXGN9vp5OvJLnY9lrWhJR98/ieEQdgzs
	 +QZYEJL/hhqoCzFGrALORuXeKivlismB8oe85SIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D93F80516;
	Sat, 29 Jan 2022 00:47:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7EAF80246; Sat, 29 Jan 2022 00:46:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F37FF80118
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F37FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UjxaIaY7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C47961EE5;
 Fri, 28 Jan 2022 23:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA14C340E7;
 Fri, 28 Jan 2022 23:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413610;
 bh=5apkettzIiX+OPI0gdZmyvbdiXBJsgjX2ch0UKkff2I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UjxaIaY7dJeMsOQ8Bf/NB5fqHYz7r7aDzcuraEaF6ZfAak/6EqJanXB2w4/hifrQT
 4tkvQXWsfI2GYqp+ZD1DlOlUDMC1txcquWme3Dvw0rFYaEFVYlFSxKw/WSPzierN3i
 R6Vao+LZ7fF3nLF6fhGNUveWXC4NlvFP+SEJgl1CWMV2/fEGXoYUkfr+UByREm7tiG
 LYJ6vkc8UcFlHmuqVUQRjCXRFv/fMCHwpd84Wb5ox/owjekANyIejoPkOdJ96Vywn/
 p0XFJlSgqKn+24iqirup8TaqrWbS2pUYBQV8Yc4U3olEqk2zLBCZPi+MqPtYz63h5p
 yLJV6y6vrwFXw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220112195039.1329-1-digetx@gmail.com>
References: <20220112195039.1329-1-digetx@gmail.com>
Subject: Re: [PATCH v1] ASoC: hdmi-codec: Fix OOB memory accesses
Message-Id: <164341360910.694662.2417882289675781544.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 12 Jan 2022 22:50:39 +0300, Dmitry Osipenko wrote:
> Correct size of iec_status array by changing it to the size of status
> array of the struct snd_aes_iec958. This fixes out-of-bounds slab
> read accesses made by memcpy() of the hdmi-codec driver. This problem
> is reported by KASAN.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: hdmi-codec: Fix OOB memory accesses
      commit: 06feec6005c9d9500cd286ec440aabf8b2ddd94d

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
