Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA564DB865
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 20:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93F61711;
	Wed, 16 Mar 2022 20:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93F61711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647457828;
	bh=Lbgd60U2ddeDaq02IYQosxu0kdzO0ja0Vzl5v5updn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNz4fXkjVT6h3HCtoQUlQK3tlTxsJUuMyEcU4QMuYRuFGgcwsC6eGLtUGzo1FNQIl
	 rLob5ywW/yKWhX2IdcZn9IxPdFlxuLFaoV1s79V/KmuM2MwwG626KvcVNgWRar5X2P
	 NxkpfK94uYGH84YTs5bhmJas8stiqJi6E4hApBPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5ADF801F5;
	Wed, 16 Mar 2022 20:09:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 592ADF80095; Wed, 16 Mar 2022 20:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0739AF80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 20:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0739AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f1KGeTKN"
Received: by mail-ed1-x52a.google.com with SMTP id m12so3917285edc.12
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVfMjKpWZT15x3YmijRgD/PsoH/JU8/gZdMzQJYY3Vo=;
 b=f1KGeTKNRPlW2bxfPuz7YJQyJOt6IG0u9P3n8uPR+HGigs9dSG92B8QDT0zfj7vTEW
 V/hP6iqRm3vUa0PYWNY36M/Xc8n8ImIY+hKw6yNxF1NtZ1NWy3kmmqrYRfbdD15d+YwJ
 WppwBX8VTAK5R0uIoTgGwOIVixNm909RuFt8i7hsRLg3SATtE9keIFyl+iY7TzsbrxgH
 3T/n8/9DIphZOaPbbWDGqe2iFwogXiYnf+yclKB2dcxLgZ3q+8j4NUqT9BlCcjYeVoQd
 YMvKcsBqDGHVOvFTnxE0Djyrfo2HQpnrJk2nWyzzGeXMU83y6c2/F8b2LB/ygK4fEZFa
 LBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVfMjKpWZT15x3YmijRgD/PsoH/JU8/gZdMzQJYY3Vo=;
 b=NNUb8TF5H3Nw5fRTLtoueYwBAOJHN7NRHPAVWGWqk64SJ2C0OZD9PvR2xbHIridN3s
 yoAsDPZzvwR9bq3XeRiuGBDSwd28u+TW0rhC3x2yFzl9jGBc2g+tk2EnjtbfRYLxNVL9
 7Xu9+Ho6kqMtb2RJuPQrIjJ/W5szwRa55QLNXCcBUZ1zNWnUvJK3kW5L3MNRwTwJ4pQ4
 nCw0/fDDIfHOfo4B2EeLdM8KAQqG44YIkhyv8NwWmVJl2qF/Ngy1Bf9dfA7DMY7qORX6
 gQPnvFy2EIG4nX7W9LttgC6RhcKkNfyhinwzCRGGKDNzElDsfqOPbTU3EWFou3HN0Yp3
 pGHA==
X-Gm-Message-State: AOAM531q8J5aU9ZhmuqP9eWhatqty9kihTrv9+q6FqzhMD4EXMp6wDte
 tJj7eBODz1bGAEl8kdoE+OE3YqpjV6O8zg==
X-Google-Smtp-Source: ABdhPJwIzIeWywntOm/DKOdAQPY6vhVMqtNL1DNvWohxRlzRQheXrQRP10LSbkpz1RLlQP3iBJt5Tg==
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id
 p2-20020aa7cc82000000b00410d2b01a07mr874230edt.359.1647457748274; 
 Wed, 16 Mar 2022 12:09:08 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 kw3-20020a170907770300b006d2a835ac33sm1209759ejc.197.2022.03.16.12.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:09:07 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: tiwai@suse.com, perex@perex.cz, heiko@sntech.de,
 zhangqilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: rockchip: Fix PM usage reference of
 rockchip_i2s_tdm_resume
Date: Wed, 16 Mar 2022 20:06:38 +0100
Message-ID: <2972526.jVqemH3vzA@archbook>
In-Reply-To: <20220315025415.2593762-1-zhangqilong3@huawei.com>
References: <20220315025415.2593762-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
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

On Dienstag, 15. M=E4rz 2022 03:54:15 CET zhangqilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
>=20
> Fixes:081068fd64140 ("ASoC: rockchip: add support for i2s-tdm controller")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Hello,

Reviewed-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Thank you for fixing this!

Regards,
Nicolas Frattaroli

> ---
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/r=
ockchip_i2s_tdm.c
> index 5f9cb5c4c7f0..d3b710406941 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -1738,7 +1738,7 @@ static int __maybe_unused rockchip_i2s_tdm_resume(s=
truct device *dev)
>  	struct rk_i2s_tdm_dev *i2s_tdm =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
>  		return ret;
>  	ret =3D regcache_sync(i2s_tdm->regmap);
>=20




