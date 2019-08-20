Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7F95C9C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 12:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D08C1668;
	Tue, 20 Aug 2019 12:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D08C1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566298348;
	bh=Qv/+0HcS5PdYs5H6dpz4hYBtjO5oCiKVpW5SPcqKxH0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JiGComR9Wk6R0AqDt1UlGYwILdsY3YQ0bzGgq5obudNgAIUTdXDcOSWXCOZM5U5Bi
	 85nltP1RBxS/yFLKDGcVPW5UIHEGIjn7bdD/bRCtz/DZx0TVJE5hqv51dVgffqlY8q
	 RwEZJpEwWlLyoXN2fmd6TnXwpuJw+rhgh0kIZ/yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F9FF80391;
	Tue, 20 Aug 2019 12:50:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB39F8036E; Tue, 20 Aug 2019 12:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281BCF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 12:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281BCF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="haBM+TFv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7KAoZZL018379; Tue, 20 Aug 2019 05:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=Sd676kgDI3J5BISCCZv/3KEjP4ZC3vS5nBNkBDvdlT0=;
 b=haBM+TFv81wjfbTy2gzkyHRKdd5Dp++9G/JisUqDimpXzWeySaY8iqwQ9YSCSd2FfsF8
 +VyRZb7rakMGFsVo8mC/QFzdnQoi+24CQry/xYWv1DUFhbZIR+7FGqhS/ykJTXUSJRGe
 5b9KkrONyrfp8paKLD2b5JqiEP8bM4GzfMSh5pofaLA280c0hARHDxPV3LvT3givxRVm
 UH9kSWKfJhTxnc6VJ8/jT6rA8HVJgSsi7bYHh8A2824jHJc3W+Vbx4vMsYDtYsESg2Qu
 xylcXPJ3cbPZbV4PzYtb37kBNBWoXSaxBEup47TfKofAUMtmWdpqtnk4PBbtok1rTlT1 eg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2uef01df6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Aug 2019 05:50:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 20 Aug
 2019 11:50:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 20 Aug 2019 11:50:33 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3BBCF2A3;
 Tue, 20 Aug 2019 10:50:33 +0000 (UTC)
Date: Tue, 20 Aug 2019 10:50:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190820105033.GG10308@ediswmail.ad.cirrus.com>
References: <f95ae1085f9f3c137a122c4d95728711613c15f7.1566297120.git.mirq-linux@rere.qmqm.pl>
 <17f8556414a0e5352dc570fa16d50bd1bc2b4b0a.1566297120.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17f8556414a0e5352dc570fa16d50bd1bc2b4b0a.1566297120.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015
 mlxlogscore=709 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908200113
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Allison Randal <allison@lohutok.net>, patches@opensource.cirrus.com,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: wm8904: implement input mode
	select as a mux
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTI6MzM6MzNQTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gTWFrZSAnKiBDYXB0dXJlIE1vZGUnIGEgbXV4LiBUaGlzIG1ha2VzIERBUE0g
a25vdyB0aGF0IGluIHNpbmdsZS1lbmRlZAo+IG1vZGUgb25seSBpbnZlcnRpbmcgbXV4IHBhdGhz
IG5lZWQgdG8gYmUgZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJh
dyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+Cj4gLS0tCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX2tjb250cm9sX25ldyByaW5fbW9kZSA9Cj4gKwlTT0NfREFQTV9FTlVNKCJyaWdodCBDYXB0
dXJlIE1vZGUiLCByaW5fbW9kZV9lbnVtKTsKCk1pbm9yIG5pdCBtaXNzaW5nIGEgY2FwdGlhbCBv
biB0aGUgcmlnaHQgaGVyZS4KCk90aGVyd2lzZSBsb29rcyBnb29kOgoKQWNrZWQtYnk6IENoYXJs
ZXMgS2VlcGF4IDxja2VlcGF4QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4KClRoYW5rcywKQ2hhcmxl
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
