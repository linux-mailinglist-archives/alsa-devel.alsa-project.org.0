Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D54775CF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:24:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97D9C27F5;
	Thu, 16 Dec 2021 16:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97D9C27F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639668241;
	bh=7wNsC+BCbQAO0rA5kSEPctoVpTxoYmTW1yf6fFxCpCA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AE9mr4a3YTyad/PivqdXlnmmeaO1katOspAj4H/XzMb+v2s5cVIgunzA3DlDZ+pVE
	 x+ruqrHC5MS8UiSuhhhhiESjRW75okqORzRIpKN5OkoAUf79J4C6daAvnrDblX7qER
	 4chr0vGYNNuvVgC+kSWPfuPnxnZLd6tayj2WX/l8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 334DCF800B0;
	Thu, 16 Dec 2021 16:23:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5EAF8014C; Thu, 16 Dec 2021 16:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 746B4F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 746B4F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LTLemxb1"
Received: by mail-wr1-x430.google.com with SMTP id t26so8515324wrb.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CYj9Ti5Fz1gBasjmZUChCljCufoB/S9vsIkoqPg2LeM=;
 b=LTLemxb1FP6iTpX0FqdTf3ZYAFXDEKAFY3uo8UJCQMrttG/8H7/bHoWOa5rx/i8ld4
 r804GELD1w7olXyG9qg7spLjZRAGYdp7rs0zeumICvoYw/jLahaXrBpuV7HmQKrqd3LM
 3YgbqKpqYKUJhYhrsxEwEiHvb4Dm4MQcQxYe0mr4nXhrBSifXn4b74yl0uo7LfOlrHCz
 NECYqvVTYi18n35vAZ/o1tuBvNIiY+Q3Cb16sojfs0TBmt9DKxzN0I6xxNnNWr9KIJsE
 esincN1Za8oR0rR431bpTe5wvUy8NC8L5dAnRels1yuHPrdRfccZebHaoZK3632u92pB
 /upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CYj9Ti5Fz1gBasjmZUChCljCufoB/S9vsIkoqPg2LeM=;
 b=tWigQWk2HcuuRIFCJlrY11wc1ShHEYjZ388AZGN4GqwbIdh7yGs/Ugq/1luwoq8X0z
 Gd8bb+QIYMuOYDZRzOpO6Nedfhf4DzfDONBFoN7f5LaY4F6XOQU1xrwM8G6ySR3Ee9Z0
 TgX9/bbjU4uEoeyGSctJdLjQu21np/dGMSCMfs8M0CShMBeItiN5fjmrqKIMt4SCdpYC
 3V4etDyz7pz6D+3pvFIMoyUmh6FR8G9YbrfNYS2PtAOnaIsvod8rq/c2K8wy96SIg4mr
 Lnlp9rQAC1BtaJA8xnUCaOOjNXsy0x05VBgVH4sRC8cRV5JF33h5S+R9xGtx8Pg1RcjX
 ipCQ==
X-Gm-Message-State: AOAM531bRDSk9c4MXmsfWQn0y38lTZg3C3bL+Monn4gbnqOriPDjGkyc
 zJQBK/JYFGHSE0Hr2hcCDmw=
X-Google-Smtp-Source: ABdhPJydZjy551Whm5yD/fZHgAm5UZMb55oNe8NHznW7CKu4C9s4F8KgAmJ0kEUxEqaJ/o6UmVqTFg==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr4025559wrv.651.1639668182811; 
 Thu, 16 Dec 2021 07:23:02 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id y11sm6477355wry.70.2021.12.16.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:23:00 -0800 (PST)
Date: Thu, 16 Dec 2021 16:22:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 11/22] ASoC: tegra20: spdif: Support system suspend
Message-ID: <YbtZ0V4wt2HKPazO@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9NVu7ZJ+lp3JPxD0"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-12-digetx@gmail.com>
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


--9NVu7ZJ+lp3JPxD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:14PM +0300, Dmitry Osipenko wrote:
> Support system suspend by enforcing runtime PM suspend/resume.
> Now there is no doubt that h/w is indeed stopped during suspend
> and that h/w state will be properly restored after resume.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--9NVu7ZJ+lp3JPxD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WdEACgkQ3SOs138+
s6EKCRAAkaJkIFGe+TIGDvf3VgojxAnoy/xehj12RZkWXIHCSj2L8Uxnkd2xS+Xh
ban5ECkhc2qCrux3ywGTAp6WR+DRZRF6uMm0MCMY98MCBAAhvLm4edllsC2ksiVI
rruKcqjeuD690pyKmVxpG43jJjmEqeDuwuOPtBIDWWcU0jym5v+X3T3Dae7TE1nm
jwvBQ3kpBaOb1eCEYI/JNv402M/e4KO1MJUAfKCoxDDgB7Zijv3jnRYMyT7AJtwQ
tk8eLpkI56pro+A89npTVm/YF/whi+RBd/fACHFHIVLWzih0i/g4v+mqRPzchT9+
7NfuCuRPiH1UUTLiXP0Yq3GW6jOiHAcdVFSTFpgmYxL/wXCK+CWYBIt0oN+clwqY
x1UxyL03y7+jcpp8JGA4qNe4fqZ8srIiEZQMNHFjto+SaCx34LNJ3PRp68iY55Ji
ITEgIoIIza5Ss6G1J+oZpEpYqg+qkx+1krv0BhramziMfvQTdd7Bdq23XRMj/Rwc
tAEe1oS2HiXt6u33K/Ft9pxxUhE1k7AhwqACUt97ekKT44wKEYYil9+eWBy/dR8u
kO2Q7ODb8Jarb6GrNG1OUtcnftrAngx0JzMH2WVoqPRLumrCLPUiiM1CCg3VLc2P
UNTrRK3LrBZsHznR2J05vCm/VVAWljBW5T4/dsxPf1oUTw5T+YE=
=8OvB
-----END PGP SIGNATURE-----

--9NVu7ZJ+lp3JPxD0--
