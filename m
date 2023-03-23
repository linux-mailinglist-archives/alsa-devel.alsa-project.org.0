Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EF6CEEA5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43051F4;
	Wed, 29 Mar 2023 18:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43051F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680105973;
	bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V7tVAtwMfYA5GoB6y6naIzgIpMjPr4TDeqC5cPvZNso5AUYAZZPsRv3UvNPxo7RRk
	 8IAV468/oxYCwCrUBUkOfF/d4jpLIlcp2P9ujLoUMQh3/kr/Za4U1jRnJ0sfFd2/+h
	 InHjnMEGJ5okp+jMFrZzqot50KkLgPgKBb9TFdRY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76D75F80290;
	Wed, 29 Mar 2023 18:05:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A770FF802E8; Thu, 23 Mar 2023 09:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B567F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 09:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B567F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jt0T1kyT
Received: by mail-yb1-xb2f.google.com with SMTP id p204so12781332ybc.12
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
        b=jt0T1kyTzkSVHHCl6C3RepTUHJHJMJwp3E7PBrhT2/xYa5EtksiTTG/c8wwIzIU4Z/
         SP6qSrUD+NxMXZX1bTG8PCQpgfuHP59u0Np8wiu0KUJPXSqAJzXQDAgAhdBdm4ERqTZu
         W1iU/UXMn4o+x12ZfA1TbzzlGle1mhqc6+pCFoTYeSycXLH0chaeh9w1eBTkD2vOP8sA
         vAdlNnAtJbu1a1BYoccU9GKqHc2Cvh+aARoS6g2QyjguTZ3KI+BylBNheh9Xg9t4NtTd
         2k3OHgvwLC4ljAJqFRZ+gv0eOvpjcGObjDM/uBGal3iyuErBjVTwBqdgO9KbDxL+mVt4
         VMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVdvufZV56apmT3wmD9ncMcsijkg1/WCzRLjEqhYbYk=;
        b=sKLD/WpmFmwdUACtK8HXQORqUC8canpOcVz6fwzLLbqfJmtr/lMOxc+giLH/dO+Sji
         FM4GQG1RK0WW/7lkZqCcMCGBjg2q0mBFmGEqS3TUIDSKlJoxMX3YwuD+VRzt26SboAHh
         Rx9YqOcnllw/tray2ZyjjcfEsZmW+UXlli0Bx13IHikj5quOmTvcJUMZxLkCIa9gKlay
         /kLstgS/1neknNy7Kse7/FHutpF4204MobxyW6cz58XavPywhUolPhOri9t2HRup9Q9T
         SRbaYkjGEUHSW9BqMAy2xNEe5OHbNRq2qlCSPlZzxXOcyTfTNJnpcOm58/aknttq+XVU
         ZJ7g==
X-Gm-Message-State: AAQBX9czCt/Wp0waELV0dpCzfXZNDz9ncFkiXWBqrycaCARbtBfTcCxh
	6GHKGRE/f6ai9s/NFkXdo+xRyUtNcgTJuy6H9TDTPA==
X-Google-Smtp-Source: 
 AKy350aSyoiWihVzfFCCUghPO+0y8OTXazqo59ZooJtguYITdbyYyykALVgXcFtgTaOhhPAE83rDbJuRGMjWP7pJT3I=
X-Received: by 2002:a25:8712:0:b0:b26:47f3:6cb with SMTP id
 a18-20020a258712000000b00b2647f306cbmr1346675ybl.4.1679560808264; Thu, 23 Mar
 2023 01:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:39:57 +0100
Message-ID: 
 <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: VOQRQGIT75WNQQPR6TVWW5QHSNBY5DOR
X-Message-ID-Hash: VOQRQGIT75WNQQPR6TVWW5QHSNBY5DOR
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:20 +0000
CC: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOQRQGIT75WNQQPR6TVWW5QHSNBY5DOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Should I queue this patch by the way, or do you need it to go into some
DT-related tree?

Yours,
Linus Walleij
