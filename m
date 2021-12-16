Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B9478074
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:20:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA1627F4;
	Fri, 17 Dec 2021 00:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA1627F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696818;
	bh=Q9eEogOBDEPBA1sQkBkKsBlpM3V0r/SHJoc6nvPeJws=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vj4e0r+uvECOBJjX1itjDWcTrRksusnVtY7dxdH0oKmtTeybWwTmwxbU/0TAEYG89
	 vW5qV1oH6qrLYT9VX+qwlXXaxxbzUDOs3FPMdlSx7+urxLsREsdsYfVlhtv1q7wCHg
	 2RE3Nr/sz2BzLndpbDgbDZOQnewNH3SOLUdQ2a30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E619F8015B;
	Fri, 17 Dec 2021 00:19:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E0FCF8014C; Fri, 17 Dec 2021 00:19:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B2BFF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B2BFF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="MxqbUqla"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ep8301TNsTrVofzvH6r9SbXwcIBmB6qE4hd7uGib1NAtlZ+HSMFcHmaEhqbqkfNWqKeUJjl20SYW5yjU9k0nFOmW5xrNKeICU4FVs0CMaiWm/qh+/0/ulpHoNK7Iza4nVVuDBV/D4lroyisBAc/dwBiNoeGm/LU2g4ruQjgyIvYE+zVYihpuDk0jMdgDFnjuaTn39W/M+m9lPUwAWD9WJW0WlWAos4ayrWhSmvPRBPw6hpON19O/sQQ+0ZaUu29jqGI4TtdqkSUmPGnc7TlssjAP3rwUC8RSXFajmYGO4GaJc1xVQDqkA3YLueCnQ2/G6uEvyRl9fo9y7E8zU4aUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9eEogOBDEPBA1sQkBkKsBlpM3V0r/SHJoc6nvPeJws=;
 b=mBhc2+lBGgigEubn5AcqLAOVSuLol7bTzOXqhtWWNInp1+vA7v9k8t/0QYhVsRvG2PbgyB/deUIm4kxQaLok3LF/yicwcw+tCp1DNuaUiwdLYgk8HlAhihN4TxifJ6+zAQBxttIEAna9z8OhQ8uNGtmxF3gJPGey87hHDSTUwjWAfMWXLbQrqNQIZVsjJXeb2CzFOwqWdBd/CPIdr2d63oJX69VQ97tN9ZghtW0iA4bMp8oIBdDCUJ2XOd548EFrvNe9OtdY0TCCIjiVZxnjaeoXBmOpc8MWT15Mgb8JaKeiZow6fsoLpBiO4WO60eTRa6CyYrEgPfYiNv+2Gn2KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9eEogOBDEPBA1sQkBkKsBlpM3V0r/SHJoc6nvPeJws=;
 b=MxqbUqlaI0ibNdFhrVw7XbyknkWZgwqTNK19sqJByfprt8MXTDatlC0vjTm0pZBEP359jTkUvIEUHPgefswKkcVktHPBRLoc4xA5Xm6n7dbaQWpdocDXcufsMRXk92UUI7EowDrqK+vgyrzUH9evZ+xho1o2LoORAH24CqbBv4c=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TYXPR01MB1839.jpnprd01.prod.outlook.com (2603:1096:403:12::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 23:18:58 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82%7]) with mapi id 15.20.4778.019; Thu, 16 Dec 2021
 23:18:58 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Subject: RE: Question about soc_pcm_apply_msb()
Thread-Topic: Question about soc_pcm_apply_msb()
Thread-Index: AQHX8mInYRiF+nkEqUCxeghym1wKjqw1vtyg
Date: Thu, 16 Dec 2021 23:18:58 +0000
Message-ID: <TYCPR01MB558111E88B2EAA0967CF7A5CD4779@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <871r2dnir2.wl-kuninori.morimoto.gx@renesas.com>
 <638df4d7-0645-1cf7-635a-ea448d0c3aef@metafoo.de>
In-Reply-To: <638df4d7-0645-1cf7-635a-ea448d0c3aef@metafoo.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c9f0a5f-d269-4fc3-6aa0-08d9c0ea701d
x-ms-traffictypediagnostic: TYXPR01MB1839:EE_
x-microsoft-antispam-prvs: <TYXPR01MB18396E0CB587900598A0585FD4779@TYXPR01MB1839.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWIyPD413AOF5O/ixkFMas+Bg/U7d7jsYxDEuIbjVyJgseLzOW3ia+y5pNDDp+ckPdZ0YfnE1cE+N7ydeTZn7+SIRJG54C+b7JbkEg1rqD7Zqmxz+UbWt/0PyDT4UjuJmQgNf5e8hU+sb5hTh/SO20xNRCV0HHqoqmH4MF8F+GU1XLa9xmDkhbggMM7KrHrahQY94AM25wBVmBUWN+9nl8DkrYPBRjOWYMfu2lhulJubrStFwk45gJfeas6g6KhnddLz311sQhZPylNoUS1v1tTU/Ps6NWqq/j29xeNBI7wip/lX4S/7zYktvi2dU/S6gEZRpZV1mE3ezUud/dUSlTL0Bt0ulh/9Rw8DhgamCBUMJ1E2ZNB2coibhGf4C+IMxqSkZbpLW1ez7DVoFgGUM2jkYzf24WTNrpRIjFJDb8SFJYj9CTBptXhjbJLDsyUSQ0wZZYdwi1HC+YjALw/WJdg/k0lfADUuRn2WGIHBxBGLcVlhSleuORj2CmdOErE+iWelHnxmxUO+fPtaF19Onwpw7QcGc2OzEBMlWNDow/U45/ke57/t98O4HC6kqdLN/+nXkfntUbOmuVE4I+zMNtbcP2vkw6rZnMdbhttw7MREEx+4lCduLwsd9H7SCfTwoDL60c/RNobwugi5FrZoGrPEBXcdQgpf++Is3fcq6FCf0y1g4iQyrvQ2PRrfPbkTFSudMzrkyFZZ3Mub8IBV/qNwj+fnfMV6nzDPBeAV2vlQCn7WSkuFzc+LJjbaY6m+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5581.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(76116006)(498600001)(9686003)(6506007)(38100700002)(66476007)(71200400001)(4326008)(66446008)(26005)(7116003)(8936002)(54906003)(64756008)(5660300002)(33656002)(8676002)(66556008)(7696005)(38070700005)(186003)(2906002)(4744005)(52536014)(110136005)(55016003)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXdtK3k4TjB4eWx2YlJrOENVbXFlWGdaWUN6eWxSc3c2NUYwMW9kMFM5eVAw?=
 =?utf-8?B?LzlFVmpuVHBXTkswN0RIWDc3OGhkb21vOU9FUU1LUXlaVHBJdFRHMzdJZ3pQ?=
 =?utf-8?B?dndibjhMczI4ZHBSd3A5MWRuNG1LdmFUVTVaZ0NXNjJrNWtGT1ZKYlREUTJZ?=
 =?utf-8?B?LzRzcTI3dkQ4WjQrUUdnZFBCa2JsM29DVndKMy93QStoV20wMDRmNjlVZk5G?=
 =?utf-8?B?Rm43NXNpRDYzMUFUeUltWXFHUURjK1dlRXlWQTR0RnJIaS9NejU0NEJVSnY4?=
 =?utf-8?B?NW11MkZFdis2K1FFL293eE1XMDlvejlwOFRsVU5tTlYvcU1yd3pIOHZabFBU?=
 =?utf-8?B?L00xbU45enZNaHhOL3Fia052RlNjcU9DTm0zTzBJaGpxUXU2ZmgzVk5hQ3Vk?=
 =?utf-8?B?V0djNkJxdnRIL3BmUnhiMUlKQjFYQll4RFo4OGJWWWxCS29NNDBEaDhldjR2?=
 =?utf-8?B?Q3dyYkhLcDZIMmFpeGN3QjB2VWNhZUJIN3Y4cmZ2WDZ5SStUT2RVbHMxTDRa?=
 =?utf-8?B?aFF5ZDNxKytYSEV6eFhDcklYMWpBellVb1JIaEN2VXFMaE9yMit6a3FiUVY1?=
 =?utf-8?B?V3F3YVB6MTNSUFplUWJGNWNhRjk3QzI2RFFWbHZhc0JNWGE5WFRzQ0x3UXBE?=
 =?utf-8?B?aGNpY0h5VlhIU3czcFUvVCtSdGNhYXJxOGpvMGQrTEp3SUViOWRCY1JROUJB?=
 =?utf-8?B?MXpSQms4bzUwSkMxK2RNMFdJZnh6Z0JOSlFrMmF6R21TaExocWR3cHlmUGRy?=
 =?utf-8?B?L3F1NDdyWit1QXdocEZXeGpHWHBGTXlHZ2I0b0gvMWNmZmhCUnRCZjFPaVFa?=
 =?utf-8?B?OS9ackVhUkZISk5KdndBSWxpa3FoUWtpZGZkSjVxUEtZVFdxdjUrNzVKWGRK?=
 =?utf-8?B?Y2RHSU9BMG1lanlKMFBKSW8yVEZFVkFSZ1hjRGE2UjRPNnd3WjNBbHNLUTFi?=
 =?utf-8?B?R1hCSTJnSkNSbzdXa1pUUFY1RXNZWTdnajk4ZGloVXpGNFR4Z1lNazQzekxM?=
 =?utf-8?B?aFQweHd4Y1ZlWmZVaEtVeDgrUGc2TGVTUVNzdDN5ZzJZUmtiMXp2elhrT2RD?=
 =?utf-8?B?ZGJUWm9TQ2NQclFTTThycHRaNGZHMWZxQlVwckNBTnNsaW1IcDBFa1lxRmtt?=
 =?utf-8?B?TCtQa3RaNkNLeVFnZDN0UlhoRXZhRyttdWNHR1IzS2JhNlFvZGR1eDkyeVkx?=
 =?utf-8?B?UE5CemR2WlZnd3pBaTArdFlXY2xoRDVFMlJRWlVPdlUzckdrOFVmUUN1NDha?=
 =?utf-8?B?QVM0c29ZcTdRTnQ1WmY3Vkt1ekp5NTlMUGlPb0I3Q3laTFlSdzR1VWxraFE0?=
 =?utf-8?B?b0Q1cE9uVitteUJ4Z3ZUY0hyKzIxbmVHWGtCbjFmUVI5d3BFbkdFcEVnYnhM?=
 =?utf-8?B?NzY5Q0NyNUY2c0ZlaUZmbTQvMFdCR0tWanlhbTNPNmpqek8zaVBUdTl0WnlU?=
 =?utf-8?B?dHhBbXdJRVd4b2FmaDBQMHRhakJUYzlTMVRXRWEvd0R6dGhFRGREWk1id1NO?=
 =?utf-8?B?UUVNbzMzWTk4Skp4QzdFV2hFYmtqRDg3NnU5Z0FEd21qWkFYamg0QnpTNGtq?=
 =?utf-8?B?LzVYZlZnRnFpQzhvTmxUN1oxcnBpKzFuYVVrRmVIS0thOU1TQnBTNm9YQkV4?=
 =?utf-8?B?ZEpraDBWMUdnSEFpV3plNlF3ekFJMm5tYzFYbDhQZkRNVWlIRkZNbVh2c0Rw?=
 =?utf-8?B?SEM5eVQ2VnM1c0ljV2tSeHV0dEl2NC9raHRGSVREcGlXTU9wbVJXTldneVZn?=
 =?utf-8?B?dGpWVUlMSElacWwrb05WOXRjTG9sNmRoZTVoOGcyN0xXWWVHNS9XK01JN1A1?=
 =?utf-8?B?c09EY1pnOE1ja0JGQVk0OHc3YUpJUzZwa3hqcDI3eEE0WkxWL1RYYjlNa296?=
 =?utf-8?B?M1JkRGdSWDYvdTZiMzFRaDEyamo5N1VXbUxoSHRBdlBlVXU0Q2VhL0Y4K09E?=
 =?utf-8?B?cVlBTXlPRHg0RytIUU10OWhYQWlRTFR4dXNxN0ZJUC9SMEEvS1N6Qm8reWQ5?=
 =?utf-8?B?NEZCU29hQUZzMUlPeWordElTRHVDdGJEdnFGRndsbm12eW5vRytGU3UyQjZI?=
 =?utf-8?B?Vmdya3RUbG9oTEJKVzAzU1VlQm9UMVNVRmFWY2NsaTVNL21qWXJkcENBV2Fp?=
 =?utf-8?B?QzZLVGticHpjbVJHcEpVV3ZIVnVTdlc3clVkQm9UZXdWZEVTMVpVZ3o5VFVl?=
 =?utf-8?B?VFpiSWhOK2N4elJrb0w5YWpMZ25tTFd2eEwwL1BrTkEwVU9oc1F1cEpRcHRs?=
 =?utf-8?B?MFcvM0hjZjEzeU1ZTEJjQkl5OWhnMFR1dGhhVzAwZFBSaHFwU1pOMkU1dzNx?=
 =?utf-8?B?b2F5d3hvb01LQ3B0RlNPK3lxOS95elZhUWFDL3NNMWZhU0FNYU1iQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9f0a5f-d269-4fc3-6aa0-08d9c0ea701d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 23:18:58.4711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wsLeXpcky8zfiFqAJJapYRTAfVpF5xs4Vpfg69XRaY6C1yd5EoXHkO8asv92S5/LezU4fBzz/yw3MN9NkDs6622NhwPdAPqXGpCU0Vwzj9VIU7o8wh6Lyhv3ak9mPXes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1839
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
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

DQpIaSBMYXJzLVBldGVyDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjaw0KDQo+PiBJIHdv
bmRlciBkbyB3ZSBuZWVkIGJvdGggKFgpIChZKSA/DQo+PiBJIHRoaW5rIHdlIGNhbiBtZXJnZSAo
QSkgYW5kIChCKSAoPSBmaW5kIENvZGVjL0NQVSBtYXggc2lnX2JpdHMpLA0KPj4gYW5kIGNhbGwg
c29jX3BjbV9zZXRfbXNiKCkgb25jZSwgYnV0IGFtIEkgbWlzdW5kZXJzdGFuZCA/DQo+IFdlIG5l
ZWQgYm90aC4gT3IgYWx0ZXJuYXRpdmVseSB5b3UgY291bGQgd3JpdGUgDQo+IHNvY19wY21fc2V0
X21zYihzdWJzdHJlYW0sIG1pbihiaXRzLCBjcHVfYml0cykpLg0KPg0KPiBXaGF0IHRoaXMgZG9l
cyBpcyBpdCBjb21wdXRlcyB0aGUgbWF4aW11bSBtc2IgYml0cyBmcm9tIGJvdGggdGhlIENQVSAN
Cj4gc2lkZSBhbmQgdGhlIENPREVDIHNpZGUgYW5kIHRoZW4gc2V0cyB0aGUgbXNiIGJpdHMgcmVw
b3J0ZWQgdG8gdXNlcnNwYWNlIA0KPiB0byB0aGUgbWluaW11bSBvZiB0aGUgdHdvLg0KPg0KPiBU
aGUgbGFyZ2VzdCBudW1iZXIgb2YgTVNCcyB3ZSdsbCBzZWUgb24gdGhlIENPREVDIHNpZGUgaXMg
dGhlIG1heCgpIGFuZCANCj4gdGhlIGxhcmdlc3QgbnVtYmVyIG9mIE1TQnMgd2UnbGwgc2VlIG9u
IHRoZSBDUFUgc2lkZSBpcyB0aGUgbWF4KCkuIEFuZCANCj4gdGhlIG51bWJlciBvZiBNU0JzIHRo
YXQgdGhlIGFwcGxpY2F0aW9uIHdpbGwgYmUgYWJsZSB0byBzZWUgaXMgdGhlIA0KPiBzbWFsbGVy
IG9mIHRoZSB0d28uDQoNCk9oLCB5ZXMuIHRoYW5rIHlvdSBmb3IgZXhwbGFpbmluZyBkZXRhaWxz
Lg0KSSB0aGluayBzbmRfcGNtX2h3X3J1bGVfbXNiaXRzKCkgd2FzIHRoZSBwb2ludC4NCg0KQmVz
dCByZWdhcmRzDQotLS0NCkt1bmlub3JpIE1vcmltb3RvDQo=
