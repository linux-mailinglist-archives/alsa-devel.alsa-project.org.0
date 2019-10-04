Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37686CC434
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 22:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75E91678;
	Fri,  4 Oct 2019 22:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75E91678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570221029;
	bh=Org07PhQdLuC0dTiQ4yNX7SshgP1TDbT67rb3JCL9bM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kje/zpMJ6F+cHNoHLupiuzpKtxF213WEAvWkf0nUk17kQWvGTeaWJ3DYurFujMD5q
	 vW01jICdtV1afr+ZIl5Gi9yhie8jxjw16sjHxEQzoRdjpfKQxY9bV1Ej+z/pFfQScn
	 k42VVd4Tz7G3OHZZWjAjcNaAIgbO6DZbi1XpAWCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3761DF80377;
	Fri,  4 Oct 2019 22:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5261EF803F3; Fri,  4 Oct 2019 22:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8BCCF803D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 22:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BCCF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zUQo7FHd"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94KSbHr006459;
 Fri, 4 Oct 2019 15:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570220917;
 bh=32Jj9WZLpQ09yNXSnafvUQE3mxWhvizY9PFIVb96fhg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zUQo7FHd4gpuCGepeufrFeQc4CCNgSI9NX1m9RRQefLoCM4NuofDhU0NifGLixzxp
 iqx2NTERXFg4P83jvcJKClGBPuMyGuZgoSYZn+Tmvs5E/BkBY9UDPjNyZ56XsF3j0p
 N9KWzHYWJiaNNzeEVslZyXPgWE2l5aCOZaFMbBcg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94KSbd7044686
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Oct 2019 15:28:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 15:28:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 15:28:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94KSaSp069852;
 Fri, 4 Oct 2019 15:28:36 -0500
To: Mark Brown <broonie@kernel.org>
References: <20191004202245.22855-1-dmurphy@ti.com>
 <20191004202651.GH4866@sirena.co.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <bbfb63bb-890f-9dc6-5bd1-1a0c18136306@ti.com>
Date: Fri, 4 Oct 2019 15:30:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004202651.GH4866@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, navada@ti.com, shifu0704@thundersoft.com
Subject: Re: [alsa-devel] [PATCH] ASoC: tas2770: Fix snd_soc_update_bits
	error handling
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Mark

On 10/4/19 3:26 PM, Mark Brown wrote:
> On Fri, Oct 04, 2019 at 03:22:45PM -0500, Dan Murphy wrote:
>
>> --- a/arch/arm/configs/omap2plus_defconfig
>> +++ b/arch/arm/configs/omap2plus_defconfig
>> @@ -395,6 +395,7 @@ CONFIG_SND_SOC_OMAP_ABE_TWL6040=3Dm
>>   CONFIG_SND_SOC_OMAP_HDMI=3Dm
>>   CONFIG_SND_SOC_CPCAP=3Dm
>>   CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
>> +CONFIG_SND_SOC_TAS2770=3Dm
>>   CONFIG_SND_SIMPLE_CARD=3Dm
>>   CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
>>   CONFIG_HID_GENERIC=3Dm
> This is unrelated and shouldn't be here.

This is true I added it for test.=A0 I also found another instance I missed.

Dan

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
