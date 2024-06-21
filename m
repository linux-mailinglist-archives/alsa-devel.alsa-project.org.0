Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F3911AAA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 07:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C90A4B65;
	Fri, 21 Jun 2024 07:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C90A4B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718949176;
	bh=B/FtBrdM0MhQsIGzDSXhE0531n+bBkbvzx6WIgFpcl4=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+0TASSYZLx3iStjFE/3Fnm8rK5GlpN/JUTHuOSd1kWDWRuoTxg5aIa9FBykp7WvZ
	 YIQ+ZbFTsBVMsntBtrm10njPrGPftEonJr7hy/rUeSAP+TErJYjQnhFWmDzr4a8mAe
	 2rI70FxOZVS2CZynYxD1trcjO822TOhRKdWHfeOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 231C5F805B0; Fri, 21 Jun 2024 07:52:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EAAF80587;
	Fri, 21 Jun 2024 07:52:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C83F8023A; Fri, 21 Jun 2024 07:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 117DDF801EB
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 07:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117DDF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=g9WFBtZJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949090; x=1719553890; i=markus.elfring@web.de;
	bh=B/FtBrdM0MhQsIGzDSXhE0531n+bBkbvzx6WIgFpcl4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g9WFBtZJ6jlB7Xhm4LApEB33Lek0861qyFNqPb11SiEuEbAqlDQlxKGJ5LkLcnKc
	 BLrvnBx5OAZfeh7r05oZsGab+pZ3zwUw4URvK5pCKhai8AwyJ+I/pjcANj2N0e0Ok
	 Mkmv5/vIM+W39FeC0LdnMz95DnOVdsSFEQ+vZOZ9m7d1f1aLUhBTEz2FlVHJ+Msge
	 F2abgY6fqjIjiJCuN8Xjwe9BEutZDXssCtL8EMyIa8rMKy/KVuzTLEbV1DW2YCUKl
	 jfdAXFHp5JAi+4+MgmH6z/bfnkBLFFTvtuXHYcrAekFxHSUZpK4NhTH0MVAPA7ATR
	 7Ouc4OrP0NrGubXFlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQPdl-1ryJTH0wtN-00XZsv; Fri, 21
 Jun 2024 07:51:30 +0200
Message-ID: <62a564df-e78f-470b-a1b3-2e49b6c05395@web.de>
Date: Fri, 21 Jun 2024 07:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bPaZvoxzJ/h40pvO52zJQM/EXwvqLuVGmwbJlhznsZdSb7+5vV9
 ivg/UFZwjDfRawbpm6w0wCBUaQyp9SJcyDqFrot02cTYmewtQVP7vrWLKc5MV0m8Yvuzqml
 3MMYaa56tKHofEPv+LYWJE+ygSMZ+e5P2grD4YKSoPHdjNrcG5SnDh1+y4SlXyeVzIcF9Y6
 7Ufmk6v6MTeNw2cuMzL1w==
UI-OutboundReport: notjunk:1;M01:P0:UuJ6HPlnuco=;b+auAotmGPrPfJRrtNoxICqpvzR
 pKZtILPKcz2H6Q3tjierCqUY1bw3iXANbljk6kGRZQ8Ir2J+sNZeAoqtxl3Ol0bMTRtSR+4A5
 R+79tcqE/AFMIX8Tj1+dTIq7iGX7H4Z/u4Wn+kGkiczsJT8uP+YBDZA8XWHHbBvTsgBvIgd/M
 t9dbgwBnBviEkn54bA4PV6n6FJWZ2Y4y+qtNc/0yhyMsZfG7v0588p63zWHDOl0BeqabSRk0R
 iSEF/OpLj1jUM9QoM53KVYIxp38zUjrP0FNRW9Bg99ZVq+9y4Cm4pt4oIst1Zi6lZ24WYkyvF
 BbLoTfMQq5eSvbcruXX4b4W4yMHhw5+LoDEdfBn/pTE++mjkuh4AWG5xEAjppkayQT5jEk7+e
 yfcqBPTlRwvN6YwtV8y0qh3+k0GcUhaS/rk5Zy7282DcKttFw8dGIzfia8vte2yv9T+KDpp7x
 ZoVyYf4Iic/IeCnBZg6D0yD+WT406j6qhg495/RmOh3i+X08miyIXWRWAtUxvD+Z2q98HXkGZ
 OnDeEaI4pDSADbegqEszNfdwJ/7SJuW4t99TgT5m1p647pYuyGNkeHX71fk1jCeF/cva/8v4g
 TaikQTpWxd8OrwGHTigbYnrR3Vlnp1LmtBfdQRH8Cw/GcZVyr+9cvXVDmQondRXAg7T013/yY
 IUdhxPtFPZpkDp9Ex3fUOe4K5g0Yvq38AyBxinSmvccQ0O9581SX9FEcl6oyvQFs6TqaswsiA
 v9A67FvaC4G/xzhDWdxVjzSCMCp7GXb3ZVKMN2KLd4wMMcDjDQRJ1S4hyog0GLC1LbvrxWaTj
 pBtdYg/1eB+cdDSUEzEgIwCtPrPRwhWBwKvX/wkLonUvM=
Message-ID-Hash: NNRFUVOKLYKKETAO73MWIUHKHQ2HSZ73
X-Message-ID-Hash: NNRFUVOKLYKKETAO73MWIUHKHQ2HSZ73
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNRFUVOKLYKKETAO73MWIUHKHQ2HSZ73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> this driver allows to route a signal request line thru the multiplexer f=
or
> given peripheral.

Would you like to choose an imperative wording for an improved change desc=
ription?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc4#n94

Regards,
Markus
