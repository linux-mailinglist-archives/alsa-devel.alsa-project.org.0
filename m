Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C146629503
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 10:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC582168C;
	Tue, 15 Nov 2022 10:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC582168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668506310;
	bh=tcxXINjI1KMEgnUfD8mZYzouHG0BjzBeu19QEQFjbAM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p86njX5WpnbWYIpehcj/7ADKwT0ZRPW57d/gXfMDuM1SDeI5/xGf/Tun9dPoDbWSP
	 ALAlnanQQx3Ekfi/29vEcCT6zTNfRapw716ae9xegJuprqzXo+D/scnaOTaskrkJLe
	 Z68tvSo68NyjTYgEZzvn5UUSR+GkfUnRyAFZAX30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129DEF80564;
	Tue, 15 Nov 2022 10:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46444F80559; Tue, 15 Nov 2022 10:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98002F8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 10:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98002F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qkLW0AL7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CDFEB81889;
 Tue, 15 Nov 2022 09:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447B4C433C1;
 Tue, 15 Nov 2022 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668506215;
 bh=tcxXINjI1KMEgnUfD8mZYzouHG0BjzBeu19QEQFjbAM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qkLW0AL7Z2qXMZ+mG/OdM1aXXrQPYuWL7IWM6+quTmrymgdkmP0NCg9oEZZxwt8ih
 7byryYiEpX8fE0dy5DH5CT+qYl05QcDnwuH+71OZd2KOHQ1C8oEi/0vRK8sTbaB1bf
 ZnfnQ/7tLt1iHJWFf2BaciBMRo8Lxovskzea1RIQW0vWKcHcZJXwU083tTcT9KLtnJ
 2PoiFPBQXFCDris75C1+LlrTGyJz0qal5XhjShHxsbGbJgqzOS6s/xIMkr2VgxBQnP
 IOTexTDv/4+KG6e2qVMRytoZgCbhXoNPP720MY/fk8XsoJK9KoYl9zdPOTY+gTUH1x
 l5DQK7vaYPssg==
From: Mark Brown <broonie@kernel.org>
To: Zeng Heng <zengheng4@huawei.com>, zhouqiao@marvell.com, perex@perex.cz,
 robert.jarzmik@free.fr, 
 zhangfei.gao@marvell.com, lgirdwood@gmail.com, daniel@zonque.org,
 haojian.zhuang@gmail.com, leoy@marvell.com, tiwai@suse.com
In-Reply-To: <20221114085629.1910435-1-zengheng4@huawei.com>
References: <20221114085629.1910435-1-zengheng4@huawei.com>
Subject: Re: [PATCH] ASoC: pxa: fix null-pointer dereference in filter()
Message-Id: <166850621200.114707.13258464165511229851.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 09:56:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, liwei391@huawei.com,
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

On Mon, 14 Nov 2022 16:56:29 +0800, Zeng Heng wrote:
> kasprintf() would return NULL pointer when kmalloc() fail to allocate.
> Need to check the return pointer before calling strcmp().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: fix null-pointer dereference in filter()
      commit: ec7bf231aaa1bdbcb69d23bc50c753c80fb22429

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
