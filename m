Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B9911A7A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 07:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802DA9F6;
	Fri, 21 Jun 2024 07:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802DA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718948534;
	bh=LLFy4E3fQZogzsjSkuuitSHmxQQmS4uiYTMS6JzbgpU=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=frvEzOO8AsFTOSFqDC9GbbTjwOzTslzWMBZXEXXF+luJsgLWaL9VOI32eUfWRuzi2
	 5pu3Bws74Kq06FtjgmzcaaUcHXd2VVPMODqGCQeuZ5eYpPfqzWujmWa53bBPMncmYp
	 +p00Yk424Vl/X5tilQM51/KiU9IbT+QVCe0KowBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C98DF805B0; Fri, 21 Jun 2024 07:41:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19286F805AE;
	Fri, 21 Jun 2024 07:41:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81370F8023A; Fri, 21 Jun 2024 07:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41CF6F8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 07:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CF6F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=OxGxApPm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948207; x=1719553007; i=markus.elfring@web.de;
	bh=1SQIJLyP8KM0t0hXj5dAJLCq9lDBaf/TIWUVsJ97Ung=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OxGxApPm3qrh/Uq5UHSKdmuHA/EdQNdVJma2RSdg+S1AafTTsW8sFpAYf2MgTKfv
	 fZqivsvv+R5zbqNTRfhhkPPlGppoe5bmTcmMuGHMKC0k/OAykV552sZwl8awTQDsB
	 AGzeQ4RW7xxaGjveQJX3GD9ERf6C+RV4Ym6AX+TKIf52lZS7atgVBQbv1mV4RtSRH
	 KkLEhiS7KHYlRbJUQEAALxh1GO9FOVOYR0xJfPw94pP+vbFbjZ76u0PXn2nVtSrHY
	 6zTbgoX3wK0YvcjZsvq6EeqaZsHZhLuAlAjT+yQReM8MI5A86H1yxI1+ANljXev5R
	 k8YcZrvMI2bYGwTXBg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zs0-1sWp6x1rro-018Giw; Fri, 21
 Jun 2024 07:36:47 +0200
Message-ID: <a39f024c-7ab0-41f2-839d-ee2f62ddd6e9@web.de>
Date: Fri, 21 Jun 2024 07:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s
 properties
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
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Q7NNgNryQC4SvaqLSK46kUdFDA/ZWIIeO+B+DYHgCi0VqphfXz0
 LxOkeihG+Vrnw4q7094DPBzn7YDv2hUbpmVAdrJiShrqQhvj/8VJB5CO1x9U8dSN1exLjhS
 laSizbk3rhAQA4KMMEgqhwVU706cLgRCb467YcJy47Twkvz6B9MtZOubwGfQ9bMn5k+qiZq
 UXTnwNamwsXRAU6cK3a+Q==
UI-OutboundReport: notjunk:1;M01:P0:sxFXbRmwiow=;ItU3h73LSNWoHkiePPzF614YhOu
 vuWij/Wyd7G8C5bGFuxA34oRBoufqeSTJ1sO9oRDCQE17yA7yy+qUu1NsP3rGmwp607imLjET
 tlxMODkKmLWwjZN6WYB6OA00j+fL4/qe6kTDDGUFCsG3taFS+ziaS/XOF31nR0iYxmcGadXTF
 6WbDUOyp+fcYOvOUMdt9RtSb2KDjSlAT7V/u2dyxjIY7X2vNdA2A3LesS4hrWtUQ/j9jjsvCn
 9beVtwcM8ulERcSMjuM741ha+Tw/qMRQ7gvbaw8+RqndqAdbkDOMNKreIXpENNCPmnCrs2u7d
 uu7d4ceOXvKIb0nfzXvE8ZxudF5gVftjMcbGm9p5v/g2bWH7hYwtq5BZvz2s5DSK5Ta2ADRIX
 Zj2gqGUTQD6PH2NOVY/JvDoxrqN45EWShbKqn6+ZNV5ks/kb+tYB/7ZiQ0Pa0HXSr9tf+A+so
 2m0HXc6DpDDbA5nZafQpxxhgKpzPfPkjIo0773z24llMY/3IgrJYUbesX+Q5vBXyKqmi9y2M0
 LK96kUrboZ04zfJ43TiSAduhHGvUqMa0Jd2kkqNGi3fbr9ha1sNkt9rYqZm5yiKLdvXbfM2No
 5QPLKvW7DEDeT5xgYTZuSUEhGr0NvKoFBDWXfNP1E1JvGayANL1ZwqCpCoC1SFc5KVhOkyEO2
 22iZ/kQ+CA2ClHf081/2WBHIHecK0qpypwt0wXVmjFbC/kbygWKAOart5LMzLQ+2A7RERaKAl
 2v4BF7zzWd40QCWglLMTkaLvdwDoghAUBkoMXKoI+FWfJV1ZYWSEIJdBn8GPUvZFcmMAMgaTm
 TmADuSAnsOy9ft+lNhrWayN5+XfvhQrVkx6wjoHCE4kfM=
Message-ID-Hash: 6ACKIDY5HHDY36YTKO5BXELJ4ILDN36H
X-Message-ID-Hash: 6ACKIDY5HHDY36YTKO5BXELJ4ILDN36H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ACKIDY5HHDY36YTKO5BXELJ4ILDN36H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Adds properties declared in the new DT bindings:

  Add?                                How do you think about to replace such an abbreviation?

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus
