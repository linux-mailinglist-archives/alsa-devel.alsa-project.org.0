Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7A5A7E08
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 14:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF3E16CD;
	Wed, 31 Aug 2022 14:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF3E16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950440;
	bh=DyeODZ+gC0WuqPypGEZqeNPo3/H5VBEkRk78HqWNBbc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvPasSjjajQTH0c4EYlfZZONCKdXofZdcOoMmudVU/CruTWoP5PprDktO+oCXXFOU
	 n5aFN1Mv8Kwkqi0/z9l9eLZ2eO6332TNPwVUSlSt/c+tZ+XSYP3+hkxIjFGvOFjmLU
	 DUmYYj87LbBC8z4PDrybZ4jleL/0j/t5r3IzoIto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD383F804AA;
	Wed, 31 Aug 2022 14:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59FC1F80128; Wed, 31 Aug 2022 14:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F231FF80128
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F231FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tS37nHwK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 337BAB82077;
 Wed, 31 Aug 2022 12:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333E1C433C1;
 Wed, 31 Aug 2022 12:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661950373;
 bh=DyeODZ+gC0WuqPypGEZqeNPo3/H5VBEkRk78HqWNBbc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tS37nHwKrpgZlmSwgPfLXMSXc8KLzYFsqw+PhEjNt0e2w3YH4RgR+wIgOngkK87CG
 5JmLeXUHkBLmRBLx3JSf6F9RG5qEnRlKObLNnPRW5JH5UJAerzAGtOAfK6vCyta4BB
 0PAJTU81Vfnud1G65ol5o/j0GNR0ta/usYz0XB7gsYrNK5r0xN/AHnaT5l3e3xWVuB
 5Sl3opk0OtAQFZw2HxiTAd5PUbwJzEdKJf+2K0zBHGOl+jwtcMYEIet5Z1BYmg7TH6
 KeNce0NR4tiiEL8MR7R0SoXk2Pv7m3gHcyLcjG+xCMnElGdgaO5In27yNIgDokrEyF
 YsaGiLk5V78yQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
In-Reply-To: <20220822101502.17644-1-laurentiu.mihalcea@nxp.com>
References: <20220822101502.17644-1-laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: compress: Add support for timestamp on
 capture
Message-Id: <166195037191.99184.7695234970678699743.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 13:52:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On Mon, 22 Aug 2022 13:15:00 +0300, Laurentiu Mihalcea wrote:
> The purpose of this patch series is to add support for
> timestamping on capture direction using the compress
> API.
> 
> This is simply done by splitting sof_compr_copy into 2
> functions: sof_compr_copy_playback and sof_compr_copy_capture.
> Each of these functions handles one of the possible directions:
> capture or playback and is called in sof_compr_copy based on
> the stream's direction.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: compress: Move sof_compr_copy functionality
      commit: 272ff8828f35658aace17e3227624fbbd68a6bcf
[2/2] ASoC: SOF: compress: Add copy function for capture case
      commit: 1a01e19278022cd2f7daa7a065ed47c5022dbad9

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
