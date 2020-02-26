Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76C16F87D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 08:24:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411B91689;
	Wed, 26 Feb 2020 08:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411B91689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582701852;
	bh=r8/HgCgjFnv88IsVFYVbexVto/LZ4UBrba6fGAtxPmI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oc7gSqfhJV0MAhxj/28IUb/zrW6LKfMPZvD6XtRG7RS3RrJ2sbFr/fQDsvJVu2XLy
	 FY7kLehs9UopnTyZvqM+ntYWBsWoTviOkaV6i5Fgz096LjqDC+jIbMVF3IPvu61MtH
	 u9ZAGbxK2xhlCMDw9KlfDnU3Cai15tAKiyGz4JR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D198F8014D;
	Wed, 26 Feb 2020 08:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3CBDF8014E; Wed, 26 Feb 2020 08:22:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA482F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 08:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA482F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="IYIQRdv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e593KR1KcnC6CzUIbAXgf7+9GlvpUyXV9gJrT9bwQvOyQO+ge8nm/x4YfGR6Muvl3svDrJCc1+pR21GxoSLW9aI7y9eJLZqWeLFa+eucAkfIZZX7CJwCuUUgtooxbMfKGuU2Y/EWgcpE3C+wwTexfn180eXttAATyu6QtpkGKOBwghFMO0pCFGGNnk76eC0jsNsdK/EAeXEqK5NmQikYN3z9OA8unETVOIlq7oKNAcbUtzykCGHKxR5+E6YcGDwquJnVeJ2FRWy4vniduRXb2oIP6lPf5o+WMJtaXqpEZyjDt5V3JEl8ZVzPtdJr89D5FcWyD0y+AtHa2rwcmLWQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQJ/ZVythcDQSoq+PoFJoW6rgJFIDJG6EpIbY+t1MVg=;
 b=kauaKF2/pK0dv2OA/8l7ug9ugfOpQdyEN5xm407NXKXlcSZE+bqgi79XsI4rNzksWJEZV/Bpcd3Qrt4drlIQJ/ytyTGVW6NlbyGEZ1U5QVN2jdXUFAU1ndqTS5kDauI+1MF87FNGEsRH1SSHgXFunsVfK5WsLrRcKkRFqZGWOVRlOQ6Igf7JE7bk0xkjRO4bkewaLDTU9P3+qtDYXBFdIaYgoOThuDBhhHteQnyOeaEunCzP9g1H2qo5mK1YjbFwNmRkb3dUvqZuqByJG6YCgATu3MpvIuD8AfhswketYuMbrka97YfIiBbGemdAUsAH9h0Gonx1+hLy/oIHomYTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQJ/ZVythcDQSoq+PoFJoW6rgJFIDJG6EpIbY+t1MVg=;
 b=IYIQRdv1TuFJinB6ffMbdXO8TqkuzowVtW4MlOcMtLemt6FVOYZCtV2TES7vBi6sUAD3GauKBp4oZbWx4iaPNdUFYCen250JqIqngx8BCRlDQWQlcbx/4IB8eE1Frn3Mw+X5WSHrQctrz/+gdfyCPbmiWWKQV80AS5Gq3a9lkUk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 by MN2PR12MB3102.namprd12.prod.outlook.com (2603:10b6:208:c6::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 07:22:20 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c895:8c76:61ae:980f]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c895:8c76:61ae:980f%3]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 07:22:20 +0000
Subject: Re: [PATCH] ASoC: amd: Add machine driver for Raven based platform
To: Akshu Agrawal <akshu.agrawal@amd.com>
References: <20200217050515.3847-1-akshu.agrawal@amd.com>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <d436063d-098b-f49c-c387-abc13bf3b570@amd.com>
Date: Wed, 26 Feb 2020 12:52:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200217050515.3847-1-akshu.agrawal@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::13) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.133.153] (165.204.157.251) by
 MA1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 07:22:17 +0000
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bae4ebed-79d3-439b-10aa-08d7ba8c9da9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3102:|MN2PR12MB3102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB31022DF70A33CD74AB0024F8F8EA0@MN2PR12MB3102.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(189003)(199004)(26005)(52116002)(31696002)(2616005)(956004)(66946007)(186003)(66556008)(37006003)(54906003)(16526019)(16576012)(316002)(2906002)(6636002)(6486002)(66476007)(36756003)(81166006)(5660300002)(6666004)(31686004)(53546011)(4744005)(966005)(4326008)(478600001)(6862004)(81156014)(8676002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3102;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eD3/fzOKuJRKBqNVYqW1YnvJe4qSJuVNBiS9B4vg/XXjpQdsg3TBktZhpQo6f3Zif2JoUs0ENVBxyEcmwWPk3Rro208cfuhPf5u6BYXOlA47PPdcFzztWsFNjeD6Byw9rS5p7GZWWJv1a08j9cVqMjeBYYU6vNUIzDEEiHem8VyjTtDAPpMh8M4IaBur5Bj5bp6sn8KrZ1reVJwNad0xBL2MCFdwRpBY+qQ7DKA0W0JDtnfMpakTm7+JwDPTpCqinbIuPXA5UxHLA1ulkZ9rVW/tXMjwfeXxhm1IKx1sdMgj6VduB2o7McpoNAkjqC6PnTuSKEkbNldqbjG/nigFuO3XEKXZFUPr/ukVVWVpiQ5oeg75EsB2ovuOzlk1vziGkoFrqJWZuVoqfiktXDi8DaqDiMib5tVAefOyt9hZySGJQwUWnMR53O/AKeKp87aCw9dTZJfxZratn5jOS49TaeleOxmoFergOD5NClHLxHEb3eshrtBzj4RuIiPDjhe5ukI19NcGV7f06UUnBilqpg==
X-MS-Exchange-AntiSpam-MessageData: UFmdCRPX3BCYg52RNcs9egnXyocC9Kn8gHMnfyc3yLb8hYel5eq2bX7yAVp/HgyusNs+IKQKQVW2z5NzN1pdpxT1WgtKUx5f+bW56isBdxCa0gLeCc15vP+Tjh94H2GrJFEjf8OSg9Fij6oYbdQFOg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae4ebed-79d3-439b-10aa-08d7ba8c9da9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 07:22:20.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGfusfxTAP1DggcTfSns9YCcNPxqqjxwkxX9D4azjUJWQnggTsfmkC26L3lIRp/suz58/QM6OdGBHcKC/2WGhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3102
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, open list <linux-kernel@vger.kernel.org>
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


On 2/17/2020 10:35 AM, Akshu Agrawal wrote:
> Add machine driver for Raven based platform using
> RT5682 + MAX9836 + CROS_EC codecs
>
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> ---
> This patch is dependent on https://patchwork.kernel.org/patch/11381839/
>
Hi Mark,

We can take this patch for review now as the patch it was dependent is 
merged.

Thanks,

Akshu

