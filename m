Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA91100E1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 16:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808051615;
	Tue,  3 Dec 2019 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808051615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575385752;
	bh=O22NMz/jrZIxPEGKMDNegJdTfjKN0pWHkn6+rWv1uuU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jq09kA2ju/au1DrgRogE6PmhsMR9ETXEFXBkp3sN1K0UX5kK42hLudyJDKsPNjRGI
	 4em2vEiUnUOlcKAFoVXk+skoI99yzZhR4mwVECfMtdmm+9Mx6nxfSVgKSG2FSx8mdN
	 PQwMRhPX+Gu7QcaAM89C2n0EaqxrjVoo57zdrZIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EE5F80227;
	Tue,  3 Dec 2019 16:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 894D9F80227; Tue,  3 Dec 2019 16:07:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E8FDF800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 16:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E8FDF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="WGNpS3zn"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3Ev0d7030223; Tue, 3 Dec 2019 16:07:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ys0ox1ao18cOZfxiE9S2+ciC5jFVh+QzhShG4ijPhio=;
 b=WGNpS3znEhwLqh5hvH8FyLX+/jjMFKWWrzJEIUohw1R29GLiH6IZzb5aXa44rzZgSofx
 0BzsEIjy05zSZ5pXDQrnTLDVJ2qV+aQMdsJQHM0lTkfu0Mvv68gAFSimW/zNQ0dK5oWA
 sHWYmZc2ALRXTRitClj+9Kc0gCxJOCz6XwOdn5zZFEvgORb2XCJU0ZxE7BAUcfMlx++1
 a87Urph9exurYKC60oXEaJfxWMOaPI/+pnCxZixjaB81s+nGfRk9u9QT/rwBQmKVwtUq
 x0I5l4/mPuENDPRiWbO0MHfxXItgCrFN7KnBgwD426NoPYaCSKnHoqVfCnuxP0waVd8z gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkf2xqw64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 16:07:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E95B10002A;
 Tue,  3 Dec 2019 16:07:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D12D2BC7B6;
 Tue,  3 Dec 2019 16:07:20 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 3 Dec
 2019 16:07:20 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Tue, 3 Dec 2019 16:07:19 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: cs42l51: add dac mux widget in codec routes
Thread-Index: AQHVqedr55RsnCXb/EmaRp/MuIs00qeociSA
Date: Tue, 3 Dec 2019 15:07:19 +0000
Message-ID: <06c0474b-8b51-0ce6-b2aa-fc3b2c348f04@st.com>
References: <20191203141627.29471-1-olivier.moysan@st.com>
 <20191203143909.GL1998@sirena.org.uk>
In-Reply-To: <20191203143909.GL1998@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5215F65C3009774EA7992774F10B1559@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_04:2019-12-02,2019-12-03 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "apatard@mandriva.com" <apatard@mandriva.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42l51: add dac mux widget in codec
	routes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Mark,

On 12/3/19 3:39 PM, Mark Brown wrote:
> On Tue, Dec 03, 2019 at 03:16:27PM +0100, Olivier Moysan wrote:
>
>> -	SND_SOC_DAPM_DAC_E("Left DAC", "Left HiFi Playback",
>> -		CS42L51_POWER_CTL1, 5, 1,
>> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> -	SND_SOC_DAPM_DAC_E("Right DAC", "Right HiFi Playback",
>> -		CS42L51_POWER_CTL1, 6, 1,
>> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> +	SND_SOC_DAPM_DAC_E("Left DAC", NULL, CS42L51_POWER_CTL1, 5, 1,
>> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> +	SND_SOC_DAPM_DAC_E("Right DAC", NULL, CS42L51_POWER_CTL1, 6, 1,
>> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
> This looks like an unrelated formatting change?
The reason of this change is to replace "HiFi Playback" by NULL, in 
order to connect
DAC widget to DAC mux widget, instead of connecting it directly to Playback.

Regards
Olivier
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
