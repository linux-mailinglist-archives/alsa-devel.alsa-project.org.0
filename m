Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 137106D18D2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 09:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7271C1FE;
	Fri, 31 Mar 2023 09:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7271C1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680248594;
	bh=QSehptp3aDujtz2jcGtUsxOGD9b6HXLpwDLr+yaqDhw=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=D3uCp6eYb1OEPtObbu3tpq/kLh2l9uSODU++V+PJNc6DQZAMbtN/YYHp7sFmWXtyM
	 ipLmLvFLBgh50xf4elI21Qdq9SQjllWw3QP0NjnEzySNGeUZFm+N8M6WIvL0pywlF+
	 ZgOkJXWtAgXg53pCvdQQGpGiM7iRnmbLGwo4IDps=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B45EF8024E;
	Fri, 31 Mar 2023 09:42:24 +0200 (CEST)
Date: Fri, 31 Mar 2023 09:42:08 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230330160510.GB489249@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I2RY7BNNFV4UFHHOFYRI63EAAMANTTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168024854323.26.7349524061926109077@mailman-core.alsa-project.org>
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
	id CD423F80272; Fri, 31 Mar 2023 09:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ECF8F8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 09:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECF8F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pMs1cInV
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10DDB240006;
	Fri, 31 Mar 2023 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680248531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYpXCgEwZhV7ddL7BC9dvRkRU/+f02CS6YXe85krNsA=;
	b=pMs1cInVUT9wPGuOnfg0VyW+3qPwdHF6UY8MhR4wtFulN2et/85ZfTpJFH9pXdCIovPyYs
	Yo5SMgCYPt7HSvp46i3qsZQxMwky3+ofDUJHyBaycm5S6z4LwWzdXZ+mbv6ZAJNR3Afh6/
	HWXszxi6YG7EhJ/7ScppdXQjK3AiSiMuWJAqJFozvfhbMDKsd4rrT/mi0dW/xjHOp1TItQ
	Lf8tq/qYI6KCbboO1kslK4IWy5RbrZukpxWxn1xBr6VfYYrt0LIzo9dwQl9pcXa4BxQtZ/
	HcEa6LlKvle9aw15vM48B0NI9HUy+9pHnUukJfrUTvP2bya9QODa00V48aE31g==
Date: Fri, 31 Mar 2023 09:42:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230331094208.41ab4420@bootlin.com>
In-Reply-To: <20230330160510.GB489249@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5I2RY7BNNFV4UFHHOFYRI63EAAMANTTV
X-Message-ID-Hash: 5I2RY7BNNFV4UFHHOFYRI63EAAMANTTV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I2RY7BNNFV4UFHHOFYRI63EAAMANTTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lee,

On Thu, 30 Mar 2023 17:05:10 +0100
Lee Jones <lee@kernel.org> wrote:

> On Tue, 28 Mar 2023, Herve Codina wrote:
> 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.  
> 
> My goodness!
> 
> It's been a long time since I've seen anything quite like this.

Yes, old things but working on recent kernel.

> 
> My suggestion to you:
> 
> * Split this up into components that fit functional subsystems

It is done. The audio part is present in ASoC subsystem (path 5 in this
series). pinctrl function is implemented in this driver and, as I don't
want to share registers, I would prefer to keep this function inside this
driver.

Also, I sent a RFC related to HDLC and PHY. In this RFC, the pef2256 is
considered as a PHY and handled in the PHY subsystem.
  https://lore.kernel.org/linux-kernel/20230323103154.264546-1-herve.codina@bootlin.com/

> * Run checkpatch.pl

I did.

> * Remove all of the debug prints

I can do that in the next iteration if really needed.

> * Move all of the defines out to a header file

These defines are related to registers. As I don't want to share these
registers, is it really necessary to use a header file for them ?

> * Be more verbose in your documentation / comments

I can improve the API documentation present in include/mfd/pef2256.h.
Do you thing that is necessary ? Only a few devices will use this API.

> * Consider using simple-mfd to probe child devices.

I did.
The driver has (and needs to have) a compatible string.
Having this compatible string, sub-nodes are not automatically populated
in the device tree. In order to have them populated and probed, the pef2256
probe function ends calling devm_of_platform_populate().

Best regards,
Hervé

> 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/mfd/Kconfig         |   17 +
> >  drivers/mfd/Makefile        |    1 +
> >  drivers/mfd/pef2256.c       | 1355 +++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/pef2256.h |   28 +
> >  4 files changed, 1401 insertions(+)
> >  create mode 100644 drivers/mfd/pef2256.c
> >  create mode 100644 include/linux/mfd/pef2256.h  
> 
> --
> Lee Jones [李琼斯]
