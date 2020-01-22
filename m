Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75629144E92
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 10:22:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02DBA1674;
	Wed, 22 Jan 2020 10:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02DBA1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579684948;
	bh=9I/CxSd+muFl4kBiFlXUzifWAbbqHcQt2at3Nfp2fOs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAszfEECnhQL7bybf41zulOmFWwwXPWbpnk2Or7/Tw9zi4jUnOhVk3WfGTgg8okfE
	 Ob0bP53b373vKuHgIEfferlzsm3aaG7+bWg65jx95VrzMjG+a+t0lq9c5Ef1RO3dvR
	 onzSmKAQ5tZuu3/W3QYDn5Oi//2wULi1qjnjbA78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 600FDF801D8;
	Wed, 22 Jan 2020 10:20:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A19F8020C; Wed, 22 Jan 2020 10:20:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9AEF8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 10:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9AEF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="ucm7i3HD"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M9E5T0017505; Wed, 22 Jan 2020 10:20:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=u/gZg5v5O2lvH7c3i8F88g2U2swQh0X4mBt44nns32Q=;
 b=ucm7i3HDueX2khE20HpGolwzNFjIa0Puk/Wtek/QfMVSRNXuR46O93vA/F7MaMiI6YtR
 MvS9+LEBl3UgQe6UrcIUMWfsWkJT9w7MIg8nhQhsefeADdnJNIFtJmH0Z8W4jxwWx3Qv
 jjWH5313tSr/TywHSg1WyyoqE4wTq1Sn9ffN+gJcrhI+fXag0xJ9llSbvK+PcNZGNTtG
 dipOtYSoCjk2Y9VgTWchVnZiLVQXWRTXE+FIve35owCPS+JJjFc3O5pMOTZD3Nm+2RCT
 ElVOBkgxqBld7vOoWEYVewFfiXLuGJuiexxfSqlQFXaC/BX37SkHOaH/RTI8m9bf4vPn pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1e3jkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 10:20:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 923FE10003E;
 Wed, 22 Jan 2020 10:20:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36DBC2AB057;
 Wed, 22 Jan 2020 10:20:30 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan
 2020 10:20:29 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Wed, 22 Jan 2020 10:20:29 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
Thread-Index: AQHV0KYwQJhZ3lJcYU6nre5Twze71af2WFCA
Date: Wed, 22 Jan 2020 09:20:29 +0000
Message-ID: <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
References: <20200117170352.16040-1-olivier.moysan@st.com>
 <20200121220022.GA12737@bogus>
In-Reply-To: <20200121220022.GA12737@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <C57D8D8E50C2B442847FA8C55AFD97B6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3] ASoC: dt-bindings: stm32: convert
 spdfirx to json-schema
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

Hi Rob,

I did not report your reviewed-by tag, as I have made a extra change in v2.
This change is related to dmas property reported in v2 change log.
Sorry, this extra change was indeed not clearly highlighted in log comments.

Regards
Olivier

On 1/21/20 11:00 PM, Rob Herring wrote:
> On Fri, 17 Jan 2020 18:03:52 +0100, Olivier Moysan wrote:
>> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>> ---
>> Changes in v2:
>> - Add "additionalProperties: false"
>> - Also change minItems to 2 for dmas property, as both DMAs are required.
>>
>> Changes in v3:
>> - Drop minItems/maxItems for dmas property, remove ref to stm32-dma.txt.
>> ---
>>   .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>>   .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>>   2 files changed, 80 insertions(+), 56 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
