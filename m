Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ADE565359
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0481705;
	Mon,  4 Jul 2022 13:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0481705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934064;
	bh=S3lpds+Dm08bh0wmuZJxD7UtITL3wTfX27aPen8VTS4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JUqyyZgfx2iqPxHcYvStJQNX4+OCK8GV5RNfsO99seMrO1wj9fBMQ/MobO0Dn0eMl
	 6W7rbM77CzYyMLPOFP/YVDj8hnj8a9B12klSqE9cmL7Ph42ZmBfAapbAC2GHyZUUwU
	 OwiptYmx4jYcjA+d6mi9byqup/21fuhW86S2FnZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD137F805A1;
	Mon,  4 Jul 2022 13:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA6F7F804D8; Thu, 30 Jun 2022 23:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B303F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 23:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B303F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="KqZoUK6Z"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="PrvQD7li"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656623790; x=1688159790;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S3lpds+Dm08bh0wmuZJxD7UtITL3wTfX27aPen8VTS4=;
 b=KqZoUK6ZO1uiv3ZodMpNKYrsI6jx/Bsim4pRI0Om9PRlDCQQ97XYFMNC
 pRvXJamWZ/Ympcm1Z/E1ePlIiOtJPScm2Z65T+/VTtNn6Thq4B3UF7HLB
 R8pe30fyZJB9Sld18Qf76N4omM4wSJhUxzZlUTvxafJ9spNM7GYDClbfZ
 IwgbGP4Xt9NMNEi/h9UrNPN9Wrx1jkDU5neMN0zgMC9JVXdzBfTIvNeyX
 A9XGWuZqC6bZMxaksgUH2+krYtGFHEAYbR05o7KRrHlzDaLaAeoHTPq0M
 xfCUlzXn1i5Lz1TEpIlgODWzS6VKWCm535w6Dm6sNCEJ1M1sYcdkZtfea A==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650902400"; d="scan'208";a="205249682"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2022 05:16:23 +0800
IronPort-SDR: n1SuOQwaGcKAmm90UbAkzWt9SgiTgTLGhJMsrIHflN5w1N4aUVgxJfMCJEVADl63+OaBUGqprH
 5mSgtd7fpOWLZMG8C3rudETsT2pQP1sUZx1aBlejPjpZIDbW89WFYTd+NrTxxlK3bLgG4ibRIu
 6lR19DIAmypgC2eRsAi4ovt26nAuYkefXwGe0AVvlf0nc7CrrZGmWg59MtkuDM7yfQR3Dz7B8s
 FCEMMDL/NLWREQm+c5yUG2qblbWRZHJ0vJQMsHia/OrGRVEwBscsY/t9OluZRf7Q7EsHk6ttC/
 akflkKB/kL2JqOfXmUAMYuDE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 13:38:35 -0700
IronPort-SDR: 3DlPv1M1ahwe5/WV73sIMbNZi5f5Ns8nvHnWw7xTpgubYYEh8Nw/6cP/LeYH/d2i5YttALZW0Z
 xIT7HQG5iI1fwY0jq9TaNqeZPaXW4ZQR7quIQq1WjwODAF65fFmD31Xpfo6E27g1KxN7B0Btxm
 +/FO2D/xzhsiofh4z6YjbWr8bKlv9gwT2w0kjSeme1tGx3dHZp9AzjDeKCPJrRhTXGF/OvOx1H
 Ox57ENRFJj1VcQvxr2pVERBrLKl/YTmimH/NZcJzSRWXD9aPMpUOEy4PGzk2cslLQcRrhG0PJF
 qyw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 14:16:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYrjf0VTJz1Rw4L
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:16:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656623780; x=1659215781; bh=S3lpds+Dm08bh0wmuZJxD7UtITL3wTfX27a
 Pen8VTS4=; b=PrvQD7liwTw5hF6g/uMJLn2Og9NBbJklV+6/QwDu+OTnyq3FrMF
 pMGP0PCczng28ke2KPEzgEXDGAjhkvtQNu9zsScICgTIMsLyVdC/OrKATUFInuyH
 Inix18i0FPUj4jAN1lpf3WyO3jH90N+C5d4DVnw1xUFHEV3CgmjhZGpUkjr5QrZT
 L1b2XJWCzLjj1WKovqaoYpo0PkUHt3sXRAKIfGNSpQZzHVX8a3UNigRVs6dZP2fT
 /DviCg8I9uKa8fm1myk7/XvOpkOvMfZOLVex9ZxCV7GBd6nrQ3YhHkh/FJSXElBl
 uklcwpdUsXnLDuzvZmNobheOWpHvMyNZnZA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id KfCP2696C8bO for <alsa-devel@alsa-project.org>;
 Thu, 30 Jun 2022 14:16:20 -0700 (PDT)
Received: from [10.225.163.102] (unknown [10.225.163.102])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYrjX18xMz1RtVk;
 Thu, 30 Jun 2022 14:16:15 -0700 (PDT)
Message-ID: <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
Date: Fri, 1 Jul 2022 06:16:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220630175318.g2zmu6ek7l5iakve@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
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

On 7/1/22 02:53, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
>> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Hey all,
>>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
>>> based boards. To make keeping it that way a little easier, I changed the
>>> Canaan devicetree Makefile so that it would build all of the devicetrees
>>> in the directory if SOC_CANAAN.
>>>
>>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>>> out of the limited stockists none seemed to want to deliver to Ireland :(
>>> I based the series on next-20220617.
>>>
>>
>> I first tried to apply your series on top of next-20220630,
>> but was greeted by a bunch of different warnings on boot,
>> including endless RCU stall warnings.
>> However, even when booting next-20220630 without your patches,
>> I got the same warnings and RCU stall.
>>
> 
> Is it possible to share the boot logs please ?
> Conor is having issues with my arch_topology/cacheinfo updates in -next.
> I would like to know if your issue is related to that or not ?

FYI, I see rcu warnings on boot on my dual-socket 8-cores Xeon system, but
the same kernel does not have the rcu warnings with an AMD Epyc single
socket 16-cores box.

> 
>> So I tested your series on top of v5.19-rc4 +
>> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
>> spi-peripheral-props.yaml") cherry-picked,
>> (in order to avoid conflicts when applying your series,)
>> and the board was working as intended, no warnings or RCU stalls.
>>
> 
> If possible can you give this branch[1] a try where my changes are and doesn't
> have any other changes from -next. Sorry to bother you.
> 
> Conor seem to have issue with this commit[2], so if you get issues try to
> check if [3] works.
> 
> Regards,
> Sudeep
> 
> [1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
> [2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
> [3] https://git.kernel.org/sudeep.holla/c/009297d29faa


-- 
Damien Le Moal
Western Digital Research
