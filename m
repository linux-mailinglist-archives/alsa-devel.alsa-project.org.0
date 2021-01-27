Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75417306244
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:32 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E7F1712;
	Wed, 27 Jan 2021 18:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E7F1712
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C9CF8025F;
	Wed, 27 Jan 2021 18:14:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7523DF80259; Wed, 27 Jan 2021 18:14:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DC7F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DC7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lQR7gdJI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B9B464DA1;
 Wed, 27 Jan 2021 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611767671;
 bh=0D1p4kLLLDUuI0gaZLyKN31QQyNwo7NbDHp7WCui4NU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lQR7gdJIctgvlDOV6X1Xgbt1wEqkrBRE8wbnCLLlBYMJW6SMCRsJ+M7Fwc++n8leN
 37xaUbaMPTqs1ZweR7B0+xqEplhSNQ64jAc+lTfFwqjXqKNefXBgge1V4Zz16mPznJ
 kKjYN763WjV/s+Xbprp8rQ+pDO80KDuF1aQZ0XeEQ9FWNeh3m7ni48W6KikMnSUmp4
 SdB+Lf3Bu/umNi3Q0uy+otdxtin5i4Kzn2TV1AioAC8yS7kPTv/zIMdz24T/Ni52V2
 MEyzuGQfOR8d8AXQbXMA2pjYNK6ZceQSzlSrBDmYdMEQiPe3AQ9wiwoJ3K0oHa3p3i
 fh4EXXpu02low==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210127020737.1088960-1-ranjani.sridharan@linux.intel.com>
References: <20210127020737.1088960-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: Intel: hda: Enable DMI L1 for power
 savings
Message-Id: <161176762854.34530.12970775587911345676.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, sathyanarayana.nujella@intel.com
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

On Tue, 26 Jan 2021 18:07:35 -0800, Ranjani Sridharan wrote:
> This series includes 2 patches that enable DMI L1 for D0I3-compatible
> streams and trace DMA stream to maximise power savings on Intel
> HDA platforms.
> 
> v2 changes:
> FIx compilation error when probes feature is enabled in SOF Kconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: hda: enable DMI L1 for D0i3-compatible streams
      commit: 89a400bdeb129dbc7e1c8ad2151cc8141a619709
[2/2] ASoC: SOF: Intel: hda: Enable DMI L1 for trace
      commit: 6e0210763024ac43c5716dc873065ce5069edbf0

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
