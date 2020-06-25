Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A4209DBE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 13:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A605C18CC;
	Thu, 25 Jun 2020 13:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A605C18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593085838;
	bh=QKzUG1JDWEIWFKihXqSh8nYFX7HoPyi30OpT07WFHmQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDTi+R1gKinZ0GGEU29vWUI3ctPoZOFewbOejoTOZumSoGQ3VaeLk0mzNJlKFqKe6
	 o0IglNkmhluspUnhExo+PHzNF3p2cGA4ClmrEScKybu0mA7rtFUCESs7UPJcYlhUJm
	 PxY70Mx9wBa9M6jQCEk6iv2ElJE0oWN1xk9wZHVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB83F80158;
	Thu, 25 Jun 2020 13:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE9CFF80234; Thu, 25 Jun 2020 13:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760070.outbound.protection.outlook.com [40.107.76.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B22F80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 13:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B22F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="lMJI9N4y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPSqH750XYzVcwFXmG5rDooBH4bwmJcrW9yROYha6XnjEWBueH/leZ9lM8Xrv2FAJ+RWeR8dYu9P9ixLNBhKQBbtmGmYlshdN6e/u/8l8rSfbDvjI2CzBjY8+a8A265E5Y1X2O1AcOJ0oXIlMAFTcXwuv9qFB5b6ojYjwv3fMEIPPuWls8sDsvVCe8amu4wVTtaSCIOHNFx2zEMMRPAa7DmkxxbItQO8MHos9xZ7HlF1w/rOAyGzc2yXqu7pH58OCeFccupumFCkpX7x2XXfmyxDAYAL4LMJf4CLxyG0LdP8vVCaDsDR/1lSSHk687rPmHkts+cfDvmlRB6b6gNIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj2OvApGo4TWHe8XJND68CKiHfBfDrn+cAa0+2wrb4E=;
 b=YOLac3YuDdPbnp+KznmgIDKHFrYn4f61XGWCvjw9QEFBg1OIGDEqHvAF2LyWpMx54G7Eqq8stCmg+wOY8JjcpS4CR0MjOhnDQAxtN7qhboC2Iz3c917qE4bOvklBF+Hh9BpBC60pGcsnyuMn7XXiY8Fuej5IlEE51gw1GTnwdw5ww9HrtHg7RifVAhX49ZpTNjFj9NoRWhL1iVkNTXh/eDyVDnJKYTmso8FRlQyF25Frld16DjHpIamf9l2pfLwcSv26xhE6gDhr23jIyPMh4UL6suE/+S3ZczWZH+UjFyTA1bD6rEdft9/om/0ECtrezTy7Y1KM7KEIl7449hP4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj2OvApGo4TWHe8XJND68CKiHfBfDrn+cAa0+2wrb4E=;
 b=lMJI9N4yHsrGth3qWJVujpbWMwS00Gh0OP2W1VufUAoi4wgM2I3+MIjuM0YsAljlAUO9Ch2jdW5oz0TFhvnl5d9pli3TOTKKJYzvw88i3v5PsspdZdCKbFd1zDG+BVvaXDlIxVKMSAOJB+rqehJGjfdBk6N9L6p6EhsZo+AZZOo=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (2603:10b6:4:55::20)
 by DM5PR12MB1673.namprd12.prod.outlook.com (2603:10b6:4:e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Thu, 25 Jun 2020 11:48:38 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::1477:12b0:571:5000]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::1477:12b0:571:5000%10]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 11:48:38 +0000
Subject: Re: [PATCH V3] ASoC: amd: add logic to check dmic hardware runtime
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <1593025336-21482-1-git-send-email-Vijendar.Mukunda@amd.com>
 <94c72bc7-6448-6d6f-d59d-4d6b30d20107@perex.cz>
 <20200625111142.GA5686@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <4c17afc2-cfaf-3d10-ffef-cc59747fe8c6@amd.com>
Date: Thu, 25 Jun 2020 17:32:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200625111142.GA5686@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR0101CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::17) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 PN1PR0101CA0031.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Thu, 25 Jun 2020 11:48:36 +0000
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a24a1f9-0ecd-4227-9659-08d818fdb323
X-MS-TrafficTypeDiagnostic: DM5PR12MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB16733792C8AA32272EC34A8E97920@DM5PR12MB1673.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWrm0EaaTTAzoXALczvxzbsfcj86bXowX818Pkw+Bh8Vcav/et5GUZEgqx5eMWE6Hugrw5NxwvkeXI+jS0WDRmbv4ONm3wgNoUKo7IvVQZsAw3hauAhPtYV2hJRilhBNW5ImvFRDTzSZ77IYgQNLOs6CLO+oqYi9H/kTq/QYwkxCCKyBK7OP5+fltRNL5R69IcDypYwHzJNA9XN2q1Vbk6zChZBKNxBFVvQVQ72PcHFfZa5oNW05VvthSWpgEPz3Ao4A1xH0r+oJ3nPTuWelDfN9oZVilXow4Fwyl/4Bb+GdhoKcyespXC/TdzT2WDrXh4kSOi6DOTU4PHyxZ151QlNFJK6wRvkACmK8xJ1EwDPwErWwc1Rw4olBA9hLcTc/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0155.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(66556008)(6666004)(2616005)(31696002)(2906002)(66946007)(110136005)(4326008)(83380400001)(186003)(31686004)(86362001)(956004)(16526019)(16576012)(316002)(36756003)(6486002)(4744005)(5660300002)(478600001)(66476007)(52116002)(8676002)(8936002)(26005)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nlcDDZjh9efT3BBa2O8I1hVbn+qeVYxfoI3werEAXsC7VVYFKp2ewyRX7pe8Z+iFy6e7wopJhl7AQ0QU+UjuV/+38CqIv+PZRTskpr+NwkJ2OaWdgcJni2O1AnUbP2roe8vspTzoRjgFbdCP8WtW+MiahKhNFTlbDYWv2aWQh8MNfBcZzuIqgOY/oJiPB/tOwBejr2c+9BJFueKmc7GRCBphhqRtox6f5FCd/82kg1/mUjL62zAEOZreZPaqjFGJLSpvZaHrDjV9uvUBbbVpWmKW8gMu/0g63NFnpcaFoAsHDAbV4JjSEYhfCiFLe4U7flG+mFRwPU8qFVdwkjnwBS8xz+FR4J0u6fjrFrg9UMBV1cPi+czsjsAxB8KQ2O04JN3JjnM/A5hnRPQCXeL/enwuLzvNtWWNtm6+REy/LDB+GsT9Z3vyOTEhrg3+n08EAE62fTj9Ki1Q4fjc4DTF7aLOllm0n5Bl8rrF807NmNBU0Mn1g2NwrXpw8EIx3/OW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a24a1f9-0ecd-4227-9659-08d818fdb323
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0155.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 11:48:38.6440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKJ4vKqtJxBgz3Gvh3SbELW4dKEEBbgqD6SeRuyfgnUh+gmGEskzZQg+s2ocqZ5AgsWQAkYEogMJCtMhJu51kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1673
Cc: Alexander.Deucher@amd.com, hui.wang@canonical.com,
 alsa-devel@alsa-project.org, Virendra-Pratap.Arya@amd.com
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



On 25/06/20 4:41 pm, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 08:55:45PM +0200, Jaroslav Kysela wrote:
>> Dne 24. 06. 20 v 21:02 Vijendar Mukunda napsal(a):
>>> Add logic to check DMIC hardware exists or not on
>>> the platform at runtime.
>>>
>>> Add module param for overriding DMIC hardware check
>>> at runtime.
>>>
>>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>
>> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> 
> As documented in submitting-patches.rst please send patches to the
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

Next time onwards, i will make sure using maintainer list for posting 
new patch.
> 
