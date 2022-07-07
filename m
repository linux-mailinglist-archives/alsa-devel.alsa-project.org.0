Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C23569EC6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891F1164E;
	Thu,  7 Jul 2022 11:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891F1164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657187022;
	bh=BP8filecon2Akg5o4yz4E3h2lHpuKgjXdafi3CvfGQ0=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJKgGJkNZVF0Nvr29zG1TNbFkf08a9t4+o7d5SvNia5pTYbhRjpZkr6ba3aPQN67w
	 Ctuyqhwj9Mg1pCEr07XjPp/k6ZsA55iNRi3/GqVWIOOYz9uWG7W3J9m8N8b3iMxZ5A
	 KwmY81HPgTP544RcZVoh8gljr1Wma3NEUjw72fsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1826FF8028D;
	Thu,  7 Jul 2022 11:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08209F8016A; Thu,  7 Jul 2022 11:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CBEEF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CBEEF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="YOCutFuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657186957; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5sBH/LTD5FNjNAFBgLqENfDmdXsl+8JDW39Z5mPsho=;
 b=YOCutFuPxElO81fsay3ThIPZqQO6RzEnWrcrzhD6w1a53aYvQA+Qq9NBqdCJLzyUh4VSLB
 pjpSmiKv5LEtKKZlYHP/uV5uX63u1EIaSII9d91QNdZvbBCnaHMyKBPmckFO+6UW95aoNt
 OYD/g/1EIDMsejdrQWG8s2gf8C0lccA=
Date: Thu, 07 Jul 2022 10:42:27 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 07/11] ASoC: jz4740-i2s: Remove some unused macros
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <RM9NER.45MCKQG64UDT1@crapouillou.net>
In-Reply-To: <20220706211330.120198-8-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-8-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:26 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> These macros are unused and can be dropped; the information is now
> encoded in regmap fields.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

I think you can remove the macros in the patches where they are being=20
made obsolete.

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 3c3cf78bf848..b8d2723c5f90 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -35,8 +35,6 @@
>  #define JZ_REG_AIC_CLK_DIV	0x30
>  #define JZ_REG_AIC_FIFO		0x34
>=20
> -#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_MASK (0xf << 12)
> -#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_MASK (0xf <<  8)
>  #define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
>  #define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
>  #define JZ_AIC_CONF_I2S BIT(4)
> @@ -45,11 +43,6 @@
>  #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
>  #define JZ_AIC_CONF_ENABLE BIT(0)
>=20
> -#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 12
> -#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 8
> -#define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
> -#define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
> -
>  #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
>  #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
>  #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
> @@ -73,12 +66,6 @@
>=20
>  #define JZ_AIC_I2S_STATUS_BUSY BIT(2)
>=20
> -#define JZ_AIC_CLK_DIV_MASK 0xf
> -#define I2SDIV_DV_SHIFT 0
> -#define I2SDIV_DV_MASK (0xf << I2SDIV_DV_SHIFT)
> -#define I2SDIV_IDV_SHIFT 8
> -#define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
> -
>  struct i2s_soc_info {
>  	struct snd_soc_dai_driver *dai;
>=20
> --
> 2.35.1
>=20


