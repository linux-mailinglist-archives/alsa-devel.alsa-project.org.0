Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4286254CD
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 08:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD121663;
	Fri, 11 Nov 2022 08:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD121663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668153574;
	bh=mfT177jhR9f7jTEme3ZOCd273McrBLdQ9UO0VHNKtPQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5Cs4Bs4XoQj9RDzT59gwocrLnHSAlHzjqUxqqgppBfv1Fv/sZCNCOu6e52MQ2b6N
	 3oiFrHCVwmiyrxOn9z+khf8ARjh9WYHqyih0ejP+d6brSHsa0Ign2lgrYplqa6styM
	 cnR1eWS9px2N4ADwbDahmBP5QQlBVbj69oquvdoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44859F804AB;
	Fri, 11 Nov 2022 08:58:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98828F8028D; Fri, 11 Nov 2022 08:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 505FDF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 08:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 505FDF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="a4Tzc+qK"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.b="tRNyItKk"
X-UUID: fd757c89beda4f76b9ea7d9b22230de5-20221111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=abtdgUxHEQn77PLC29qW3ZUSSVV9EERV6IDcSRuFQlQ=; 
 b=a4Tzc+qKouiaCS73DdMZsqGWT+b4p1YB2vPpgDJyyJpqYO98/orhxxCL4oe1mAcvMT7SD2Txoicw/zrE3fU2TLscSbClgrS142uxKox6q0XjxkJxiB8DM87NtirX0Mc/glnk0OXtxdtBGWISDaE71iqRbnev13qbx1/44bfoWuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.13, REQID:6eaaf951-336c-4e60-b191-b6905136e740, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:d12e911, CLOUDID:d20e0451-b7af-492d-8b40-b1032f90ce11,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fd757c89beda4f76b9ea7d9b22230de5-20221111
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1973105465; Fri, 11 Nov 2022 15:58:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 11 Nov 2022 15:58:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 11 Nov 2022 15:58:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or/0LTz2IRut7QFFK7aaVBPaS6XgFwC3GQSu5lUSMxowdp4fxqZt03V6MO9c4eD98HWNXUARHmrlLyJgCkLbXa1Jjybf31NpxzCW12jJwZkv7spJlvne4QNm9aodQ6PI1CHKV6teoo+fxWBSM342fJGugcsuWsKVfF8Bw8Pdfmz5b2fzaF//zmj45uzO9b6Z9Of+835A9bbpQXxIJscIzU1VTICvOwvuv35/QM4XgFNo6otOgsbRMsOX4f7V63syX9Abk/rtUTHH7doYcqltY9/JryeWu5qhz3dndT4Li9Jny/62NQcKY9XeFqcv/GrD49+kjk8NlUZ9VcozhuMBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoJebuc/+BU4ZTzmLCc3jaNZYdcYBaVpDDvT0JAJhz0=;
 b=YkwO+BnOxMSUn+B/qZ89AMCgf1pVubSibwldumg0vceRCpsw+5x5R2QnvkjPR8ADCym+RFbcZW69bflk0hVgtFQSdmdbLsPOMBTlDRMBlgm6ptYrF462EhcLIZEjInh+oukrDblIZ2XUQVlIhTbvKO49YWorH7fILOsb279EjasZBgBzrCG3wm7LF/JqlaAcnFuyArDpxNiOKkhVOjTqJnY5jfQY1OHp19f6lNeNJ8MTVscAtfzLl/x6qNfkgMn2gV9AXL2wkuzbWW7Ek4FXpcvqxuqTOOkwOiuTBU5t5rJWwNb7xoIeLLj1aPfd0nRQiIpY8kmYw3IdrwFce8BDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoJebuc/+BU4ZTzmLCc3jaNZYdcYBaVpDDvT0JAJhz0=;
 b=tRNyItKkKVpjBxono+5Va9N/H5QsHJWDL4FNpc6I7elBB75rXjlQ9lKCoCbClJ0drKBOAujn+INlOWRjxYU5YYs6MvymJPq98nfCF2lFh4QXVoWOiyrLQcGxT4BnCt3r7MbaH2awU4jknbglT7Tl09Qz3fHWRWGcXhBfzcsoWZ0=
Received: from TYZPR03MB6495.apcprd03.prod.outlook.com (2603:1096:400:1c8::6)
 by SG2PR03MB6825.apcprd03.prod.outlook.com (2603:1096:4:1d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 07:58:14 +0000
Received: from TYZPR03MB6495.apcprd03.prod.outlook.com
 ([fe80::54b:6a19:a632:f8d2]) by TYZPR03MB6495.apcprd03.prod.outlook.com
 ([fe80::54b:6a19:a632:f8d2%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 07:58:14 +0000
From: =?utf-8?B?Q2hpaGhhbyBDaGVuICjpmbPlv5fosaop?= <chihhao.chen@mediatek.com>
To: "tiwai@suse.de" <tiwai@suse.de>
Subject: Re: missing sound on kernel-5.15
Thread-Topic: missing sound on kernel-5.15
Thread-Index: AQHYtf4oAqnj0u9Vo0uCZtGBXKOgi6260NWAgAtDCwD//3yJAIAAkqAA//+zTYCAAGRVgIAAw2yAgACLWQD//4emgAATEIqA//9+M4CAAcj/AP//lYKAgACjPoD//4sFAIAAnSAA//+QuYAAFfCMgAAP68OAABLLcQAADIongAAXzh8AABtpsIAARukpgA1ftpCA
Date: Fri, 11 Nov 2022 07:58:14 +0000
Message-ID: <154fcd96e77b4a39ad97575fc37ce90547f06a15.camel@mediatek.com>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
 <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
 <875yia87gu.wl-tiwai@suse.de>
 <737b992a1546486fa622c83831209f935e45ffd2.camel@mediatek.com>
 <871qsxxa6g.wl-tiwai@suse.de>
 <d161bc518a0313e807a6711150a5a259d93cae29.camel@mediatek.com>
 <87tu5sx2ih.wl-tiwai@suse.de>
 <f0ed9708c99cedd4c6c91c39e905dc7e03cc6bcb.camel@mediatek.com>
 <87k06owux0.wl-tiwai@suse.de>
 <5b47c3025fba9fd7b2156d1260962b1d67c1b2fa.camel@mediatek.com>
 <87sflcy1i8.wl-tiwai@suse.de>
 <09f0c52d86155fd6617eec59c341c6cdd4aa5059.camel@mediatek.com>
 <878rn3h6ra.wl-tiwai@suse.de> <8735dbh52h.wl-tiwai@suse.de>
 <204d18b345165560f23b3021dbdbc8e8e39c1674.camel@mediatek.com>
 <87y1v3fl1s.wl-tiwai@suse.de>
In-Reply-To: <87y1v3fl1s.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6495:EE_|SG2PR03MB6825:EE_
x-ms-office365-filtering-correlation-id: 0a785152-255a-41c1-f3e6-08dac3ba7c29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PUISacIj72MwDi1rarlttp29a0uLCVlZ5To8p+A5gP/284KpEFXQSr77dHKdP3OXitMsf9QdPf9PSE7cj24kgjHyiE+m5dC4MTSRPBA/LHJe8XijqCrLy0yZNgRY0lm6VCGWEbYsgjxlplzGn7LSrA290wKkp7ReebV7TWRJrLxvZnftxZC67wCyNrLpj0PtKkiLuQAd4X2Hd/8cuvyiPqs3Q5PehLbPQu4iRF2whWno8T28O+mgr/hkeDvfoip5R8GFYm2BZXOZydDqhDSgOslGksh6lkva+g3mZXDq2XNpYESFTBD3FLCfGmZCpKOobNZCAh7mYpJC/YqrYPAgdEHzwws/07qoPXZ1C4gD+hJmNm0f1ymdTMxF4CpcTCWnjHa8dCJoWDQDaVGEkWamZCq7jyezVWKK9/7Gh397LVmXqBptCiPgoCojbPrBUIZdfzWFDLbGQNAecp563B2EZ0+ygJTsECRfjm8TPXGOsyzW+GGF2XFCuxIT2/JeacxyOFXqGOoa3kSHcXQoDU2hcgC8dxh/Un14IeuNyKgGPzWahvKA8Ro28gQ5/i3i+fkrFwQvILxRrIaF3BxasSRWsuFQq994ibwbc2KRHwkJOLHxQyUJXwmb3kqy08OnVN/o6PRwrnhjaZJHfpPLmXhEejWv3UpuHSn7emAR0t1GJTmo0oglQ0QhLmpCJBnNhWWmWWg5iXFIFOo5A+rbsAAd8wX64OiKhg3FdITJVf8SYozxTpgl7DDO26iBCB9SufN6tZ6SGFUyjneEqZuhzJ3uLTkORiLKhX+J7979aSeL4gxBoZ6WE7Xo9ybJ1aHp7/MT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6495.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199015)(186003)(2616005)(6512007)(83380400001)(66446008)(26005)(6506007)(2906002)(316002)(478600001)(6486002)(122000001)(5660300002)(41300700001)(76116006)(4326008)(66476007)(8936002)(66556008)(71200400001)(8676002)(6916009)(38100700002)(64756008)(66946007)(36756003)(85182001)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dko2YmZvVmI1OEM2QzBvK1M3Q0dNMlVjQ0NrK0lKOHRWQVRDSkl5bEFNYzN0?=
 =?utf-8?B?YzNIS1FQKzNqTzJCdTJseWdmbFIwcGVxSmhuQlBZOUh4TzNpd3M4ZHdLSUVu?=
 =?utf-8?B?TlgrZFhhcWdWb0hWYlMzdFUyekVWeVF2WWFuckNsd2Fsa25xMHZKOHRnU0Rt?=
 =?utf-8?B?S0M4QTQ5VUxOeU1waHNaTGtreUJuNmYraUZJQUhyRUtKNGxXS1M5c2ZqU1p0?=
 =?utf-8?B?bXRoQWRMRXI1c3lFN2JYYVNQZEFmVGZjcWdocWJxcjdOdXlYVndNY0ZlV1RK?=
 =?utf-8?B?QlN5VnYzcEpuMkkzYmFQS2VZUGZNOUhKaXNLRjBjeG9tazR4RURoUFdDanJV?=
 =?utf-8?B?TmdzY3hSM1MvdTAwNjFLcHhSTE1xY0dIRkVOZ0R2TDJqaE03ZTEvMmdVVHpU?=
 =?utf-8?B?VldqTVhWd0VPeHFmcjdPZEovVnp5R2V4QkZNTFlQZCtXTnBocTU1dXNXaUZC?=
 =?utf-8?B?a01yeHZpN2lJZWFRNUx2TWhsOElXZnZscjFobHU1Ym5ITVYzaElsYnllSU1V?=
 =?utf-8?B?OE96MUkwbDlhdW1QRjFhblA4R01pay8vWnhQaWRDbFptNmF4eng2K2hhL3Jz?=
 =?utf-8?B?MHFubytTRFBrM1JrUURHQ1BacmhCbEVGMkF4Z3BuSy8rTkJYYWxqY3FwRDVK?=
 =?utf-8?B?OVRiakllTEt2NjVnVXVETEJpOXBuQjBYTXp0bUhDaEw2cWdVc2gxTUsvekJU?=
 =?utf-8?B?VFpuWHdkVHZobGlqSWZRM2xOUU5rcHU0emFSYmpDVlllVEszRGdjUWhqODRz?=
 =?utf-8?B?ZGJjQU14K1BlL3A0UUVsdmdOb05pd2xoL3lMckUvcFdCeW42QXpDaTNaa2Zo?=
 =?utf-8?B?by9VUXNaeVE0L3ZaNnR5a0FkOGdWMG1YTFcxZm9odGd1aEhlRUFiVEJwMTBV?=
 =?utf-8?B?cE5UUzhvMWVBMmlsRFBqUmRnK3VLcUxaNDl4S255RG9ZL25kVHV3ZzZFdlFx?=
 =?utf-8?B?SElLV1V4K0JZOGxXMGZ1SnJxaTVySXNST2FJWHN4cGNGaHhwNkVCTEFCcEow?=
 =?utf-8?B?bXpaS1FBdmt2M2VVbFhWak1JSVlNc2xuZy92Z1dvTzJVd25ZdC8yNUh6b1hL?=
 =?utf-8?B?Vm5HNE1HaGFyNGZ3aFp2NFJMRlFGeXVwZDRuanhhYWxVU0FjcEJkTXdLOU5p?=
 =?utf-8?B?U3I4Slp4bjdEOVV0VU1OVzFPT2hlU1ZEWW56TVVIYzlBOEVCOUJ2dkVKOFZF?=
 =?utf-8?B?OFM2ZXYwMTFlS3BNVUZxMG1IZVNaMkc5alhFQW10RFNsWlUrNjRpa0JJNFh2?=
 =?utf-8?B?a0VGKzdmNTlYbHA3OTYzM3JMTzViME0zMXJNa1RhaWpwT3BseTg5OUIvTmEr?=
 =?utf-8?B?bEpBUmdsN0h2OWpyWHh3Q1ZNUU1YQVEyN1gramhOUlJRb3FadEk2VWI4ay8w?=
 =?utf-8?B?ZWpzUzhuTDEyWko1SkFzYVc3OGUzUzg4ZmVaNzRIVDNpSkFVQWtWRjYxM1Fk?=
 =?utf-8?B?RWFqWXk4eFVpZEhXY05nVFJMM29GbWNMdHZSc3RRYU8zeHNETTRMbHorWWo2?=
 =?utf-8?B?eFVSc2FTcHFaaHliV2dub3RpWjdLNkZNRFcvSjVpNDN0Z0dIL2U2UnBqODJu?=
 =?utf-8?B?K1NmV2tSRWlEdmNjS1hFWlhHeVM4K2doYUplN2Z0MW9nWHZSNUVYWTBzWU04?=
 =?utf-8?B?djljQ1FQckVTMHFkME9MTDVlQlJxZElaQnVMYnJ0Qm4zZ2crZ1RwSmkyYUdo?=
 =?utf-8?B?OFk1TWIxQmJqR2FGZks0WVZZd0VBL0UxSDZ1VU5HTmV1d0E4UFRsUld2dlZV?=
 =?utf-8?B?Y28raUY1VHlCSlFISC9MaEVWZllWcVM0dG9KWGRuTHZ5TGdjNFBvT3gvY0RQ?=
 =?utf-8?B?SWFITklwN0ZQNUUrV2lyRDJSK3JyQlpuazFodUNDalc5WXBieVA5S3kzcXdn?=
 =?utf-8?B?L1lKQ0RuZHpaM01IamUzYjVobFRpd3BjWXZoY2dQSms0ZTRrZmlJenQ3Y0l3?=
 =?utf-8?B?TTRIWk00SjRVSVRWWVhWejN2bW8xQjdzT0Q3djgwNGxRakNsbVVMT0s3MzMy?=
 =?utf-8?B?UXlpdFFheWhQekRrN0dtRXhGK04vbi9aZGJZZEdOOWR5SjUzclU2aVVjVWJs?=
 =?utf-8?B?U3hFblZZOFd0RGxQSHpCWE1OM1gxaVo1ZEpyM21IajF1ZnIzcjNKVmQzWEdC?=
 =?utf-8?B?enR4azdpUjNQWFUvajNnaWRiVzZZOW5qYXEzR2UzZko1YXRmUmxFbVJOcjA0?=
 =?utf-8?B?QWc9PQ==?=
Content-ID: <65905BF90DC9C54399C4E8B063E601E6@apcprd03.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a785152-255a-41c1-f3e6-08dac3ba7c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 07:58:14.0477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRH/JirRB9KO41OnbSvR/XIetFhVa4wqZLjDaZpyIU9c1/eTbgJ4uUbDS7ewFg1aKYpYcbM1A/+zY+FNPYs0BpqNNYvLcS94vC5YkReklOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6825
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi Takashi,

I noticed you applied related patches to kernel-6.1 and reverted the
patch on kernel-5.15. Would you please patch back to kernel-5.15
because there will be more and more kernel-5.15 smart phones?

Thanks
Chihhao

On Thu, 2022-09-01 at 12:25 +0200, Takashi Iwai wrote:
> On Thu, 01 Sep 2022 12:06:25 +0200,
> chihhao chen wrote:
> >
> > Hi Takashi,
> >
> > I tested the patch and USB audio function works well.
> > (Start and stop playback more than 20 times with Samsung USB C
> > Earphone)
>
> Great, thanks for quick testing!
>
>
> Takashi
>
> >
> > Thanks
> >
> > On Thu, 2022-09-01 at 10:28 +0200, Takashi Iwai wrote:
> > > On Thu, 01 Sep 2022 09:51:37 +0200,
> > > Takashi Iwai wrote:
> > > >
> > > > On Thu, 01 Sep 2022 07:50:40 +0200,
> > > > chihhao chen wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > The patch fixes this problem.
> > > > > I tried it with "Product: Samsung USB C Earphone" and missing
> > > > > sound
> > > > > problem cannot be reproduced.
> > > >
> > > > OK, it's a good news.  I'm going to add more information to the
> > > > patch
> > > > description about the regression and submit the patch.
> > >
> > > Could you check whether the below cleanup patch on top of the
> > > previous
> > > one doesn't break things?  I lightly tested on my devices and
> > > don't
> > > believe it would change the actual behavior, but just to be sure.
> > >
> > >
> > > Takashi
> > >
> > > -- 8< --
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Subject: [PATCH] ALSA: usb-audio: Clean up endpoint setups at PCM
> > > prepare
> > >
> > > This patch cleans up the superfluous checks and calls for setting
> > > up
> > > the endpoints at PCM prepare callback:
> > >
> > > - Drop stop_endpoints() and sync_pending_stops() calls; the
> > > stream is
> > >   guaranteed to have been already stopped and synced at each PCM
> > >   prepare call by ALSA PCM core
> > >
> > > - Call snd_usb_endpoint_prepare() unconditionally;
> > >   the check for endpoint->need_setup is done in
> > >   snd_pcm_hw_endpoint_prepare() itself
> > >
> > > - Apply snd_usb_set_format_quirk() only when the endpoint is
> > > actually
> > >   set up (i.e. the return code from snd_usb_endpoint_prepare() >
> > > 0)
> > >
> > > - Move a few lines back into snd_usb_pcm_prepare();
> > >   it's even easier to follow than a small useless function
> > >
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  sound/usb/pcm.c | 40 ++++++++++------------------------------
> > >  1 file changed, 10 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > > index b604f7e95e82..4ed53a3dc922 100644
> > > --- a/sound/usb/pcm.c
> > > +++ b/sound/usb/pcm.c
> > > @@ -433,35 +433,6 @@ static void close_endpoints(struct
> > > snd_usb_audio
> > > *chip,
> > >  }
> > >  }
> > >
> > > -static int configure_endpoints(struct snd_usb_audio *chip,
> > > -       struct snd_usb_substream *subs)
> > > -{
> > > -int err;
> > > -
> > > -if (subs->data_endpoint->need_setup) {
> > > -/* stop any running stream beforehand */
> > > -if (stop_endpoints(subs, false))
> > > -sync_pending_stops(subs);
> > > -if (subs->sync_endpoint) {
> > > -err = snd_usb_endpoint_prepare(chip, subs-
> > > > sync_endpoint);
> > >
> > > -if (err < 0)
> > > -return err;
> > > -}
> > > -err = snd_usb_endpoint_prepare(chip, subs-
> > > > data_endpoint);
> > >
> > > -if (err < 0)
> > > -return err;
> > > -snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> > > -} else {
> > > -if (subs->sync_endpoint) {
> > > -err = snd_usb_endpoint_prepare(chip, subs-
> > > > sync_endpoint);
> > >
> > > -if (err < 0)
> > > -return err;
> > > -}
> > > -}
> > > -
> > > -return 0;
> > > -}
> > > -
> > >  /*
> > >   * hw_params callback
> > >   *
> > > @@ -640,9 +611,18 @@ static int snd_usb_pcm_prepare(struct
> > > snd_pcm_substream *substream)
> > >  goto unlock;
> > >  }
> > >
> > > -ret = configure_endpoints(chip, subs);
> > > +if (subs->sync_endpoint) {
> > > +ret = snd_usb_endpoint_prepare(chip, subs-
> > > > sync_endpoint);
> > >
> > > +if (ret < 0)
> > > +goto unlock;
> > > +}
> > > +
> > > +ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
> > >  if (ret < 0)
> > >  goto unlock;
> > > +else if (ret > 0)
> > > +snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> > > +ret = 0;
> > >
> > >  /* reset the pointer */
> > >  subs->buffer_bytes = frames_to_bytes(runtime, runtime-
> > > > buffer_size);


************* MEDIATEK Confidentiality Notice
 ********************
The information contained in this e-mail message (including any
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be
conveyed only to the designated recipient(s). Any use, dissemination,
distribution, printing, retaining or copying of this e-mail (including its
attachments) by unintended recipient(s) is strictly prohibited and may
be unlawful. If you are not an intended recipient of this e-mail, or believe

that you have received this e-mail in error, please notify the sender
immediately (by replying to this e-mail), delete any and all copies of
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
