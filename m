Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7ECDA40F
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 04:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709201673;
	Thu, 17 Oct 2019 04:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709201673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571281168;
	bh=wPYJ/6g4bPKsiHiLUp/F20cfEIhH8pMXELo72CUwopM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdYQ+CtGksm4fZzCqP7a7u+GPo4mZLEij1OXHNs4iqgVl32Guu83+V4YGvpsPrVbF
	 IusrINf3nvf1zMG/2/qpeXZ8iY+3dQCgztPsLyeNNvGIsu4EBoPoeOCWw5dyE8Cl8P
	 WOzs6Vfi83dRTfK6ZaoprCR4H8SByO5qAeiiVkuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A786F80528;
	Thu, 17 Oct 2019 04:57:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB77F804AA; Thu, 17 Oct 2019 04:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87F29F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 04:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87F29F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WMRenqWV"
Received: by mail-pl1-x643.google.com with SMTP id q24so369447plr.13
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 19:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tjt+/Axl1IvzmW6XlYzMidII91vtDmoK3IJ5fHSxSac=;
 b=WMRenqWVPH9trLQV/ukChylmkEL6sEVWt/wpu4djbs1RFI9rMDXfXhkQHqebF1HssD
 DsSIcQuOSMkHrOP9fxhavvl6iXkstjFzLWqakpqKbWGCPX0dP3oWoDhm3RGa1QFtPn2b
 1i+/iC1vY+AtLr7HIEsWJHXHYvjMEd+UBv6xCsVgsk6PFWygxd2SdMVRTchFNLvVtkRV
 04fA9LaZluM1TR/ORT2dPqKMIc7iS1zeS7tP9K6235PCJXBTLFfokcQPtnlELmH2VXC6
 IEdx55uuuP7CrnFtNXs5t4P9R8fJKY0zYZlS/bjuSQu0eFa4b+Vv6BXKtkaLknP/8e5g
 JVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tjt+/Axl1IvzmW6XlYzMidII91vtDmoK3IJ5fHSxSac=;
 b=t8JPZptJTVdSe+PiAWR095kIEqs9b1XCVf2XohxQ+gMTUU/VQxPXAst+gGimeuQzWu
 ZoQIJTLnKyW5d3thcAGkW1JByZjRrqxAR4zgrTLg5TgcsJmbDm43QHe7vev4/aXT4uR7
 0/onbXMFhBY/S8UwO0eOcShtqRCpOL5iJrrrr0DRlB2oxfRszA8jE48qRrfkXsoctus8
 BdOvmnKjRAOSpX4Q3hpQViL1WDljscvQ9MuS7aftXnk7w8avIvtud0kbqEV9or3T4XH2
 3C1qQ/vxMaJGQGCUoJ8MEBBB4dO5er4X03dToyKMdRwzgA5b0aKpkWWov/tq9vgHDxFC
 L9Tw==
X-Gm-Message-State: APjAAAVhBMkAdoOc0fX/m+RvqO3I3ebYZekQSzg3n7iHvuWFtWbFjOcR
 axU4GooMqmKUUEY72WdCmjv9jw==
X-Google-Smtp-Source: APXvYqyNVlHmSHerT2rt4/QTzCuqidNjeUINeWLNCF+2g/z2fzvCBM7ZnwvFrje+hC3v54LyeVwTaA==
X-Received: by 2002:a17:902:a610:: with SMTP id
 u16mr1569536plq.200.1571281054569; 
 Wed, 16 Oct 2019 19:57:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id y2sm532925pfe.126.2019.10.16.19.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 19:57:33 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:57:29 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191017025728.GB72195@google.com>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 broonie@kernel.org, enric.balletbo@collabora.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 04/10] platform/chrome: cros_ec: add
 common commands for EC codec
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
Content-Type: multipart/mixed; boundary="===============7493725148367866959=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7493725148367866959==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Mon, Oct 14, 2019 at 06:20:16PM +0800, Tzung-Bi Shih wrote:
> Add the following common commands:
> - GET_CAPABILITIES
> - GET_SHM_ADDR
> - SET_SHM_ADDR
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_ec_trace.c       |  1 +
>  .../linux/platform_data/cros_ec_commands.h    | 64 ++++++++++++++++++-
>  2 files changed, 63 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/c=
hrome/cros_ec_trace.c
> index e73bb6a8b00e..2ea0d4e0d54d 100644
> --- a/drivers/platform/chrome/cros_ec_trace.c
> +++ b/drivers/platform/chrome/cros_ec_trace.c
> @@ -98,6 +98,7 @@
>  	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
>  	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
>  	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
> +	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
>  	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
>  	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
>  	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index 58e460c015ef..3ca0fa9e92a7 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4466,8 +4466,68 @@ enum mkbp_cec_event {
> =20
>  /***********************************************************************=
******/
> =20
> +/* Commands for audio codec. */
> +#define EC_CMD_EC_CODEC 0x00BC
> +
> +enum ec_codec_subcmd {
> +	EC_CODEC_GET_CAPABILITIES =3D 0x0,
> +	EC_CODEC_GET_SHM_ADDR =3D 0x1,
> +	EC_CODEC_SET_SHM_ADDR =3D 0x2,
> +	EC_CODEC_SUBCMD_COUNT,
> +};
> +
> +enum ec_codec_cap {
> +	EC_CODEC_CAP_LAST =3D 32,
> +};
> +
> +enum ec_codec_shm_id {
> +	EC_CODEC_SHM_ID_LAST,
> +};
> +
> +enum ec_codec_shm_type {
> +	EC_CODEC_SHM_TYPE_EC_RAM =3D 0x0,
> +	EC_CODEC_SHM_TYPE_SYSTEM_RAM =3D 0x1,
> +};
> +
> +struct __ec_align1 ec_param_ec_codec_get_shm_addr {
> +	uint8_t shm_id;
> +	uint8_t reserved[3];
> +};
> +
> +struct __ec_align4 ec_param_ec_codec_set_shm_addr {
> +	uint64_t phys_addr;
> +	uint32_t len;
> +	uint8_t shm_id;
> +	uint8_t reserved[3];
> +};
> +
> +struct __ec_align4 ec_param_ec_codec {
> +	uint8_t cmd; /* enum ec_codec_subcmd */
> +	uint8_t reserved[3];
> +
> +	union {
> +		struct ec_param_ec_codec_get_shm_addr
> +				get_shm_addr_param;
> +		struct ec_param_ec_codec_set_shm_addr
> +				set_shm_addr_param;
> +	};
> +};
> +
> +struct __ec_align4 ec_response_ec_codec_get_capabilities {
> +	uint32_t capabilities;
> +};
> +
> +struct __ec_align4 ec_response_ec_codec_get_shm_addr {
> +	uint64_t phys_addr;
> +	uint32_t len;
> +	uint8_t type;
> +	uint8_t reserved[3];
> +};
> +
> +/***********************************************************************=
******/
> +
>  /* Commands for DMIC on audio codec. */
> -#define EC_CMD_EC_CODEC_DMIC 0x00BC
> +#define EC_CMD_EC_CODEC_DMIC 0x00BD
> =20
>  enum ec_codec_dmic_subcmd {
>  	EC_CODEC_DMIC_SET_GAIN =3D 0x0,
> @@ -4500,7 +4560,7 @@ struct __ec_align1 ec_response_ec_codec_dmic_get_ga=
in {
> =20
>  /* Commands for I2S RX on audio codec. */
> =20
> -#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
> +#define EC_CMD_EC_CODEC_I2S_RX 0x00BE
> =20
>  enum ec_codec_i2s_rx_subcmd {
>  	EC_CODEC_I2S_RX_ENABLE =3D 0x0,
> --=20
> 2.23.0.700.g56cf767bdb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXafYmAAKCRBzbaomhzOw
whpZAPwMfZmGpA/4VyA899pci6XbRvn07QP9yN9NJJ3JXZFjUAEA6fzzW+VhtEpU
k30TwffsdHMZ3vF3qjcGC/9vG+p7LgM=
=WcX7
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--

--===============7493725148367866959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7493725148367866959==--
