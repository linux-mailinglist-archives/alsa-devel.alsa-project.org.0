Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE63BC2EB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 20:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB7116BD;
	Mon,  5 Jul 2021 20:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB7116BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625511530;
	bh=CfyxlZPdJbArrDmmtNwpAlmWuzYR3RRlv4qHhK1iDGA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyGiVpG155H/7vijUzDG6zLahkLNUgvScy6mN7O9N2NvrAJ4AsLz995dedpXagtRz
	 bBtale/2HCGwYlWOG2j5GKhr7nSYzeobTxgQcHTdl2Q5GC+2QdW7kEblmATVl+Wg8F
	 PtJHA/FxioSdvgGfiNtAf7/f5kvkxDJiJwhv8eoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B84F8025C;
	Mon,  5 Jul 2021 20:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF59F80224; Mon,  5 Jul 2021 20:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 542DEF80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 20:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 542DEF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hCvuTbG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VReA7VKc7ZvT5vLk2hargiPSFHjFyrz6FrURLXfWFuRNmxSMxp9Tk5t40Hs4bxnzbi6XSVkoHRVPFOUeq+5olMVhaoZGQGv4l5Act7YmwbMoEC7y/W1XPaVzA3nwnWza+bvCXg5dOWTINpjwXGVJOIy5z14Tt3q5/4k+2uF+KKjvKnsTmU47YGbCQQqxUp4LAbQdc9/ygHs1OZGenU/+fX87ipPnIKbHSDCSMvQ3Hjv0pu03Tm/g0YOtXxwFaOLefMe16bOz4qkXLMFwWOJkx/RIf5EL9XprkJJqVhKS06qunfrZhlhWOjKWnZgCCTW+ZU1yNzOdj9hkdaRdIF1Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQZNMIvdrz8Tr0T4xlSzK6GyJ33JbD/A8uZuSmRekCk=;
 b=PQ6sQ3BtCTgT6KPUH/WQ7dWRczS6oeAXJCcJAEDWfFV72gdZ1vQWotWvTijpZS4NA/l4XloAmJD3fEcz1djvwaRi352HUwOr+9Nct/RpcJV3QEF9bphYViUsv/l0wfeBn8mm/jKYQnVei8FlangQE7RTt62A30vhMmERas7lDLeXvrBwo4xqlCaHrY5VqElRkeAOS6gbjieYJ25Qqzf1vxav0VRJu00dnxfgJWtBcJ6ar/hLAFbV9YNeImJTI03rTMYlQrrJUyeYuAkHSX03e1bqU/SjCDD8ZePkmaET7rTakt6p6d2edx388d8LYhCx3Ci6smVRuNCjqWzdjDfE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQZNMIvdrz8Tr0T4xlSzK6GyJ33JbD/A8uZuSmRekCk=;
 b=hCvuTbG6WNqd9+xqRISMpc8h4jEj4qMISrSuPnk9ccZMB9O6oKiv60tOKezxFZuDNZsIyqHN5TaVhYHmY8E8XLuc90O62LyfviupP9aoujF2J5irw47ynH/jEMeg3ToNMSuSTa5FCTroJjcDfOlptV1NzidgQRUUJh1+vi+vi5U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1646.namprd12.prod.outlook.com
 (2603:10b6:301:10::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 18:57:08 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 18:57:08 +0000
Subject: Re: [PATCH] ASoC: add dai_reoder flag to reverse the stop sequence
To: kernel test robot <lkp@intel.com>, broonie@kernel.org,
 peter.ujfalusi@ti.com, alsa-devel@alsa-project.org
References: <20210705155830.24693-1-vijendar.mukunda@amd.com>
 <202107060150.COdfEU5D-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <bb5cbde1-8bc7-d272-3eef-84323a222deb@amd.com>
Date: Tue, 6 Jul 2021 00:44:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <202107060150.COdfEU5D-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 18:57:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abde05dd-d7e6-4498-9144-08d93fe6b006
X-MS-TrafficTypeDiagnostic: MWHPR12MB1646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1646480C3686A363B485788F971C9@MWHPR12MB1646.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBRpLtcTw6d+8epyNlsuCto4MVik9X/vhEPiU7b4ftYPtsFUvrDS8Xi4L2ChIw3eg//WdlPR5H50SxzKAyw2vPkUUusYkg9htxY2RsQnevK6JMUcu3TnXWVnYNuzyT8JEsR1CtdFOvkRbD3OqMJSoEz8dzxxtO8UpoFRSG8i1lZSRpmNCHJWiv16biaGcC1UdT1mt+n+jN8zEQVSC27HiLa0Xt5hvygdDZquis1E0gvtwrzZonNqU4JXhSTpZ1bns3rCXTnUFiXgCCpgxRZXRZIOgCV8ynw7/fzaXNNm3k2icNIfxvNcJT6XCZ+1QzN2PkvFz7FdzGFgltUmmylQlnXyK0jQmbjM0jMKQYBjNJno+jm8JBl1gIZ6dmOrJAEFtchYOIJ9P3E7gSirpWtEl/LNuRo+9L7zg3axyoRZ1l7d9RkgV9KWf7MmLs5tz5LRJhwyIpEeQjNal9f8O3kVRDVovuPJAACSDp8KsPEGggQGiNCufQeqIgTzCYqUA9sRXKXJIwJo3UZaAt07gH2DtqiDHDep8Ku4JfSvIJn2cRsbWM00gKmdkNsBRdGddLpib8ahlQryGBx1HNPZAMum33nQlGfUozdcttPM88jPR9zZszxKKfl7UwKWGubRLgdizZ2vpBCO+M8RjO/miZdxPWSGGjRZAwbrqm9OUCLbpuqNiCNz8KQQiSXfrQih4D0Q99TY/N0QHn9J1rDgdYzCptqwOctY8YGHzYWQ7Gt5YNBPd+HdCOMDKSrCLKuBbw7Mm5ddzSguAYFp+BlW+QuSonXL8/+DJUB1qt4ldMTC7mxOzQTquzwKFXDteVf5itBsNsFcsrUkT4X60LCePTp+n4BMEEpks12jBQHH0TnOT0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(31686004)(86362001)(956004)(38100700002)(8936002)(31696002)(4001150100001)(4326008)(83380400001)(2616005)(66556008)(66946007)(478600001)(66476007)(966005)(186003)(6666004)(45080400002)(36756003)(26005)(5660300002)(53546011)(316002)(6486002)(8676002)(16576012)(16526019)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?oKRyvoG4Rv9P4kPvCeX7jX4ujCfnbaq/3+crsCRz37ffTQ2qS/iZKKWI?=
 =?Windows-1252?Q?AZ7Vc4EjabqMdt+A65JhXKXYfdJIsitxA8SyKFJD4w0yNz3vFaTOykoY?=
 =?Windows-1252?Q?+pP3HX7QDUlTF4SiGWyAhZ1OnFv7RCoDdw5PRh33MoP2ggEpEgPaIHx9?=
 =?Windows-1252?Q?Vpkv5+tFpQP1+ioWPcJb5Y2DqINBzozBcd+UAnQMtOFaSUHlNoH0SCZR?=
 =?Windows-1252?Q?iKftp4iUrdeFzbAd4JBWSa2drS6xBeprL69Fgg+fznWr842RBayKfORD?=
 =?Windows-1252?Q?1gqL+LFX/pMCQYpQ6abGW9eYMU4/hluSOG8JP6T3AieD1JWkOL9fGOMt?=
 =?Windows-1252?Q?uJjkYCRvCjQALhfzk+PJVZOsRf/EjQirBoMRw5dRYgSLHgKrLpy5dhhh?=
 =?Windows-1252?Q?Fi9LWBwdXaf7GjQNtEOcw0P3oU20gwr6dEfqj9x2C8HHiHoAblJOQrTH?=
 =?Windows-1252?Q?H2F3Z6c4p14B4ZNL4DX/awp7ahlHF60NGEAuMmSxYg20LM8I/andgPwj?=
 =?Windows-1252?Q?Lb5VRhbTHZztl5PXs2hobp57EX5CDUsuzgNieWIwIGzWI752RQRAzA/3?=
 =?Windows-1252?Q?aiLKxZ5ZRzcTEi0lEOIubv+YXsq0gwZTRHahqmz4yEYAlIbADHBHVD8w?=
 =?Windows-1252?Q?LDN1y2KXpqwR76NuSgp912OTNDeQY5/40nRHxP7V3H+mmQO/xxrJe5aZ?=
 =?Windows-1252?Q?GuoF8WsTVjF3yI6HmBKEwkn1APRqJLK7xiSVbJfQ2qKvRR5Tq4HTbOiG?=
 =?Windows-1252?Q?n9l6pXEcxxHo0ZhJQ93yDDXKP8KT9sly3j3usNiW8Ng09cSLVdsXR+qZ?=
 =?Windows-1252?Q?WyzdHnY8LwbEo95pi67/DiLyPoTNNHXx7ZhOEnpUd554hnUkakcQMSrQ?=
 =?Windows-1252?Q?tv0BTdpyYnghjQwCDJ0uQruMCO8l0LzV24E7bNA75wtMQDFvVFQgTTOW?=
 =?Windows-1252?Q?e6bRljmQvwxKoWO9RcbIPtO9cOrWl9JUFlfiQKLh/GQfbOhVLsUykVwZ?=
 =?Windows-1252?Q?8FWYkMFqd8sOtzhZAl5tO9CXq8Xufjw3Hj50aKvDb3VExUjh2KKq+7iz?=
 =?Windows-1252?Q?nCubORgSf5rSkP5GHXJu/rP5IFiRoK2A6KYJchdM8QcS7PUEZgQ3yI8n?=
 =?Windows-1252?Q?H5ZkMasaEOuCQHFHoXh88shiHPgd049BWnXSiY/sC0HxTxtCOHtXnZhO?=
 =?Windows-1252?Q?6ntiJVQkTr0Sb2E7LYA+1AOs8DCxSUAiGAIC9L57j5zUx3DXnoxJPMza?=
 =?Windows-1252?Q?N1zf7S9caimnQpDEn3q6wnij+jUIat1hyxwpGbDGYfgDict6U9MSR3uH?=
 =?Windows-1252?Q?DZ3xHYssZq+lcUfwFgzFMk8V1Ji0AF0LFlwq0cT+bT32JNaWk66a3Xxk?=
 =?Windows-1252?Q?p8zMYEZ/8sVhN4y2IoqK6E5ckAKFqEtTMJIbGLV0AwegvhVl5liCzDlG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abde05dd-d7e6-4498-9144-08d93fe6b006
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:57:08.0787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF5KHyhjnJMmBzu7eDMpy4BcIXZrFlEpP8N+qnEXLxU8r76INkKToXghTSvosXYNoIzW7xo0GZfrsHXUjxRh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1646
Cc: Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org, amistry@google.com,
 Basavaraj.Hiregoudar@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On 7/5/21 11:36 PM, kernel test robot wrote:
> Hi Vijendar,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on asoc/for-next]
> [also build test WARNING on v5.13 next-20210701]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054720345%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=osK4Tiu040qnydE9OQc1v7cDJyUe3agQooPSJPsallo%3D&amp;reserved=0]
> 
> url:    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FVijendar-Mukunda%2FASoC-add-dai_reoder-flag-to-reverse-the-stop-sequence%2F20210705-234319&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054720345%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2FIzzuIaGPiIoWh8Z3EtcOjP8kzMhFId9UuD6jqfgCj4%3D&amp;reserved=0
> base:   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054720345%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RqAZaoQ5hrjmmPExq93uE0u%2FwP5B%2FUfIFg89n5JHHLY%3D&amp;reserved=0 for-next
> config: i386-randconfig-r031-20210705 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2Fa132ec819f3d15c103f3afb5f3e8154355fafdfc&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054725344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JzibVA7BhCqtGUkwPhzuhRiVR4pZaGSRa4DJSPY95bo%3D&amp;reserved=0
>         git remote add linux-review https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054725344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=f0T04nTP2VDF8rHdcbAhkSDU2CQdpeMYVjL8NrIOGWM%3D&amp;reserved=0
>         git fetch --no-tags linux-review Vijendar-Mukunda/ASoC-add-dai_reoder-flag-to-reverse-the-stop-sequence/20210705-234319
>         git checkout a132ec819f3d15c103f3afb5f3e8154355fafdfc
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/soc-pcm.c: In function 'soc_pcm_trigger':
>    sound/soc/soc-pcm.c:1019:3: error: expected expression before 'struct'
>     1019 | + struct snd_soc_card *card = rtd->card;
Extra + symbol introduced build error. Will repost the new version.
>          |   ^~~~~~
>>> sound/soc/soc-pcm.c:1020:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>     1020 |  int ret = -EINVAL, _ret = 0;
>          |  ^~~
>    sound/soc/soc-pcm.c:1060:7: error: 'card' undeclared (first use in this function)
>     1060 |   if (card->dai_reorder) {
>          |       ^~~~
>    sound/soc/soc-pcm.c:1060:7: note: each undeclared identifier is reported only once for each function it appears in
>    sound/soc/soc-pcm.c:1018:30: warning: unused variable 'rtd' [-Wunused-variable]
>     1018 |  struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>          |                              ^~~
> 
> 
> vim +1020 sound/soc/soc-pcm.c
> 
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1015  
> 836367be289d5b Kuninori Morimoto 2020-06-04  1016  static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1017  {
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1018  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1019  +	struct snd_soc_card *card = rtd->card;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01 @1020  	int ret = -EINVAL, _ret = 0;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1021  	int rollback = 0;
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1022  
> 836367be289d5b Kuninori Morimoto 2020-06-04  1023  	switch (cmd) {
> 836367be289d5b Kuninori Morimoto 2020-06-04  1024  	case SNDRV_PCM_TRIGGER_START:
> 836367be289d5b Kuninori Morimoto 2020-06-04  1025  	case SNDRV_PCM_TRIGGER_RESUME:
> 836367be289d5b Kuninori Morimoto 2020-06-04  1026  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1027  		ret = snd_soc_link_trigger(substream, cmd, 0);
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1028  		if (ret < 0)
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1029  			goto start_err;
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1030  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1031  		ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
> b8135864d4d33d Kuninori Morimoto 2017-10-11  1032  		if (ret < 0)
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1033  			goto start_err;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1034  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1035  		ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1036  start_err:
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1037  		if (ret < 0)
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1038  			rollback = 1;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1039  	}
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1040  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1041  	if (rollback) {
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1042  		_ret = ret;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1043  		switch (cmd) {
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1044  		case SNDRV_PCM_TRIGGER_START:
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1045  			cmd = SNDRV_PCM_TRIGGER_STOP;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1046  			break;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1047  		case SNDRV_PCM_TRIGGER_RESUME:
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1048  			cmd = SNDRV_PCM_TRIGGER_SUSPEND;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1049  			break;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1050  		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1051  			cmd = SNDRV_PCM_TRIGGER_PAUSE_PUSH;
> 836367be289d5b Kuninori Morimoto 2020-06-04  1052  			break;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1053  		}
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1054  	}
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1055  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1056  	switch (cmd) {
> 836367be289d5b Kuninori Morimoto 2020-06-04  1057  	case SNDRV_PCM_TRIGGER_STOP:
> 836367be289d5b Kuninori Morimoto 2020-06-04  1058  	case SNDRV_PCM_TRIGGER_SUSPEND:
> 836367be289d5b Kuninori Morimoto 2020-06-04  1059  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1060  		if (card->dai_reorder) {
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1061  			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1062  			if (ret < 0)
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1063  				break;
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1064  
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1065  			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1066  			if (ret < 0)
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1067  				break;
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1068  		} else {
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1069  			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1070  			if (ret < 0)
> 836367be289d5b Kuninori Morimoto 2020-06-04  1071  				break;
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1072  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1073  			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1074  			if (ret < 0)
> 836367be289d5b Kuninori Morimoto 2020-06-04  1075  				break;
> a132ec819f3d15 Vijendar Mukunda  2021-07-05  1076  		}
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1077  		ret = snd_soc_link_trigger(substream, cmd, rollback);
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1078  		break;
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1079  	}
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1080  
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1081  	if (_ret)
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1082  		ret = _ret;
> 6374f493d93b22 Kuninori Morimoto 2020-12-01  1083  
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1084  	return ret;
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1085  }
> 4378f1fbe92405 Peter Ujfalusi    2019-09-27  1086  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7Ce5b275b4ac8a495cb82908d93fdfaeed%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611055054725344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1BE3N8mS0LUpanKs2CGxygLVYLO3dQxpC2CprbqJeIU%3D&amp;reserved=0
> 

