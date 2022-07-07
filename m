Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA1569E6D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8AF2E0E;
	Thu,  7 Jul 2022 11:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8AF2E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657185484;
	bh=bzKwx+3ShntRFS/GXCVR2I42NNcZDHH6hYgFEHVJgdE=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQiXMJLnTUdMVk/0z5JaAa6fvLLQSNt96tNvskpg7nC/QqSMhN33GDGeLd2iB5YBz
	 Y/XCnWA1qV3QGOmsttedro6oxA3JfuAmtaApd5EBs8hRfivapJCDYXMDBFwVXtUvL3
	 NzPwd5pZYNMaDbmPPIv3xLmg+oaoUOLjzX1ncRn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F24CF800C5;
	Thu,  7 Jul 2022 11:17:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B9D5F8016A; Thu,  7 Jul 2022 11:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B41F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B41F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="VyD4jBxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657185414; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G9+ZdgiY1pf7540Iu8Mnhcomtxme7gXDOd3aBrjvco=;
 b=VyD4jBxnLv08QoWXpC0q4O64XKy65EcXZ9cz2Bd64ITcPsfwEZHpaaMYN0/lJpIyXR2MRh
 hbEdTldsBf/5cCq38mYAn3Q+lzpnsNSizOhJSXk3Nk0TSOzfYjYMo811SiofIV7BFjx9L4
 9qQlmXByEkj81aMxv/rZ6wzmc8o098M=
Date: Thu, 07 Jul 2022 10:16:44 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/11] ASoC: jz4740-i2s: Remove Open Firmware dependency
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <WF8NER.2XOF3ZGKDQYB3@crapouillou.net>
In-Reply-To: <20220706211330.120198-2-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-2-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Hi Aidan,

Le mer., juil. 6 2022 at 22:13:20 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> This driver doesn't require Open Firmware support. Remove the
> OF-specific includes and drop the Kconfig dependency.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/Kconfig      | 2 +-
>  sound/soc/jz4740/jz4740-i2s.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
> index 29144720cb62..e72f826062e9 100644
> --- a/sound/soc/jz4740/Kconfig
> +++ b/sound/soc/jz4740/Kconfig
> @@ -2,7 +2,7 @@
>  config SND_JZ4740_SOC_I2S
>  	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
>  	depends on MIPS || COMPILE_TEST
> -	depends on OF && HAS_IOMEM
> +	depends on HAS_IOMEM
>  	select SND_SOC_GENERIC_DMAENGINE_PCM
>  	help
>  	  Say Y if you want to use I2S protocol and I2S codec on Ingenic=20
> JZ4740
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 79afac0c5003..298ff0a83931 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -5,10 +5,9 @@
>=20
>  #include <linux/init.h>
>  #include <linux/io.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>=20
> --
> 2.35.1
>=20


