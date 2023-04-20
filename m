Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B06E9515
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 14:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 033D0EC6;
	Thu, 20 Apr 2023 14:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 033D0EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681995181;
	bh=NxIMbU7NmODWW6Lyqi+DPtyb5o+AafTNe2mF42Ub/B4=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=cbyohh5Pg6PyrjErhfFfsauz2BRZx+1bLR7clHbt517zhMjEkmEMevfgwuD709FZb
	 skFGCv29Eax3Ttb5uhrnEuu4lO1a0u/de88DMZLYlP+wShRrN3PC7bzZrEgj9m8z0M
	 m38uQ3CJpA3csjHcWuBPoiM+qvNukcHqfgGnIdS8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D1FF80149;
	Thu, 20 Apr 2023 14:52:10 +0200 (CEST)
Date: Thu, 20 Apr 2023 14:52:02 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v6 2/7] mfd: core: Ensure disabled devices are skiped
 without aborting
In-Reply-To: <20230420122955.GA996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-3-herve.codina@bootlin.com>
	<20230420122955.GA996918@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S75NXUR7XMBMCESAOR23GPFOUFDJH3TH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168199512950.26.6353720843193397165@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03554F80155; Thu, 20 Apr 2023 14:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF272F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 14:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF272F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K3NraIj0
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2974640006;
	Thu, 20 Apr 2023 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681995124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSvkVShDg2ogaaxh+qhZHwOBGnoML0lh9gLtFf0aYJY=;
	b=K3NraIj0bS9d2Ti9kkDjrdUnGd5Vvl/H4l2VnJrcbWQBF35iNR1tne4vvmzKC50ehtfOnv
	Lsy5pl7nk09AurzhQFsU/l069qzTDJVv5jyfQJqHeMcT+TgmkBZWzIg6BJ+95OLkQ8eC8F
	c4aFDnEtkuZvSztyCp/ifxAvgEDsxyMo4GYY4WxZO7Zv9hpU4dREDRkwnaC9z58aGPEMBe
	FKzuNaLV9K3xz7EUhO7l3wBEIzrMBkFPTns6DknzBLDw/XaGvLcEL1QddQoT3OdDYRAD5G
	YVY7RN4OH1eEvWC/b70AG4MHSqBbmTAeZ26WA59htBOYIJH3BTyXA7ZofApklQ==
Date: Thu, 20 Apr 2023 14:52:02 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v6 2/7] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230420145202.4e21b51d@bootlin.com>
In-Reply-To: <20230420122955.GA996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-3-herve.codina@bootlin.com>
	<20230420122955.GA996918@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S75NXUR7XMBMCESAOR23GPFOUFDJH3TH
X-Message-ID-Hash: S75NXUR7XMBMCESAOR23GPFOUFDJH3TH
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S75NXUR7XMBMCESAOR23GPFOUFDJH3TH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Apr 2023 13:29:55 +0100
Lee Jones <lee@kernel.org> wrote:

> On Mon, 17 Apr 2023, Herve Codina wrote:
> 
> > The loop searching for a matching device based on its compatible
> > string is aborted when a matching disabled device is found.
> > This abort avoid to add devices as soon as one disabled device
> > is found.
> > 
> > Continue searching for an other device instead of aborting on the
> > first disabled one fixes the issue.
> > 
> > Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/mfd/mfd-core.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> > index 16d1861e9682..7c47b50b358d 100644
> > --- a/drivers/mfd/mfd-core.c
> > +++ b/drivers/mfd/mfd-core.c
> > @@ -176,6 +176,7 @@ static int mfd_add_device(struct device *parent, int id,
> >  	struct platform_device *pdev;
> >  	struct device_node *np = NULL;
> >  	struct mfd_of_node_entry *of_entry, *tmp;
> > +	bool not_available;
> >  	int ret = -ENOMEM;
> >  	int platform_id;
> >  	int r;
> > @@ -211,13 +212,13 @@ static int mfd_add_device(struct device *parent, int id,
> >  		goto fail_res;
> >  
> >  	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
> > +		not_available = false;  
> 
> Why not do:
> 
> 		bool disabled = false;
> 
> ... here instead?

Yes, I can change to 'disabled'.

> 
> >  		for_each_child_of_node(parent->of_node, np) {
> >  			if (of_device_is_compatible(np, cell->of_compatible)) {
> > -				/* Ignore 'disabled' devices error free */
> > +				/* Skip 'disabled' devices */
> >  				if (!of_device_is_available(np)) {
> > -					of_node_put(np);  
> 
> Why are you removing the put?

The of_node_put() is done internally by for_each_child_of_node() calling
of_get_next_child().
As the for_each_child_of_node() loop is not break, the of_node_put() must
not be called here as it will be called by of_get_next_child().

> 
> > -					ret = 0;
> > -					goto fail_alias;
> > +					not_available = true;
> > +					continue;
> >  				}
> >  
> >  				ret = mfd_match_of_node_to_dev(pdev, np, cell);
> > @@ -227,10 +228,17 @@ static int mfd_add_device(struct device *parent, int id,
> >  				if (ret)
> >  					goto fail_alias;
> >  
> > -				break;
> > +				goto match;
> >  			}
> >  		}
> >  
> > +		if (not_available) {
> > +			/* Ignore 'disabled' devices error free */
> > +			ret = 0;
> > +			goto fail_alias;
> > +		}
> > +
> > +match:
> >  		if (!pdev->dev.of_node)
> >  			pr_warn("%s: Failed to locate of_node [id: %d]\n",
> >  				cell->name, platform_id);
> > -- 
> > 2.39.2
> >   
> 

Best regards,
Hervé

