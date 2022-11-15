Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34202629501
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 10:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA701AEA;
	Tue, 15 Nov 2022 10:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA701AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668506277;
	bh=OxSSLC5s3zYlfc0BwFA+5cZFGoeym1E5oa0EER2/Ll8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjudzBrknIArovZeXJoLRZaZyG/KJnTCC917Q/xh2Oevk/bwtH7+madMkf9J0y2wz
	 8kcANxhGU82C98yg26VxwiM5+tvz5XqiYl7UbjqIw1K4L+aSe3c+m628ue3KYOiAi0
	 6158yiqGvizEcaF/qG4oGd6dNw/DgPOGK4/8hDDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48CE2F800AA;
	Tue, 15 Nov 2022 10:57:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5066CF804C2; Tue, 15 Nov 2022 10:57:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 414CAF800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 10:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414CAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rBr+5SQ/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BEB9615DB;
 Tue, 15 Nov 2022 09:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3898FC433D7;
 Tue, 15 Nov 2022 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668506211;
 bh=OxSSLC5s3zYlfc0BwFA+5cZFGoeym1E5oa0EER2/Ll8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rBr+5SQ/iwmYPVxhEa/zE/oLpD5/FLlqHcfk2v+v12T8o6+JRAzpGQQ4/RNGMmOxc
 I9O0uBKbH076JhfhBrQhXP9PFDcye8eYTIB0OTRbR8CuKE9AG4e0E8u+Qkb9GuHvBA
 1DNaSdZy8VVUFYIcu3hmqEWl6AmJCLEmC9KegNa+YP4UeUduSlsujmRnCRnvb4W17C
 kQbTBJZC/uPJbeVzeAQK0oZKOP0xLTnIml/bEDU3hI5hTn6EPtAJlhyU20GOmPg/s9
 13ZLxu7k+ei6DKhYi/8XV7/sCvJvBg6SqgD/C2r4iKoPvyf31XcVG1M2iKZd3vxIL8
 EwcMmovNEeW5A==
From: Mark Brown <broonie@kernel.org>
To: fengzheng923@gmail.com, ye.xingchen@zte.com.cn
In-Reply-To: <202211111641514826535@zte.com.cn>
References: <202211111641514826535@zte.com.cn>
Subject: Re: [PATCH] ASoC: sunxi: use devm_platform_get_and_ioremap_resource()
Message-Id: <166850620892.114707.3764390592141990223.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 09:56:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 chi.minghao@zte.com.cn, lgirdwood@gmail.com, linux-sunxi@lists.linux.dev,
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

On Fri, 11 Nov 2022 16:41:51 +0800 (CST), ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: use devm_platform_get_and_ioremap_resource()
      commit: f8fd5f4813b6d8bdd003ffe164e98bfa01b1c830

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
