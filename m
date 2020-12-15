Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 170772DADAE
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 14:07:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A92A17FB;
	Tue, 15 Dec 2020 14:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A92A17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608037651;
	bh=OOuEOg2Q8Yh39oGN3+IWGluvoa/ND1d9iLzBv8dN300=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zivbkyh8yiBc48VgzJaAHE+XHBi1+4kWR6+sXjjbQAYHEsUPhGMnPuq14X7BtxfVP
	 DMe1YRt2NQPNgbaDj5UtBug3CcMxUXD6gxE5HHfRn0AFXgUvqIvcJDYtw5epC34BX0
	 gdA7yMlSJA+mp1GkI4dfJXR5ZKrYfFOjbOF27tyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36624F8028B;
	Tue, 15 Dec 2020 14:06:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4D3F8027B; Tue, 15 Dec 2020 14:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00BDEF80121
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 14:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00BDEF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JWe5KjRB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD6YZQ036237;
 Tue, 15 Dec 2020 07:06:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608037594;
 bh=v+wfwR8MsifsGuoRp9WQUfmkznAVY28F5hPJ+pwwwPY=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=JWe5KjRBAcwxtlafH2+rIPtkiTbTg25Xcqf35/sROr6DRYkJZSu9uJaYsXSp3TmXm
 m5IHvsJoVt7UmGzHvKgAGxNuTre40Lq45tSWILMnoPE17fQtV9zpymWmz5vVtGtsM9
 U3f+XYHfl+z9/d1CgfPrj3L2RgaqWVoRLOHHdRno=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD6YD9092758
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 07:06:34 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:06:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:06:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD6UL7027914;
 Tue, 15 Dec 2020 07:06:31 -0600
Subject: Re: [PATCH 0/2] ASoC: ti: Maintainer mail address change
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <jarkko.nikula@bitmer.com>,
 <robh+dt@kernel.org>, <peter.ujfalusi@gmail.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
Message-ID: <05baa6cf-9364-63e4-0bbe-a49ff2177941@ti.com>
Date: Tue, 15 Dec 2020 15:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tiwai@suse.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi,

On 15/12/2020 15.05, Peter Ujfalusi wrote:
> Hi,
> 
> My TI address is going to bounce after Friday (18.12.2020), switch my email
> address to my private one for now.

Obviously I forgot to 'TO' the private myself...

Doing that now.

> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>   MAINTAINERS: Update email address for TI ASoC and twl4030 codec
>     drivers
>   ASoC: dt-bindings: ti,j721e: Update maintainer and author information
> 
>  .../devicetree/bindings/sound/ti,j721e-cpb-audio.yaml       | 4 +++-
>  .../devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml   | 4 +++-
>  MAINTAINERS                                                 | 6 +++---
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
