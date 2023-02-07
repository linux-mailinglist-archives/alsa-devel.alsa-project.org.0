Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953D68E452
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5727F8;
	Wed,  8 Feb 2023 00:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5727F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811973;
	bh=H/oVSZcRF3b8KDtF5uAb06gMQM+ekcrQs1AeSvC4p6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OK8gO4FiXOgiXlJ1HboZjMUD5m5R2GpNschBZk/TaqYf5X/5vWIrMXOZqeJWDmjm9
	 OaH5O1gYQuiIXZhIAxfIrjQ/gGMAEwC3Q1/GEUaCS2SC/aPJ5CYt3THx4HyhvTQjuB
	 GmvEOzt1csfdsEBk8vAkPcsahpzTpW1jGfmD4sMQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B76ABF800E2;
	Wed,  8 Feb 2023 00:18:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47597F8012B; Wed,  8 Feb 2023 00:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C94AF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C94AF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X3rJisH4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79945B81990
	for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 13:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF22C433A1
	for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675777830;
	bh=DMSQcB2gRBiYrCLNnIJNq5P5lvWtVkLpSH0UjyUj4+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X3rJisH4D9N4h5LfmaiMiCPlCAXxUJhpyx9ew/Qn4HmiBs6tdOUxfBIzfz0Il9GJJ
	 1VPzI5KWWmjwHjSFgiaRzN+g3npE+qNoFO0ws6s69xFX2zJ2DvsnSUX5W2hgVnmA+f
	 q2caFLVBY4pxxrvmAniqU2DWA8NuV8AMfHPjP5oDCnpllUL7nJ82oCpvm4beCQ5tS2
	 wswnZswe2QOC6sNtMrUq+EDhlHdOtd1ouUVKCjDSV9Qlqwzmv4805Jt9HVu4XEpjIu
	 k3ZANYH4/7Dcvoq20Cp8nnKYgsSJ+Vr+iEalXRugEJNv+2IAy8STA/HR0tno/PAshc
	 fxjvzA/xhEn6w==
Received: by mail-vs1-f49.google.com with SMTP id d66so16264191vsd.9
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 05:50:30 -0800 (PST)
X-Gm-Message-State: AO0yUKXU8h/y/71lTW+QM393KOtiaoDv5LibmPoygLOd1cFfRx6hyGc1
	WzJLd0azoIrgAbM7jA8ojMPG8recEpJWwRXC0g==
X-Google-Smtp-Source: 
 AK7set9Mqs4Sx0a58l7EyhlbieUTrJF9RKPUKmeczwiTxCkbvS2g0I4TZU3iyOJf9Ok5Nh88ak3V1dtUt64keTdUzkc=
X-Received: by 2002:a67:7206:0:b0:3ea:c8c:48a5 with SMTP id
 n6-20020a677206000000b003ea0c8c48a5mr659074vsc.53.1675777829362; Tue, 07 Feb
 2023 05:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
 <167571334291.1212116.1869881432057405431.robh@kernel.org>
 <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Feb 2023 07:50:17 -0600
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+OMYwJ3_bjhOgGq--SAotqAW7fnzQfEOnHR+_cxSW1RA@mail.gmail.com>
Message-ID: 
 <CAL_Jsq+OMYwJ3_bjhOgGq--SAotqAW7fnzQfEOnHR+_cxSW1RA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID-Hash: O5ESU3YX2SQDVKJ4MX4GIFXK3X3CRYH5
X-Message-ID-Hash: O5ESU3YX2SQDVKJ4MX4GIFXK3X3CRYH5
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5ESU3YX2SQDVKJ4MX4GIFXK3X3CRYH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 7, 2023 at 3:33 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 06 Feb 2023 at 13:59, Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
> >> Convert the DT binding documentation for the Amlogic tdm formatters to
> >> schema.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
> >>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
> >>  2 files changed, 88 insertions(+), 36 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> >>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml:
> > Unable to find schema file matching $id:
> > http://devicetree.org/schemas/sound/component-common.yaml
>
> This is a false error because the bot does not have the patch applied
> by Mark from v1 here [0]
>
> [0]: https://lore.kernel.org/all/167543616131.928818.17902040818579023398.b4-ty@kernel.org/

State that in this patch and the bot's advanced AI capabilities will
not send the report.

Rob
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
