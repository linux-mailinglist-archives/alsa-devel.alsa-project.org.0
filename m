Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2BF4C36CD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 21:21:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7CD1AE4;
	Thu, 24 Feb 2022 21:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7CD1AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645734115;
	bh=uTKwU6+YCQF+y9/bHte8UgFihCwOEO1tm9hwr/2u8c8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GAJeKGvPNvZcftxBE5eH2ac4+kzkXGArfTDYlf4EuFw3TYwLR5N9wRR49wtoFp2FO
	 d3u6no3eDHpx2AQJS6u75cGcbbTN8KJ6oDXqWOlYqpMRF6QvgiA3Mg1LQByCvqz3Dq
	 Qbwu/KYdCrEBgLX5hskO5gwAdaAeMG8TGitrsdyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E963BF80430;
	Thu, 24 Feb 2022 21:20:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E51F1F80118; Thu, 24 Feb 2022 21:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 809F3F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 21:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809F3F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K6RTP5rY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 589D3B8292C;
 Thu, 24 Feb 2022 20:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2775C340EF;
 Thu, 24 Feb 2022 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645734038;
 bh=uTKwU6+YCQF+y9/bHte8UgFihCwOEO1tm9hwr/2u8c8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K6RTP5rY7E2ChagQSUz7gFM4hNmDKjd3BZbggafJlHfrqAQIqGRMC/sYJyfSwLL7x
 cWC6Q9LG2E8S3yAO4lK+7rol36GH4tHL0N2aqhfO6zEBmCsCQnHWt2WUsBddZYomGV
 AiTlidPbvkncK+Nv6aqtbWMAziSQ8kTZTC2yV5ouzcrA96oLtnVE0x4h79L+ct7F2b
 A7AJv9rPIvmi+v7SrhoFYWJOzLhQ9p0EUXA7du01bBhEZFQtesv0Z1lqJWlgpL2ZvA
 1lf3zOR43CfOekhtpEfWjxNF6qoxx+pXwURbm0/D+4kt/Nkte6S94GF+OSSP9dszT4
 qmHulvKJqe3sQ==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220222124213.721224-1-AjitKumar.Pandey@amd.com>
References: <20220222124213.721224-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH v2 0/3] ASoC: amd: acp: Add new machines and minor tweaks
Message-Id: <164573403651.3139675.9186898819525573460.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 20:20:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com
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

On Tue, 22 Feb 2022 18:12:10 +0530, Ajit Kumar Pandey wrote:
> changes since v1:
> - Fixed error for undeclared variable.
> 
> Ajit Kumar Pandey (3):
>   ASoC: amd: acp: Change card name for Guybrush Machine
>   ASoC: amd: acp-legacy: Add legacy card support for new machines
>   ASoC: amd: acp: Add DMIC machine driver ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Change card name for Guybrush Machine
      commit: abdcf7282f390ae7b95de4bdf93b07ebabeb0f01
[2/3] ASoC: amd: acp-legacy: Add legacy card support for new machines
      commit: eee33bac9e7d71e6eb9ab5f863efdb9d44174e0a
[3/3] ASoC: amd: acp: Add DMIC machine driver ops
      commit: 1f197351b3af345b626735ed9cda43fa896c23d3

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
