Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB22A46BB
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 14:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6D417BE;
	Tue,  3 Nov 2020 14:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6D417BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604410810;
	bh=veJLxaZum4JdTDrVxKHaiJiTG54WMzCcdpwiNPTXfGs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Al7gMilZxDcrnwMvVxbaMZUmPvEDugQkT/qd1KJv90UM1pYxkysLSBa9qC5RPfEGB
	 +keT1w637wWnPoYA/+VfzfEjK8aVEz9Se0+OASrkiW/J8XZ/J2RCDk4oLduDLUrbqf
	 fLWzycUKlmN7AlpxPVFaLYdzrjCuK4mfxMCReXbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C85F80083;
	Tue,  3 Nov 2020 14:38:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0F5EF80171; Tue,  3 Nov 2020 14:38:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A76F8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 14:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A76F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="AC3Rtnim"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3DbkJe011808; Tue, 3 Nov 2020 14:38:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=veJLxaZum4JdTDrVxKHaiJiTG54WMzCcdpwiNPTXfGs=;
 b=AC3Rtnim66NSR4Kc9Bid+9yMvnx84VoNGxN69+my2YlB88rFz2AimLb2cw/z4+5b9EZ1
 8HsTxSeH/lbUST1wQyNwjpn2T56IwucKy3/EaiMKQHwQbqTNEmzKH7l+YpiX50jpa7SZ
 WyuJPqCUgC+8Rku/1ZPTUaUlTHgn7Jxwu4oMYEr/JS9pTIznRPg4gvgsjZRsVsQqJnAs
 G/aaTzsfYXTT+XvhavkJcrkAkqXxAHrkcB29Wq+rf/oLIp2saCmJ9N8vnTmtI6tNd0pu
 Iv/vIBlL3bdyttxNueFT/kzvT0th7ktp4PlQsWfX+2bekovJlbJTKwzZPtgTi/oOSzZ2 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqspcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 14:38:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F59F100034;
 Tue,  3 Nov 2020 14:38:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DA26254067;
 Tue,  3 Nov 2020 14:38:28 +0100 (CET)
Received: from SFHDAG2NODE2.st.com (10.75.127.5) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 14:38:27 +0100
Received: from SFHDAG2NODE2.st.com ([fe80::14c2:73ff:db87:a27b]) by
 SFHDAG2NODE2.st.com ([fe80::14c2:73ff:db87:a27b%20]) with mapi id
 15.00.1473.003; Tue, 3 Nov 2020 14:38:27 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "robh@kernel.org" <robh@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 0/2] ASoC: stm32: i2s: add master clock provider
Thread-Topic: [PATCH 0/2] ASoC: stm32: i2s: add master clock provider
Thread-Index: AQHWiBzGV/vdLD0mo0u9KLFGd/U756m2rDkA
Date: Tue, 3 Nov 2020 13:38:27 +0000
Message-ID: <20ed825b-10b6-e71f-9da4-91df38a950de@st.com>
References: <20200911091952.14696-1-olivier.moysan@st.com>
In-Reply-To: <20200911091952.14696-1-olivier.moysan@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA6C81104F79949A06BE598EA49E90B@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

SGkgTWFyaywNCg0KR2VudGxlIHJlbWluZGVyIG9uIHRoaXMgc2VyaWVzLCBhcyBpdCBzZWVtcyB0
aGF0IHRoZXJlIHdhcyBubyB1cGRhdGUgDQpzaW5jZSBSb2IncyAicmV2aWV3ZWQtYnkiIGZvciBk
dCBiaW5kaW5ncywgb24gMTEvMDkuDQoNCkJScw0KT2xpdmllcg0KDQpPbiA5LzExLzIwIDExOjE5
IEFNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToNCj4gQWRkIG1hc3RlciBjbG9jayBnZW5lcmF0aW9u
IHN1cHBvcnQgaW4gU1RNMzIgSTJTIGRyaXZlci4NCj4gDQo+IE9saXZpZXIgTW95c2FuICgyKToN
Cj4gICAgQVNvQzogZHQtYmluZGluZ3M6IGFkZCBtY2xrIHByb3ZpZGVyIHN1cHBvcnQgdG8gc3Rt
MzIgaTJzDQo+ICAgIEFTb0M6IHN0bTMyOiBpMnM6IGFkZCBtYXN0ZXIgY2xvY2sgcHJvdmlkZXIN
Cj4gDQo+ICAgLi4uL2JpbmRpbmdzL3NvdW5kL3N0LHN0bTMyLWkycy55YW1sICAgICAgICAgIHwg
ICA0ICsNCj4gICBzb3VuZC9zb2Mvc3RtL3N0bTMyX2kycy5jICAgICAgICAgICAgICAgICAgICAg
fCAzMTAgKysrKysrKysrKysrKysrLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNzAgaW5zZXJ0
aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pDQo+IA==
