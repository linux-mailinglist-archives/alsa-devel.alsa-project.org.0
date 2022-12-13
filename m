Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22664BA74
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 17:59:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788DE1833;
	Tue, 13 Dec 2022 17:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788DE1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670950742;
	bh=2rJj9OMxubZ4mfonGmGOkcsfKiwgHXD/t/rl9tqAmuM=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kGbwpFT9fF4YjZpjtV4t6JA4z9Yop1uwNd6O1MtBZiYk9RtQFBjzUXeM60Nfdj8zb
	 D3YoxM/oHlyH9sTAELeeae4UtkSMnDGW9hboqBGI6OMHYfW3DuL2Ft+pzSGd4iX3ov
	 eRUBDhsfRLF96uM8/0ImzlR1SYZxfunlLU5ONCwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4791EF8047D;
	Tue, 13 Dec 2022 17:58:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34D5F804ED; Tue, 13 Dec 2022 17:58:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DACAEF804D6
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 17:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACAEF804D6
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=QJu+O6vd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghT4bF2JP5ALaUHuEZGkdhXOiC7wQZh/YdQapW3YwhIaNE/I94cYTWxnRGnaTtTy1tX6xB5LgD5bpAnYCa5PgL+c0aDPz7o/7knLh+o3UXdbZglxtBfSJXI0abdqX0MgWs7+XlS78eBhq5joWq12+8GujuNs/jl+ZkT7Kubh/qJfxxHxpFROOt/eDbpktQn//M36+Tydp8/vZYoNZAfh6QghhoFqZYLY6Gd772iDKu2TW87e4DY91e3n/DwQbXtluPvzzrh5a+aiG2gVJyVpotObq+F9yPdVMkyYOG37o+tplZl2BWxG9eqUFrni3poskXQow48mY+ii3ro4QiFNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rJj9OMxubZ4mfonGmGOkcsfKiwgHXD/t/rl9tqAmuM=;
 b=fd5c94uao/fiyGZ4v2NHqtEghGi7vb0Uyv3/kmNNyUHIx6ZT5njPabmSuKzT3tTJ77rV7wIEm4wDA9IjLUi59xL+qS5L+S9yJ9kC43JIoarevvnpxbAOnpFBMSR43evtvtRRVHlBcHsMwVAvr/JlSX5DhGb6xxJNWCQrdvMCTuG2PDE/rBdQJnf0g91hW0+bfyWV+6CQcGQF82JOhgvOy9AR9TurBoTfgIJaCiyOlbKeBXEM/FTcDYrjw34gOxq4Xuo97C/GO5Eo4ty+aOuNkjnHgtq6KWxOdIc6ZDRhPeBzCO7hZ2jBQ1UgdSybRkY6Kr0nPCEoQ7Kvt9ghxziUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rJj9OMxubZ4mfonGmGOkcsfKiwgHXD/t/rl9tqAmuM=;
 b=QJu+O6vdXtnLnLz/oqEQT/aOGFeBBWDWv23Met0bCSW/SHa7oNfBynh61XG/0zjkDABQKNUhxlBNx5LFS88l3IfE8GeNsi5+NWRLQNauT6rCsJ0YX742l6oL58SIQ2yAjZDBqTAdCCVUsMa/gio22TvKErg4pX8+XKzDZbXbUFw=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BN0PR10MB5351.namprd10.prod.outlook.com (2603:10b6:408:127::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:57:55 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::8dd1:9a66:ecfa:e4fa]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::8dd1:9a66:ecfa:e4fa%3]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:57:55 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "peter.ujfalusi@linux.intel.com"
 <peter.ujfalusi@linux.intel.com>
Subject: Re: ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open() breaks
 SOF Audio in Lenovo laptops
Thread-Topic: ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open() breaks
 SOF Audio in Lenovo laptops
Thread-Index: AQHZCyNeTSaXxAkIDUeuV7auWjKGEa5lK8qAgAB2+QCAAA+mAIAACwIAgAACRICABlIfAA==
Date: Tue, 13 Dec 2022 16:57:55 +0000
Message-ID: <962b52d90af9bbb3bd2ff0a2a125037a80019a97.camel@infinera.com>
References: <f7a515a0d5429b41348341874b78f3c3254970e6.camel@infinera.com>
 <Y5IOEAw5pjAvGgiN@sirena.org.uk>
 <8fa316d5-b525-2207-9092-da14f1d77232@linux.intel.com>
 <ade9deca-2f15-a3a6-97c3-7198f1cf0da0@linux.intel.com>
 <a31e0bee-6972-0c0f-7579-449fb412a0b2@linux.intel.com>
 <b54b48cf-3680-9f0c-8ca9-db904e4a57ec@linux.intel.com>
 <Y5Nfyo7VARU0TKoB@sirena.org.uk>
 <bf558787-0ca5-f99b-5ae3-3b0a30de9344@opensource.cirrus.com>
In-Reply-To: <bf558787-0ca5-f99b-5ae3-3b0a30de9344@opensource.cirrus.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BN0PR10MB5351:EE_
x-ms-office365-filtering-correlation-id: 701ae47d-ae17-4eb2-2311-08dadd2b2e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3wXYZoiUry60EnILMTJY8hNNFkVQdp4gRJrkyG+wwqryKdjptJEqiLzFPmGW/5npFgpgFQZg7buHJNG/yXslS5X86Ql/ynar9qgzTCIuxCEQVKkiULxtSEbl37kJoabpRWZ5CwUOzFj2KkFNrc3a0tdxG+uQ3UAR/l2Mz4Y2hUTFQ0kT+dAtzl96G6ifa7gdfks0DpSJ9kMNBg8yD5VXgGgRRMHiJqv7KjOhdNrxHFAEDt1IgUdXWHO7MEc0CC/ZEocrcBNrPEtgEUCc+ctotzHJATww3vWEnZqa+5DHiqjqWucpW5mKJJZnuwojo//XnSUzHh6YtlRfixsPShskHHH8JgQDoq50U3jeE3acBU3QngzDCsRSFQ6sUOQXNZshYyaN3TZ6ZAlqtc9d5GzIwG65wJ1OS28sAEclD8EGPBL7++yH6OtfZZDhD8o8/Eg9GQhQym6KJntYqx7CmpOjLyJTKaj/4MmNIwYo+eSJuUommufctApvMVcI6fqJ5hSSnRvut8Ik1CbFTbY8N/Hea6jOS0RGlqQw3/fwExMMzkZJ1mM0WOIGZNb7GlAJSwLlk9CGV3+lsIkWwRNuQ0EQJEd4LhqA8D/r90nNUDIwTYF93ciDDUgmDUf91M3mJf0CDGvi3w6H+ds3xn/dV7svCDFAVYAozTFkc2XuC9zcONquIu2x1DP8FCee73Jfv/lBfdC+CVldM6NLcXzeZvyngA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(71200400001)(2906002)(316002)(478600001)(54906003)(6486002)(36756003)(110136005)(83380400001)(38100700002)(122000001)(6512007)(86362001)(186003)(38070700005)(6506007)(66574015)(53546011)(2616005)(91956017)(8936002)(41300700001)(4326008)(5660300002)(66556008)(64756008)(7416002)(76116006)(66946007)(66476007)(66446008)(8676002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFpTNE1YZE9sNDFuK1ZuQWkyOEJDQXdsMlRDRGdoNmtBRU54ZStRc3VoazVY?=
 =?utf-8?B?L2ZEKzB1aXVkUkpIc1d5SW9qUUg5RHBiWEw0QUdjd1QrQ0Q4RmV6NWpWTW5D?=
 =?utf-8?B?aUV6YVRuTHY3UzVadHNrOWU0eXd4ZCt3bWt3elU5d012MHBGWXNQVEJzaHVh?=
 =?utf-8?B?dktNblBGaUMycEtrN1Foc3hWek5PWTlXTTEzNUlVT2pPTTFZVk9mek10QzhJ?=
 =?utf-8?B?dUR2c2ZaL3NTNDZZRXlBcnJlbGU5UTNtY3ZGeGc2VnFpdmlaKzE5QVdHSEc0?=
 =?utf-8?B?V29PSXIzQVZvaEtLM24yRzBRQWgwdk9zR2s2WTJHOTJ2NDlGUGVOanFsNm1C?=
 =?utf-8?B?dGVYMmhHWHVPRGxNUklrd3BwUnJNQnhQTDN6Q0dTOGFhNENzSjhjMEM4SWYy?=
 =?utf-8?B?S3hNaHZFdVVZZUY1dDBIRjRac3gvdE91WUlraXRiUU1YQmtoM3cvNUpsVWRo?=
 =?utf-8?B?TU12TTJrRXBlcFVtR0VlOWtUdWtjYXozSmJGMHo3bGtPUzVrSSs3OGhCai9X?=
 =?utf-8?B?OE9yRUtneEE3dkh0VlZlSGdUYVpTeVJueGRuZE9Ya2N3akVhUXMzaERaM3NN?=
 =?utf-8?B?Z0lZWGJOOFN1cUdOMnVhc2N2OWJkQkVUZDd6ZEcySHdLbnBCYk1VU1U5bDds?=
 =?utf-8?B?U3AwUzZEVWkrcHAxVCs0Z1VUaU1HTUM1bnM5bE9aVkZmQVI1SFphUnBIVHo5?=
 =?utf-8?B?MzdVV2k1L2tqeGtTVVFqVVlqNk14WURXcFBuMGJROEVTNzg2SS8vY21YL3JV?=
 =?utf-8?B?ZXBIZE1TTGVHRkp0SlJMaUoyd0JKT0U1VVZHanpML1dCMFhoNGNPK0xxTVNO?=
 =?utf-8?B?bVF6c2JFM0xteU5IdC9NZ3JkVHlHN2NZdFlUOGRJb3hDRlZXUTE4bFc5VW5x?=
 =?utf-8?B?djZva3ErdDRpSVk1ZkpZL3ZiRTZNdGcvelpQMnFOLzlPNXVmcU1oTVNlQjc2?=
 =?utf-8?B?UUJoWkw0bGowRk8yUlNwVmUxanhEZ1A2dFRYUWtVSXlpVGREVnFkR3BYbTZT?=
 =?utf-8?B?NUkrUGdzcHB6Tm8rZjZMOWw0UU4zNHB0emFNWmMvQ2tUd1dJdlAzZ3BhZXVW?=
 =?utf-8?B?V3o1Z2xTRWhIcGZnbEhFdVlWMTRjYnNrZDRrd3BQTnFIQzFXOHAyOWxPaEE3?=
 =?utf-8?B?dThHdllOaW1XUlBoUGtQSEtsTGdMNHdncWNWWkM5LzJPSExGdzlRaTJvVHB0?=
 =?utf-8?B?UGsrMkVCcnlzbUhxcUloZjVlNDB3WFNkMjhiZ0M2N2kvR05pZmtsbXd1aHhL?=
 =?utf-8?B?KytYNVBDbmtJQ3djYkp2ckRpRjRhY29HYkkzeWo0MHpwSVVFdFdjbVFwaXRG?=
 =?utf-8?B?aCtBMG5OYXdJNERvb0tCQ0tYa3BCSHk5RGlsZnhpdWQ4ZHJsTWhKTXF6Q2lT?=
 =?utf-8?B?cFY4M2VmWVN6THNONjZsTnRidHhLMEtaTTlPaS9BemdUVUlidFVjUjJ1V2Zn?=
 =?utf-8?B?ZUpWeWdQR3cyekpvaTVlTXpCQVBFdnRtaUxRZURFNWl5MGQ4QjRUZWVCVjRW?=
 =?utf-8?B?Vko2aXFZeGJnUkxHcHMyM2tZbkgrZXVxcUMwL2ppdUJKRWRWV3E5THlpZUN5?=
 =?utf-8?B?V2RKTEhVZWovd2ozMFV6ek9oalN4NTBDWDFraGwxMUlENWIxNEphSVV4T1pp?=
 =?utf-8?B?UThSNmhhcENnQjRpbU1RUXBFWDRNTDk5bjVNUFB4N1poU0liSmxHTTJ3YW52?=
 =?utf-8?B?aktSbVVBKzVJdmNobWRkRHJOTklBb0tRZjFLUUF4MndDSm9LcURoTjBJOVQw?=
 =?utf-8?B?c1ROdC9WdDRmbC9wUmdCRUJyV0tDYTZIV3VVWEorV3hGOFpBK1lKUURMU25u?=
 =?utf-8?B?THhubjZrRENXb1FSNEFvMFcwR2RIWTl3UkJFbVZvbnJtMDIzc0ZBZm9UVHpU?=
 =?utf-8?B?UkxNdW4zSjRIaFlPbmV2OUQ0aEZOUm1sNUxGQUxUQm93V05NL1V4OTVkTThB?=
 =?utf-8?B?MmZqNmZCWm5kZFVLSk5JOXNaZCtGVHZjN0VDUlhST2pRZmo4S003aUdxNktw?=
 =?utf-8?B?bVNqNHp0SStwN1VodS92eEtzVE9rMWp5cWxaRUpHenROS3JxUStHUjhBc3JK?=
 =?utf-8?B?Y0pPKzdQVTl3bEZSKy84c3g5MlQxdVlHa29jZVFtc2pmT0xmYkdjbUROWUNj?=
 =?utf-8?B?dlFFTVZXczBJWWlucGhRODc3eUVLaUpEKzFGSzdwbkFWdmlRRmhzUitkdlZC?=
 =?utf-8?Q?xZQp3KsJgof9+bM3V1WxD7Vecia2WrsmquYGu1001am4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01414011C6285A448F1113F658468BB3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701ae47d-ae17-4eb2-2311-08dadd2b2e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 16:57:55.1479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zuw2nEvo/nLfquJiZ9AVV1/810vN2kRcbkbPuCmzdgTS26sCspSO91Z9u5+YGvVfQyQF7j4Z3QFA9MwRT/Ln2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5351
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "sashal@kernel.org" <sashal@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gRnJpLCAyMDIyLTEyLTA5IGF0IDE2OjI2ICswMDAwLCBSaWNoYXJkIEZpdHpnZXJhbGQgd3Jv
dGU6DQo+IE9uIDkvMTIvMjIgMTY6MTgsIE1hcmsgQnJvd24gd3JvdGU6DQo+ID4gT24gRnJpLCBE
ZWMgMDksIDIwMjIgYXQgMDU6Mzg6NTRQTSArMDIwMCwgUMOpdGVyIFVqZmFsdXNpIHdyb3RlOg0K
PiA+ID4gT24gMDkvMTIvMjAyMiAxNjo0MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+
ID4gDQo+ID4gPiA+IEFncmVlIHdpdGggdGhlIGFuYWx5c2lzLCBzbyB3aGF0IHdvdWxkIGJlIHRo
ZSBsZWFzdCBiYWQgcmVjb21tZW5kYXRpb24/DQo+ID4gPiA+IGEpIHJldmVydCB0aGUgImRvbid0
IHplcm8gVERNIG1hc2tzIiBwYXRjaA0KPiA+ID4gPiBiKSBiYWNrcG9ydCB0aGUgY2hhbmdlIHRv
IHVzZSBzZXRfc3RyZWFtKCk/DQo+ID4gDQo+ID4gPiBJIHdvdWxkIHZvdGUgZm9yIGIpIHVubGVz
cyBvdGhlciBwbGF0Zm9ybXMgcmVwb3J0IHJlZ3Jlc3Npb25zLg0KPiA+IA0KPiA+IEkgZG9uJ3Qg
cmVhbGx5IGNhcmUgZWl0aGVyIHdheSBnaXZlbiB0aGUgYmFja3BvcnQgcG9saWN5Lg0KPiANCj4g
TmVpdGhlciBkbyBJLg0KPiBJZiB5b3Ugd2FudCB0byBtaW5pbWl6ZSByaXNrLCByZXZlcnQgdGhl
IHBhdGNoIGluIG9sZGVyIGJhY2twb3J0cy4NCj4gDQo+IExlc3NvbnMgbGVhcm5lZDoNCj4gRG9u
J3QgaGlqYWNrIGEgZGF0YSBtZW1iZXIgdG8gcGFzcyBzb21ldGhpbmcgZGlmZmVyZW50IGZyb20g
d2hhdCBpdA0KPiBpcyBpbnRlbmRlZCB0byBob2xkLg0KPiBEb24ndCBkZXBlbmQgb24gYSBidWcu
DQo+IERvbid0IGFzc3VtZSBhbGwgY29kZSBpcyB1c2luZyBhIGRhdGEgbWVtYmVyIGZvciB3aGF0
IGlzIHN1cHBvc2VkIHRvIGJlDQo+IGluIHRoYXQgbWVtYmVyLg0KDQpEaWQgeW91IHJlYWNoIGEg
Y29uY2x1c2lvbiB3LnIudCB3aGF0IHRoZSBzaG91bGQgYmU/DQoNCiBKb2NrZQ0K
