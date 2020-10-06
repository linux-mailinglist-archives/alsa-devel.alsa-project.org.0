Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A6284F33
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 783D5172C;
	Tue,  6 Oct 2020 17:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 783D5172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601999170;
	bh=wwHDWis+FR/uiwH2DbWAwpt249w3wbP+pJ3EliI7z/8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rG3ykqCVBqn71s/XhQVgbr6jWGdXiaG2ka/KcVite7VMc3iY7kVsL5yp9uZt2mSQ1
	 Txdlc4AKjieNWGtd9Xdn0N8zsXvW5wCEp6cRAvuOIo4bhxQvO15HDLM5mZhh8qmuoK
	 c2SLqZKyX4ZgIcBtR97gsGswLr5Z+BAir8CYefh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5A5F8012A;
	Tue,  6 Oct 2020 17:44:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E8EF8012A; Tue,  6 Oct 2020 17:44:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32C29F80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C29F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="13fu9aJ9"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="UBokLFcb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601999062; x=1633535062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wwHDWis+FR/uiwH2DbWAwpt249w3wbP+pJ3EliI7z/8=;
 b=13fu9aJ93hI60vZN50Y69Qqs0vvOoaBy1OHK5+Hw3tUIfGZLAEApIAr4
 L5kWhlTqD6UtTh/eN1VpStimWbjLZCXGSp7qp3va8eHm7i1fXZkUqg2Zp
 Yv101wibq7xM79TdSYXiij7PYUBWxhbkI8N/ZOBWFlqoV7gWE0iGf0598
 TsLUyq5/AWbP8x25q3X1KGtSh32RrytYanFuRyd/F0yeKNdVWS5sxOkXH
 EZZi3N7f0P8uO4kQuFpplDalNLNbHwsrCbPi6UEWy80cQOqamuuq2u7aW
 fo6J9qs/enG+uUVSCqsgfARFzNGNY54P6Zx74Dm4cGGJPUG57ZLJYlWFX Q==;
IronPort-SDR: 3xwKByHWsU8ZrzinDvsjzODa+E/mg12sRNAAO4Zcf3OAsq4S+rNi749SeYpaTfnijBmdcytgyW
 0jsfc9JFtkyHcw147fzdGvCLL26+PZ+TnnjF4q6xdJ98IsbF5ThQaR5eYbTLCgzmw5JCntFkIf
 f7H8X+3OUpuQ0BW6AWQ4HobiHa1zefgV0abyWn7enjXdLQ5vEb0lU+nUWnqgelUa6iN0/1Y8sC
 TA5cOoEznSA5FCmA302mnB3JySo5DjgP42r4gPDUu9hEG5q4yIb+Oh6OnMaeSWrFHouxCvlee4
 BN8=
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="91627120"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Oct 2020 08:44:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 6 Oct 2020 08:44:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 6 Oct 2020 08:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8AuDFlYU95rQeRFGFdNu5b83q0W/v+o8n+tVruUdLni4foR/T7OAPegZtu+W6+x0oFssC75v0qggxGwPKGpqyMRJAbTpgoPKGwQVbP88v9QcgLu1Qc8hNN4gVFHfRbzDj6W8TKp1mwgSBdNbTUVEu/tuq9279UOQGijN/Oo7kPlpyDNhfG21lUjDu4rPiBFeKR9Rij+evMvFs9Tw+9+iGC8idgH4u1tgL9VCKfkyih54vO/pdadmVIgNlrWgNp0lSuOcYbqKojSx8LXFAtAwmAvp09cdYELcmeDlE/M/uGhwhOmmKmykbGl9QinkiNfrg9UKFhw0GcnEBhxmoAihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwHDWis+FR/uiwH2DbWAwpt249w3wbP+pJ3EliI7z/8=;
 b=SU7j3QtdD+q7xFiZATqLOODyA7EcrvtYMh+2OiVtlIRUpzCc2wwmqQQRXvlkQ7gVK+t33m+P/jhfJQkxXBl8Rmkvjag0zaTTa0eD5H44l3WtAxl06RuR0xXRRlLFugf63XvkWRbVVNldqIjbVCJ0NU/LiQ91gzit69qTXVpCW/LTGQ7tixuwds9GZWKy7vYs8msllOWBwzH40BpgzcqEo1FEa1iDcJWDoNxL3M0zlflV/1hiHWNi9Q+r7MFHXEoo1f1T6/sucm47+3UiaSBwWFBspehdD3z+GNDWu5fQOk7Zm01tXhhH9eIZZLd9hcEJc5fJZ1LQ0p1rIowAJIQwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwHDWis+FR/uiwH2DbWAwpt249w3wbP+pJ3EliI7z/8=;
 b=UBokLFcbPbGENXrxKgyKHDXFnrjNu46+1fVa3fQeWeFoherXWFiRvud5yEJyxeJ/1ecxGr1DOF1lNLBibjs+VoG/CG2G0N2DzbMmt7KhfChwJnJvOCYrQL0qnV4EaLdb7f2lLEnMxd2dYf/+R7FcKsK5q8EYV+pFzxHWvMgTdbw=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB1942.namprd11.prod.outlook.com
 (2603:10b6:903:125::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 6 Oct
 2020 15:44:13 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e%7]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 15:44:13 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <colin.king@canonical.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun"
 -> "overrun"
Thread-Topic: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake
 "overrrun" -> "overrun"
Thread-Index: AQHWm/Q817bEwg9jYUW656J+jxiSmqmKtymA
Date: Tue, 6 Oct 2020 15:44:13 +0000
Message-ID: <69436582-3b11-b063-dffa-9975773617ff@microchip.com>
References: <20201006152024.542418-1-colin.king@canonical.com>
In-Reply-To: <20201006152024.542418-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.121.164.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b000b9b0-880d-4fb6-b1cb-08d86a0eacad
x-ms-traffictypediagnostic: CY4PR11MB1942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB19425697B2E35C7DD02E2569E70D0@CY4PR11MB1942.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7TM758PcrHjOm8OTPEkT2l8MIt44Rqkif7QlnQLERpwUwo+7fGRLdl/8EKss97+kow4drHtC+3fCwH642Ka63Xuz/w7+O65c36IRXoIxcqkyT13LuOAF0dFcWq1aRJROPI3txQyiTqme5rNLKIzl5TmRsXNlpAI1d3AJPGAPCae7PV1Ew9AYQaOuUWmD+WZyYNMWdOq2lyh9rVxkZ1hhlWnntdKtz96Yiea5IRJE20MP7BY3MamO1+G1hdDIKAMIGxDgOZ/SLEQa+u2+HodKZ3loqbfWLwK5hGkvfyimFU+II77VhLdwQjjrR8otvLkkqarKQOmyRCsEBfzB4WbojrFn+Ixapdc3+WftJX0z9XoSR+iRa984zxvTevrDQFstkMTdrvhIoNDk4bWWi2oa3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39860400002)(7416002)(71200400001)(66446008)(2906002)(66476007)(64756008)(66556008)(66946007)(83380400001)(6486002)(8676002)(6506007)(26005)(36756003)(76116006)(2616005)(91956017)(478600001)(53546011)(186003)(31696002)(4326008)(316002)(8936002)(110136005)(54906003)(5660300002)(6512007)(86362001)(31686004)(4744005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fVjfpbkqQPi6x/K+XRXSd2FeNFfXlyZZ2JQWUANNAgdNFwoPUtIaJ9pdlUysMoXrhzvDhp9YhTuyLS2a565WUfUmB1urQgNftANCp07WwCeFAhIKHAaRQg+Nyxskp/Ei8KBeaLxIcMnQTp3MEUmRfr6Vja2CXCSK2aFRmdRKLC2ABEGzD5NFlof4egTjkKI3U+ZgdJv+fzcYdDoHj4McaQO+rmEWsFXHm4EQOEhKzp/OjIkchKt5p3MMqIntzHqNs/U5nyFqj0aUu/wpd9tVc5W8QeEnvRYme3vFFyUIYipOabCPE30KUQngbKzaXepL0zw52Ne2Q0iZjFJjZvwdOfKniwU1AKfmAdoM0R66QaSGNo3wOPRalkSluu6i6gZYjAr5d6y6pceXjWSVLc5gLd0jbUgjIxJnAIe3Amv8CyZOuzehsdUoPFmxZEii/JMxbnuYI5TerubwTWH7i2e1JwgSWWCE8RhqJmfLXnCDvI1sssxZVW3dLr6YkVyk3/BQo7r4fABHA2FgvHq3XYCO3+Lat5UDyi9mL6EyJgQYyfLdjaWkOoWH1T85igYgb90pnuin6OXw/2YYgg1ZAVHvcjOLoIL4qJtx/+KHZY6OPYQ6Ysg5dALO1uTeeTNoa6KcoJrTc88Z35X+NVC5idtdOg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBD31730194B6A4B8A662E6392974F78@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b000b9b0-880d-4fb6-b1cb-08d86a0eacad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 15:44:13.1296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hr3p2GQqU/gQCzb20Q6MZt91hBSMPyBsHwy4jczFn1LE2TMeTb5hApVf85HwCxBvp1fKZoOTzEsgrIA6tTWXzR44ls5pHQl7MsoKwq1yVf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1942
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gMDYuMTAuMjAyMCAxODoyMCwgQ29saW4gS2luZyB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhlcmUgaXMgYSBzcGVsbGluZyBtaXN0YWtlIGluIGEg
ZGV2X3dhcm4gbWVzc2FnZS4gRml4IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBD
aXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFuayB5b3Ug
Q29saW4hDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0K
