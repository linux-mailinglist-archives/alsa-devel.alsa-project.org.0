Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DF425AFE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 20:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAFA165E;
	Thu,  7 Oct 2021 20:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAFA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633631896;
	bh=P/DbYUdJjx7nfQUhHjO6NNREVhsAaXzsLgofUHDsBzQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDXyx0D8Ho/TK+DA67nhsmrN1AjPB5IqwHJZqSBae2OzSmajOtwbqOngkkbLd4kwn
	 NTWiFFPME0sWjaz0JZGNCPLGZyDrZn7noZZ3xk77sOj4bZ+nWD3tLuHGDnZvWvRyPe
	 HH75KTlkNMqpc4YBxLcPaUIQJHQjkezzaW/eO4Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479B6F8028B;
	Thu,  7 Oct 2021 20:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F06EF8027D; Thu,  7 Oct 2021 20:36:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA46F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 20:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA46F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j/RzlXQP"
Received: by mail-wr1-x430.google.com with SMTP id u18so21972501wrg.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zLaZpWdOA9YGgfI6hvca3fqu9BEMyK7TxqjLBX/WmtY=;
 b=j/RzlXQP+c93v98nZ12jYj5ppyjG9BB/ibRL1SJFxncDtU9ZDCLq9cwNCCZkUvJ7E2
 rEd2/qsC4xqgSSEQkO3sf7lyuX3NgnPVlVQ/2i8GtnUdC1nhmnJ8pQohznDp6RgjhgCT
 diDX0UP7U91QIuQcdpy+eEJ/sj/1MznM0Ewg7t0tNhXgXpwNb2WpMGu2RY0HbaQlrbpX
 /3LhN2sLdiqUqxe7sMbNZZx0SC9GmLdSRON73Xi8dNl84BY7i0iFhK8soeBnbOteKo3b
 nS1PPGOsoc98rJHN2RVD2Wboy6a9YnOLKDxe6bVFIKnXjqfKPYS1RGIpGhQ6Pk9fFyvi
 vMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zLaZpWdOA9YGgfI6hvca3fqu9BEMyK7TxqjLBX/WmtY=;
 b=bbpNBBqeklJACexiGc8Uexa16oxbdy5DOS4h8lqj+uEnDOIe/mNNc6lTDhnrJcbTql
 oL0JBUD9EMOOJRjRbEVCyZlUcItmROHhHZUCWsbuKJlYP4EwCLsL7uN+oE9DyucIkfPf
 zBGfscsK0qG+xiPwE21NSyuHBwSrifLluREK62ToBNZ3HU8lvzefHf74lZLcRn8kr/aO
 LZOfqr6MugUZXm5kqkNj6yXCm7WSS3d4ZeLOv6imMsKq5qdzzYZo9425xkWku2UL/Kn1
 hwHH0Z325R609b01UTSGwlYEUc810APuogpA5ceBwazzLF2ZrD2gcV5a/V7bN4JurCbB
 N67A==
X-Gm-Message-State: AOAM532CeBIPw/VVeOhePJTdKOhVGHqUH+z0RE9NtpuqHRV9IvHdKkUy
 iO1wDEPyz58zmzvuTKGL2sQ=
X-Google-Smtp-Source: ABdhPJyCexqGuOLaGmhwluMn+iXTu/n+h1tUydyY1DGlVBytxYcf/LKginmzQMflIBApP+LeVAi/8A==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr7492271wrr.371.1633631804783; 
 Thu, 07 Oct 2021 11:36:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z18sm127209wro.25.2021.10.07.11.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:36:43 -0700 (PDT)
Date: Thu, 7 Oct 2021 20:36:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 11/13] arm64: defconfig: Enable few Tegra210 based
 AHUB drivers
Message-ID: <YV8+OvZnc2ETJeWZ@orome.fritz.box>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-12-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GcftIXBv14+oi/Q/"
Content-Disposition: inline
In-Reply-To: <1631551342-25469-12-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, sharadg@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org
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


--GcftIXBv14+oi/Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:12:19PM +0530, Sameer Pujar wrote:
> Enable configs for following modules:
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
>=20
> These configs are used on Tegra186 and later SoCs as well.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thierry

--GcftIXBv14+oi/Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPjoACgkQ3SOs138+
s6Fw0A/+OZPfwytdhahHCcLZoQcMgkys3XyM5prhnNzTZBVmRY4INEcDvLcBNzfg
kFpK+xMdOtCPL8HGmiH31RnAblZdh6PgiQ7rZJM+0ozWmUr4+/7Uapf6ArY20TAd
WoHDetEDyGN7sF+fnnv+ZRztfGnmCB/laBIC9TwHjYaCPG6RBfMbktsHhVgKhX9m
pE5BDUll+ZblB1dOrjdnuu5odCqcxbrprcy5oAnC0w/POpflB6CxCoiPFrBDvOr2
7hdcMuyybXLAto0pIxLATVP3/BASUsyqedDpUfeKK66Ar6DyvVrf3nxMxkmAjtTk
AlMMjUvtd63ER2ARC1/DLZgl4lWWxffituU1FXCe2i6kNw8UFV7ImEzPdO/qwEEC
Jv8g25pGK1NCqd+IIufM3JihpCSZSUzgWV09rQQwrQvsfFmyc/4KUtSQVaJ8XFM5
s0jUYYzzT6l3nNfgnYQYxhNeUO7a0qg+KP59WIm/V+JpDuXUA4dqXYnAHgDeG/DA
T52U62eZFV2k8+yFbOGy2i6WmI22+J2OKAYX55D9Q6FPUSZoByExkGj2wMsR5IVQ
mDd45Z288zADqhlmXjL2wGBQ9JLWZD+dkV6r9fAARNjbA3Hf9Zva8D82m2Kre4vk
HYOBy+7fJmZDBUeHNQwIPKdHZQ4mSMdY103jRF4K0rbO4LepXNo=
=iDmU
-----END PGP SIGNATURE-----

--GcftIXBv14+oi/Q/--
