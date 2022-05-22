Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606F533EDD
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BFE16C7;
	Wed, 25 May 2022 16:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BFE16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487873;
	bh=y+9D31BFu4yBqM+nAQCZh4xpXyKLRGswJDB5/Akc7Wg=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h25VnQ7cBQkY0y3J9oeZmNfLFE7rS5pTpRSjcF9nm1h2brzymKzqQ/zAr7IBTChLy
	 7FHATyloPHkkAQg4nEapiiIdlYi2iYeF3LZzkJ+4hn27sx53jpUbBOxJaUZ38idPQd
	 aBg9PZACdQ73d7AbAo6IynJklYjTlc51McJkbHGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45531F8052E;
	Wed, 25 May 2022 16:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24978F80238; Sun, 22 May 2022 21:41:14 +0200 (CEST)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C152CF800CB
 for <alsa-devel@alsa-project.org>; Sun, 22 May 2022 21:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C152CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=WallaWallaUniversity.onmicrosoft.com
 header.i=@WallaWallaUniversity.onmicrosoft.com header.b="Wd+cw40q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQt+7iuNt3MyC3dQJ+hDFo37oyojqbOAHb8K9xUQD3tpaolboi6drfWvEmkLo+tiUBlOYJ5eiRd8AYz++x9LcjyvnxRTUDJ5YjMzTC1zkmDuNQQEXkA0UEqOrrV48fDWkBBGB+4I/thH8pW232Ii9jdOT2iZ2YI7YSI2ggSP1CRNqwBXJ7e6JTALB+aGyJaZ+yB88QZtCgbbCSug4fmj3KWmzkRmnyb34pOf21zETmKWtj1N6KAmDjEw0oHVhzt3lONKD9o3RXD6zVUrYqfNIdT+2kt5xTVy9WVkS71/BF/U3KbJ1AIgInJDlJgCKlehXLQCWdGA3QyFJ9UWM/i49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/AqhIp3aeMFItr049ub09V3Qy03VAW0H0DpN5yg86c=;
 b=SZJI3jQMRd5pDHSODBGfT7A8wOnNBXTogCmn3vUMF/uHQjknZV2hkyL0/yvVQQxie5YLckqbmjzAfwYEWIKLvOBsxqL/u5qASIgastNAdliVAN7jgtqsa3qvd+kLcjQT9jj4OBz/v5KSw/XqgflRaYuTUID452Pl1f1n2wN8BNZblym9m5Iu3f65vnXYe0JQDm4WmTbr8P59KHgYIPsYHvQFjRLSKGL7bYvNgTdcCqYoyshncuzZvafN7yO3WKLpEUU0KYWvzxqB5+gY7iQsj5/aJeVo94PCo63WKOu9cR0tqZ+aQq0jwrXmxtnmg+DZoquKm5o1D1N7ufk7cjwnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wallawalla.edu; dmarc=pass action=none
 header.from=wallawalla.edu; dkim=pass header.d=wallawalla.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=WallaWallaUniversity.onmicrosoft.com;
 s=selector2-WallaWallaUniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/AqhIp3aeMFItr049ub09V3Qy03VAW0H0DpN5yg86c=;
 b=Wd+cw40q1ih93OsuBnNihjlndUMxuyYSDR0riw4ysCVpzYdh3nmKtvyilPKlLbih50JjyMm5B1ufPQGmGF0RJdpuF7gkgvtpnY8uH6HK+RiQ12ozHBE51cHgqZ2joOvNBDP1aDFpPt26Z/cDfU9ry8tP1lRVwmq2vAkmY8mMoV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wallawalla.edu;
Received: from MW4PR07MB8681.namprd07.prod.outlook.com (2603:10b6:303:106::13)
 by BL3PR07MB8819.namprd07.prod.outlook.com (2603:10b6:208:352::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Sun, 22 May
 2022 19:41:01 +0000
Received: from MW4PR07MB8681.namprd07.prod.outlook.com
 ([fe80::583e:91d7:6aee:6485]) by MW4PR07MB8681.namprd07.prod.outlook.com
 ([fe80::583e:91d7:6aee:6485%9]) with mapi id 15.20.5273.022; Sun, 22 May 2022
 19:41:01 +0000
Message-ID: <3e93e8e6-2bfe-6695-cbf9-e8f1ebbdac6d@wallawalla.edu>
Date: Sun, 22 May 2022 12:40:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Rob Frohne <rob.frohne@wallawalla.edu>
Subject: Is it possible to set the CM6533 so it has 96 kHz sample rate on
 capture and 48 kHz for playback using ALSA?
Organization: Walla Walla University
X-ClientProxiedBy: MWHPR01CA0033.prod.exchangelabs.com (2603:10b6:300:101::19)
 To MW4PR07MB8681.namprd07.prod.outlook.com
 (2603:10b6:303:106::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0142fdc-711c-4c82-1576-08da3c2affc2
X-MS-TrafficTypeDiagnostic: BL3PR07MB8819:EE_
X-Microsoft-Antispam-PRVS: <BL3PR07MB8819B889E4378A06CB045EC9E9D59@BL3PR07MB8819.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC5iFywSryjiMyN+n273cRv5fM0ylL24J79XUqiEJRyuTq5+mgsvlzkt90CESnczhuh1Lv62CHLteoPx/czKnfR3qcVwRFWRHA6aDNsxYgTbX28l2o88EyaOOuUEXWxG7C5gfIoc/2R2oCmYgH+vAoqYoNdquGyEpWcsnWj6HzC9u3eQtWxjbVJliRYzaATspAwVvgy7oUjvF2sfn4sgOEfxd/vLP8I3pIGvCyjaF+0+qlv4ueBJH9u+fFpi72V/pZ6swmQ7PIfILYcKMjym3k1dNUPjrGMNrNAtNXpv13J/DxpR4R+1U9yFYg70wDVA6RUGDtONKxRQ0iEMZXcReVS7czK2FU2VZVyKVCsC3GpZ873AAITpdqJ7f42P4M+T1ceLhcUsfj1DWF1yxvKmCXB2f9yiifyrp8kPP3W6psAvQe2/+33/h58FMBU1gF4cd8wkMvdrbyLsdiXUi6tQmTSMZFNgNXDhQodx0nliOHpL5hvBHK5OyKlBq0+c3lNKzx2+w3iWdIx5UWptemxnFU+INhKvtjsbcNWh0n1Nwl4A6Uiv+YbLTTxEMbE72e6PQpCvYtJ9qscxxpwLUyIeqGQMUJlAw8JPFbUTm95Bm5IUs6diQi6NCAEqB+sbxon1C3RxVADXkKl64A145+kY9AfWE9YPZrDiMiHtxtxpLIDUZE+uDJ6+3fhuXOOeGidN2Xu2qEzEL1pz+IgDSrZXXVSlZ4QILXgWTtXZ3TKSKE5kAJScJr/R31LyD5qHMBDVE1bUpjKvY9HlL1zw7bnqvOv6LThIkM01dew/qJajFPdligeCNT0uh2qDLyKfmbGu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR07MB8681.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(36916002)(6506007)(6666004)(6916009)(186003)(508600001)(6486002)(2616005)(21480400003)(316002)(786003)(40140700001)(31686004)(36756003)(83380400001)(38350700002)(26005)(86362001)(31696002)(38100700002)(28085005)(5660300002)(8676002)(66946007)(66476007)(44832011)(21615005)(66556008)(75432002)(166002)(33964004)(6512007)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFVbUhZeGcxc3RleG1XampCNi81S3BNZ0ZnNXBvV0R6N21NMUZURWwrY2k5?=
 =?utf-8?B?bndKUWhTeUJjMWFWSXZ2NjVxbDdjKzIzNFRmV2FVVzBBaXFYYzhVeGYwNEhr?=
 =?utf-8?B?MUpnY3FZbno2eWt2Z0Fobkp2dFVjbk9TTGluYlduVEp4WlpiQXBHQWtMdm9o?=
 =?utf-8?B?QzM5aGZkRGJ4VXM4cGt1Y25QN2E1cXRzY0VFRHpERlJhWUYwLysxc2ZCMTJw?=
 =?utf-8?B?Y0JQTU8wYkR4V01xeU9XaGtUaE5ZNUltbTVDL3pESzVmQkpiaURjT1RZMlc0?=
 =?utf-8?B?N1hvdDRzYTZpWTFYQ3o4eEowTGZlV3FxWjJhOG5ISGVyYXFHVlFTTElMNDNN?=
 =?utf-8?B?RUplL0lnTU5Gd0F6ZGpPVU05SzdVeXhUcGdtT05BK1BGV2ozNDR6eFoxcnBJ?=
 =?utf-8?B?bDE2L3N0YlNOdm12OURaRVBpVlNiRzBlZVZoSS9sbDFHWFZvVVRucWRaRThj?=
 =?utf-8?B?YkRvM0lwOG5pdnA4SEd6ajNKL3lrbkhJRzNvREZ2a0ovbnJqT1lpM3ZsZ28v?=
 =?utf-8?B?YThpVTNxNHY1YklaazUvdWNleW9jNmhOUGVmMU1TS3VTeVMxRVJmZWxRanoz?=
 =?utf-8?B?ZHloVFhpRlpXcmxyWXRCeHRsS3g2ZWhtUm9jVmpING1qbTFuSHBZbFdpS1Ft?=
 =?utf-8?B?eG1ZNjRuaURWK3g3UjJ0MDlmckVVZ0gxZDluTEozMERJNCtmTXhBMjNtcnFl?=
 =?utf-8?B?ZXVCaHpFdDZRZmtESG1TSGJhTkVOVERXbEY4TWN3Z2VxSnh0bGtKQTljc2cy?=
 =?utf-8?B?eDFWeXNQRFRTaW1EVmxuRjBjRzlmWEdDb1lCdm92VERQbklYWko2TmNodUlH?=
 =?utf-8?B?a3BJY0lGZTR3ZUVMRmYzdVJQem9xNEZNc2ZhdUQwTnIrWC84blgrQ0dNcXRZ?=
 =?utf-8?B?QkROWkJlS0N2NVl2YnEzT1M4QjY2ZDliVTRWRTVJeUgvUzJlM284cEVyK1BS?=
 =?utf-8?B?N2d1NllKUmdNT2tvbzFyTFBHWW54OVpkdEtmMmpjcldwRnEybUJTdmd5dlAy?=
 =?utf-8?B?M1ByTnJIWWs2Vit1RGQ3R09JRkFBd0NmdHpDREcybzNmdG85eDV3UzhPMUhs?=
 =?utf-8?B?NmZsbmRZaUdEY3dUMmJmdmhHK1dWMUxzMmJROW1WZ3poZDMzRXJIWGg2cnNG?=
 =?utf-8?B?d3RCWHhLbDd0azZMOWxRRXUyaUl5cXJ4bmxIYjNXVU9QQmc2bytheWRxdjQ5?=
 =?utf-8?B?VlRtZlBJVFBueUsrWjFKbzIzNmQ0ZEw2L0djMFBaZk1tQ0M0NzVxUHhnVUJE?=
 =?utf-8?B?LzJMa0thYXM1ZXhXc0VHVUYzN0ZiL0d5bWZYdkFud1RRWFFLN2NJWk50aWFW?=
 =?utf-8?B?dGJ5ZUdFTTJVb1h6VnJaSGJHeFV0ZnpBRzNOM25SdFlmd1JoVWJadWMwT2U3?=
 =?utf-8?B?QTZ5OTdWNW9MTlpDWmlGSlU3TXA3UHN4VUlBdUh5Rlp3MzROejBMZURiSHRC?=
 =?utf-8?B?cnpKT1lTUXZiMk9xVmJyUjQ1b1dkdTRNdEFLaXFBbzRkMFBVc08rbm4xK01s?=
 =?utf-8?B?cCtkZVB4WEJyTTcwQlNNL055ZEtBeWFnRW9reVIyOHFuSUx6RkIyTFBvRW5Z?=
 =?utf-8?B?RGJIMUZkc09lL2Qxb0FlNjhCSjdQU3IvY0dVVGViVXhyYUhRaDRtcjJjZ2Vn?=
 =?utf-8?B?dy9XTTNlN1RGcTh5THNDdm5mMUQ2NlpjUTd1Wi9KZ1gwVTVnamtybkUyV1Fn?=
 =?utf-8?B?MWJ6Z3ZmQWV0TzN1ZGUxa21QN2ZFNmZLQi9GaXhEbEJ5SWcva1BnNzRWb3hp?=
 =?utf-8?B?L2J4cmlyRmVvRGVib3lzcThUMUtiMmo3RXRJVEhkNy8xN29FcVV6aDR1cWJQ?=
 =?utf-8?B?dnRSazVMdUNNWG1uT1pIM3VBMy9kMzNnT3VQaUNucjl3cTM5QzIzOXpOQ1pW?=
 =?utf-8?B?enRIbS9aVVVFOUIwa1AyT3ZHVmNOK0V2VFZsM2k1TFA5ditmanFXV2dQWVp0?=
 =?utf-8?B?S1ExYnRMY0t0WVg5YVYyWUZvK2lWenVLelpSRzhxdE9USC9pOVJ3a0VZOHBU?=
 =?utf-8?B?MzkrZjBHMUd6M04wTzBiTWkyWFowMkpTbDArSEo1dlIzNHlOT0tYU0tXeVVt?=
 =?utf-8?B?RFZNcWt2WEpoMGZCVnhlR0dBcFNjbE14blB2ZUVGYU1Ec2dQTUpwUVcrVGZO?=
 =?utf-8?B?ZGF4UGRBSUtLVjI0SSsydlp1UlcyRTF5NTEvWXBFdzJuVUIzdDBvRFArVmNT?=
 =?utf-8?B?bDBlMVJTVDJXa1RYR05uVkQ1WVh0SzZVdE9Nckd2UnkzUzBVeHdENFdQeXlZ?=
 =?utf-8?B?QWk2bjF6TURncWdaVjNvZm5lT3BHc29oTkxRYWhpOTBaaHVvNStEN3VxV0lZ?=
 =?utf-8?B?VkNDYlFwTVdxTEh5OElLTzVFWC90VlBHM0VsTENyQmVuQWs0TStWdHpySkJK?=
 =?utf-8?Q?BEcWC1wjPRdwpTUI=3D?=
X-OriginatorOrg: wallawalla.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c0142fdc-711c-4c82-1576-08da3c2affc2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR07MB8681.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 19:41:00.9486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d958f048-e431-4277-9c8d-ebfb75e7aa64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy9nBnjYYkClS1yokZV7YoOKEsk1E4TNbuKxkCWgPU+45Zii4qSdOq3gvyeebCBGSXs13Qb2NCZM+HtxmA/t8LjIK+eHKV/+EyGYEwce2Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR07MB8819
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi All,

I found this thread 
<https://www.alsa-project.org/pipermail/alsa-devel/2017-November/127289.html> 
on the list that explains why I cannot get 96 kHz sampling with the 
C-media CM6533.  Reading the datasheet 
<cid:part1.SZL6HGoZ.u1f9OjPs@wallawalla.edu> it is tempting to think the 
mode I need for my class QSD SDR receiver project, (96 kHz sample rate 
on capture and 48 kHz for playback could be selected perhaps by ALSA in 
the HID interface). Is this possible to do with ALSA somehow?

The sound cards I purchased for my class on Amazon from Syba, used to 
use Via VT1620a codecs, but now have been redesigned to use the C-media 
CM6533, and these have the limitation that will not allow 96 kHz 
sampling on both capture and playback.  I need to change the present 
setting (96 kHz playback, 48 kHz capture) to the opposite.  Page 7 of 
the datasheet has a note about this.

Thanks,

Rob

-- 
Rob Frohne, PhD, PE
Professor
EF Cross School of Engineering
Walla Walla University
100 SW 4th Street
College Place, WA 99324
(509) 527-2075
