Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA41558B1
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 14:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BE5167A;
	Fri,  7 Feb 2020 14:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BE5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581083050;
	bh=VXI7D1b1NrFDSKS05Q0Trsmg7ltnFM74p+9ylMK2ho0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZijiXRheqVvlKUDQv33rS9Y4mtVJemiu4V1zv173/R07Vm5FlsIMbFDkcfx0x3Eb
	 E6SWia4jtIHHhtcizC2X2pp0aRG8RJI4MR1xuoqRcWvEbo3+DaycIFswAxHsST9qL3
	 2JAXN6AoI8Hq+Tx96hZ8r2qL96WqDL2OXF2TwFYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E9CF80142;
	Fri,  7 Feb 2020 14:42:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D71B6F80148; Fri,  7 Feb 2020 14:42:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE148F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 14:42:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE148F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="ilpm6sFU"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 017DY0Et018260; Fri, 7 Feb 2020 14:42:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ns0QtLqPa8SmkeWyBcF/Eq7WVxbsRzcIrzcHgD6trQg=;
 b=ilpm6sFULBJqAVUGKdf3VyXgsKsWxU9p7LKjPkMiK5Yu82SCHGb/86fZG/fUqRb6NdsP
 iMisrifl+M6zBVNXfgsx/z60onpyGbyt4YX/DI+O5OyKUc/Zbm1He9v0iEURBjmRLFXd
 RRDLR3LPI/WOzwViaUEIeWJ1AAEK93Ku1sf6SEjooOU+NVWu/SDsWw7B03QCw0SYLUg2
 XOXMlbOMDbn04wq0wY5gaA1kzQTzmvUIhB2pcDipgYTQvrmKBRdLbW4AlOwZlIxUMhKE
 84XkvBX8+ujYb0CmM+cnKgfpNyhLYigTugvVqnGSn6mhMl5zqczHP8+nBdAQSS5vaOuI 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhk8ugbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2020 14:42:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B23D110002A;
 Fri,  7 Feb 2020 14:42:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87A382C38D4;
 Fri,  7 Feb 2020 14:42:20 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 7 Feb
 2020 14:42:20 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Fri, 7 Feb 2020 14:42:20 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH] ASoC: dt-bindings: stm32: convert sai to json-schema
Thread-Index: AQHV3S6DA3BIMSjHSEeIkHecvkxO+qgPrbSA
Date: Fri, 7 Feb 2020 13:42:19 +0000
Message-ID: <843b9213-99c0-ec9f-bde6-4745a9cb6221@st.com>
References: <20200130135040.22575-1-olivier.moysan@st.com>
 <20200206182125.GA23274@bogus>
In-Reply-To: <20200206182125.GA23274@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <1B3E3BCF77F660458CE2CD96D4B546B0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-07_01:2020-02-07,
 2020-02-07 signatures=0
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
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: stm32: convert sai to
	json-schema
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgUm9iLA0KDQpPbiAyLzYvMjAgNzoyMSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFRo
dSwgSmFuIDMwLCAyMDIwIGF0IDAyOjUwOjQwUE0gKzAxMDAsIE9saXZpZXIgTW95c2FuIHdyb3Rl
Og0KPj4gQ29udmVydCB0aGUgU1RNMzIgU0FJIGJpbmRpbmdzIHRvIERUIHNjaGVtYSBmb3JtYXQg
dXNpbmcganNvbi1zY2hlbWEuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4g
PG9saXZpZXIubW95c2FuQHN0LmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3Mvc291bmQv
c3Qsc3RtMzItc2FpLnR4dCAgICAgICAgICAgfCAxMDcgLS0tLS0tLS0tLQ0KPj4gICAuLi4vYmlu
ZGluZ3Mvc291bmQvc3Qsc3RtMzItc2FpLnlhbWwgICAgICAgICAgfCAxOTMgKysrKysrKysrKysr
KysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTkzIGluc2VydGlvbnMoKyksIDEwNyBkZWxl
dGlvbnMoLSkNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zYWkudHh0DQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItc2FpLnlh
bWwNCj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvc3Qsc3RtMzItc2FpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvc3Qsc3RtMzItc2FpLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjMzZGNhMDA3ZmM4Ng0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N0LHN0bTMyLXNhaS55
YW1sDQo+PiBAQCAtMCwwICsxLDE5MyBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0K
Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvc3Qsc3RtMzItc2Fp
LnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBTZXJp
YWwgQXVkaW8gSW50ZXJmYWNlIChTQUkpDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAt
IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBzdC5jb20+DQo+PiArDQo+PiArZGVzY3Jp
cHRpb246DQo+PiArICBUaGUgU0FJIGludGVyZmFjZSAoU2VyaWFsIEF1ZGlvIEludGVyZmFjZSkg
b2ZmZXJzIGEgd2lkZSBzZXQgb2YgYXVkaW8NCj4+ICsgIHByb3RvY29scyBhcyBJMlMgc3RhbmRh
cmRzLCBMU0Igb3IgTVNCLWp1c3RpZmllZCwgUENNL0RTUCwgVERNLCBhbmQgQUMnOTcuDQo+PiAr
ICBUaGUgU0FJIGNvbnRhaW5zIHR3byBpbmRlcGVuZGVudCBhdWRpbyBzdWItYmxvY2tzLiBFYWNo
IHN1Yi1ibG9jayBoYXMNCj4+ICsgIGl0cyBvd24gY2xvY2sgZ2VuZXJhdG9yIGFuZCBJL08gbGlu
ZXMgY29udHJvbGxlci4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToN
Cj4+ICsgICAgZW51bToNCj4+ICsgICAgICAtIHN0LHN0bTMyZjQtc2FpDQo+PiArICAgICAgLSBz
dCxzdG0zMmg3LXNhaQ0KPj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBpdGVtczoNCj4+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBCYXNlIGFkZHJlc3MgYW5kIHNpemUgb2YgU0FJIGNvbW1vbiByZWdp
c3RlciBzZXQuDQo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQmFzZSBhZGRyZXNzIGFuZCBzaXpl
IG9mIFNBSSBpZGVudGlmaWNhdGlvbiByZWdpc3RlciBzZXQuDQo+PiArICAgIG1pbkl0ZW1zOiAx
DQo+PiArICAgIG1heEl0ZW1zOiAyDQo+PiArDQo+PiArICByYW5nZXM6DQo+PiArICAgIG1heEl0
ZW1zOiAxDQo+PiArDQo+PiArICBpbnRlcnJ1cHRzOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4g
Kw0KPj4gKyAgcmVzZXRzOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gKyAgIiNhZGRy
ZXNzLWNlbGxzIjoNCj4+ICsgICAgY29uc3Q6IDENCj4+ICsNCj4+ICsgICIjc2l6ZS1jZWxscyI6
DQo+PiArICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICBjbG9ja3M6DQo+PiArICAgIGl0ZW1zOg0K
Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHBjbGsgZmVlZHMgdGhlIHBlcmlwaGVyYWwgYnVzIGlu
dGVyZmFjZS4NCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiB4OGssIFNBSSBwYXJlbnQgY2xvY2sg
Zm9yIHNhbXBsaW5nIHJhdGVzIG11bHRpcGxlIG9mIDhrSHouDQo+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogeDExaywgU0FJIHBhcmVudCBjbG9jayBmb3Igc2FtcGxpbmcgcmF0ZXMgbXVsdGlwbGUg
b2YgMTEuMDI1a0h6Lg0KPj4gKw0KPj4gKyAgY2xvY2stbmFtZXM6DQo+PiArICAgIGl0ZW1zOg0K
Pj4gKyAgICAgIGVudW06IFsgcGNsaywgeDhrLCB4MTFrIF0NCj4+ICsgICAgbWluSXRlbXM6IDMN
Cj4+ICsgICAgbWF4SXRlbXM6IDMNCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0
aWJsZQ0KPj4gKyAgLSByZWcNCj4+ICsgIC0gcmFuZ2VzDQo+PiArICAtICIjYWRkcmVzcy1jZWxs
cyINCj4+ICsgIC0gIiNzaXplLWNlbGxzIg0KPj4gKyAgLSBjbG9ja3MNCj4+ICsgIC0gY2xvY2st
bmFtZXMNCj4+ICsNCj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsgICJeYXVkaW8tY29udHJv
bGxlckBbMC05YS1mXSskIjoNCj4+ICsgICAgdHlwZTogb2JqZWN0DQo+PiArICAgIGRlc2NyaXB0
aW9uOg0KPj4gKyAgICAgIFR3byBzdWJub2RlcyBjb3JyZXNwb25kaW5nIHRvIFNBSSBzdWItYmxv
Y2sgaW5zdGFuY2VzIEEgZXQgQg0KPj4gKyAgICAgIGNhbiBiZSBkZWZpbmVkLiBTdWJub2RlIGNh
biBiZSBvbWl0dGVkIGZvciB1bnN1c2VkIHN1Yi1ibG9jay4NCj4+ICsNCj4+ICsgICAgcHJvcGVy
dGllczoNCj4+ICsgICAgICBjb21wYXRpYmxlOg0KPj4gKyAgICAgICAgZGVzY3JpcHRpb246IENv
bXBhdGlibGUgZm9yIFNBSSBzdWItYmxvY2sgQSBvciBCLg0KPj4gKyAgICAgICAgZW51bToNCj4+
ICsgICAgICAgICAgLSBzdCxzdG0zMi1zYWktc3ViLWENCj4+ICsgICAgICAgICAgLSBzdCxzdG0z
Mi1zYWktc3ViLWINCj4gcGF0dGVybjogJ3N0LHN0bTMyLXNhaS1zdWItW2FiXScNCkkgd2lsbCBj
aGFuZ2UgdGhpcyBpbiB2Mg0KPj4gKw0KPj4gKyAgICAgICIjc291bmQtZGFpLWNlbGxzIjoNCj4+
ICsgICAgICAgIGNvbnN0OiAwDQo+PiArDQo+PiArICAgICAgcmVnOg0KPj4gKyAgICAgICAgbWF4
SXRlbXM6IDENCj4+ICsNCj4+ICsgICAgICBjbG9ja3M6DQo+PiArICAgICAgICBpdGVtczoNCj4+
ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogc2FpX2NrIGNsb2NrIGZlZWRpbmcgdGhlIGludGVy
bmFsIGNsb2NrIGdlbmVyYXRvci4NCj4+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogTUNMSyBj
bG9jayBmcm9tIGEgU0FJIHNldCBhcyBtYXN0ZXIgY2xvY2sgcHJvdmlkZXIuDQo+PiArICAgICAg
ICBtaW5JdGVtczogMQ0KPj4gKyAgICAgICAgbWF4SXRlbXM6IDINCj4+ICsNCj4+ICsgICAgICBj
bG9jay1uYW1lczoNCj4+ICsgICAgICAgIGl0ZW1zOg0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBz
YWlfY2sNCj4+ICsgICAgICAgICAgLSBjb25zdDogTUNMSw0KPj4gKyAgICAgICAgbWluSXRlbXM6
IDENCj4+ICsgICAgICAgIG1heEl0ZW1zOiAyDQo+PiArDQo+PiArICAgICAgZG1hczoNCj4+ICsg
ICAgICAgIGl0ZW1zOg0KPj4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBTQUkgc3ViLWJsb2Nr
IGlzIGNvbmZpZ3VyZWQgYXMgYSBjYXB0dXJlIERBSS4NCj4+ICsgICAgICAgICAgLSBkZXNjcmlw
dGlvbjogU0FJIHN1Yi1ibG9jayBpcyBjb25maWd1cmVkIGFzIGEgcGxheWJhY2sgREFJLg0KPj4g
KyAgICAgICAgbWluSXRlbXM6IDENCj4+ICsgICAgICAgIG1heEl0ZW1zOiAxDQo+IFRoaXMgaXMg
ZGVmaW5pbmcgdGhhdCBkbWFzIGhhcyAyIGVudHJpZXMsIGJ1dCB0aGVuIGxpbWl0cyBpdCB0byB0
aGUgMXN0DQo+IGVudHJ5IG9ubHkuDQpkbWEgY2FuIGJlIGVpdGhlciAicngiIG9yICJ0eCIsIGJ1
dCBub3QgYm90aC4NCk1heWJlLCB0aGUgZm9sbG93aW5nIHN5bnRheCBpcyBtb3JlIGFwcHJvcHJp
YXRlOg0KDQogwqDCoMKgwqDCoCBkbWFzOg0KIMKgwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxDQoN
CiDCoMKgwqDCoMKgIGRtYS1uYW1lczoNCiDCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogfA0K
IMKgwqDCoMKgwqDCoMKgwqDCoCByeDogU0FJIHN1Yi1ibG9jayBpcyBjb25maWd1cmVkIGFzIGEg
Y2FwdHVyZSBEQUkuDQogwqDCoMKgwqDCoMKgwqDCoMKgIHR4OiBTQUkgc3ViLWJsb2NrIGlzIGNv
bmZpZ3VyZWQgYXMgYSBwbGF5YmFjayBEQUkuDQogwqDCoMKgwqDCoMKgwqAgaXRlbXM6DQogwqDC
oMKgwqDCoMKgwqDCoMKgIC0gZW51bTogWyByeCwgdHggXQ0KDQo+PiArDQo+PiArICAgICAgZG1h
LW5hbWVzOg0KPj4gKyAgICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgIC0gZW51bTogWyByeCwg
dHggXQ0KPj4gKw0KPj4gKyAgICAgIHN0LHN5bmM6DQo+PiArICAgICAgICBkZXNjcmlwdGlvbjoN
Cj4+ICsgICAgICAgICAgQ29uZmlndXJlIHRoZSBTQUkgc3ViLWJsb2NrIGFzIHNsYXZlIG9mIGFu
b3RoZXIgU0FJIHN1Yi1ibG9jay4NCj4+ICsgICAgICAgICAgQnkgZGVmYXVsdCBTQUkgc3ViLWJs
b2NrIGlzIGluIGFzeW5jaHJvbm91cyBtb2RlLg0KPj4gKyAgICAgICAgICBNdXN0IGNvbnRhaW4g
dGhlIHBoYW5kbGUgYW5kIGluZGV4IG9mIHRoZSBTQUkgc3ViLWJsb2NrIHByb3ZpZGluZw0KPj4g
KyAgICAgICAgICB0aGUgc3luY2hyb25pemF0aW9uLg0KPj4gKyAgICAgICAgYWxsT2Y6DQo+PiAr
ICAgICAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCNkZWZpbml0aW9ucy9waGFuZGxl
LWFycmF5DQo+PiArICAgICAgICAgIC0gbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICAgICBzdCxp
ZWM2MDk1ODoNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgICAgICBJZiBzZXQs
IHN1cHBvcnQgUy9QRElGIElFQzY5NTggcHJvdG9jb2wgZm9yIHBsYXliYWNrLg0KPj4gKyAgICAg
ICAgICBJRUM2MDk1OCBwcm90b2NvbCBpcyBub3QgYXZhaWxhYmxlIGZvciBjYXB0dXJlLg0KPj4g
KyAgICAgICAgICBCeSBkZWZhdWx0LCBjdXN0b20gcHJvdG9jb2wgaXMgYXNzdW1lZCwgbWVhbmlu
ZyB0aGF0IHByb3RvY29sIGlzDQo+PiArICAgICAgICAgIGNvbmZpZ3VyZWQgYWNjb3JkaW5nIHRv
IHByb3RvY29sIGRlZmluZWQgaW4gcmVsYXRlZCBEQUkgbGluayBub2RlLA0KPj4gKyAgICAgICAg
ICBzdWNoIGFzIGkycywgbGVmdCBqdXN0aWZpZWQsIHJpZ2h0IGp1c3RpZmllZCwgZHNwIGFuZCBw
ZG0gcHJvdG9jb2xzLg0KPj4gKyAgICAgICAgYWxsT2Y6DQo+PiArICAgICAgICAgIC0gJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCNkZWZpbml0aW9ucy9mbGFnDQo+PiArDQo+PiArICAgICAgIiNj
bG9jay1jZWxscyI6DQo+PiArICAgICAgICBkZXNjcmlwdGlvbjogQ29uZmlndXJlIHRoZSBTQUkg
ZGV2aWNlIGFzIG1hc3RlciBjbG9jayBwcm92aWRlci4NCj4+ICsgICAgICAgIGNvbnN0OiAwDQo+
PiArDQo+PiArICAgIHJlcXVpcmVkOg0KPj4gKyAgICAgIC0gY29tcGF0aWJsZQ0KPj4gKyAgICAg
IC0gIiNzb3VuZC1kYWktY2VsbHMiDQo+PiArICAgICAgLSByZWcNCj4+ICsgICAgICAtIGNsb2Nr
cw0KPj4gKyAgICAgIC0gY2xvY2stbmFtZXMNCj4+ICsgICAgICAtIGRtYXMNCj4+ICsgICAgICAt
IGRtYS1uYW1lcw0KPiAgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZS4NCj4NCj4+
ICsNCj4+ICthbGxPZjoNCj4+ICsgIC0gaWY6DQo+PiArICAgICAgcHJvcGVydGllczoNCj4+ICsg
ICAgICAgIGNvbXBhdGlibGU6DQo+PiArICAgICAgICAgIGNvbnRhaW5zOg0KPj4gKyAgICAgICAg
ICAgIGNvbnN0OiBzdCxzdG0zMmY0LXNhaQ0KPj4gKw0KPj4gKyAgLSB0aGVuOg0KPj4gKyAgICAg
IHByb3BlcnRpZXM6DQo+PiArICAgICAgICBjbG9ja3M6DQo+PiArICAgICAgICAgIG1pbkl0ZW1z
OiAyDQo+PiArICAgICAgICAgIG1heEl0ZW1zOiAyDQo+PiArDQo+PiArICAgICAgICBjbG9jay1u
YW1lczoNCj4+ICsgICAgICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgICAgZW51bTogWyB4OGss
IHgxMWsgXQ0KPiBEZWZpbmUgdGhlIG9yZGVyLg0KPg0KRG8geW91IG1lYW4sIGFkZGluZyBpbiBj
bG9ja3MgcHJvcGVydHnCoCA6DQogwqDCoMKgwqDCoMKgwqDCoMKgIGl0ZW1zOg0KIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogeDhrLCBTQUkgcGFyZW50IGNsb2NrIGZvciBz
YW1wbGluZyByYXRlcyANCm11bHRpcGxlIG9mIDhrSHouDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGRlc2NyaXB0aW9uOiB4MTFrLCBTQUkgcGFyZW50IGNsb2NrIGZvciBzYW1wbGluZyByYXRl
cyANCm11bHRpcGxlIG9mIDExLjAyNWtIei4NCg0KQnV0LCBpdCBzZWVtcyB0byBtZSB0aGF0IHRo
aXMgaXMgcmVkdW5kYW50IHdpdGggcHJldmlvdXMgZGVmaW5pdGlvbiBvZiANCmNsb2NrcyBwcm9w
ZXJ0eS4NCg0KVGhhbmtzDQpPbGl2aWVyDQo+PiArICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+PiAr
ICAgICAgICAgIG1heEl0ZW1zOiAyDQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaD4NCj4+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL3Jlc2V0L3N0bTMybXAxLXJlc2V0cy5oPg0KPj4gKyAgICBzYWkxOiBzYWlA
NDQwMGEwMDAgew0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJoNy1zYWkiOw0KPj4g
KyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICNzaXplLWNlbGxzID0gPDE+
Ow0KPj4gKyAgICAgIHJhbmdlcyA9IDwwIDB4NDQwMGEwMDAgMHg0MDA+Ow0KPj4gKyAgICAgIHJl
ZyA9IDwweDQ0MDBhMDAwIDB4ND4sIDwweDQ0MDBhM2YwIDB4MTA+Ow0KPj4gKyAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1NQSSA4NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4+ICsgICAgICBjbG9j
a3MgPSA8JnJjYyBTQUkxPiwgPCZyY2MgUExMMV9RPiwgPCZyY2MgUExMMl9QPjsNCj4+ICsgICAg
ICBjbG9jay1uYW1lcyA9ICJwY2xrIiwgIng4ayIsICJ4MTFrIjsNCj4+ICsgICAgICByZXNldHMg
PSA8JnJjYyBTQUkxX1I+Ow0KPj4gKw0KPj4gKyAgICAgIHNhaTFhOiBhdWRpby1jb250cm9sbGVy
QDQ0MDBhMDA0IHsNCj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItc2FpLXN1Yi1h
IjsNCj4+ICsgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQo+PiArICAgICAgICByZWcg
PSA8MHg0IDB4MWM+Ow0KPj4gKyAgICAgICAgY2xvY2tzID0gPCZyY2MgU0FJMV9LPjsNCj4+ICsg
ICAgICAgIGNsb2NrLW5hbWVzID0gInNhaV9jayI7DQo+PiArICAgICAgICBkbWFzID0gPCZkbWFt
dXgxIDg3IDB4NDAwIDB4MDE+Ow0KPj4gKyAgICAgICAgZG1hLW5hbWVzID0gInR4IjsNCj4+ICsg
ICAgICB9Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKy4uLg0KPj4gLS0gDQo+PiAyLjE3LjENCj4+
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
