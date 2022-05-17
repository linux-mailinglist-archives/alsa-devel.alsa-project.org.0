Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C396552A788
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6320F84C;
	Tue, 17 May 2022 17:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6320F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803232;
	bh=fERQZggsBwWdHxLHZxC0R2Zo7qJEWV8qww8X1ChV7yQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RtruH985TN5BSGMiTcrAwjGDZT7GrrlgaT5HVIS4lK3yVc8fbHKw6ZTASAjbcnEKj
	 tlBaALSf+wXk6JsVtu/5LoaaggIXZwig3HNcGU9/Awc45ZEMLYsbOpM6akal3dY6gZ
	 24bYbH3B+JS9alZTmg1PWL+c4xNcRjbaBWCyJVTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B38F8047C;
	Tue, 17 May 2022 17:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6941F80310; Tue, 17 May 2022 17:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F046F801D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F046F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UmswcLTQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 583D6B818DF;
 Tue, 17 May 2022 15:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50C4C34116;
 Tue, 17 May 2022 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803167;
 bh=fERQZggsBwWdHxLHZxC0R2Zo7qJEWV8qww8X1ChV7yQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=UmswcLTQcZ6lYohR+eGjuKxzz/8hmQSfYpceg8ruIh3IcM1uLe4ucUO/QGLDH/NHi
 amZVYSEL2ZvFXzKDCS9TYFBNnmHOUhy+5Y6RDeM7S650l39uIg7CFMzgqVsTeLavUb
 tRy3q0+U2GDPeU7tGCfYQye7JFjfRJ8iN6euPxdMVftG6LzSEYMBHJd9BqyMOpFY2G
 GUjijiX0OUIRY6H+G4kdEb3okth1LkLkUlYFPZbj40EKcTugJMhew8AauQzJqt2CQ4
 GoaZrgLp7ukC6qONRfMshQoycYExFIFBGRUUJIoIoygKbwghAxs7Y4W5olp+1USBd4
 jFOU+73QxR+XA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, linmq006@gmail.com,
 peter.ujfalusi@gmail.com
In-Reply-To: <20220512111331.44774-1-linmq006@gmail.com>
References: <20220512111331.44774-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: ti: j721e-evm: Fix refcount leak in
 j721e_soc_probe_*
Message-Id: <165280316539.1635268.5141203985086127855.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:25 +0100
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

On Thu, 12 May 2022 15:13:30 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: j721e-evm: Fix refcount leak in j721e_soc_probe_*
      commit: a34840c4eb3278a7c29c9c57a65ce7541c66f9f2

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
