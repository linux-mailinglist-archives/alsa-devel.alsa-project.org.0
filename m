Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95B2DCC5A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 07:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 381F0176C;
	Thu, 17 Dec 2020 07:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 381F0176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608185341;
	bh=OEk1c+hcvgGaDLUbK0J6rewxfFDMYptZkNRp9+OSmNc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnGqZ2SowdKla01aFfahmfzuGTragEEat09QhoiIBQMDjubFcxxjuXeCoGHoycKFt
	 M46XLDtGSRB/XPkFaUG7borLCmkr1eUbXyHy0FDGlry6nmEWAckSpciEjH5O5prk9k
	 UbgKbUo0IC3ledX171IafE9p7W5q75kFbXmRDzTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A46F800C7;
	Thu, 17 Dec 2020 07:07:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3935FF80260; Thu, 17 Dec 2020 07:07:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790CCF800C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 07:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790CCF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="a40GdwuL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdVrKL+b68JKSPJ5Mrp4Fknr1FLox4bOGE1rsUcC/exo9LcdXIA+53jtYoA8Qr4ehWOBa9ucmYHycm/uDhY9+a356Q1lvhxxa7A9BPPgnooEGo1CcsRDoSZVn0HmTiKBEStPMo437Afoes/fekCxNx1ASlNtCL8eU7I/HtLHtmOKdsfUQ1VmJNsm3lwrpAUCinNpkRRXC8sQzKEti6xBiPgIUyVF9LGEo2sUtUDPzs+AHqaUsfa/sX2b0xj5NmbykPQGk0FrsWV9FKS7j7QobZk/svIcumbUdtJ1SMNzpqARtmSxM83gFXOP687UkXETONrAuV5OpreEp+NPJuqthA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCc0WhGTr/i8opLoBXuwQ5ROnTDSNAyhHIiTb4bSqk4=;
 b=ihPECbkATmjUfRhHeUw+sDsOG4MYCF+ol954uSIp3z7tvh9IpZnkE3aLJqH0HfHu7WsDSnCo7S0gowvH6TIk+usJmao+RbHPWSGDcoz5FzuPv9JbH9Gjh8oy86mNdmhzOQkuB7XsjdhdLhnDJ+7D4S7CuCr0aSsM5nKDQk6lExH/ySwehCS6uuws8XjJUD1EQ7SR0FsWLkMCvhU/6xS5PBUvDmptYsH42Nj/NwhN1QYDkGK0vIqBywXfTA6FR5oDUlzCC7qbOX7YtZRht4J1IhQkrOLsH6joWLcQQbdkmbxCF7AiYSCDn9dm5giZ0NT/sFJfLidEHXy5kQV9otShHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCc0WhGTr/i8opLoBXuwQ5ROnTDSNAyhHIiTb4bSqk4=;
 b=a40GdwuLOOZCyo5oIgEc5V+ZvtLOtgbuPrHvWmE9IM3XBNsQFuqZv3h9UkW5fgmX7hFnGx+endaqI+rrDP+x2m2DN7u+cUycTQROuSPt2Xs+66suS2IhUtY5Tbah3hjWYrkRB4Gy1Hip8cOmV2LdeTat2IrVOSLo/kdorIMMRsg=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR12MB1456.namprd12.prod.outlook.com (2603:10b6:301:f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Thu, 17 Dec 2020 06:07:03 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 06:07:03 +0000
Subject: Re: [PATCH v2] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>,
 Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20201208171200.2737620-1-perex@perex.cz>
 <e1097123-6f22-8921-0415-248958c2a952@blennerhassett.gen.nz>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b3d7a830-c7c1-8819-fce6-1e1e094de4cd@amd.com>
Date: Thu, 17 Dec 2020 11:52:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e1097123-6f22-8921-0415-248958c2a952@blennerhassett.gen.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: BMXPR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::24) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 BMXPR01CA0038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 06:07:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5875ce23-5986-4207-52d5-08d8a251f963
X-MS-TrafficTypeDiagnostic: MWHPR12MB1456:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1456524CC12E31BE9E02CCFA97C40@MWHPR12MB1456.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DmGqCt1rGJpfk6sRdSD0VoXT4pPPzTxowIMkZALuxNf6YcIsx3JEH62qjgO2+QMhzbkFILQ2O+V9sCIwhrZA7lZ9N862LrprEx7tA84Y4mthJwcEzxcnaDebR2lkoWplzakJMyM+op05a0LPIT7gyTPN/7cDtu3gBU665TT1eIbuWWAZ6x4pYH/vrl8d1VN7sFRx6xsj21Nbmp/SK+YKBL8YzavWTnWSunjiSo+XZP76a5lgOZVzKo2NSXQTQg4sXKKoeSOchLBhk0ryylHzYMKOvZApc2+IGeb9CScJ37qgEpBeShGQjpfrYKh2tv1+N5nRwNtM5srcLk93NXLXt5jbueDDZZ0P0e8ErBCDmzua5g2HEhAh2e5SvS9rzMDISohrbrJtqQa8reOZtft/Op4RScYIIqclKx5iHvliy0cvN9A7i1JZWy69h3DutFDcWBIiePlJcZe87pwnhsHU/hdTi3wP8l9m5/IfqfImRfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(6666004)(5660300002)(36756003)(316002)(110136005)(16576012)(31696002)(8676002)(16526019)(26005)(186003)(86362001)(45080400002)(8936002)(53546011)(83380400001)(966005)(52116002)(2906002)(2616005)(4326008)(66476007)(66556008)(6486002)(478600001)(66946007)(31686004)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckxoaHkxV3NoUTI2ZHkvc3Y0c1YzQmpyU09VcTk4NHZwdlVSdEVhZG1yb2g4?=
 =?utf-8?B?bnB2Ykp0UVBtT0xua0dPZzUyYmd0TUtIUGRtRDZKSmcyS0R3UzNvcm9qamdQ?=
 =?utf-8?B?Y014b2h5YjRxakl0TktVN1dHTFJJTVhqeTVMUmtxR3hPWlVOU28xMU1PS2xV?=
 =?utf-8?B?ZmlXQ1BualUvMWhlNCtaUFZtWVJYcWw0R0kvM0U2UzJSRnBDbU93YStFaXdB?=
 =?utf-8?B?djVSUTRIQ3daa0NTeDZRZ2hsV0ZmVzFjRjBJcHJsM1lvclorMWd0UHBJMWhR?=
 =?utf-8?B?UEVHMzdtVlFPQVAxL1ZTeGdVM0tvS1NaYTJWdEFIa0pGYzQ0Y2V6d1JCdVl1?=
 =?utf-8?B?L0hTT2ZkWFdKcUNsWmpIVlY3TENMLy8vRUxkTU5KQXVILzR3RXgxUHNLN1pT?=
 =?utf-8?B?Y1ByU3NqY0c3Snpkd2JsSkZkZkxGMFZTSW44R3ZyNS9kdG1YMEdaOXV4TjAx?=
 =?utf-8?B?ZEVWT2NoMTEvY1RiMHloUDdBRGd6QTAwVUJxNnhRQUF6NXhQRFp6RGVhZXdl?=
 =?utf-8?B?Vi9iaWNTVlU5QVpFTEJlb3VHU1dsUVN1czNkVU1GQlp6ZnBnbXhOV0ExTThx?=
 =?utf-8?B?Rk5KWEYweWRuVDhmejZ2RWd1T1NMYVgzb2hyMS91ZUFqYlBudkFrSkVwY3Rn?=
 =?utf-8?B?UEpPYmJhK1ZWMkgxekVUT2tkQnZRNUNNdGRNVVczTEl3a3NjNzBWRFJWb01y?=
 =?utf-8?B?NUN2d1FxOG1jRHJNNmJtbTlwd2xkallvdTIvZlluYXR4V3IvS0UzRWhhcVNT?=
 =?utf-8?B?ZjZQbTh5b3FLdUk0UG1JUWlxMm9aOFJLbHY3OGw0alVqOUNkL1d5amtNVktm?=
 =?utf-8?B?czEwNDhvSmR4QzdUYkJETklUQkJJcUdLeUZyMkhpcEozZWgyRzZPVHhMZnhN?=
 =?utf-8?B?RU1CYStaRjBJUm1TNFZwRWFnd2dLVUhaN1lHWHpLdmZkOVNPUGpDV1dzbGpO?=
 =?utf-8?B?K1hmeWhrRVFQTEIzSzAxWWM3dVdnbW9jdndDRFlGY3BQSG1iQUQ2YmtIVStP?=
 =?utf-8?B?S21WZFNIKzBMNWxzSFBnRmdNWFFMbllzQUlNME5wM1lkM0Y5S0d4UzNaWGxJ?=
 =?utf-8?B?RFhLb0M5aHh6OWkwalFwdjMvU3RuZ212YTh5ZmJ3d2hrSUdjOG5VWEVEeHh2?=
 =?utf-8?B?QktaTVlFNHJ3M0FJcmY2cmVDa3lBRHR5REo1UXlPVFowdFJucXkwRE5Gbmsz?=
 =?utf-8?B?UDZtZ1BFdTk0aWZJaHUyUVJTTHg2eklqdmJudUVpYzIvMSsvRkZ6OGx2eU1I?=
 =?utf-8?B?SXdSeUlzKzRyZi95VWhJYjZaVTduSGRUNTV3SnFpWHd6UEd5NTJnb09RcTB4?=
 =?utf-8?Q?4F6dSMfZrO1Nojew/4GhZspZfGTidhgptb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 06:07:03.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5875ce23-5986-4207-52d5-08d8a251f963
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qSkaWxTEvjkHQgu4utyMQmFa6e92QbgTem/pPGxG1SvDxH+dF/V+R3JkJzE3NjSCAsx/UjqaKiuMelLn7FpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
Cc: Takashi Iwai <tiwai@suse.de>
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



On 15/12/20 8:55 am, Eliot Blennerhassett wrote:
> On 9/12/20 6:12 am, Jaroslav Kysela wrote:
>> Users reported that some Lenovo AMD platforms do not have ACP microphone,
>> but the BIOS advertises it via ACPI.
> 
> Can you briefly explain how to confirm that this specific problem
> exists, and what info you would need from me to add a new machine?

On Renoir APU based platforms, DMIC presence will be detected by _WOV 
method.
If DMIC is connected to APU, _WOV integer will set to 0x01.
This has to be updated correctly from ACPI tables.

On Few machines, It was found that BIOS is not advertising ACPI entries
correctly.
Jaroslav added additional DMI check for the platforms with Broken BIOS.

--
Vijendar
> 
> 
> I have a Lenovo E14 Gen 2 with AMD that claims to have DMIC but no
> evidence of it working.
> 
> My workaround so far has been blacklisting the related modules...
> blacklist snd-soc-dmic
> blacklist snd-acp3x-rn
> blacklist snd-acp3x-pdm-dma
> 
> alsa-info:
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Falsa-project.org%2Fdb%2F%3Ff%3D0c4d6f062e6065d47ee944f5953f0aaa328d4b44&amp;data=04%7C01%7CVijendar.Mukunda%40amd.com%7Ce2917dcc2e0846f7b3b908d8a0a915d8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637435995634448015%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=uqPjeXg6OWt0vXTTUa6R1tewu5QAGoHFkg18ov16mpU%3D&amp;reserved=0
> 
> --
> Eliot
> 
