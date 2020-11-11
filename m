Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA92AF56F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 16:49:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F0DA176D;
	Wed, 11 Nov 2020 16:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F0DA176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605109769;
	bh=TTNoL6GBlWNK0Z3Z/H55ys2nW7UK0eo8aEagF6NmeZY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUsSPiVOnGn7zjzon0v7Tj6OfhmWCpCW7R2PSgPvouv+xtCIBef3bY4QOYXe64QBO
	 GKN9Ep4WXJFFz0D3ztNq2frk2teKTU89kVMjnzkZ9t/lOnGY+tEyBT9GZ2RxwAYB5r
	 iN3HHnpWKIXkmajgREA9sqTHCc3yv9K0Is0f/MPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E23F8025E;
	Wed, 11 Nov 2020 16:47:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 970C8F8020C; Wed, 11 Nov 2020 16:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A59F8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 16:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A59F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="we78jZ9o"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3745520795;
 Wed, 11 Nov 2020 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605109659;
 bh=TTNoL6GBlWNK0Z3Z/H55ys2nW7UK0eo8aEagF6NmeZY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=we78jZ9omwC7/HZcSka80t8XOSOZaRySnn7Va6Kg0o1uRxXCDEvwmcJajgultKo+f
 R0diERYRDS6b2a9JBCQKbPnoDlv7oQxYfRGIfmuTMvgun8eOIFv48MPNoLb9QZJzA2
 5zFzXjnNmcRE9NKCIQq7p/xqt3LoFQ+LWwNg4MZw=
Date: Wed, 11 Nov 2020 15:47:24 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org
In-Reply-To: <1605062722-8711-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605062722-8711-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8192: skip first time data at the
 beginning of DMIC recording
Message-Id: <160510963229.12073.3065618911548119366.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com
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

On Wed, 11 Nov 2020 10:45:22 +0800, Jiaxin Yu wrote:
> We can choose to drop away any length of data from the beginning according
> to project needs. Some projects don't want to throw away any data, because
> they want to use recorded data to do echo cancellation, so they have to
> make sure that they are aligned with the reference data as much as
> possible. Or there are other algorithms in the upper layer to eliminate
> this noise. Or some projects want to eliminate this noise form the kernel
> layer. However, the minimum recommended value is 50ms to skip pop noise.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: skip first time data at the beginning of DMIC recording
      commit: 2aff94e47da2e2006ceb53c00247218ea8a72770

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
