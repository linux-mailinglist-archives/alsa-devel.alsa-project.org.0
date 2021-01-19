Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A82FBD64
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7507B18B3;
	Tue, 19 Jan 2021 18:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7507B18B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611076728;
	bh=RApKhocXoiuH+bVzxrjiStyGde+PJR5eHjE9gHqWMIE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/UeTbdwEDNp37tB1ZsI9csWU/aJSgUz4SNPaUNDZVCQ0XQMGi5ur1bjEXpcxCKt4
	 Ip1Zdz0qtuskXns/SrGc2FEOCvDzFqvRzeRNSKRlpYCA7YH6NqPdTAM/YUnz1IrKr0
	 RffoCvB7Dgi42z+kb/hLPl7nJIzcVewnJjyj/0mE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBA8F80272;
	Tue, 19 Jan 2021 18:17:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB3CCF8026A; Tue, 19 Jan 2021 18:17:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D592F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D592F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l/n21kYH"
Received: by mail-qk1-x733.google.com with SMTP id 19so22570592qkm.8
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b5LVKZxTrplQ11RZzvZpJI3DUzGXGrVYerBOEgEz3Uc=;
 b=l/n21kYHvIIahJUswWHxBAyM/26feZo064ZrEbI6AsIrwNR0f8tI3sbipKjX+jYgtu
 fCJoADl181GNe+acSApG0KsagHqMvDJgGKB1nh9B4hdbtYSH4E3f+2Jm+U4GAZQ8rgQW
 MP5sfiPE/HKYPowcrY+5yaJ50ixgy/DlJy5IYQXpB3YdqBwWANQsfqKgJqnU7VGcDUmJ
 HA6yKOKoLb6gcBClXoHl1pQU/qpk6LNHGav76unhGL7HN2OkI0rHbV6IpU7kLWTQXQ78
 JfTw27VvqtXyTMRr6dlw5CVoRSSeHKc01G96mn6kN15d7hs3oEHEKp3tEZk0plShKmjY
 dCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b5LVKZxTrplQ11RZzvZpJI3DUzGXGrVYerBOEgEz3Uc=;
 b=dMqbun7cqPMOIJEr/n7SGOwhE3keE3Kzmqmyfmg65ViKst+aFmWauijUhR6JdpPjiI
 SeG31YWbF6zyW+BqDyO4esMLkxFEThP8GPmBT3oAxpSnKkHQnOEY2fwBSkF3j2MryoF8
 b06hCItUcAYzANQavJ5ED+tLKGIrtBg2nqobb/HlrzJe6ytC9gElxsR7zKjZ/1k3uDyX
 GQ7SlBbOBkKpiNNcmbru2FicMMTLEFNg5FFM2l1ZLeqORdeMD+aWnMaHNcIhBHTkiyw9
 5HXbjYFKR1AX54UzEJYYN2rWhro7GcXr2NhwCbZEQrTziHePyZOZbkuWEmU2VdY9Fqb/
 0hcA==
X-Gm-Message-State: AOAM5328auIhTc0YjFmTA+VNA0JGqMZIdqiJV4yFHQVk3DZ6UqjbpWNn
 wPlReq4ZCHP3cyzY2IE3Sawr8j0Lirs=
X-Google-Smtp-Source: ABdhPJzvA1cMspD0O9nIWOVS4ATYqPCJVxApWvkdPWnsRK8TH9FkVxLjk1DX1basETRjptxUwnfavg==
X-Received: by 2002:a37:5c81:: with SMTP id q123mr5289236qkb.309.1611076644872; 
 Tue, 19 Jan 2021 09:17:24 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 8sm12922265qkr.28.2021.01.19.09.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:17:23 -0800 (PST)
Date: Tue, 19 Jan 2021 18:17:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH v6 6/6] arm64: tegra: Audio graph sound card for
 Jetson Nano and TX1
Message-ID: <YAcUIZpOVr7Sjyoq@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-7-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PWqwWawcwfvI8Z/3"
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


--PWqwWawcwfvI8Z/3
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

Similarly to patch 5, I'm likely going to make some changes to this when
I apply to avoid those label references, since that's not something that
we use elsewhere, so I want to keep things consistent.

Again, just mentioning that here, but no need to resend.

Thierry

--PWqwWawcwfvI8Z/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHFCEACgkQ3SOs138+
s6FBpg/+LPSfyFZtSmQC9bfJ13HYxQ7gHohZ2vXse2/p6URwG/zJO5KWW3C6G7ou
1QPSEjcmu93wU3CdyJfMjeq0ZkTtETUO91lhdBJSVG0ZzVeuwMDTySwzaDnvTZfz
ZjYbM0eYIL2DNQYdPATo0jEBsIDkwvGvmnrdgcGQlQEfDp7mk28Xbp3nlKmyElp6
5D845/Mf8Kvna6eMX3op9gq0f/RSBGyQCXBaZbKSUapD9WEpRCDev6Y/dUwh4544
E3oh/LrkcXyX7Mh/pT26O0wWVDzT9TSFyBQ5TMbenxt03gV8g5Lrxi6p+8XvlPNt
Rz0YOdFQUdC5NTwtwPcEQTNJA4ZxUtcln9gzozFama8cG+8EcrnfdRQflzaARr3d
jt9ST91LzNGsw/Ua/KJS9P/MCOa8WbKERqR13/m3OUavXi22G6aBKErd+V03P6JP
VWj4gRh/N7gx8CPmEIb4pu6TJL/xEcDC+SmfRJlJx5rMvzwvDuwkz9GAxS+vYCzy
LPOsIRKM+K4SG1iKghK/fOjMoWECmB63cYiEVHvXs4aW4Z4hK6AphRlFEfCDxKrn
GJT1SkpssGZvLTl/I1QFQSSRIUIEyK5l9xgfBr5JAe1z/dwlITZOrdYPTkJ5OV+V
TGpp3ObTYhUYd0lhJUxYOlNkM1wdZcGg9ALEwJDKwfud0McFTsA=
=DCH2
-----END PGP SIGNATURE-----

--PWqwWawcwfvI8Z/3--
