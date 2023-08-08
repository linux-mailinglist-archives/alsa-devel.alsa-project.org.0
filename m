Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B3773924
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 10:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7D6DF5;
	Tue,  8 Aug 2023 10:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7D6DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691484380;
	bh=rMusbxuWFSZ92Hztpqpqz7O5FSdNhIfihAl7M0/MAq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uY2kL5L+ZObW/EDZlLeZahB0kY8LaDptcapRec1SQ7asLPxQCRjWxNyHoqO+rbz+6
	 CUJB1EU10PICWfBqFGz0Dq/cpjeyYe9/obPN+lEXrR3gYlmVjtOvj0cZGJHvfL7HJc
	 qsFnYQ7daAqID38Fs6NgocnJ32aSrlJqybHN1caI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05093F80552; Tue,  8 Aug 2023 10:44:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62176F80552;
	Tue,  8 Aug 2023 10:44:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 993FAF80553; Tue,  8 Aug 2023 10:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F9FF8053B
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 10:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F9FF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QZBb0EFg
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDBB0C0011;
	Tue,  8 Aug 2023 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691484284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nUiw4hJK7/Sk678dMlTFdsFNk9UZV8JT6mDURM0k34=;
	b=QZBb0EFgqssUT+yAxk29eDTjBMqFKHe4zPB1Smvyc+r9fR/tpmYpbax2btHCBtrJ0JveOQ
	SLfeDDBlE9c33fmD8j8hb0+2e4T0kQOwo4HkFuefiM4/FTN3Qixx+U9a0Lr46Zpybcvhk/
	pzfqXkJVEK6u6AuwEp9In8Fri7fCoasFyYBjwMbGHW2x81o0rcjV7vfIV/7OGspbkZCXS2
	UrlV5ZcAPgDJe2OMs4EUsIvewgY6Zd2BHitCnMItMwzgzOZ5eNl6yKxTIuUZMuMRIDLoYX
	ZPFdIRfr4+fIGi+NiAyTBb1Q6Kip8TN6o7JB9xQlS463pwiOEXmyVfbepPKRoA==
Date: Tue, 8 Aug 2023 10:44:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230808104439.6265cd01@bootlin.com>
In-Reply-To: <651ad095-8753-762e-d3f0-aec74c5794c2@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-23-herve.codina@bootlin.com>
	<651ad095-8753-762e-d3f0-aec74c5794c2@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: TDJAEHSAY5RAOCMTJEUPVLSFA6HZSERY
X-Message-ID-Hash: TDJAEHSAY5RAOCMTJEUPVLSFA6HZSERY
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDJAEHSAY5RAOCMTJEUPVLSFA6HZSERY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 8 Aug 2023 08:13:27 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 26/07/2023 à 17:02, Herve Codina a écrit :
> > The loop searching for a matching device based on its compatible
> > string is aborted when a matching disabled device is found.
> > This abort avoid to add devices as soon as one disabled device
> > is found.  
> 
> s/avoid/prevents/

Yes, will be changed.

> 
> > 
> > Continue searching for an other device instead of aborting on the
> > first disabled one fixes the issue.
> > 
> > Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 

