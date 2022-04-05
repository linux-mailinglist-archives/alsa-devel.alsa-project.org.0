Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB24F3D5E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 21:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F7917E6;
	Tue,  5 Apr 2022 21:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F7917E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649187637;
	bh=/s6fZDVbpiIQW0S5UO2G1RWfpbsAjuqB16uALNiR7fA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDNtvxF0p/e7ScoPZHMEKP2jxJw4gR/msMXnwFNfZUOWDlRiTjhoftPXBN+Xc/GXF
	 lDSIMZk/vd060GF5GML5tzQuBr1hZWCaDhffV5dDsj24wcYxK/r5+syMQwfKbrblUi
	 MBCtDSiSa20FV1zyihlHkQzR0bKJ5Nl8n0ICnUJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E715F8016B;
	Tue,  5 Apr 2022 21:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3F3AF8016A; Tue,  5 Apr 2022 21:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB58CF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 21:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB58CF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="du7y76Mr"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 1EB511F4370D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649187569;
 bh=/s6fZDVbpiIQW0S5UO2G1RWfpbsAjuqB16uALNiR7fA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=du7y76Mrgs9fzjL6kCL5pOm6CipJjs1QamPYv1VvPMSWG91LVSDu1RxdfWBh6lZPg
 +JGG/hCKtjAEKHkndXb3mOeTS33Xm53CSSlkRW355R9tGA7mUS7EQqKjc7cAaj5Kea
 HSxDfF4SMeP3vJ6Bt/9Ap2xsNhDHtmayvmHu7wnzVfu9vcLM6gPvdnVbY3JTkkcZzZ
 yS2ib2WEBNIRVpbXFfho7OvHdDDTTacxJLJ3byL5utZtnzqhYboqXajagIfyD/MWTu
 08J2P3HZ36pAqXCQvIeD/UYFPHTEOdagRPIY/mnP5S1pU+e4h13Fsnu0n2z5b1sCCH
 OdOslyJaw4/6g==
Message-ID: <9887dc0c-c2e0-868c-55e3-32083f820e09@collabora.com>
Date: Tue, 5 Apr 2022 16:39:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
 <CAOMZO5D4_WboF4S0dgSLD1m15a13c2irK2yjDV4C77_Wb15=2w@mail.gmail.com>
 <d9f14221-b0ad-9853-e9c8-a35d9111549b@collabora.com>
 <3e3b223f-7d05-f439-625a-a15afb44b95f@collabora.com>
 <CAOMZO5D8UHkkyJE9uJ4yBmf+ajjbzJOrLM57OHpyAiATvMNXcw@mail.gmail.com>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <CAOMZO5D8UHkkyJE9uJ4yBmf+ajjbzJOrLM57OHpyAiATvMNXcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Shawn,

Gentle ping :-)

On 3/31/22 10:48, Fabio Estevam wrote:
> Hi Ariel,
> 
> On Thu, Mar 31, 2022 at 10:35 AM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
>>
>> Hi Fabio, Shawn,
>>
>> Can we merge this please?
> 
> Shawn will probably start picking the patches for the next cycle after
> 5.18-rc1 is released.
