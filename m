Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF4476B065
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C2F820;
	Tue,  1 Aug 2023 12:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C2F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690884539;
	bh=Q99KkuKX9ZTyeG9a82Bkj0Cfe55NiHTQpwd2MvuUUms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Md3E1GVw3ED/FwCk+DJpaYKEdqZ8p4IvJqYwUXG9Ooe84caML3ropTbabyjhsKsGJ
	 yKTN/ccH9uuPaX6OgSWI3GhP1MnKqTNYk9S1fP5d2jUA+UPddPOByTJcd+EIHM5iGo
	 laiAuy9lBb2mJFzi8B8VmUurHdOXv0eR8BQqZbAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9561F80087; Tue,  1 Aug 2023 12:08:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E09ABF8016D;
	Tue,  1 Aug 2023 12:08:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D11CDF801D5; Tue,  1 Aug 2023 12:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 315A2F8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315A2F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j0ab26/L
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67785C0007;
	Tue,  1 Aug 2023 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690884455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWt1iHAsmrfK3BwrkrMdjb6oetsmwYgFvyU2cU/2Gk8=;
	b=j0ab26/LBkhJu/rDBUgxTxpfUHsrUu+mfwFrtSgmX9T5+Pk0LuHAPLV/9JflTk/bXN78Iw
	GxNpsOf5oXmOU1WefL+SDb12OMzJALhot9d8BpXmrOJkwqiKU9u+qM4F6K1E5nj0lBfb7+
	gLCrL+TlVu1b+Du7sMnHz75yki1Sho1tzxFptk2CFoK+gEUyxpzLNZKbZLUIg8VILRvTNC
	jA293aUHVMzqAS7Ih35p4vP9mjBeznj8kVMegn7AU6mm6wBKKsHMvIdoaGgWGc0lnAr6VS
	XUP/Egyc8NGdUCrdAPow0ErAFNIpObFqtVsobYB9grq6Ebj8meCevmKJMnRnDw==
Date: Tue, 1 Aug 2023 12:07:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 06/28] net: wan: Add support for QMC HDLC
Message-ID: <20230801120730.64e5b58e@bootlin.com>
In-Reply-To: <80341a96-c40f-4a45-9bad-359a890edfc4@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-7-herve.codina@bootlin.com>
	<80341a96-c40f-4a45-9bad-359a890edfc4@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: JNMUFVHOOGOWOFHRA6VPHJB7LWYXBDOY
X-Message-ID-Hash: JNMUFVHOOGOWOFHRA6VPHJB7LWYXBDOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNMUFVHOOGOWOFHRA6VPHJB7LWYXBDOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 11:31:32 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> > +{
> > +	return (struct qmc_hdlc *)dev_to_hdlc(netdev)->priv;  
> 
> priv is a void *, so you don't need the cast.
> 

Right, I will change in the next iteration.

Regards,
Hervé
