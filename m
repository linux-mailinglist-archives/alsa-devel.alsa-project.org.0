Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6F7342CB
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 19:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22770843;
	Sat, 17 Jun 2023 19:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22770843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687024061;
	bh=hMT4LGOeCEN9ozXyV4zVUtX/Z9t+AI6WEzC3nEygvaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I9a4pUuPVa4ZGn/fBS1Sc0DFztgN9qK4KhbzaYYfGOdy5qacXsFYE7eEa+EPDPQph
	 8pGUDKs1ZuFocGW0ZTHYVKl2Eu7ObH0VZzjhYBgjrWTKppECLIxo9zaqMzYbPMuPAq
	 9qGt3YINX9xT4HOMLOLPPmJvLm9y+ACwl50eSv+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E6AAF80557; Sat, 17 Jun 2023 19:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D0BEF80149;
	Sat, 17 Jun 2023 19:46:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A56FF80155; Sat, 17 Jun 2023 19:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AB3BF80132
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 19:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AB3BF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kXOeFadJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AE8E60C12;
	Sat, 17 Jun 2023 17:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2D1C433C0;
	Sat, 17 Jun 2023 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687023994;
	bh=hMT4LGOeCEN9ozXyV4zVUtX/Z9t+AI6WEzC3nEygvaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kXOeFadJtidlKQEy2d9VpGOCLVN+DsY2EivkxGUfLg25UMgBIY+CIt3iVqkCueUDi
	 SRH63yW8c3TqCPDceAyldogBMJQe9EjtJnVumtlFw2+P2Y1qh4swXh+YAN30X7e9zc
	 nMk0HwGzvq8bUPLUMEGxZJYQHp04kc2ZjNso5PLlcAkUkn4h+0p06Pd50lWodbXukm
	 INfxr8l+c09VHCmWM48f+GVuKbO4TGH4c7KCuSLPc/tGE+JibPPY/b3yGuPICD+A1m
	 wGVNU2wCOtA7TuLy6+mrOLJ8G+Dk+OFcWvpMwjXUzLYeNBn0KHD9aHsFPno78OcoHA
	 wOB8jGeWreHHg==
Date: Sat, 17 Jun 2023 18:46:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v5 09/13] iio: inkern: Replace a FIXME comment by a TODO
 one
Message-ID: <20230617184624.61fb6252@jic23-huawei>
In-Reply-To: <20230615152631.224529-10-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-10-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F3ODAF4JTWJM4GCZGNZC4PGZVFRITC7X
X-Message-ID-Hash: F3ODAF4JTWJM4GCZGNZC4PGZVFRITC7X
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3ODAF4JTWJM4GCZGNZC4PGZVFRITC7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 17:26:27 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> This FIXME comment is more a TODO one.
> It is a note when someone will need for this currently unsupported case.
> 
> Change from FIXME to TODO.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/inkern.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 8bfd91f74101..19ddd77adb11 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -879,7 +879,7 @@ static int iio_channel_read_max(struct iio_channel *chan,
>  			*val = max_array(vals, length);
>  			break;
>  		default:
> -			/* FIXME: learn about max for other iio values */
> +			/* TODO: learn about max for other iio values */
>  			return -EINVAL;
>  		}
>  		return 0;

