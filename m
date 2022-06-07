Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FB53FC62
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C721A73;
	Tue,  7 Jun 2022 12:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C721A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599211;
	bh=3AqcgFROyY3hkCEzdOdEFdNbxxw2PBTGqPDd+uvJsfg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUusi9oGaSHyMbQlnY8wNe2MaP2753796IGtucerlvWv6rtJBf+g6GsGG9ZCapWTo
	 4csd5TBRWwHVv2XzTmbP54bPXWUmDoS1GEWG7EPmUn4Q0yyzjVuvXjhUbxiFkpJ4ls
	 jvnpUZ/2a6LKPDMFuGKjUfHriYVnBGO10KgPLBhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D30F805ED;
	Tue,  7 Jun 2022 12:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADCAEF805EE; Tue,  7 Jun 2022 12:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 557EEF805EC
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 557EEF805EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HMQtJMbL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46A4B6152C;
 Tue,  7 Jun 2022 10:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0E1C34119;
 Tue,  7 Jun 2022 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598775;
 bh=3AqcgFROyY3hkCEzdOdEFdNbxxw2PBTGqPDd+uvJsfg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HMQtJMbLxLQSEp7UXDJ7hEzxzW4fRv+j2PIoSK3J3pTWeudUPx8n5kx7opSQXGVHA
 EyniiYipGW9svD5twRM5TSY91gW1hzouKgenmFd4IrEb4WfSuIHHIXVLKQb1Kfz8kk
 JmX9onj1NqItd3H9uZeO9yh9ozWlUNaBPiftGsjH1noMt1mBZCQ3n1UPW0UFHisUgl
 f58QhKi0WiSPJ4h4L9uI5TH0f/Hr8C2O8FAR8NFakWP/K6pKzUtwWJuEnxxWmoR8K8
 5bJp5IhW2xYqnOEhKK6WmxpehnwHmfBH9Ka7MVDKJUOlm28k/qfDQOaGaDd4au6ROD
 APBg2hiXEMQgA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, support.opensource@diasemi.com, lgirdwood@gmail.com,
 perex@perex.cz, jiasheng@iscas.ac.cn
In-Reply-To: <20220531094712.2376759-1-jiasheng@iscas.ac.cn>
References: <20220531094712.2376759-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: da7210: add check for i2c_add_driver
Message-Id: <165459877402.301808.1092458245565665338.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 31 May 2022 17:47:12 +0800, Jiasheng Jiang wrote:
> As i2c_add_driver could return error if fails, it should be
> better to check the return value.
> However, if the CONFIG_I2C and CONFIG_SPI_MASTER are both true,
> the return value of i2c_add_driver will be covered by
> spi_register_driver.
> Therefore, it is necessary to add check and return error if fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: da7210: add check for i2c_add_driver
      commit: 82fa8f581a954ddeec1602bed9f8b4a09d100e6e

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
