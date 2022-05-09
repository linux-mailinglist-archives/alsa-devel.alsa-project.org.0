Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299652042D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13CC11679;
	Mon,  9 May 2022 20:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13CC11679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652119658;
	bh=gGfUxs0/w+zjfDmY/Qhn/XynbQHVpf03rg4HBdcEACU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igg1ixMGAexJ6zXgycR6ukAV3b8avuIDr7SSPBUhR0ER4qSl4G2WP40yhbHbet8zf
	 Y1l/C8wO/9ch7x+AVkvodAkm/cw1DlFqLCeJlT0tLa7q3XNv0BnIMgcV66+AiewC6Y
	 uSO61s9GYgXWgOV+DjkVzBCWUxtovejrjDKveo3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D47F80511;
	Mon,  9 May 2022 20:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 132F7F804A9; Mon,  9 May 2022 20:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A35CF800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A35CF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kJI8qMJU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79958B818CE;
 Mon,  9 May 2022 18:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCAAC385B6;
 Mon,  9 May 2022 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119536;
 bh=gGfUxs0/w+zjfDmY/Qhn/XynbQHVpf03rg4HBdcEACU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kJI8qMJU76rImKVJolra9Tvt1KxAzVFxHIl/UHCy5musRzZjSz5UL7UbxOdZS3Q8a
 8n+j2BFjcUO06W1VPNlvkuCBaIBHuBUrQDRntmTJwD/djHNq+ZPGphEJWizALurXgt
 k4v0vHY++LY0yTVuHx7f0q0iibILCT9t6gKohjXOKvriVKhcUafOo8VzOwpZHJYEpD
 EOcZvDdo/g6mwQEC5cw1gPz39bzEseZh//zFukhRqL2DBvcEABQXp7Ty3zww6Ra9sZ
 IMsEoQ1IRnol84HBH64+lYcOT59YcTBDPsFVDHRJ2kQl6tbP74Fd/Oi2z1YMdTAq9I
 w9NqnqXC32CQQ==
From: Mark Brown <broonie@kernel.org>
To: lukma@denx.de, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220509121055.31103-1-lukma@denx.de>
References: <20220509121055.31103-1-lukma@denx.de>
Subject: Re: [PATCH 1/2] ASoC: wm8940: add devicetree support
Message-Id: <165211953463.1181242.11641287577145582350.b4-ty@kernel.org>
Date: Mon, 09 May 2022 19:05:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

On Mon, 9 May 2022 14:10:55 +0200, Lukasz Majewski wrote:
> This adds devicetree support to the wm8940 codec driver.
> With a DT-based kernel, there is no board-specific setting
> to select the driver so allow it to be manually chosen.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm8940: add devicetree support
      commit: 3a3610aaa9dce8ef1257bb42ac7f0fe2b5809a54

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
