Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F55F03FC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 07:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF331614;
	Fri, 30 Sep 2022 07:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF331614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664514075;
	bh=elD7JHKh8WRSL2NaTRqWWSBnyqXpWKzCOK4yiACS+bw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUMFBXrVITVIBFsgFgWPw6lJPQQ2cT3SEqntWCQIrEh2J01KxUoGXe8NyMy3qF9Nv
	 fVmR3MXxDlBTdG6NPVHf9F35hoZwNCZ8GQuDC5U+1IzFWRdS2G6yzO0++CumOzcJ2t
	 tPaxbI0Fd5fcr//CYSg13plsQIxUZmauvvp8Vgd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 766A8F801D5;
	Fri, 30 Sep 2022 07:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B1C5F80155; Fri, 30 Sep 2022 07:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3505FF80095
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 07:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3505FF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com
 header.b="JPUjTSEP"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28U4qBUE007534;
 Thu, 29 Sep 2022 22:00:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VwH51f/VdIvrpm9iKGbGkp+91hkW5uvZDNOK9W2CxZY=;
 b=JPUjTSEP7lbkeQxTjRBmq6WGHYstyRGTf5ikmR2qTNEA8A3ILnSEoNX+yhcOnodI7c7m
 njmW6O/cdCykN2nwkNALI4IBEcz6STV1dCZJnIb+1WvuEXlUtAGeiHZYF9VKalqYmXin
 2fFXl8e9WSNrUI7uWg9Zc74PAdLk9k2uu7E5ZDUIR9shgcBWDSLqZABhtQt0T0xk1Hbc
 ZF+f0R7MC18GkpV9GfK47rb1R+9JZrJm83vdZDijtKh9aPMSvLLz2aeuU2HfG6pV5HIi
 1CW4SSkbcVKYL+lncEKMkVhx8nSaBBaKnltXcnkNKdgDab0vWyWJcQtVuX4YAA3pok2H mA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkcy2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 22:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7612EGEXkSlRqdcmfGO3RwdYKXfSTMavRXkYUhziibMNW+enpjTveGZ19S1+iG3M6AUmHpG9JApqqqQnrojIoixdrEvnEVdzTZWC4wCbbdSzLsiDMCTrdBJpnQZgv1zjZQkcr3qC3uHs8iuat3iOp9YKIkcPk4bOuvMz4wv9XnJqp6TqXr/UiZBa5kuLRMjBTKcgp1Y+VzRoR9RiPqWnIPoOaqQxp/RkrjOp7p+uDRh5BgzH1n2WeMddulX+fFMazy+pOxLyhONyTsZUS+K8JzHrGOTLNe/Ta79y7iFT7bHy0I6Pas4F2B2USKoAAoiGOEMX4nyRVKeSx3a3IvT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwH51f/VdIvrpm9iKGbGkp+91hkW5uvZDNOK9W2CxZY=;
 b=nEsQft8aHBYzNqeOSXmGK0lFR2f7KAnQz3r0F5+13a2WPiocCEJrTdtoYcMA8gQxk2viPUvARcfFjWFhMqL2sWlr/hYdFILm4R7qdFwy2yDIyKYvAg6+VX7SeQog2tjRq6EiT89OWYB1zah1p9XDwj+wgzcK3jUD/C+aAvzAqNxV4L86kEOdynhnvmSBbNviTaqUQ+6qQ/k0CQ00ChMZPkCYHN99u6qSEBmKI9UVhUipvWF8GlP0tZaI3gbjERrOTnHs4GuWK4V+oGBT47BR2o1pa2llu9d9npWiTCF8cChudI5qOtDOTKjuuGO8E174tsNz5OxjegkDj5INu/C3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 05:00:03 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::25b1:ccb:b06c:ee86]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::25b1:ccb:b06c:ee86%4]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 05:00:03 +0000
Message-ID: <77903e11-e586-64ee-4c5e-f72cd67d924f@windriver.com>
Date: Fri, 30 Sep 2022 12:59:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: wm8962 0-001a: ASoC: error at soc_component_read_no_lock on
 wm8962.0-001a: -16
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <MW5PR11MB57644C9D9797BB1F5B30B70795549@MW5PR11MB5764.namprd11.prod.outlook.com>
 <20220929092403.GU92394@ediswmail.ad.cirrus.com>
From: "Wang, Xiaolei" <xiaolei.wang@windriver.com>
In-Reply-To: <20220929092403.GU92394@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1df598-2bd1-4cd4-e4fe-08daa2a0a289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: issNJaItCd0qk7frMFUHXJ9/YrxJ7tNUfoA8HhOOJBt15ZErGnx9gT7HEWHWqspSi2vaqoNspazP228RVRN/VlYa9f51VyAaF11AQolYqK8rzzATkYQsNzqO0VCP0kr6kh4XMSzatqwHDOGRrErnTA3Vqj6oSIS/k1CeiaXJHemH5iXBA9qB+0WeJBveph+DKs/mBL1jDgzBuVl1MBnlIV1vdEEtJuskwDOV9IQWPXKd+Quv53aDapABo9QbNCfVmXEmBasY89E78iZ5sEz49SD5BpQD+djWy5Z7l7zhpDdJNlJCGk4IdKPEvH6Zk7xOD96FUggwMhiCtQzuPJ9OUDgpiH4gHV3AZjNRM7mSUODcAAo3tJhZxr6fEBr1CmxzGYVu1LJChqMEKnVRA7ykrhMrZYoQBGyUkCjnrqcKUK9atEegTbdAJeML0x+YAQbla0JHyb0Iu+iSdcYqJQ5ZS5Z0MPV2X7NKgCAfNfPOPoUEAvnLLhZ3PZ9A9I4tlBsHiFRjeGZoPaXM8rVKfsonYfPQqhpJU7We23vawUx+q5xJhD69LCNX48Fe7DXbE4WezIAuSk5QNj6e+asOqIj7zDzeHAPvJ11iHuIzxzu3JclvTj2aJYzdjPUkfYRpMOzNpq33kCZVBp+b9swBMYB0oTlMTqvjxKPKC1/9tW6wKtvb6RG5JB/aWUsmqs2qRSm7BE2KjgabIXoMrEATJ0Mj8qrLK5RrSsTLWaxY+aGUL5FZsiyAFYaZcQILpNlfCOYStFNAqWY6fTDuJAkhzUvk01YgY53KmE7Ok2i2NxoMhzBfl92/F8zIVkr7GkBwcCML
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(451199015)(53546011)(6486002)(6666004)(2906002)(4326008)(6506007)(36756003)(316002)(478600001)(54906003)(38100700002)(38350700002)(52116002)(8676002)(66946007)(66556008)(86362001)(31696002)(41300700001)(8936002)(6916009)(7416002)(5660300002)(83380400001)(31686004)(2616005)(186003)(6512007)(26005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?endIK09rL3N1ajM1S3BaV2p1Q0dzaXQ1Z2NyVDg2RThYRSt4T0VMMnhPYlA2?=
 =?utf-8?B?RDBaWDNmWHViRHJjdENlbS8wMlpvZTJSdG9ZUWV4MXcwbUVpUjlmc2FNRDg1?=
 =?utf-8?B?M0tKR1BCd3NjOFI3aXdmcUFlc3ZlTG1MaExJeURDVUZsTzVORWY3OU81dStX?=
 =?utf-8?B?ZFFBUW5taytBS1ZTSFpIbVozNWdlTkFUV2k5aXViQ3R2aUlVQ0tqTFFDdEVm?=
 =?utf-8?B?M1NOei9ORyswZVlyTUp5aVpHVzJKaGlhdzhMUXFHUTBYNThSeTJYMk5GS1VQ?=
 =?utf-8?B?andsem9UU0V3c0o2T2MwSlRxcTV0UFhNNDJFYVd1OEthU3Q3dEVhcWxScktl?=
 =?utf-8?B?L1hwd2J1R3lrZ3FQMm93RTlJSUVIcTExQjI0OFhDWS93TzBRaVNYTTJQWUFa?=
 =?utf-8?B?dXdZdEZ6YzRldXlIbnRLSDhuU0FhK1JZWXJMOXE1MTcrbmtBVnNjSzY5Y080?=
 =?utf-8?B?TDhSWWQwcnVkWlZWTnpybjVBa25NZnZ4M0Y3Mkg5d2ZiamhBVHByN21Hb0t6?=
 =?utf-8?B?Vlg4d3JKVjJwclh1cEFtVk1kSG1oQkhZMlU2cnFnbEkweTZ5NDNkb0p6aEdP?=
 =?utf-8?B?R2RPSUdpLzJTN2VxWmQ5NjZMSTkzRUxPdGV4QlBZZ29BQkR2TXZaczA0UCtT?=
 =?utf-8?B?YmJkTHBObmhEbmF5TlkyeHkxc1BiSFZ4TDJtUzhFV3BLMG1PWHpJM3ZocDVs?=
 =?utf-8?B?Mlh4Z3Q5cHFMUVN3UUpZZk1JNkhlWjhyMWQ4UFNvTXE0MzNwYktROW5OS0oy?=
 =?utf-8?B?cEJTT0V0L2ZsUE5RaTA4NUVKbzd3c0Z5K2JRWHRqY0dzOVJtMlFLNkVFTGJF?=
 =?utf-8?B?RkFGdlYycHUweUZJbWgrNXhIVXJMYUNUSHhlWEpWVWJKT01lQ1dubExWbHc3?=
 =?utf-8?B?RjZsSE13OVltd21qdURFclRyZVVNZUlGdlk1ZjJVNlozdWZLOHhVZjhwRDJi?=
 =?utf-8?B?VVdhOWNpeEZMekRycStiTVpxMVJ0L3luS3NtREtoSHpQUXBOdnBMb3pVTHFZ?=
 =?utf-8?B?bzRCTjNRdjRJNDVqdy83QkxnN2pFVzRxekM2a09IL1pQWC92VmVxZk9jcHg5?=
 =?utf-8?B?L2NFSUZ6cWdhUDcxZkFxVUxDMFQvRjExeENaYnVlVzZqbldIOUhLZEJTcjlP?=
 =?utf-8?B?R3NkZ1pvRDlyTEpKUzNBUjRtQmg2c1R1MUN1S090NjdrOWN1U01YbEVUMjRq?=
 =?utf-8?B?N3FtTEFrcTFhYmV6emx3YVl4MXlhRG9xRDRPSkhIaHJCbytkVy9iMjAya1No?=
 =?utf-8?B?MGM0QmlkTUJ1bFYzMXluMUpMK2Y2ckJSUHpXRWFzOEQxb0FDWGJ1Y3pIQ1M1?=
 =?utf-8?B?Zk5wM2Y2REJHd0NvODRpQUxvSjRkTkpKbTgvR3JMQ1VSdHh4UWNuT0hoak1J?=
 =?utf-8?B?a3E5Vi9mRjRxQnhOd1NrRTdDTkVJTC9nVUhTOG9GMHd4aTNJWFE5TWl3QWZP?=
 =?utf-8?B?MjUxWDFFTEZQbjZRM1R5bURERlhScXVBUFZRcWx5UEQ2UjB5bTZoT29xbFNB?=
 =?utf-8?B?SWViZ1VMNE5NYkpoUzVoYjNOb1QrR3orZ3VySC9uSHhLeWxGV0lVNlQ4enVN?=
 =?utf-8?B?QVJwaXp4UHJJd2RpL0hqQ1dQSVRTRGp1MGNTdHRkNEJEcGtjTEZZS2pCL041?=
 =?utf-8?B?RWFGUWZHNXlqaktYRGgvOUpDV0hVN3RGR1F3S3U2bElPbmFjTlRsTDlOSVJu?=
 =?utf-8?B?N3d1TFlCQXdUODFPRmZOc3luUVNRc3kzOURzZ1BZTTVZNE03SG5yY3I1eVM2?=
 =?utf-8?B?U1hpRkE0dWlPNCtVMm1oSXUranh2WG1JYXgvVWIzKzdGNnN5bW9JcGZabXpt?=
 =?utf-8?B?QmdKMWZseldITk5wbkJlVm9XZlJDSGxDSjRqUUdCeFN2MStCRFl5dHZ2bCtR?=
 =?utf-8?B?TG5iVzJlZzAyZ0hwMXBoNkdEejhaeWpMUlo2RU84N0lmUEcxNFV1VGlNdmZv?=
 =?utf-8?B?MFl1djNzNXFMTGpHMVc2SlhrUkE1dHpyL05GMXFUV1pncHlhcXFrMEFoR2M4?=
 =?utf-8?B?alIyMUQrOHFxMW9LaGFISzZORE85TjkvUnN1OUVHSnZ1dU5EakROUXFVb3J0?=
 =?utf-8?B?cmpYMlNWK3dCZGdqSHUzT3F4SGIzbkhDcysrclZWWkVVWExEOEFFYmN3KzJj?=
 =?utf-8?B?WFZKZlRrbWI0RzZWVVllWmkrMi9QSm45NUZNUW43dVhRWXg2cWp1SHB2OWU2?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1df598-2bd1-4cd4-e4fe-08daa2a0a289
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 05:00:03.4572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+YqQwrmhiVF6e+EVE3sg695Q6HWPc8nw71JqQc/9k2qmm+OL2qt52/kaUM3R1VGIKraR4HPsNdeEG2M8P9K6ia3qGkZSXUJQ8RMgthYNfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
X-Proofpoint-GUID: XT7J7dsyhC0fFnH2zcFoxAvfZ5UQTprW
X-Proofpoint-ORIG-GUID: XT7J7dsyhC0fFnH2zcFoxAvfZ5UQTprW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_03,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=632 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300028
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "steve@sk2.org" <steve@sk2.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "chi.minghao@zte.com.cn" <chi.minghao@zte.com.cn>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>
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


On 9/29/2022 5:24 PM, Charles Keepax wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, Sep 28, 2022 at 02:44:30AM +0000, Wang, Xiaolei wrote:
>> Hi Jaroslav
>>
>> When I tested the audio, I found that some registers in the
>> codec of wm8962.c will fail to read in the mainline kernel. I
>> found that wm8962_i2c_probe will enter runtime suspend after
>> startup, but in the following program:
>>
>> snd_soc_bind_card
>>       snd_soc_dapm_new_widgets
>>           soc_dapm_read
>>               snd_soc_component_read(dapm->component, reg);
>>
>> There is no runtime resume, which cannot perform normal
>> reading and writing for volatile reg, because it has been
>> switched to regcache only in the process of runtime suspend. I
>> can't find the right place to resume, can you give me any
>> advice?
>>
> I think the first step would be could you clarify which register
> is being read here? Reading a volatile register as part of
> setting up the widgets does feel rather problematic.

Yes, this is reading the 0x30 register of the wm8962, it can adjust 
Microphone Bias Voltage.

thanks

xiaolei

>
> Thanks,
> Charles
