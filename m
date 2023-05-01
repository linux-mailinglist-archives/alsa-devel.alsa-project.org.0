Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB06F3292
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 17:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90C11817;
	Mon,  1 May 2023 17:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90C11817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682953812;
	bh=cUsOqfxkIZKyqqJ02ZRf0fbQ0VVSONKVBQcffytJjtk=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XvvamVrtmCZf6urnnLJby1pZvsW4uwYLDTaDsB+iMP8fOn0FVKg7GSDwpPXqk9MwH
	 pCmqPNRL8Vy5Y5Bdf+1wiaMshRPKxz4YpDmdQU8YP6XGNkd8vE4sbdohGuTFA2SqZF
	 ErYrTgVweSaruHNceS/5JpD0R2/m9notcL5GSpKU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 486B6F8032B;
	Mon,  1 May 2023 17:09:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 962C1F8049E; Mon,  1 May 2023 17:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBCD7F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 17:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCD7F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LXsZT+m4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C993561DB8;
	Mon,  1 May 2023 15:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2769C433D2;
	Mon,  1 May 2023 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682953752;
	bh=cUsOqfxkIZKyqqJ02ZRf0fbQ0VVSONKVBQcffytJjtk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LXsZT+m4RC1Wkzi4gGg7dhvNreN88Pqydx70S7nVYE3En1YazI1UXgrbDB/acgko4
	 WdN0xFED3fL+1lqYjoNtpiWvpUkQHn0dNcr5Tiw7hziaTknpfeok8+ybqMSuDk83Sd
	 D28ffSMdMstVcNMKRxmI5eeyRFOrp3EZhxj7ZMV+8YcjLMz6ursQFkWzgde7DSGk0+
	 hURXmbJ6WJQSwV6dNCtmIFgI+DG/+9sVVEDGOxvPoDA4KmzUD/aQhENlLfkIB+k9z9
	 aKemwGil86e9cGRezdqtMUWqZVbY0VyyvpxZHHfK1vCGk883WzoXbnogrMeBOyXKV/
	 jwuPst3iBBYhg==
Date: Mon, 1 May 2023 16:24:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 4/4] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
Message-ID: <20230501162456.3448c494@jic23-huawei>
In-Reply-To: <20230424125216.0f279f82@bootlin.com>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-5-herve.codina@bootlin.com>
	<20230422180814.61d24aa3@jic23-huawei>
	<20230424125216.0f279f82@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QRN72A765GUCSQ3UATZWLU2BSOXKFPIB
X-Message-ID-Hash: QRN72A765GUCSQ3UATZWLU2BSOXKFPIB
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRN72A765GUCSQ3UATZWLU2BSOXKFPIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> >   
> > > +static int simple_iio_aux_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device_node *np = pdev->dev.of_node;
> > > +	struct simple_iio_aux_chan *iio_aux_chan;
> > > +	struct simple_iio_aux *iio_aux;
> > > +	int count;
> > > +	u32 tmp;
> > > +	int ret;
> > > +	int i;
> > > +
> > > +	iio_aux = devm_kzalloc(&pdev->dev, sizeof(*iio_aux), GFP_KERNEL);
> > > +	if (!iio_aux)
> > > +		return -ENOMEM;
> > > +
> > > +	iio_aux->dev = &pdev->dev;
> > > +
> > > +	count = of_property_count_strings(np, "io-channel-names");
> > > +	if (count < 0) {
> > > +		dev_err(iio_aux->dev, "%pOF: failed to read io-channel-names\n", np);
> > > +		return count;
> > > +	}
> > > +
> > > +	iio_aux->chans = devm_kmalloc_array(&pdev->dev, count,
> > > +					    sizeof(*iio_aux->chans), GFP_KERNEL);
> > > +	if (!iio_aux->chans)
> > > +		return -ENOMEM;
> > > +	iio_aux->num_chans = count;
> > > +
> > > +	for (i = 0; i < iio_aux->num_chans; i++) {
> > > +		iio_aux_chan = iio_aux->chans + i;
> > > +
> > > +		ret = of_property_read_string_index(np, "io-channel-names", i,
> > > +						    &iio_aux_chan->name);    
> > 
> > Whilst today this will be tightly couple with of, if you can use generic firmware
> > handling where possible (from linux/property.h) it will reduce what needs
> > to be tidied up if anyone fills in the gaps for IIO consumer bindings in ACPI
> > and then someone uses PRP0001 based ACPI bindings.  
> 
> No device_property_read_*() function family are available to get a value
> from an array using an index.

That feels like it might be a feature gap in the generic property handling that
should be solved.  Emtirely reasonable not to do it in this series however!



> 
> I would prefer to keep the of_property_read_*() function family I use for this
> first IIO auxiliary device support.
> 
> >   
> > > +		if (ret < 0) {
> > > +			dev_err(iio_aux->dev, "%pOF: failed to read io-channel-names[%d]\n", np, i);    
> > 
> > dev_err_probe() would simplify these cases a little.  Not sure on ASOC view on using
> > that for cases that won't defer.  I tend to take the view it's nicer everywhere
> > for calls in probe() functions.  
> 
> I have the feeling that ASoC uses dev_err_probe() for cases that can defer.
> Mark, can you confirm ?
> 

Left as needs an answer from Mark.

Jonathan



