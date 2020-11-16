Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F42B437B
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 13:19:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8587E1776;
	Mon, 16 Nov 2020 13:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8587E1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605529161;
	bh=UfyV4VaXHNprsRLV2193xm9H7pjN60E2gIwkjs9lRuM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChYnNpm/7I+aIxuHs0xUkjSEmiLpivrgSHZaNQ4+OXSgcaN/X4AmygIaDdvZHZ4r3
	 hWQLZ4RDe2ynxX1K1W4zD4GeHAYOfho9ECzI/IKZUEStNozj7Dn7BH/KK89Tnb7VZJ
	 Jem5H6fV9Qe/rpjh53PeWXWK1WgzG3IL6GcfNV9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3215EF80229;
	Mon, 16 Nov 2020 13:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93316F8016E; Mon, 16 Nov 2020 13:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E46F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 13:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E46F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e5Ab2GKk"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AGCHaep060296;
 Mon, 16 Nov 2020 06:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605529056;
 bh=DIzdKScpm9h/Phr262Uk9Tdbqx0xp32Mf9AFx75nzB0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=e5Ab2GKkOznRhDYPpDG57S+gkzD4pdj45CZ6bqBVPveXPeiQzus51pS6ieO5XYrb9
 RzMQbgMj/CBGKq8St2GXCH8+YYR57EdsMCBa95eUzQ1fUJj/cCOpsOXpdJGpKQSzzN
 1Rm5B1lkLWms0Fv6aEablWKAakqj3xdp3pT3/uew=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AGCHZmf116773
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 06:17:35 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 16
 Nov 2020 06:17:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 16 Nov 2020 06:17:35 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AGCHXCN051472;
 Mon, 16 Nov 2020 06:17:33 -0600
Subject: Re: [PATCH v3 0/4] ASoC: pcm512x: Patch series to set fmt from
 `set_fmt()`
To: Kirill Marinushkin <kmarinushkin@birdec.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>
References: <20201115122306.18164-1-kmarinushkin@birdec.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <adecfa94-7907-a0e0-1ad2-fb32cf7a0db8@ti.com>
Date: Mon, 16 Nov 2020 14:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201115122306.18164-1-kmarinushkin@birdec.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Kirill,

On 15/11/2020 14.23, Kirill Marinushkin wrote:
> Set format from `set_fmt()` func instead of `hw_params()`, plus supportive
> commits

Thank you for the clean series!

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Kirill Marinushkin (4):
>   ASoC: pcm512x: Fix not setting word length if DAIFMT_CBS_CFS
>   ASoC: pcm512x: Rearrange operations in `hw_params()`
>   ASoC: pcm512x: Move format check into `set_fmt()`
>   ASoC: pcm512x: Add support for more data formats
> 
>  sound/soc/codecs/pcm512x.c | 134 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 84 insertions(+), 50 deletions(-)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
