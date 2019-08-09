Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5987AEB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE1D4E;
	Fri,  9 Aug 2019 15:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE1D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565356580;
	bh=HFrCLnWlyiY0Y86FVVt3kYVirmkETQxbgoC6VNyB1OQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcfNf5dzl1McYPKaPUHewYR3SkBOLHwCluYfHCOS42ajnXPG45SfoMgozOoURbVyl
	 bxYfev2k0WkItU1koxLuA/tPWLyA5f+qKe02hJVktTVTzOVa7f94614nSUZbYshQj4
	 7mnDBpJjnE0j1vSO33UU7Exk1eSHzQOKVoDn1Muk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8533F804AB;
	Fri,  9 Aug 2019 15:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF5EDF800E4; Fri,  9 Aug 2019 15:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 958BFF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 958BFF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xtrtu2h6"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79DEQcH051478;
 Fri, 9 Aug 2019 08:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565356466;
 bh=lqd4cvYerI+bLrW81rK95niroFLbI9sxTGg612NPmek=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xtrtu2h6nP1YNCrnZ692gMoH/T0GxF8LseKl+MC9nSK3mVtkFYhvP1IkspE2d5/5J
 /0iG7w9n9sa9A+m6oYiJ5Kgb0BaRhbP4xftiAgIcyjLt2EaU+zNZE0TAgT/2lu1PAZ
 iumzoiWEB5dUiFH2kjWox/nWba9JGGZtZMEWBygc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79DEQUv064547
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 08:14:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 08:14:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 08:14:26 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79DEOC9069090;
 Fri, 9 Aug 2019 08:14:24 -0500
To: Mark Brown <broonie@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
References: <alpine.DEB.2.21.1908091229140.2946@hadrien>
 <20190809123112.GC3963@sirena.co.uk>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <88ac4c79-5ce3-3f1a-5f6e-3928a30a1ef5@ti.com>
Date: Fri, 9 Aug 2019 16:14:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809123112.GC3963@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH] fix odd_ptr_err.cocci warnings
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 09/08/2019 15.31, Mark Brown wrote:
> On Fri, Aug 09, 2019 at 12:30:46PM +0200, Julia Lawall wrote:
> =

>> tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-4.19.y/=
wip
>> head:   62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a
>> commit: 62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a [34/34] j721e new machi=
ne driver wip
>> :::::: branch date: 20 hours ago
>> :::::: commit date: 20 hours ago
>>
>>  j721e-evm.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- a/sound/soc/ti/j721e-evm.c
>> +++ b/sound/soc/ti/j721e-evm.c
>> @@ -283,7 +283,7 @@ static int j721e_get_clocks(struct platf
> =

> This file isn't upstream, it's only in the TI BSP.

Yes, it is not upstream, but the fix is valid.

Julia: is it possible to direct these notifications only to me from
https://github.com/omap-audio/linux-audio.git ?

It mostly carries TI BSP stuff and my various for upstream branches nowdays.

- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
