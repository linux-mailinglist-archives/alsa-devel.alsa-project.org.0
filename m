Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F4356ACA1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 22:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A885E1631;
	Thu,  7 Jul 2022 22:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A885E1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657225248;
	bh=rZaWyO+gpqHD3NkhTN+vyIH9HHwCVAuShvIMp29Upn8=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wo6EJU73pjTFmPG2h/1GC0qqlTYEBiSvsW7YeKaWNsdjedDnnxc9i1ExvyTHUyWGw
	 G5px0WjXa4fippfm0PGZcMl5LjkLVRkOY5GU95GLXnr9wtDMkD8kl/LBus4DLoILqx
	 rOMyhN/v4MfJGABb6crknDlIgaZdeSLhyOivDl6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B5CF8028D;
	Thu,  7 Jul 2022 22:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22A82F8016A; Thu,  7 Jul 2022 22:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9DDF800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 22:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9DDF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="KaHF4/9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657225179; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjIa6VCGeD+ksTrcQqfh2dLYucU0urZhX3yUpGkF3xc=;
 b=KaHF4/9ji/Pl7Q4Ldp9NVY0eJMtvhriRAjKe+0mLozVZ8pA64lkWk+Vl/gNmda2gSJAWan
 zLrPhWQWW3wj+lSm3DxLXUHSIJERZ4Re6/5fyuGMWQP/qdD/SApuiAVPtS1StzuvITTCCT
 zLclWuo5r7i4xqyKf1rK0+mJiNfiwig=
Date: Thu, 07 Jul 2022 21:19:24 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/11] ASoC: jz4740-i2s: Remove unused 'mem' resource
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <C43OER.T16CTN9Q6E0U1@crapouillou.net>
In-Reply-To: <20220707194655.312892-2-aidanmacdonald.0x0@gmail.com>
References: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
 <20220707194655.312892-2-aidanmacdonald.0x0@gmail.com>
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

Le jeu., juil. 7 2022 at 20:46:45 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> This isn't used and doesn't need to be in the private data struct.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index ecd8df70d39c..c4c1e89b47c1 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -93,7 +93,6 @@ struct i2s_soc_info {
>  };
>=20
>  struct jz4740_i2s {
> -	struct resource *mem;
>  	void __iomem *base;
>=20
>  	struct clk *clk_aic;
> --
> 2.35.1
>=20


