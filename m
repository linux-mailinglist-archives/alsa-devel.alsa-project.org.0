Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6B87CEAC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 15:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDBA2353;
	Fri, 15 Mar 2024 15:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDBA2353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710512659;
	bh=cr+/aQT+qT9SbX9VXJjLYOAL3dxlPMmPMDGFkNlLRRw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3x+4BseG4rFTvwno9WfTxe8bh0/zvKMzPdE959aJo0jGVvBvQcdfA/vDCxJkYC64
	 tUrYf2IEPqtQuzu7VThgCsHmlrn0Y4ET6pksB2XYb7Ko4GlJQ5dv/MVC3E3cuLMyDF
	 r2Yh6uoTcMCknwTVYJMkja4ZbvFZFnzaQOzdtQD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E03A3F804B2; Fri, 15 Mar 2024 15:23:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E88EF8059F;
	Fri, 15 Mar 2024 15:23:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2113FF8025F; Fri, 15 Mar 2024 15:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 248A9F8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 248A9F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i7+C2wYk
Received: by mail.gandi.net (Postfix) with ESMTPSA id F00A26000F;
	Fri, 15 Mar 2024 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710512615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nWOjdNRJQt/bpdeE8qfZ2hZ2CbBU52wmtVHaGOGss9o=;
	b=i7+C2wYk12fq9PeTVpN2e8X4HliWxtZGH+XwwfFPLtfcDj1C09gYCdGxmdg5HdzW3bl+mB
	IAsJ6LdKwsG0vTPG5bMZkaMOleEBpSsg8vKMY/B9LsoRS590BofF559/NLsxQTrx2T7Ya8
	u1Uiwkzgs8MaBGOsAS2GL+bygh6Rs/kIe8xfCFKOFofypuRc66ho75qhk5QbzTM4AoxMPI
	CujAS9c+nWLRDQBfIEDciN3tvnyZccTARz+aPxC3L2HAJEqhpgv92m+9FUp8UBAhA4XbE0
	diBs2+xdWEpsRxOwQTd6Q4DMMRRIRxnt9wNh68oHji1WTKc3Aejz+XAJB1txbw==
Date: Fri, 15 Mar 2024 15:23:32 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 04/13] ASoC: ti: davinci-i2s: Replace dev_err with
 dev_err_probe
Message-ID: <20240315152332.57c8fdc4@bootlin.com>
In-Reply-To: <6102130b-b496-4e75-9b9f-f960484848fb@sirena.org.uk>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
	<20240315112745.63230-5-bastien.curutchet@bootlin.com>
	<6102130b-b496-4e75-9b9f-f960484848fb@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: AWW7KH37SUX5L763CA6VCN3YCMTWX4VO
X-Message-ID-Hash: AWW7KH37SUX5L763CA6VCN3YCMTWX4VO
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWW7KH37SUX5L763CA6VCN3YCMTWX4VO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Fri, 15 Mar 2024 14:07:13 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Mar 15, 2024 at 12:27:36PM +0100, Bastien Curutchet wrote:
> 
> > -			dev_err(&pdev->dev, "no mem resource?\n");
> > -			return -ENODEV;
> > +			return dev_err_probe(&pdev->dev, -ENODEV, "no mem resource?\n");
> >  		}  
> 
> dev_err_probe() with a fixed error code doesn't seem to make much sense,
> the whole point is to handle deferral but for a straight lookup like
> this that can't happen.

The error code is uniformly formatted and the error path is more compact.
  https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L4963

IMHO, to benefit of these feature, it makes sense to use it even with a fixed
error code.

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
