Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BD6756E6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 15:20:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA6D32E0;
	Fri, 20 Jan 2023 15:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA6D32E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674224426;
	bh=0EFlWgRLxVNkH0D5+K2CCNLnfAooxQdTXCQg9UomTuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nQ0WSlmrLTKok6LGOEDsHQeGfdTrTNee2ZfDIl9U82T18nFDT67o9VJTt0pdIlmqn
	 GBdt3RLBs5khlaEeLrx04uL7H656y5/gg6R2R+89w3nNFlRiaK9F13vrsUnI9UJTXf
	 rzl8nTqjyDNaLjWBhEqiqIWHDkNmgFv61GCpIQwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4283F8026D;
	Fri, 20 Jan 2023 15:18:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF67CF80548; Fri, 20 Jan 2023 15:18:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED324F8026D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 15:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED324F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KiaEKsSg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9712961F8A;
 Fri, 20 Jan 2023 14:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C58C433D2;
 Fri, 20 Jan 2023 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674224299;
 bh=0EFlWgRLxVNkH0D5+K2CCNLnfAooxQdTXCQg9UomTuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KiaEKsSgiJZRbz7IKmOLtFRffZaQY4N6z/wjKf5yz+GEGkQjSDICZpoCCcYKk/qLP
 nUCeXBwXPwvyJOaQR+AKhv/QeKIe7CLRN41e5ZSJYMzqT/uHubQum0UB7AYMm5XiZr
 e8X6v6ScvdAzYvAut1sYbLR4QjHeIVc0BE9FTAQvxkK0OggUn3/Gm/Wq226R47d0Ou
 RCSGoN/357G+odIg8wBmEHFlxJc9fr7EYOKrbsTjS9GvYgbZbLSwfeO374/FcLfwVr
 fkFSy7/SdtvmfQCMOEtuFxy6Vt1SqnUlQDRBfXT+djifdJawncA98CuJTf/QgZTqkO
 oVqLICJMrEltw==
Date: Fri, 20 Jan 2023 14:18:11 +0000
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 19/27] mfd: remove ucb1400 support
Message-ID: <Y8qio/hwsP6+EG29@google.com>
References: <20230105134622.254560-1-arnd@kernel.org>
 <20230105134622.254560-20-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105134622.254560-20-arnd@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 05 Jan 2023, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ucb1400 MFD driver and its gpio and touchscreen child
> drivers were only used on a few PXA machines that were unused
> for a while and are now removed.
> 
> Removing these leaves the AC97 support as ALSA specific,
> no other drivers are now connected through this interface.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/Kconfig                   |   7 -
>  drivers/gpio/Makefile                  |   1 -
>  drivers/gpio/gpio-ucb1400.c            |  85 -----
>  drivers/input/touchscreen/Kconfig      |  16 -
>  drivers/input/touchscreen/Makefile     |   1 -
>  drivers/input/touchscreen/ucb1400_ts.c | 458 -------------------------
>  drivers/mfd/Kconfig                    |  11 -
>  drivers/mfd/Makefile                   |   1 -
>  drivers/mfd/ucb1400_core.c             | 158 ---------
>  include/linux/ucb1400.h                | 160 ---------
>  sound/Kconfig                          |   1 -
>  sound/pci/ac97/ac97_codec.c            |   1 -
>  sound/pci/ac97/ac97_patch.c            |  40 ---

Happy to take this with the relevant Acks.

I assume an immutable branch is necessary.

-- 
Lee Jones [李琼斯]
