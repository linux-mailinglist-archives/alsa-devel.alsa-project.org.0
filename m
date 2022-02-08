Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB644AE1D1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 637DE1833;
	Tue,  8 Feb 2022 20:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 637DE1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346912;
	bh=ZiA/0kD1MBGV+Hm0u53oEM2vLF/uX1qOaIsjpZ+PBCE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0WREunjHwCmNjCliMEItifoYxKSVACAWahk3GahPuJIJ8q/CqFmwdp620nz5YyDT
	 Df3TkmDB1Zhey8G82br9XzMbb//8VMh4ReaOaECT54uNJcibAF1tew7IbKajCstD+a
	 pKTuyShNj+RovIVKyIUJLyYlbd/QpX0iZAZPJjvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CDC7F80516;
	Tue,  8 Feb 2022 20:00:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8829F800E1; Tue,  8 Feb 2022 20:00:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CF1AF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF1AF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bRKcFFVw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 992AD614D9;
 Tue,  8 Feb 2022 19:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61861C340EE;
 Tue,  8 Feb 2022 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346801;
 bh=ZiA/0kD1MBGV+Hm0u53oEM2vLF/uX1qOaIsjpZ+PBCE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bRKcFFVw3Rh6eWe9MKtzOX9riKt95kAMTHRotbWyKOvAsQiYx8bLER47rtmyFVQ28
 2gtLSDyH0CusAmrNTNALv5fkwiOWslUx4kRogK9lQVfVAITkJtCJ7//kYKZhzhw/8z
 Mc/MoGk070OLyWOZIjAyWZQd71L378ni3oQIlFlebJxKoxf7fc45d9kHRdPNgQFXjN
 PrWW5pJfdHQEiTwjB3zIeqzzqIki9tRBR+hlr78jEgt1Mf6W+C3XfnXnLtVYyoAfW9
 zB/W78zEmtX4Dy99jNkfL2v+EWJGNrPafyz6rzhQAF+kVqId87s5NIAxZa/qgvGNU0
 pMd11AkGO/Ilg==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
In-Reply-To: <20220111081518.982437-1-s.hauer@pengutronix.de>
References: <20220111081518.982437-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable combine mode soft
Message-Id: <164434680011.1135369.18398048373911461432.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 19:00:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, kernel@pengutronix.de,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

On Tue, 11 Jan 2022 09:15:18 +0100, Sascha Hauer wrote:
> The fsl_sai driver calculates the number of pins used and enables
> multiple channels if necessary. This means the SAI expects data in
> one FIFO per pin. The SDMA engine only services a single FIFO, so
> multi pin support doesn't work at all.
> 
> This patch enables the software combine mode in chips that support
> it. With this the SAI presents only a single FIFO to the outside
> and distributes the data into the different FIFOs internally.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable combine mode soft
      commit: eba0f007751986ee401f2a1bcbdd3bdc845cb606

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
