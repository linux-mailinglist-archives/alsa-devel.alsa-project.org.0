Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A917F901161
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 14:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2998822;
	Sat,  8 Jun 2024 14:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2998822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717848032;
	bh=DzZItR/XD7N9LswW4+TMkpca7KLSfzsgxdoa43ZNfDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b3oRbJfZxPa5WNNMTyJQS9pGkK0mn5nF7TiWcM03q+jnGH3hvEggnMQtYCtRsuXef
	 FWKH825R68AvYRxGTItoow9uRLnKjIMnvQ8EN5J0ZHwpMOdqZfghDZWlcE3gQhVXzg
	 iFNW1rpJ/gsLGITqSa5QUmJEYyOJ8ub5HXaCP6Qs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33675F805A9; Sat,  8 Jun 2024 14:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B48FCF80578;
	Sat,  8 Jun 2024 14:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96414F804D6; Sat,  8 Jun 2024 13:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6285DF80107
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6285DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U6GINMJk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12646CE1EA1
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 11:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EC5C4AF08
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717847928;
	bh=DzZItR/XD7N9LswW4+TMkpca7KLSfzsgxdoa43ZNfDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U6GINMJkSlCE41KfeaZzFXTUrtZxDWSXH4JVhX9PcTRg4CT1avrA0pw1g0YxTg+fF
	 5Lw2IPNc2TvxHCn+i8eJQ1TOt3YG0aFTLFFOIKVFqp0VA2d9XBPYKboK/U2ris6OLJ
	 VxRnzshbIdkdGrSHwAkXMBmENZDuiPnK8np3YjX532syJvdkUznNMAUhCMVbmX6AES
	 35YDLDksqui+QvpJqmnVTv6Hj9gwpxaIjXWc55Y6Zi3tbDvy4GUpAYQTnVx5rgTwLU
	 2rNhqpUkDBpUX82vypdGoTqT7YYRweE5D5YagB39ysDYJRdVKazSaXEmNfFq12Fbsu
	 femu34yk9gODA==
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5ba84b73b6aso280757eaf.2
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 04:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWg1jpbn/ZTuRuWoMYgq6G8dTHBX3UXrMX5eQZ4jAlIlNVLMHK9QkyVS4NV/zWZBypZ2LcwZM3Qkupbd3a5ONstUfuthbbfxD1QZWQ=
X-Gm-Message-State: AOJu0YwxYKac8uhKDsx3xgJYDJOCtkTqHHy9wqIU3cJzV1Zb43/ApEsh
	MDFI/LeenBrpUbP9Gfs08W7DlfFukFXE+JYAZ4yfHV/1loK6n9p+XcUXwfSC8rVh80kfQIcMOkJ
	RPtgN6ZLJHW6Uut4/qD8X7oCKBJM=
X-Google-Smtp-Source: 
 AGHT+IHOgfE8EAt38vVrthEz/6qkdGWnaA9HHRM1PPC9eDL1nE44LwGfWGO+Utqm9g98PDm86I2O3dR5lHLvECcfzt4=
X-Received: by 2002:a05:6820:d13:b0:5ba:ca86:a025 with SMTP id
 006d021491bc7-5baca86a2a3mr2925804eaf.0.1717847927247; Sat, 08 Jun 2024
 04:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
 <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
 <998d53cf-c22b-4706-93af-ab38802dc531@linux.intel.com>
In-Reply-To: <998d53cf-c22b-4706-93af-ab38802dc531@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 8 Jun 2024 13:58:34 +0200
X-Gmail-Original-Message-ID: 
 <CAJZ5v0jVpLNLiQ3uHEA9+MWWHv91Yov5hC8uhTg5+z3mK08Yuw@mail.gmail.com>
Message-ID: 
 <CAJZ5v0jVpLNLiQ3uHEA9+MWWHv91Yov5hC8uhTg5+z3mK08Yuw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ACPI: utils: introduce acpi_get_local_u64_address()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
	vkoul@kernel.org, andriy.shevchenko@linux.intel.com,
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Len Brown <lenb@kernel.org>,
	"open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PU3U3WLM3DQLSVYXCXJL52CTFIWERCWI
X-Message-ID-Hash: PU3U3WLM3DQLSVYXCXJL52CTFIWERCWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PU3U3WLM3DQLSVYXCXJL52CTFIWERCWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 7, 2024 at 10:33=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 6/7/24 20:51, Rafael J. Wysocki wrote:
> > On Tue, May 28, 2024 at 9:29=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >> The ACPI _ADR is a 64-bit value. We changed the definitions in commit
> >> ca6f998cf9a2 ("ACPI: bus: change _ADR representation to 64 bits") but
> >> some helpers still assume the value is a 32-bit value.
> >>
> >> This patch adds a new helper to extract the full 64-bits. The existing
> >> 32-bit helper is kept for backwards-compatibility and cases where the
> >> _ADR is known to fit in a 32-bit value.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.=
com>
> >> Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >
> > Do you want me to apply this or do you want me to route it along with
> > the rest of the series?
> >
> > In the latter case feel free to add
> >
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Thanks Rafael. I think it's easier if Mark Brown takes the series in
> ASoC, I have additional ASoC patches that use the u64 helper.
>
> Mark?
>
>
> >>
> >> +int acpi_get_local_u64_address(acpi_handle handle, u64 *addr)
> >> +{
> >> +       acpi_status status;
> >> +
> >> +       status =3D acpi_evaluate_integer(handle, METHOD_NAME__ADR, NUL=
L, addr);
> >> +       if (ACPI_FAILURE(status))
> >> +               return -ENODATA;
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL(acpi_get_local_u64_address);
> >
> > I'd prefer EXPORT_SYMBOL_GPL() here unless you absolutely cannot live w=
ith it.
>
> I don't mind, but the existing helper was using EXPORT_SYMBOL so I just
> copied. It'd be odd to have two helpers that only differ by the argument
> size use a different EXPORT_ macro, no? Not to mention that the
> get_local address uses EXPORT_SYMBOL but would become a wrapper for an
> EXPORT_SYMBOL_GPL. That gives me a headache...

OK, fair enough.
