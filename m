Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7042970F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 20:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C1D16C0;
	Mon, 11 Oct 2021 20:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C1D16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633977919;
	bh=eSfAZ5mo/dCi4uFf6tWvCpR55UV6ZvcVHWBBtT2tmVU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFlRSW/S6LzGNipf/HSK5l+rbV+QWVOps08MUS0PvaHJ4Jsfpg8IW8W83mwJO2l+a
	 CsvAimZ5RagaRog9cE4ljPWY2T/nPNzYJ58qR/c8UbQ3hPQYoZDgtdKZnKWRPRW6Z4
	 7NFis9aVWSzM06NQkzPoiKWL4oFWH13H61fgTSUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F03FF80104;
	Mon, 11 Oct 2021 20:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 367AFF80269; Mon, 11 Oct 2021 20:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5B86F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 20:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B86F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="l0hxNkP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhEmpfjS/hJ955U50UD5Z2+yKwErR7F0QM/wtNRTdY6B6t5/vh553hbPR/tynUUsAo6pYlWWNBob7LYpv3uZzKGreUOFGac6s++2FrioVUcNRT5ZEplSymb23onEsWTly+K4HcS6I3NSxCAtTmUNF5f6appBNEdRLwpB5NCq5+Dc0bhENGsnSAssQbVtY1zmLjCaTtOzKE7UJ6bsPQTroIa6PRUB+iN7LSQ3fT0eKegwZaJ2xVkzQv7a7bqfAM9fDdJyjwEyROLq7h/yRyTQk9MJJJSwY5X0TbonA50M3JsU8+v10mG4YSs1//1WSZIKGFiuHRg9j2aw0Lox8EITkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gVqNzQn8DBvWudXNP7UGO+U1ap/sk89DG267MVy9p0=;
 b=C0pvWhDsmpiX8b9tKjjhjQlBvGMeQt1mqHJBSLd8GpqgAMSKk/mQBC+Lj3xtqBHGnLO9zps1NjfXLOukVgc1CGhrnvin5YhplMDPwUGaZhD2HrDf90f17dz2Dyde1dpJjdM45Qmbr1OL9YOAh4P/CWMty+4CiEHaDuHXF3n0YlPW7muTh90P35rh8BA5MYAOyCSJmomy5yIbhNGqrTQ96wU711Y2qV/7xupN5vxiAfOFQzlL2tvPfjLycoV8yDBCyr7GvcrEGVYrYFc/6xebO1Pj4E5KeI/M1Wfk9Mdh8W+n3NT0VMcSlGR19jE8rSxYYqmqVx4sCjRnoJRAY3hckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gVqNzQn8DBvWudXNP7UGO+U1ap/sk89DG267MVy9p0=;
 b=l0hxNkP5CzLr+hD0nceGRPG44EjQC9/LhGdQWIldIzf7xiFzrEt6t8SX5PCvR+do+JgEsf2mEvmqNU3NqR9wh3VOD4Mz7jLiEHq1ll+r0l+Rt+/Ke+CNuR4p5uUTfhlddQ3HwJFYGXGJXEzgvubK9VighIvP6JO+SKCdd1eVZ7I=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB2684.namprd12.prod.outlook.com (2603:10b6:5:4a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 18:43:48 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3%9]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 18:43:48 +0000
Subject: Re: [PATCH 1/3] ASoc: amd: create platform device for VG machine
 driver
To: Mark Brown <broonie@kernel.org>
References: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
 <YWR5QH1lYqiT1cX+@sirena.org.uk>
 <57f313fe-fb8e-8b4b-8839-d9d8653880d1@amd.com>
 <YWSCg2Nzi8lRDiIE@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <4ded51b9-efcf-8acb-f399-e169a34badba@amd.com>
Date: Mon, 11 Oct 2021 12:13:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YWSCg2Nzi8lRDiIE@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::34) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 PN1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 18:43:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 180e15e8-2b57-4aee-738e-08d98ce71026
X-MS-TrafficTypeDiagnostic: DM6PR12MB2684:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB26849640EED7CAB272DFF95797B59@DM6PR12MB2684.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuUWzexIWp6LaPippqsL0rOk1p6A2sz2cHz08agOcj8OHBc0x1ybY/fMDnLxR4Lylx0Zriqyx0D+ZCZIdy6UO+N2aruVBhZm6tXKrRjPC6H/C/22hler0/KfSumdOMzjbw11RQkK4v4vjWPIJKK+NWfxr0MHzpJvd6Kwmd1WUEnl3/BleJ63OFRfFwPvhTaLIB4J9n/2Jwa0b7CiA5FX7BZn/b8gP0C5CnGn5EMVbnl6diyIa7LVp7XyCUu3ct/2+iTnd7sxb0etJv0bnVgdiWnosr5zEK91DPF4DH5AZHD5ulQVo5mCAqJQrJV1g9ojIwSTKBVw/txi76NNQkhSqC+nbwmk6t7+f0IycmamDiTfWA/2bsIsVZDx2/JUqKRxOzdvaVSsmix39metkRjLpbcxA5Uuy1BUWv3NDa6uFqfanNNbbNmosUKqzyLlIN28m5k+eTLeIUyt8f1xTy4GMmxhQd0o8bPnNJi69IrLCCjmMfBeK0eMH2BgddzCuFLN7MTJIFSsy/sJIWFsHvI65JJhivEO7toXdxOTy0F8Mr5UMBdvXK393EUqH/USkzD3OzevGTV13aixLIEqg4WCyFZfqLvAzSlGf2U4cnmVmDCCB1YrFBcN9C+yYMahqVpQX+mxqwXJQ3q4SZMSfyLWkx0GQlW4egrNtWlfFvPrbB1QLbAZcKSVo1eGnOh3iClXPp/qtUrt31Prr3aYf5PeapoVOorUw109qBGOQxs9Krc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(316002)(186003)(66556008)(4326008)(26005)(36756003)(54906003)(6916009)(66476007)(8936002)(16576012)(31686004)(38100700002)(53546011)(508600001)(5660300002)(6486002)(956004)(2616005)(2906002)(31696002)(6666004)(86362001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?/KO9dPQwIHSflZOkwnpWZrdZDx8pvLeS07d/HueOSs0cI21iSUxOpeAC?=
 =?Windows-1252?Q?vBbuNK7sb6vhNG52M0VDjrBFJVz3xNiViY/jx0aFKl5tdvHQVUkZhMGD?=
 =?Windows-1252?Q?MaYiMdfs7Chiy8S03tUMKCiynahOnY/0vy+X/oKeRgls4z21/wHegzWy?=
 =?Windows-1252?Q?ABh/O9SYSk5BClUHyAWKk2UIO6HlTDDvYbsSgBKKqcPaEuHnKeN+dZR+?=
 =?Windows-1252?Q?KANm9Vv+5mq0mBj5jn3KArDJOK7Xgi4RklRH5WZJECji4OITMqnvt+6T?=
 =?Windows-1252?Q?K18cQd1tkmr2uDN0oIIElAeAVHwUvdhkAhru9qaG70w9sg5mX1vOykYh?=
 =?Windows-1252?Q?wZ50YygF4I+0EZfibh3XWgDZHlFWoEJcY6ECpJlr2+uGpWrrdE40eoHn?=
 =?Windows-1252?Q?P4JiVf4S7NiJDLg6W71+qYbPPF8UrYGV0/yftdLB5IHfgPfzXuwKiQZ6?=
 =?Windows-1252?Q?99i7Rmw5c8soLjJ8nIcELpqOCjc1BsDcAi0AC0Kh+sS8Q95IASu6tDlz?=
 =?Windows-1252?Q?5aB7lmzsER4ZFU+YtnUCjNYk631YrUrene5wYaIewrg2yAfNZ8j6DLQ6?=
 =?Windows-1252?Q?y+4vuamJNl7AAr8UH1AZy9KTDj7+7HbuFe+zWWJmOCMxtJCabZ/qCVye?=
 =?Windows-1252?Q?GegplzLGEniMXlDkFUombNwgg2e5r5mAT78FXVFTcAzOvQQ6BvRQ1Ghc?=
 =?Windows-1252?Q?PKSZCRT0Xxx/wgnfvlDASf4VvVkaBB2f1nDp61HWp9A+X8HRipDvB9Jw?=
 =?Windows-1252?Q?Dbs1guR4WHDCKknaRpPWM1MuQOQ/uoqbS8RrKzJuWSqO6GqlQ7vsblpk?=
 =?Windows-1252?Q?Qm1Slj0lnnHP0XD9PEmAQnXv2ABYm4fRuQuisc1a2HlISj5TAZhdtWgm?=
 =?Windows-1252?Q?FMvAsZl+EBn2qXfkPW5jB+1JXNlJTSQx7jD5ff4mxv6rSQH1gdDDJ8zY?=
 =?Windows-1252?Q?msMVbiU8mi5Xp4NjPkpiJR9HbLZdqXJ1jIka6TSYwzI568kbHNnNHGlj?=
 =?Windows-1252?Q?/mHTI+cIC7ua11bnJ36M8mYdkFmLaTHGLl7Zz1NVo1ZNGzRQAj1je1/R?=
 =?Windows-1252?Q?IWzBkUa8w4e3arZsTRcaZOMK2SBoddeSGTLSPyVGWP8iWFvPJf4A7d1b?=
 =?Windows-1252?Q?VgJckemcj6uXgU0kUHtVO2fx6TNCty03Esi+Ytt31HZA2sqsR4fYjRxg?=
 =?Windows-1252?Q?DNOTjqYWjg1u8CugKQCMYAeHkjeB/xQPqI0n3ntwIWFyFkj+1KAEHGHM?=
 =?Windows-1252?Q?0pHkg19dg3JFIiyQjZz0kCiz4Pjd01JWlxHvg2XVjhf72HbjVY6u3Tob?=
 =?Windows-1252?Q?k+Jb74Kbf+mXmwCBswu2V1XGTeeKZKuIMizf/I7qPu4JJ06Hx5Ll4oYW?=
 =?Windows-1252?Q?bd9yrdrn5RAQZKPdN9PyN+CLeG/G93aeE/Y+wGRcTTFvrCBor7NkHrFD?=
 =?Windows-1252?Q?tF9SUXcbHyCZJa+jKBKNNA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180e15e8-2b57-4aee-738e-08d98ce71026
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 18:43:48.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JST7Ef+blQtpqr9mI2HB8RcaiN8KWhLynKdXUJE/X0xNHS7fG8eV22njHbA2X3hAo5ULNUqlMJuV32o3giNew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2684
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David.Rhodes@cirrus.com,
 Alexander.Deucher@amd.com
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

On 10/11/21 11:59 PM, Mark Brown wrote:
> On Mon, Oct 11, 2021 at 11:48:40AM +0530, Mukunda,Vijendar wrote:
>> On 10/11/21 11:19 PM, Mark Brown wrote:
> 
>>>> +		pdevinfo[3].name = "acp5x_nu8821_cs35l41_mach";
> 
>>> This appears to unconditionally assume that any machine with this
>>> hardware is going to have exactly the same CODEC/amp combination - that
>>> seems like it's going to go badly at some point.  Shouldn't there be
>>> some other check that we're instantiating the right machine driver?
> 
>> we will make the platform device as generic one something like "acp5x_mach".
> 
>> Currently we have only one target platform with above codec combinations
>> for this APU series.
> 
>> When we get new codecs combinations to support, we will address it in
>> machine driver by adding DMI checks for distinguishing codec combinations.
> 
> If that's the case then this machine driver that's being instantiated is
> poorly named, and I expect you're going to get issues with assuming a
> default here and trying to instantiate this machine on unsuitable
> hardware.  It'd be better to at least put a bit of the framework in now
> and positively indentify systems that can run this machine driver.

Will address it by adding DMI checks in machine driver code.
> 
> It really would be good if ACPI system vendors were to adopt a more
> standards based approach to platform enumeration, this really isn't
> good.  Something more standards based like DT has would be much more
> scalable.
> 

