Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18740204DEE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F1291755;
	Tue, 23 Jun 2020 11:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F1291755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592904598;
	bh=EbG+7KAHak9bXHtttIaS8iGGsypvdlleNCH3Qwsq9HE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UaIa7yT4x+Jdixf1QfvAMrkDWnxe8BUAvd6xJlGMXa1AdeqiG5FjQ3rJAHl3vDzI2
	 6EfX3owjXqJkiFpuZF18KWyXbW/KkSeFcjq7PcF+LYDNoGJEgSE3bLX/1BSVGRMEI7
	 nV64bsscx5Q7/C0/tWh4s/Rbr0bNL3LuF/rQV6Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D18EBF8012F;
	Tue, 23 Jun 2020 11:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D05EEF80234; Tue, 23 Jun 2020 11:28:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4995F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4995F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qmzQkGlc"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05N9S5Ze125926;
 Tue, 23 Jun 2020 04:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592904485;
 bh=fEs47RkZAn3o/i2PzvLLvWnHhB3TwHTtIfZTfW8Ym2A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qmzQkGlcIGW8tTCERgHaPdshR+P5MVgidMjFj7XXg5ukVfic43hZAj79vpZQQ5uJC
 G74mzz4I2s31oVrEhjCDYtFK8SMiT/7xo3uTWwHHzRfsSpOKYQJpAwqPBpsCo27XCH
 NVhPriYQt4yHQFoVEJg/9Xqu3AuXA9q6rmCspZR4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05N9S5c1034921;
 Tue, 23 Jun 2020 04:28:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 04:28:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 04:28:05 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05N9S3LY025765;
 Tue, 23 Jun 2020 04:28:03 -0500
Subject: Re: [PATCH v3 3/3] ASoC: ti: Add custom machine driver for j721e EVM
 (CPB and IVI)
To: Mark Brown <broonie@kernel.org>
References: <20200612085909.15018-1-peter.ujfalusi@ti.com>
 <20200612085909.15018-4-peter.ujfalusi@ti.com>
 <7f2c4297-3ad9-5b8f-c9a5-5120078120c6@ti.com>
 <20200612122757.GF5396@sirena.org.uk>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <8c255c3c-8c9c-9200-962f-69de9a1f861c@ti.com>
Date: Tue, 23 Jun 2020 12:28:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612122757.GF5396@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 12/06/2020 15.27, Mark Brown wrote:
> On Fri, Jun 12, 2020 at 12:27:17PM +0300, Peter Ujfalusi wrote:
>=20
>>> +	if (IS_ERR(clocks->target)) {
>>> +		ret =3D PTR_ERR(clocks->target);
>>> +		if (ret !=3D -EPROBE_DEFER)
>>> +			dev_err(dev, "failed to acquire %s': %d\n",
>=20
>> Looks like I have extra "'" in the prints...
>=20
> Apart from the issues you pointed out yourself this all looks reasonabl=
e
> to me.

Thanks Mark,
I'll wait for Rob on the binding doc side before I send the updated v4.

- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

