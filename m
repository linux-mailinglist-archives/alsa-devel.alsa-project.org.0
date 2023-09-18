Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF57A43CA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 10:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0649C206;
	Mon, 18 Sep 2023 10:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0649C206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695024193;
	bh=+NPBANySxrt/HConiiIb9Q/KxxzoXvylVco2UBXCPq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oLPOrTC3Ol7M1TfzTY3La4+7kjMpE29ha2n0gY7s/BwiY08DVyqjn76ghZN2fVRw4
	 FvHCsdmkhE/WtlM6e0Ai2N9LINvx02HzZ8L8+ttffcJ0evTEyjbmqBSGZYEe4pXJx8
	 q41niuATrF5wrOTO9qrVyWL4jFTHXvTzw5gzyyf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53EAEF8025A; Mon, 18 Sep 2023 10:02:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FFCEF800AA;
	Mon, 18 Sep 2023 10:02:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A83F8025A; Mon, 18 Sep 2023 10:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44DBAF801D5
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 10:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44DBAF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mTtoy6Qk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE67240003;
	Mon, 18 Sep 2023 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695024135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Swps3A5n7FEUQFidSq00HP9HJSFws8n5Srz8c0lIaak=;
	b=mTtoy6QkMgiN1fFQIcZ/I6T7HLsDUUmwQoWtrmWRlgrRvSas5Y7ZueYbwoJcUN5yMH2yE2
	rj4dWdQ6co74kek9BKb9F/H6NwOQRX4Jex9aAufBH2aMxpqfbXgnKTgSouDPKghgm3ZIbN
	0VKiQ8YK/f5peyquPIPxk8etPNK4sD54n5G2AQQ80Rx2zng9rBXyVd6nnujIr6FHdWS3ip
	lu2JQGyBg2Xug/JUmjSiIku/CdJGdk7gFmSxLSKKbxxqutDwplBgwnF91+lH+N1nRl0Raz
	oFEGjruxqwEzZCtgwWJYoWD0cq3f49JsenqqV9fSu+rmaOvAaMEcs4CM3BlnmA==
Date: Mon, 18 Sep 2023 10:02:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Conor Dooley <conor@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
 <alsa-devel@alsa-project.org>, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230918100210.2946f1e0@bootlin.com>
In-Reply-To: <20230918094919.03835d40@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
	<20230912101444.225809-1-herve.codina@bootlin.com>
	<20230912-overplay-donated-080eb97803d6@spud>
	<992a2b31-e21f-eee3-8bfc-a65b69fe5bd7@csgroup.eu>
	<20230918094919.03835d40@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: GENCWOSACBBOOJYBCR72JCMDYLRKC7IH
X-Message-ID-Hash: GENCWOSACBBOOJYBCR72JCMDYLRKC7IH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GENCWOSACBBOOJYBCR72JCMDYLRKC7IH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Sep 2023 09:49:19 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Christophe,
> 
> On Tue, 12 Sep 2023 18:49:26 +0000
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> > Le 12/09/2023 à 20:13, Conor Dooley a écrit :  
> > > Yo,
> > > 
> > > I'm not au fait enough with this to leave particularly meaningful
> > > comments, so just some minor ones for you.
> > > 
> > > On Tue, Sep 12, 2023 at 12:14:44PM +0200, Herve Codina wrote:    
> > >> The Lantiq PEF2256 is a framer and line interface component designed to
> > >> fulfill all required interfacing between an analog E1/T1/J1 line and the
> > >> digital PCM system highway/H.100 bus.
> > >>
> > >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>    
> > > 
> > > Missing a co-developed-by?    
> > 
> > No, I guess it's a left-over of version v4 that I sent-out while Hervé 
> > was AFK.
> > 
> > If a v6 is sent I think this line can be removed.  
> 
> May I move to reviewed-by ?

Your signed-of tag is present on all patches (left-over of version v4)
May I remove your signed-of (or move to reviewed-by if relevant) in all patches
present in this series ?

Best regards,
Hervé

> 
> > 
> > Christophe  
> 
> 
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
