Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD67900C11
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 20:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A00D93A;
	Fri,  7 Jun 2024 20:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A00D93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717786398;
	bh=cFzkODmuFdatFvol7eP8ZUj927zMJW9NOIP9knaSwqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uMrOT+9Erj7By0vvA/KO7DdGHDmuwUWMcg7idkx7mMWNgY0uqN8KRX/HLHe8vUpMF
	 If7+B6kAbBjuW66P17NbBCbZpuOYO7yM47ANs9Z/GxZYx4vQKDEA/l2zhTFQCncddW
	 kQ+Mgi1X/YiJTPxHiJuIAW2RxnNRuYOmrrnWUoCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28532F80517; Fri,  7 Jun 2024 20:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 633E5F8058C;
	Fri,  7 Jun 2024 20:52:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C73F804B2; Fri,  7 Jun 2024 20:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2EF4F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 20:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EF4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tJ/KCLvp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17E2962020
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 18:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79074C4AF07
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717786288;
	bh=cFzkODmuFdatFvol7eP8ZUj927zMJW9NOIP9knaSwqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tJ/KCLvpAQp9P+xzeq/6CkTDwAkNJUy20ikt9Y8mBnm4ySHuZfdPh5W+x/dBgqPNl
	 n53kEHEa1Mz9+CrEJYiOqvk4gpERRCGPpmiT1HuCMlK2Lzbn+SwgXuvqrLtCt0/LKY
	 jH2HYUdu7NsL2XMNo96hapMJTcxo1ZLaVyjRiwC69ItjpDANAuvxDKIjoqFknV4fw7
	 GofetUKQZsi6VdG2P9AmYokVhM/OMDpH4pT42jptURKeDio1zB0vRLtLQrzgOmdn9w
	 YJPmflr6C77QiIdBQhjz7rmpDIZc9xmhRDv2yZM9VYSBIzViMY2iRefrmSXXrTuUSP
	 cD88MlB6pC+Ng==
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5ba68c30395so271344eaf.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jun 2024 11:51:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPgonyStNp+Egl7xpFrw2KYBWQGNPNTHLMJdI30rIZHQbYSGlikyQCGCtVHOVN8vm8Jhip1Q+WEZSdF4uUkVuIxijbarEuJWuTMJQ=
X-Gm-Message-State: AOJu0YwxJrPueS6tyj0GYbhSQu1m/Q03j0JtYnoYpT5zDC6Mr2cxomJV
	SWlXa+LgFHabE3YNWMrlzEKlYy9QODFefhOW0oAk88fQ8rv0tLnip8dB9SwqAlcsSE50FPE+5pN
	TNXNHTzwEnXrvuX9DBa/9GdUgqXE=
X-Google-Smtp-Source: 
 AGHT+IFsrjyMELPV1llaPxZb1cvGhLLxJKvmwyTp0MUABHmTP4LU0rIk0K5xv2Xq9o9QbrFspFa7s+sGnpxz0dgKb9k=
X-Received: by 2002:a4a:ac08:0:b0:5aa:3e4f:f01e with SMTP id
 006d021491bc7-5baae73b688mr3253417eaf.1.1717786287770; Fri, 07 Jun 2024
 11:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
 <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 7 Jun 2024 20:51:16 +0200
X-Gmail-Original-Message-ID: 
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
Message-ID: 
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] ACPI: utils: introduce acpi_get_local_u64_address()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, rafael@kernel.org, vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Len Brown <lenb@kernel.org>,
	"open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WD4EXM4SAQFMWLO56T2S5HB7HABWYWJT
X-Message-ID-Hash: WD4EXM4SAQFMWLO56T2S5HB7HABWYWJT
X-MailFrom: rafael@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WD4EXM4SAQFMWLO56T2S5HB7HABWYWJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 28, 2024 at 9:29=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> The ACPI _ADR is a 64-bit value. We changed the definitions in commit
> ca6f998cf9a2 ("ACPI: bus: change _ADR representation to 64 bits") but
> some helpers still assume the value is a 32-bit value.
>
> This patch adds a new helper to extract the full 64-bits. The existing
> 32-bit helper is kept for backwards-compatibility and cases where the
> _ADR is known to fit in a 32-bit value.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Do you want me to apply this or do you want me to route it along with
the rest of the series?

In the latter case feel free to add

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to it.

Thanks!

> ---
>  drivers/acpi/utils.c | 22 ++++++++++++++++------
>  include/linux/acpi.h |  1 +
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 202234ba54bd..ae9384282273 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -277,15 +277,25 @@ acpi_evaluate_integer(acpi_handle handle,
>
>  EXPORT_SYMBOL(acpi_evaluate_integer);
>
> +int acpi_get_local_u64_address(acpi_handle handle, u64 *addr)
> +{
> +       acpi_status status;
> +
> +       status =3D acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, =
addr);
> +       if (ACPI_FAILURE(status))
> +               return -ENODATA;
> +       return 0;
> +}
> +EXPORT_SYMBOL(acpi_get_local_u64_address);

I'd prefer EXPORT_SYMBOL_GPL() here unless you absolutely cannot live with =
it.

> +
>  int acpi_get_local_address(acpi_handle handle, u32 *addr)
>  {
> -       unsigned long long adr;
> -       acpi_status status;
> -
> -       status =3D acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, =
&adr);
> -       if (ACPI_FAILURE(status))
> -               return -ENODATA;
> +       u64 adr;
> +       int ret;
>
> +       ret =3D acpi_get_local_u64_address(handle, &adr);
> +       if (ret < 0)
> +               return ret;
>         *addr =3D (u32)adr;
>         return 0;
>  }
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 28c3fb2bef0d..65e7177bcb02 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -761,6 +761,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
>  }
>  #endif
>
> +int acpi_get_local_u64_address(acpi_handle handle, u64 *addr);
>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
>  const char *acpi_get_subsystem_id(acpi_handle handle);
>
> --
