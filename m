Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807ED5B6E6B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 15:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E34431751;
	Tue, 13 Sep 2022 15:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E34431751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663075989;
	bh=F0cqZytYnDM1UyPSUoRFaYeWA37WWne+bdR5WeTUuDU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8QJSPvQuimljljT2g5cg7P7qbzQwpusKo5e767tVOAnpooNOMNWdLtyXXv/eBvRl
	 CmgrCQIY8D4/Ml4oaNpfztiUQwn6Sw72ljFhGK/CVzYU5xH7JlhLZ2ZgGnKxy2AKgj
	 8eiNR9yaTIAqA/WMS93ykltsIN1p+DxK8zlD2Do0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51140F8025D;
	Tue, 13 Sep 2022 15:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B426F80224; Tue, 13 Sep 2022 15:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8F1F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 15:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8F1F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RVeOTrx7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7A5F6147A;
 Tue, 13 Sep 2022 13:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4674C433D6;
 Tue, 13 Sep 2022 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663075921;
 bh=F0cqZytYnDM1UyPSUoRFaYeWA37WWne+bdR5WeTUuDU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RVeOTrx70ClhJ+u3/hFZKiE4NdznV8itDQ54ZlvRZTayU0imDhgxDux0kiR3LYGkF
 SExpFFn+xFNKoMKeI0Yc+DP46uBLCyIUGN+05lYIL6wUdhkzMBjrH5JfKccH5bAKq6
 xCIjiA6gM6/yBkocCWnJYU072SRbShqmumLKnKK0eOkimaTic3PiK4DS27vpV4FPff
 HcEA3HSuxw79hZbO9wEJdyR6AN6TAhEYJ4wHQlnNbQQd7d1ws/adm5KFSeEMRm/0/Q
 MVCjEIWykRyQV1ySASIObu5T+peSkd/VnK8LtviFdAfQhuM5KVkCly4ADv7TeSmall
 lVggVdBoHkLRQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, 
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, festevam@gmail.com
In-Reply-To: <1663059601-29259-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663059601-29259-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-card: Fix refcount issue with of_node_put
Message-Id: <166307591852.124960.4909394552213550357.b4-ty@kernel.org>
Date: Tue, 13 Sep 2022 14:31:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-95855
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 13 Sep 2022 17:00:01 +0800, Shengjiu Wang wrote:
> imx_card_parse_of will search all the node with loop,
> if there is defer probe happen in the middle of loop,
> the previous released codec node will be released
> twice, then cause refcount issue.
> 
> Here assign NULL to pointer of released nodes to fix
> the issue.
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: imx-card: Fix refcount issue with of_node_put
      commit: d56ba9a04d7548d4149c46ec86a0e3cc41a70f4a

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
