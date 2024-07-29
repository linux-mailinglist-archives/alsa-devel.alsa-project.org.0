Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E393ED43
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 08:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423E6839;
	Mon, 29 Jul 2024 08:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423E6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722233750;
	bh=mdXaX/I7zsamo8g6v05bVQ+OjFV8uJNOfkizzRlWC1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lVQje7ajtQoLUQ0kqse15/P5Qxkrqaj5nrPmZhNpK0RDdv/n5gjpJrD+1hy/K4GyW
	 EU1kmo401oOaAQMIUwmho+1aPOfUkaC5VBsMNu5tO3znqag5QCv3BMI0HMMcv5LAPv
	 leEiGrK4wH/t41LjOv/U1LQ21/K5eZa87H3oaDfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25BEDF80580; Mon, 29 Jul 2024 08:15:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E69BF805B3;
	Mon, 29 Jul 2024 08:15:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68650F802DB; Mon, 29 Jul 2024 08:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52BD8F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 08:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BD8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SLMqeTDB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A84D8CE0A38
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 06:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046C2C4AF09
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722233227;
	bh=mdXaX/I7zsamo8g6v05bVQ+OjFV8uJNOfkizzRlWC1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SLMqeTDB5gxiMEF3SIwrn5MTMNE9118DvsK/knoKn8/KJLiKZfQWhS3tHBQ4+V5GZ
	 7ZpxQN1jFQO7pVSZL+PRbY2peWX6HtONV93nZ7e8GD7hzqOoF3vrJpOfrPFDWG32hw
	 ++jn24ZUClMw+xX/zWsKFXOz6OPEPux7OV1hkKMvKOtecezKwL+aquJ9YLIR/TXAIS
	 xe7NMZ7bu/oDOg5gSUaTBLBi/g5uDrL7yQMj+Q1r3DHrx4Kp6du41UmSpE7pt7rfmf
	 qkQkF/2MO+Nsqj8r3nm+wA8jDUO3AHTC1jl2+NWWL/nOFyzA9cbrKnuzc0sO+eme5V
	 9AuZdawXbWGXA==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52f025bc147so4283963e87.3
        for <alsa-devel@alsa-project.org>;
 Sun, 28 Jul 2024 23:07:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywp7XxFTlUskT46sWPuPK1j5Z71EzCAH5ooWBmOPvQu3G++XnlQ
	VoX2mcliwEYjDYxLkzOFGxAVtLOc/e/ZjfQHojeYu2W5LL9jnHlLxMbGBFPI42uWBYYesBhV3ie
	e45EPOsPOC2tQudR1oPsBvsRjXeo=
X-Google-Smtp-Source: 
 AGHT+IEaUUPAFEIfx+aS3dP+tnOlmjGmVlPdnXmPHa0w+1pwDJCKqdX9Y4kC5wXE8VDyCJO8HgBfFV6GLpqTc8+y9+Y=
X-Received: by 2002:a19:7404:0:b0:52c:d80e:55a5 with SMTP id
 2adb3069b0e04-5309b2c3071mr3725189e87.41.1722233225661; Sun, 28 Jul 2024
 23:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240606133615.986035-1-masahiroy@kernel.org>
In-Reply-To: <20240606133615.986035-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Jul 2024 15:06:29 +0900
X-Gmail-Original-Message-ID: 
 <CAK7LNARnBDXm0fsVaeHdvst_XqH35K5+LeBdBAZa15brOKEyfw@mail.gmail.com>
Message-ID: 
 <CAK7LNARnBDXm0fsVaeHdvst_XqH35K5+LeBdBAZa15brOKEyfw@mail.gmail.com>
Subject: Re: [PATCH] slimbus: generate MODULE_ALIAS() from
 MODULE_DEVICE_TABLE()
To: alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 26WHZFLQ66LH4ASMBON5B5OGY7G4H6WX
X-Message-ID-Hash: 26WHZFLQ66LH4ASMBON5B5OGY7G4H6WX
X-MailFrom: masahiroy@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26WHZFLQ66LH4ASMBON5B5OGY7G4H6WX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srinivas,


Any comments?



On Thu, Jun 6, 2024 at 10:36=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit 9e663f4811c6 ("slimbus: core: add support to uevent") added the
> MODALIAS=3Dslim:* uevent variable, but modpost does not generate the
> corresponding MODULE_ALIAS().
>
> To support automatic module loading, slimbus drivers still need to
> manually add MODULE_ALIAS("slim:<manf_id>:<prod_code>:*"), as seen in
> sound/soc/codecs/wcd9335.c.
>
> To automate this, make modpost generate the proper MODULE_ALIAS() from
> MODULE_DEVICE_TABLE(slim, ).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/devicetable-offsets.c |  4 ++++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index 518200813d4e..9c7b404defbd 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -153,6 +153,10 @@ int main(void)
>         DEVID_FIELD(i3c_device_id, part_id);
>         DEVID_FIELD(i3c_device_id, extra_info);
>
> +       DEVID(slim_device_id);
> +       DEVID_FIELD(slim_device_id, manf_id);
> +       DEVID_FIELD(slim_device_id, prod_code);
> +
>         DEVID(spi_device_id);
>         DEVID_FIELD(spi_device_id, name);
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5d1c61fa5a55..99dce93a4188 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -960,6 +960,16 @@ static int do_i3c_entry(const char *filename, void *=
symval,
>         return 1;
>  }
>
> +static int do_slim_entry(const char *filename, void *symval, char *alias=
)
> +{
> +       DEF_FIELD(symval, slim_device_id, manf_id);
> +       DEF_FIELD(symval, slim_device_id, prod_code);
> +
> +       sprintf(alias, "slim:%x:%x:*", manf_id, prod_code);
> +
> +       return 1;
> +}
> +
>  /* Looks like: spi:S */
>  static int do_spi_entry(const char *filename, void *symval,
>                         char *alias)
> @@ -1555,6 +1565,7 @@ static const struct devtable devtable[] =3D {
>         {"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
>         {"i2c", SIZE_i2c_device_id, do_i2c_entry},
>         {"i3c", SIZE_i3c_device_id, do_i3c_entry},
> +       {"slim", SIZE_slim_device_id, do_slim_entry},
>         {"spi", SIZE_spi_device_id, do_spi_entry},
>         {"dmi", SIZE_dmi_system_id, do_dmi_entry},
>         {"platform", SIZE_platform_device_id, do_platform_entry},
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada
