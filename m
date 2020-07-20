Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E4225BB2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 11:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A910847;
	Mon, 20 Jul 2020 11:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A910847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595237602;
	bh=8VzPxmiK4sTcMGp6TneaFuitJlptGhAdS1vCV4zIDbo=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAjtvD5UyquauluCI6cdUaIgW+scsyTT3MQ+TkY+mEZIBwAqSxbhWOee4xjnliJlf
	 m6aYAWd20oWWcHzx6G98KR3cmJfwHNOa2a98VvZfxw8WSrrPRMAoznYCiu9qNBvU2n
	 o2iMIrkw4c3SZPrUoohWhRLm2HPYKH6ubC4mtIFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E810F80125;
	Mon, 20 Jul 2020 11:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEFE7F800F5; Mon, 20 Jul 2020 11:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39DF9F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 11:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39DF9F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KbxWNmWy"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06K9VPuj092489;
 Mon, 20 Jul 2020 04:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595237485;
 bh=Mk0n1A2T8FvzB1xfSmHVxnF5QJPFxrkdVyVRA6kgP2g=;
 h=Subject:From:To:References:Date:In-Reply-To;
 b=KbxWNmWy/Z7ar0+6WC80Kp15UnVfQPANu21VcRx7/DcwhO30PjRFLtIPfYAyEFX5P
 oihJGaFAAFwPvTI8PvOOAWsF/RLJr/PAv5ftCS6PcikYuxR7TpMYFhjZ8waVurNetW
 iat1FTtMxNryoWaWVOCuKgSgeUV9vsvtENPMfdbo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06K9VP7v106782
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jul 2020 04:31:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 04:31:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 04:31:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06K9VN55023396;
 Mon, 20 Jul 2020 04:31:23 -0500
Subject: Re: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Dave Young <dyoung@redhat.com>, 
 <alsa-devel@alsa-project.org>, <linux-omap@vger.kernel.org>
References: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
 <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
 <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
X-Pep-Version: 2.0
Message-ID: <d8829b8a-eca7-f0e3-600f-3263619332b3@ti.com>
Date: Mon, 20 Jul 2020 12:32:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

On 20/07/2020 12.03, Peter Ujfalusi wrote:
> Hi,
>=20
> On 14/07/2020 21.03, Jarkko Nikula wrote:
>> Hi
>>
>> On 7/11/20 6:33 AM, Dave Young wrote:
>>> Hi,
>>>
>>> I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seem=
s
>>> it does not work.  No sound when I play from a laptop, and also see a=

>>> lot of error like below:
>>> [ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
>>> ...
>>>
>> Head 0dc589da873b ("Merge tag 'iommu-fixes-v5.8-rc5' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu") records and=

>> plays fine here (arecord -f dat |aplay), although I see some of those
>> errors but don't hear any glitches etc.
>>
>> Peter, does above indicate a serious issue or is it perhaps a false
>> alarm on OMAP3 (no audible glitches)?
>=20
> I need to dig out my n900 or beagleXM, but it is hard to believe it is
> not a result of a glitch.
> The DMA is triggered by McBSP and it should write exactly what McBSP
> expects to be receiving.
>=20
> I can not recall any changes in the past years which would have
> introduced regressions in McBSP or the sDMA driver.

I have booted linux-next on my BeagleXM (OMAP3630, McBSP2 <-> twl4030)
and I don't see the TX overflow print.

I have checked element and threshold modes and it looks fine.
I'm not sure why we have TX Overflow printed on n900.

>> I believe you don't have some mixer knob on, N900 audio path is somewh=
at
>> complex and needs bunch of mixer switches and volumes to be set. I
>> attached my N900 mixer scripts for you to try.
>=20
> This could be the reason for the silence, I have asoundrc files
> somewhere to restore a 'good' mixer config.
>=20
>> Set first everything off:
>> ./aic34_scripts/shutdown.sh
>>
>> Then enable internal digital microphone and speakers:
>> ./aic34_scripts/dmic.sh
>> ./aic34_scripts/speakers.sh
>>
>> Hopefully these help you get going :-)
>>
>=20
> - P=C3=A9ter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

