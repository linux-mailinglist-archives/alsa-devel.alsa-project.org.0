Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392462FF3B8
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36171920;
	Thu, 21 Jan 2021 20:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36171920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611255736;
	bh=V7GM9Z1aWN595Ukdl1rPslOBupdBYsDbSgaSDMzjEdA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCqHmD/Llwi1Am34bQGGueMQYBn9THmFq84g4+LbTFtjkAviuwUDl8rop6lZk1CHw
	 bGxDKUEEBxCBkXRceVc90mTDdAAWKep+zdxyoCyaXNm6fJMKuZdJtUkPFYnX9teQFm
	 5qOu+YXH3f/iF0qgxzHUcMeC2B45CoAUE945yKzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD5DF804C2;
	Thu, 21 Jan 2021 20:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED0DF804D2; Thu, 21 Jan 2021 20:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4781F80255
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4781F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZScCF4q9"
Received: by mail-wm1-x330.google.com with SMTP id o10so5459024wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 11:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K17Qb/xqJhqemGjS6kTuTL7FFWSJ4l9BP89RSwHWF5E=;
 b=ZScCF4q9ohNh1JUkk8uuqWZ8Rq8ZDBqMV4uqim51MRtN3L7wr3V5GXWe1UNAYrx2NG
 iWmT1UHRYeligQF9mMqPe9M53d9xPFG+//3VSwFpP4c2jf02Tv0o2JT7Z77Ob6k/ykDl
 /heJDcYuDSC6yzwfzCc1eVsvo5h1hSd/2Un1NJqGuFWtatvhU+lFIBXs7Ulcn0JXeX//
 9I2T7wSnyah9yUWZ2VAynfXdFz7BuCXj4C3O6T68Imgxg+RsTItetkWotjLgDXLVdm2z
 vFrD41N369dEkQA3Yr+piTujNErzQyvocyaqaaEF8aNpbkhXT4+uKZUGT9ZnHBVTXFOQ
 MRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K17Qb/xqJhqemGjS6kTuTL7FFWSJ4l9BP89RSwHWF5E=;
 b=d6yK4hhXC7k6X5MqVcKhfAXWfrPi6hyVjrgET5o4mIZQ0BWswwUaAcy5M6/kLY+ycy
 yQmdt8n9mVWqxb5oltVyg/Y0uGDezq7nttmBcVANG2XybIFVkcXMsV0jROhU9prOHauB
 fdn97HvR5eiRBv3NSXl1YqqueJuMKbYL56tcB1j0AC846/Fc3G5cLrhwMFgE2JLMszoB
 tvZJmnB3tLe0O+fiwgX6EA0X1O0OQ53Rrt7zZ5si4dI+QDRpu/wKbFC7ywyxx4xX2UiZ
 RNG4Xejp93um8ucJ7fk9o96rMP+1+939eDjD8rpaB6p//uqvYuOQNoQFULrAQzrU3+aJ
 Cm2w==
X-Gm-Message-State: AOAM532sXprtEH8LWGnDIiMMKioKe3bGKmEzuMSCBD+/Rw8uXGhPdFtv
 JrjhPhX1/K6o894Gtd7a0Ec=
X-Google-Smtp-Source: ABdhPJyJGoMAuEiKqmzk71DvSTnpg4Ui3V10hF5b8vzzCod0tNFv3UIb4yOZgcvqdflnJZPOlpC9wg==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr699705wmj.27.1611255636500; 
 Thu, 21 Jan 2021 11:00:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p9sm8673767wrj.11.2021.01.21.11.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:00:35 -0800 (PST)
Date: Thu, 21 Jan 2021 20:00:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH v6 6/6] arm64: tegra: Audio graph sound card for
 Jetson Nano and TX1
Message-ID: <YAnPUsg7cNJQKqfO@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-7-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="51vTQSaQmQ9+ueZw"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-7-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, linux-tegra@vger.kernel.org
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


--51vTQSaQmQ9+ueZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:16PM +0530, Sameer Pujar wrote:
> Enable support for audio-graph based sound card on Jetson-Nano and
> Jetson-TX1. Depending on the platform, required I/O interfaces are
> enabled.
>=20
>  * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
>  * Jetson-TX1: Enable all I2S and DMIC interfaces.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
>  2 files changed, 408 insertions(+)

Applied, thanks.

Thierry

--51vTQSaQmQ9+ueZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJz1IACgkQ3SOs138+
s6GsMRAAsajRy5WFgKN+ktn2lL5UogXSyqcI2/4odHZspdTjh48LGWAWZZ2BkJO3
0FBPJmcg9irGgzc1L0mKH2SKLbs0owGIh24jpuf51T3SAzygOXh/K6wIy/mMBz1F
ViRWHtM866kzXyAizKanXmXnVP75VyquwO6TNgMhsldEm0CqjA2kcsWZZ+KCFsc3
mlMFUfGgzxjScgjhVXTrSBa8jx5FmaFEIRMwFRfuU1eZxV4oVWocWPS4fM7nkFNg
1FEvwGr3MZGmR4VZ8VUUyoiCHIIXD0A+o1X2+2iLpau9bgh9LASrj7mWHA62eRWa
ji18iCYrdsv3+ac82Yhbnot+0mCMajIlP8qL75HPpjSavjIiAOaJ2ifYdWmzNbcd
Ep/Ot1GkXnyMhSZwL8vp6TOvDq8uoLDwdMjNilA8BXwDq8V7QZvz5fVT9EV7oPY1
Q7eoiypjrsfmDbw1niP9uNKcCIDh1Boj9FqxKi9Unq/blcbKqXbo8zb/ANGAwIau
Ds8bpCy4zQOFCXnmDw1BReWQbryUZp4TsSQ18gskEIo4U8/Tg2JDJzqJbmN6LuQ1
Y4VzhHq0JBzr5oBlTJU1f7d+v3Bcfxtwm8LMYrUqQYkEZidO+794fC6077Dai/r8
KcDiIFitTxSTqogQLN45ISY/a3MtNGRhDLBZcf6Sdd6yoJa+IfQ=
=ceXN
-----END PGP SIGNATURE-----

--51vTQSaQmQ9+ueZw--
