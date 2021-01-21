Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B653B2FF3B5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:01:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ACC31918;
	Thu, 21 Jan 2021 20:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ACC31918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611255681;
	bh=B/juRshxuM4PHhBkZbOamgEuEjKLSlqkGnoQ9n14n7k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YwpNmq15NV6cqMmv6G0oVsS+l0edOPIBfv3JOzasunPf47OXzEPV/wHbt8FQfD94i
	 z8vcfVkfdQ0UdBizEjhORSceOBNf4JGzateNolS+palTufPuY6w/I25qaSkObsn/bR
	 PVDBcBDO8cTtioKs57lG0Fg3EkL16u8v8to+dnuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F6DF80125;
	Thu, 21 Jan 2021 19:59:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC444F80257; Thu, 21 Jan 2021 19:59:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85CD5F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 19:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CD5F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qhXcdVQs"
Received: by mail-qk1-x731.google.com with SMTP id 22so2710221qkf.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RDTUmyi6TX1dMW73o3akqz8xuDPvL4pb5fyygLXF4I8=;
 b=qhXcdVQsNa91XXCzLVDPU/KqxOxUQZkfZtbeQrwUU4IlsbysGk6QJ+Q3vOXbR9dmGl
 r9jKgAaSXICozJbVVlFl0Qye8z7BCSKijeJM1ijBLLjv0vcbalesCtsDnUwoFXf90rPq
 6+jgC6lftZJ2ESX97wnAn+KAARFJbSNugo9OHNnkP7rIaAscP84QXuvGsYe1G6eEM8XZ
 DEDEql0vKSNM5ktuSfDfROgZbzSax7OQnCbuctNmmYeTZOy0KDyfVOC7PMrESzXHEdM/
 1rtpIVkXx3jhDr+pSt4jN3gnXS+SwLQSEScht/y+OnRi3jqfmH1VjqVllnE4glJZeCIz
 jiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RDTUmyi6TX1dMW73o3akqz8xuDPvL4pb5fyygLXF4I8=;
 b=CS9Na0jJuXE9w6lnAsEa+GzGPjy5cenC/tF/bxPBDB/1hK1wjgEQYi66BbCJstnZ5P
 VJrlFOKj68ZAKCzSlct7f6aGsD+1xyDpjAeRvBPshMWhIMwqnZWehGHFfJ4QKsw1gk5D
 GFMdN9DiwwUQXdIZv6Sb2pCe3pw6SGAwpOt5nLJFKgQeDua92KnAidv/FbHoQ/3TN02Y
 4gr6YJH08UOzy5Ra9Wq9WxI2wELRkYuxJzzR5rAhQ6iuvioI/ojPfuWqhw586mzBDhPZ
 VBCj4P0wyNU6QfJAFKgYCCmxwTqBuzbT8LEstLEMjlMzPizbmHaz/oDsXs2+14n1x3dm
 rP5A==
X-Gm-Message-State: AOAM533vVBhlnAmUGwBPpfOlYCL7NJYYpDefDXKuJtP9AmpfLbqMeEdV
 OeE8ML7H31CRLTGa2gt2hlU=
X-Google-Smtp-Source: ABdhPJwohk2DIFAJlac5ohtlYAVxOFCDRj/GRbEUUa3RQ01XDV7/9jInryHqvORzkYAcKk6YUf52KA==
X-Received: by 2002:a05:620a:1206:: with SMTP id
 u6mr1183789qkj.209.1611255576713; 
 Thu, 21 Jan 2021 10:59:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 196sm2961883qkl.4.2021.01.21.10.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 10:59:35 -0800 (PST)
Date: Thu, 21 Jan 2021 19:59:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH v6 4/6] arm64: defconfig: Enable Tegra audio graph
 card driver
Message-ID: <YAnPFV6WBDmJR7uU@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UNXIJuGPFxobgmD3"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-5-git-send-email-spujar@nvidia.com>
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


--UNXIJuGPFxobgmD3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:14PM +0530, Sameer Pujar wrote:
> This commit enables Tegra audio graph card driver which is based on
> the generic audio-graph card driver. This is intended to be used
> on platforms based on Tegra210 and later chips.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--UNXIJuGPFxobgmD3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJzxUACgkQ3SOs138+
s6HJ3Q/+L0jCt+mm47rX9vykjTeqtyF8JyoUyIhqNIhYPtlqgW/Em7qfuq/lZ2M2
dZysuBm51BUIZXN1mVZwBVXpvv7lbITPA2lbBaIA85hFvVThA2/wKrEC6GlEIiCx
boRAWs3lDqFzU6sha+t6BIizmePN3rWMkvuJeuLCK6F4xov819o1NGRlG/uJJ4B4
d6Q4CpGVvJDCU0h3raq+bXKRoXgzOUUX9xuCT6ZLzmQ2hRzuLi5M7pKm6TGGTxTw
2ySGWiOaOouDqKErnq7KqOBEKHAdjfeelmU0gHMCBziO4fKG/Tcj1mv+8P/pg/HS
TZSQRY7ExONu2W7UQB5SHxvFU/TLpnS15UF1+r426KkdPueCqQRdeDc5se8YzVuc
VadOQGvEaOArxddyyyFSeWL7NFFVLG7ZB9B11hvsx71XGOFMJ3BNBEP8kwrr+thl
azMw+U0JAu8Hikbd9UoqTl8xoRg3ihKJKmS1ilXPmnsx7ztHx1BhGojMW2bv8S4l
Lf3VzmI9yGu/AbQ4wCB1WZShVr5nx36TpbZzorg72cBJx7zXjkNFadGpjfdRYnwb
SXFuwnQIXngaAoRVlFH5MGRcY2klZRHU1DPdnm2FxH1F8DewCK6AfF0aWHGmrXHp
RgsS7NHpckY8lQ3acKsx53I0B9XV8nYxNhtB291SLwkTP9Y5Je0=
=n94E
-----END PGP SIGNATURE-----

--UNXIJuGPFxobgmD3--
