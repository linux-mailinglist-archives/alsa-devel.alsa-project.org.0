Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 755964CAB14
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:03:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAF91F5A;
	Wed,  2 Mar 2022 18:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAF91F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240613;
	bh=y+uH68d5vOrwOdfWEH+3AUW1R2sFaFUxb00XYMAIJbs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYAyJ9OivjDBMhj+qk1FXFeVWs0ruzhyU5UAPIuVoBZRNPp7R5OHPvCUzV31PTrG8
	 EvBSMOYPWHmBjyZgops1ZFALiyG6C+UdYZPpLQW2Y0I0BPZNk5SgWeMvbgrcrwyW+b
	 a0e+EPqqOsplMJyHEu20b0O08RMZhq8RE1hDxc7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC882F8052E;
	Wed,  2 Mar 2022 18:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C7BF80526; Wed,  2 Mar 2022 18:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65029F80516
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65029F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PD046Pi2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A49B6192A;
 Wed,  2 Mar 2022 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227A3C340F4;
 Wed,  2 Mar 2022 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240461;
 bh=y+uH68d5vOrwOdfWEH+3AUW1R2sFaFUxb00XYMAIJbs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PD046Pi2CB9w8aa3ZwREtbhdUmxerhXJ5fRlQd9Qvrc8oWXhfucHYcdH4ekUar4Xg
 L6HIkrPfFeCfiU3RmfpDNZFK9slcTTQwKCKM8S3tipuR0WpyGLzajJw8I+D1775vg8
 TahVq0a3LkOgP0I00qSdukWY+0Fs6cT/zPtKZ4thLNA53Otu5mZteY5UJPj1PoUyv5
 Mk5/TwywvIv7K4eHtpn/pC0UkdQi3rnjN5W5cp30vT+1N+Ve92Kl8RzcXuerek6O+5
 G8ppwQAO8emEBLAqQE9tSqGiKBPRk6eE/MZodBYtsbYCRRnCUhozkjuZdyNEpgx2uA
 Of0tBKjjgUxSg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, codrin.ciubotariu@microchip.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, claudiu.beznea@microchip.com
In-Reply-To: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
References: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: atmel_ssc_dai: Handle errors for clk_enable
Message-Id: <164624045886.1145067.17267254890476226513.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 1 Mar 2022 17:06:37 +0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error if fals.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel_ssc_dai: Handle errors for clk_enable
      commit: f9e2ca0640e59d19af0ff285ee5591ed39069b09

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
