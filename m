Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF898876F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 16:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83698E9F;
	Fri, 27 Sep 2024 16:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83698E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727448366;
	bh=MEJMjn9ntS8Y8zmLvfnNVYD5q/dmVMCCKHH9WIxiXyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=obxdUbLOixVBlVsElOAIyVP6ZQcuuuGJecTvmnzZesT9lGIDv9OPfl77YD8Qvykg6
	 8SsvZEcUAlnOd3Sv5CwCnMTC+91M5KzMLrYWjEJCRvSaQXFYQpwSl/Wf13yf5cBeRl
	 UbpqDQIjpJBDdbVe/IL+KtQN44YYNIkUpuoLbt8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D688F80107; Fri, 27 Sep 2024 16:45:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F085F805B2;
	Fri, 27 Sep 2024 16:45:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34DF9F802DB; Fri, 27 Sep 2024 16:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_PASS,T_SPF_HELO_TEMPERROR,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41D1FF80074
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 16:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D1FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=hHZyQS+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eyv6FxKbSvQOFgQGcK5COE/kC4alwt92KY2oNq8SFCM=; b=hHZyQS+vg3fGvDLP66OXewKSw/
	MgkYPIHasNP3Y4Vnw+Qz32VU90hJgUuL0TNZM9Z0ex/VAcLL+btM20yOKGwqvGR0MSZJy8sZzWNmu
	CRtWZj46gdvGkeDWd8p6q6YFW0AO0Dg5nO6P2uO2uLV/GZj9x94qWOdQJ0+fOJKpEOeNwONe2b8my
	IytLCrYxSKBSyluqn/mTPCnt7Whlj3/ufprGWJQo4y2pUCu3eDn29jqe+Qo39CjycUpZaK6XK8Vbs
	wKQGVRYSz7kf5xERWOuc7hB190jPyoC7OddhWU6836LF6mjGb7UEvB/bz8zUJ6HC3A5y94d4HTLiu
	+ui1ah4g==;
Received: from 85-160-70-253.reb.o2.cz ([85.160.70.253] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1suCD8-0006OK-Lb; Fri, 27 Sep 2024 16:44:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 16:44:43 +0200
Message-ID: <4455919.MSiuQNM8U4@phil>
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: ZI4CLFOAZTBT5OZEEUJ5TUP3WCV4MZZ2
X-Message-ID-Hash: ZI4CLFOAZTBT5OZEEUJ5TUP3WCV4MZZ2
X-MailFrom: heiko@sntech.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI4CLFOAZTBT5OZEEUJ5TUP3WCV4MZZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Geert,

Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
>   - The second patch updates the Audio Graph and Simple Audio Card DT
>     bindings,
>   - Patches 3-9 converts various DTS files to use the new properties,
>   - The last 2 patches convert Freescale sound device nodes to use the
>     new properties.
> 
> All patches can be applied independently,

though I guess dts patches should wait till patch 2 gets applied
somewhere, so that changed dts and changed binding can again find
together in linux-next?


Heiko


