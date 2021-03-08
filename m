Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D96331320
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:15:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D483F192C;
	Mon,  8 Mar 2021 17:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D483F192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615220115;
	bh=5ZxenuEnRxfzPre9OG6r5woaetmVVzyp01P71cOUEI4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERrfqSLxarNFYKlVJ52NVm7dHDmIBp3fGmB6pCEgG8DU6BcaMHJaHTRdpUQgeCpBl
	 6htvJ7sF4rkgN8YfU5PBxyuwkGkOQdcPo9pCW91AYfrBGRdK6+M2Z7K5QTnVFe5Fs3
	 NP1LroX91YrajxsE8P866/3eLzqa4St4i7U6EHcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E6AF8051C;
	Mon,  8 Mar 2021 17:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D67AF804FB; Mon,  8 Mar 2021 17:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F1EF804AE
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F1EF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FlP3VA9Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD30A65229;
 Mon,  8 Mar 2021 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219729;
 bh=5ZxenuEnRxfzPre9OG6r5woaetmVVzyp01P71cOUEI4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=FlP3VA9ZKepWg5/F6l/C/wKWBfJzj9FxaAunQX3+vEqURInAj96aiv8xsqsgsq5Pv
 HeMN9+xB83ZcXUUPLp0lYWRkxIuOWiib2suX57+Ln+8qQrjNXXcDPWsecbP/awBS/G
 6W9WExFp0U7axoirXf2YZWbyHNyYwCMeMRl+jNfw6SiTKij9h+gQdN5LUs+Ry+RamR
 URb9rK9r26AscFSaWq22Y0MfMniaaXSDYY9kJcPSHpJQZjeP1YpRWpVNk2ZXAanTYV
 muiFv8kdewRqCaLhZO974KRku0L4rMOoD7XMRjYYywi8QwZBvVsFD9yK2r7ULqEztl
 fIBMwUDdUDKcQ==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, lgirdwood@gmail.com, sebastian.krzyszkowiak@puri.sm,
 linux-kernel@vger.kernel.org, perex@perex.cz, ckeepax@opensource.cirrus.com,
 gustavoars@kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1615170877-25918-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615170877-25918-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: Relax bit clock divider searching
Message-Id: <161521960849.9621.6433725701226320562.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 8 Mar 2021 10:34:37 +0800, Shengjiu Wang wrote:
> With S20_3LE format case, the sysclk = rate * 384,
> the bclk = rate * 20 * 2, there is no proper bclk divider
> for 384 / 40, because current condition needs exact match.
> So driver fails to configure the clocking:
> 
> wm8962 3-001a: Unsupported BCLK ratio 9
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Relax bit clock divider searching
      commit: 51309c5bec7cfe567a00a667adbffea444845543

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
