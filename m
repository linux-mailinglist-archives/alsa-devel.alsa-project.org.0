Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8646A3C4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41D0218D;
	Mon,  6 Dec 2021 19:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41D0218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813863;
	bh=2RiRaDMe4pCK1VB/Bu/ITd8PZTYEbSQhnyGAdnBQUrk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXeMZXAuZHGwqD2l99RcHPBKqOa3gwQoGjyiBnmAoEwJ0prE1vjMbnAskmUlxvrtc
	 3ot18hCRtnvwm/36JZIEog7EGOa0729FgE+hSHx2Rxtx550udVQKFyYhR2gPoCJAMa
	 LC8WQUVGEWDIsfQsjeMC5UTbykQcM2VgRCYnkcks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B423F80527;
	Mon,  6 Dec 2021 19:00:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E60F80520; Mon,  6 Dec 2021 19:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110B4F8051C
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110B4F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XlI4NPX0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A761AB811E9;
 Mon,  6 Dec 2021 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02DCC341C1;
 Mon,  6 Dec 2021 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813645;
 bh=2RiRaDMe4pCK1VB/Bu/ITd8PZTYEbSQhnyGAdnBQUrk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XlI4NPX0kqvOLhI7fnk4Iwv3mg3BDGMu80RHDRDWvAyJAaklrga3eGZ7XKR9z58mQ
 ZGr4RHfoL3Td6RkVEzP1b0veYy6sWLOZTlQfa0apubFRwresEEl2AxsAbVDrHxgzBt
 SoW7YhLmvm+dKBgYHOcN5M6Und6tG7or3xfdH/DR9S/t2fZGcPDy8fgPQqGCnRc4Fz
 9JJ051TZUqWIfU3XqC8hOQrMe58l3RwT0Mi8gjEFrh+pAr8mpFpKJGMN7DuP9Tv31e
 lu6qPmgMoo4XJneKmZyrfQCyJo/BqahBJnnusEgZTNylYJFnzC09K69mR+tJLYEJFu
 xRtgUObS75QtQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Ameer Hamza <amhamza.mgc@gmail.com>,
 perex@perex.cz, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 tiwai@suse.com
In-Reply-To: <20211205204200.7852-1-amhamza.mgc@gmail.com>
References: <20211205204200.7852-1-amhamza.mgc@gmail.com>
Subject: Re: [PATCH] ASoC: test-component: fix null pointer dereference.
Message-Id: <163881364233.2769299.1844028008704672549.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
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

On Mon, 6 Dec 2021 01:42:00 +0500, Ameer Hamza wrote:
> Dereferncing of_id pointer will result in exception in current
> implementation since of_match_device() will assign it to NULL.
> Adding NULL check for protection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: test-component: fix null pointer dereference.
      commit: c686316ec1210d43653c91e104c1e4cd0156dc89

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
