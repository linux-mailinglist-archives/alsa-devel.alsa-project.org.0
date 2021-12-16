Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B307147745B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AD51FA9;
	Thu, 16 Dec 2021 15:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AD51FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639664500;
	bh=R+l2JoQS023TcGtBLgKHGJ2nmwyJfY24/eS/cm2e6kw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iHY9uN94KvM5rn3yAvvIceS66jXtScyolXCmlDjpUhQTARdUkurexBA2hzXokWbDv
	 YJuobpqEl4aR7ERIr6yD070Cx4fIAO9CNQ7ZwQXq3T1Cxxs5ICtyYUWhtcJ5lTB8Wm
	 gPxO8XamNqcslim8KUVVjO0Ogl2sH/kpeoSFdGGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 998B1F8015B;
	Thu, 16 Dec 2021 15:20:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16AEBF80116; Thu, 16 Dec 2021 15:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D46B6F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 15:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D46B6F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jEXIJan1"
Received: by mail-wr1-x42d.google.com with SMTP id j9so12377202wrc.0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2aMnjU7hIQzPIODNPQxr8yp+39K6YzUUOxZgZZF/gHk=;
 b=jEXIJan1huk1UQpmmCmNfmwqrd4qKANO5zNtO8Iijqax4fsDmJvFxqBEI9x5qrcgfq
 Ye8tnshx4JVdfL4kZBqhxOzJ2xMFLrThaclAwSTQmw/2fs0XZaIGl4xlTA6Vf/ebNqwF
 sO2rK2ZGdWMbB6Fbo08LnCIjOBiU6gTb1Lk1WGlvdpWNfnRStY1ulhBlmov2PZzKUzJK
 ZDdHZUNzPxPjFmX6KnFQysxSD0QIfXb2jSCBjNOFPbIxqLjcmJeNfzGyRNWrqkMJo6xv
 G1joetmCmqGyaqWacTWR5NhiGJ4DfQ3vKCg/5K55qhCws8gH9Vja2Ua4hpztSGsIqdSu
 Nbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2aMnjU7hIQzPIODNPQxr8yp+39K6YzUUOxZgZZF/gHk=;
 b=KKGJAOy1JmgFcTT7cQoYVVahR8dAstr5Ahl94sIoza8Azr9VUBSFtUQZK2P2hdQ80e
 bbynVN0M9l3oTcldkBTFPYkrh/16AzCR8+QmT08akQnNKlDH5LreDAqyRXzglkkoE78R
 84yPRK4yUFCE/YFc4wQAg/GRh+cLKS8IfjnEcXpwLeBPJIXNIKCf+geclJ6Lkrp1n8OR
 DhNX1VHhTQDHXbxHnovbLzEYOSrk4TUuEZIQ8m+5lv8HQFZlUKnF7B0PKBVx+GD6rxKc
 w5JMTotxT5UUBYFT7YpQ5S/sCXliGTzKf3oSekp+tkZJ1savwttuGf+8YWLeFhOoKSSt
 0x0w==
X-Gm-Message-State: AOAM533fDDGDFKDs4Vlm7vYRfgIj+N9EkVtrLlTEEnmksBSHPz/xIlfF
 eqLYqizdI4zkwNhc+PyG7Ww=
X-Google-Smtp-Source: ABdhPJzyhdKgbIYkyLmJVEDx2jsU2zymKPqxvGpbsD2mBizBJldfL7d0I25gv5R9KPE9gf994HYdeg==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr8139833wrp.212.1639664426137; 
 Thu, 16 Dec 2021 06:20:26 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id q13sm1460504wrr.64.2021.12.16.06.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:20:25 -0800 (PST)
Date: Thu, 16 Dec 2021 15:20:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <YbtLJeIxXlVyQhd3@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s6xvmThKn00W/gOE"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-5-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--s6xvmThKn00W/gOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> Document new optional sound-dai-cells property of HDMI node. This node wi=
ll
> be used as endpoint of HDMI sound DAI graph.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
>  1 file changed, 1 insertion(+)

It's probably best for this to go through ASoC along with the other
audio-related bindings.

Alternatively, I've just sent out a patch that converts the host1x
bindings to json-schema, so I could work this into that as well.

Thierry

--s6xvmThKn00W/gOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7SyUACgkQ3SOs138+
s6HU9Q/+LJiPotWXIHgjqddwtzU6/HD7NNzSDIDIQzl+FQCjYyWmJCFfhyIgmI1O
3t27pQ7abUhhsvr1oZr/+vnUpw/ZGekjOTA7cuqXWstDJfVpKtALJXwqqNvn059V
NDBYXE9IvoNnPWZlKZpF+RvPxBekzBOOG7zQ8Ig/2JwhG/caYnzRYNsH1GF5NOhN
8zbP5CrTY+jRpaKWF5J2oXrvS+EmV0tYuleNpJsZttYhPwWwbyE6Nk12WNqacnEW
vGBSNv/DeO2yPvcfxvn15SXPFRo93hc1JdoiuGKUrS38BoKCjQj4yA5DTFgp9MVz
tLzMZ38YlZS7hwxrlhzGjNPyZmZ6e7o09cj2CgfYzL++fJC0PzTXK9bPkwBpnmB8
TT9TCAVZE+KUpExyiOroT6TmpJRl8ETH+x/cUOltkPwtpl1eKIS19l1qFuTqp3x0
Uh5w4Wg96EeqRlf8BDw6l7748TmED1Z4BqiyMZ0SrDAxF8fzalxsoIgfZ9xrn2u7
xJIoigBHB2gHjVfaDFxOx3eHTioW9xQCdjMC0y6vBbJYPjw1lXz5Sc1n84k3Wyij
Gd80HQ68NLb2hcERYf6Rbl+jVnibKYrS5HEuA9bGU0gU/HEoTqEJTAicFKHu5PwH
OjRKjFar0sFhYQtFVQh77Yb7CQzlV4dg9ywdLK718KnY9IlzipA=
=InZN
-----END PGP SIGNATURE-----

--s6xvmThKn00W/gOE--
