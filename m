Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F2161F0AE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 11:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19861D7;
	Mon,  7 Nov 2022 11:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19861D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667817119;
	bh=LG4mMPtBvfhswdkSd81Mij5wNT7MapSJYmvf8+GJJ4I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOIWDlAKDkx2g1nuqiqvf61EbuuPPGII+KE2QGc0JPJSs5joVvU0iNw6W0Gr7QZK1
	 +7w2e4hNwjQPRhSRTGpgouzqMkM73s+mbWfz2FH6zbcWoz+9jNRdanVHiljoiUoKX/
	 KT+JhXYW9tQZMXjI4PRB12GcWnlX0VrRSjvNO+AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0277F804BD;
	Mon,  7 Nov 2022 11:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33C22F8025A; Mon,  7 Nov 2022 11:31:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5401F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 11:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5401F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="dv+yG4Wq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4sFQHLglWi52ABK6Rp+5yDw/7SwLhkswBuSs9bVLZc5ZZlQLmVPCZysgjH2/Sebaen1ZnNlB2Os0xYsOsLoyevK6wc5HVChBXYmL6BQcbynPKC7+WVA7NZQYWnO/ROza1MIl7puMvzPJDC3z+P4SOsl7HA8Os5f27TuQzmL+MgUGWFTLZO6XCj8+++nqqHoVZ2TF6WHASBDn2ix7yg2mSwTb+h+IRFqRc5D7vqTtQWlsEXwLAykjVDc0pnyKqeIEyHneQuNImHHIAnhZraElCyp9lfR5hNHtODm2qwWu9P/Z2tA90R1H7lDCsyS5VZYwYmAf+PfUghZ3dyg/grisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LigeacCJuZkoSLHk0O3m9uXy8b72JoppXwVkF8w8QPI=;
 b=hphGhunbFFPhqyOKA4UGE7/YXqXefrboNfK3/Kgfkke7p1Sp5Qbuq9wYygJPJFwfQ6HkTFjkMaWm3u2E0hgcUJSrwKLgHagZqxUSnIznvPdQ8mIui07lswbZdHrRKioAIdblGjs2BPMjzbAmEvPoVbozW0ajlQKGpScOlDpz7Sz+hexQRAp4gZRXGL8ulWe4rdB0VByFExmHuxw149/2EuUDMlTuWfy17hKvI8mPr1ZhJ9aOtC/pdEPwFKAzYhUUSlX0XkSEB3z3VC3yXtEEamYWYe4je1uLGBduAD3C9ZHV6GTvx9RvvcaAQnuPBhHzeML8rmwixRlklD1tY5DvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LigeacCJuZkoSLHk0O3m9uXy8b72JoppXwVkF8w8QPI=;
 b=dv+yG4WqZ3dB84A8F4eax9Lao0O/ElLLe3uPVmfCiz1FbUJEALhwP/K3Dbo/fPSWKSc1Gk45q+8lBIBpsU2fmy96iNKDU20MefvhL75kACeSOdiRYvq4RRYErygKdeBt2otishnTLxC2iOatSQWd6zShV1rB2OhyXc049dzYdPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 10:30:51 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::43f5:9df3:a0ef:3da3]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::43f5:9df3:a0ef:3da3%4]) with mapi id 15.20.5791.022; Mon, 7 Nov 2022
 10:30:51 +0000
Message-ID: <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
Date: Mon, 7 Nov 2022 16:04:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
 <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
 <Y2JVWmJsprt0xnKH@sirena.org.uk>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <Y2JVWmJsprt0xnKH@sirena.org.uk>
X-ClientProxiedBy: PN2PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::27) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DM6PR12MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf9ef4c-6e11-4436-1ced-08dac0ab2469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BS6ICpG8PBGhE1gHHb7n1ZnKs8jenwqCIpEegD/ektNSaQ1FZyTdFHZyOGFzuv7apmpevnCRgn5pEtg7aG20EG27kl2y9OU82czQlDk+vnGeVHJesfdqcKucs/c11M1WKIM0sZsaihvymaJUwDOtHDIVUeucLkmj+nTeEXnTMtwZtp2PGb83xvRQcojlXgB0eZfyDyDZeYs6ilZZNpIWK1GiWhjdCMtii/t7gzWRJEDmhUO9PQuGNnQtVnaQuuZ42BuOazPq9RJQMqg1x/nZtgP/FQtOhIzwiBiK2fR64QOx4Nr5C+jXRetDCz2t6d3Ib4iA3E5JvnUmN0ZnfjLuh4QgiVfGMN0ZBfMW60eUdQ/Dvgf+zkJscxCxegh34Os9kc6LGiIK8uS2yhhugDhGM0uiry8y2qTtEyTzMsiInPvvo1Ae9xGVESus4hsaeQgFtOKQdJlnuB4EnkgBNlIH6aw7ifDxonw9d47kkDotxgnAcSF8KLzu1rgZ+PGvKWNO+om2FBTUP4X0E0VNSfE0rpQtgL9go+bYo+HPbZMW2B74rcIlMQocEUFCXSorC4dTulQqJUH3GA2upUHYadh3gHf4/xzBFK+t5ZYF6/15rQx1PS4D3ycvJThElahoFNcXOT21VDa2j1/9qHMrH42O2rTszIcDrEZ6W/iARsJSjm4brTjNje2ep2IyXwtvuGBhEjRYxY+LMtI4thuhAiQdNus+ECLn3E+RinYQTusfPCsQ8EC6aZDsfOnnWkcHtCDm+YNhC7M/WG49gNsZN/yHXQl8XgGjUCtrnMGDWestkkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199015)(2616005)(186003)(26005)(53546011)(6512007)(33964004)(6666004)(6506007)(38100700002)(2906002)(86362001)(31696002)(41300700001)(8936002)(5660300002)(31686004)(54906003)(6916009)(316002)(478600001)(6486002)(36756003)(8676002)(4326008)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGFwdExiWXNPc2VPMUZ6cGZPRFdRT0V2UmxEVEFtdEdraG5uaFJmcmFRQVpZ?=
 =?utf-8?B?SStxQjNjeHVudmxNN09leWRBT3loaDBKN1oraGJJQlFONUxsVTI5d3ZnczJy?=
 =?utf-8?B?Z0xQN3h5Z3Q4VVhOaGZyQlBVMzdUOWxQQVlBZktDdDFocEM0OTlkdlRnTTI0?=
 =?utf-8?B?aWMrT1JTUGk4aDU0bFVSN29VeUUxcjVwc09WdFRleHpHMFlIUjB3aEQ1QS9Y?=
 =?utf-8?B?S3JmWm1NeVkxamxIcVBUclVXV2pOV0o2UHBibjRJMXllYmkvcFBqWlJBNGhm?=
 =?utf-8?B?bEZLWmZrZ0w3OHQwbGpNYWpFanBlNHpwa3I4YmtUcmVPL2loMXIrYkYzaXR4?=
 =?utf-8?B?UHU0eEVXZWc3TmpjK1NFTTZYOG9malloWWEvZWtjbUsvMGk2OUNaKzVnc0Nj?=
 =?utf-8?B?RUl1SGo3VVlrSlVSWE9ZY2pobGNQS0F0RFdZVS9Yck4xZXpSNVdYenBCRGRD?=
 =?utf-8?B?Z0Nxa0Z1MUpTdmtyRTdMYnRZSEVFYjV3V1laYmhQalk3MXdHZTlpeVJRR1FP?=
 =?utf-8?B?RDVyUmdta3NZK0U3YUEyR3h6aEhqTUJWZFFsUExmZ2tYSlYzRDVycVlvZm1k?=
 =?utf-8?B?UXJseVFsQ1VYaWQvaGgrblExdzk5QndvakdHR2hvN0ZxdFVFSEo5ajI1NXRZ?=
 =?utf-8?B?eThkc1pad2d1OG9zMzFKbnJ6dGNSU1BoNzBaZmtvNHEvUG9sQVNpTnQrTmRX?=
 =?utf-8?B?Z04wRVQwRC84YkpjbWh5OTIrcnV5dVRoaVErNlhZbWp1RFZZODViUU5LNFcy?=
 =?utf-8?B?SE9RbGRxblBJYnlXUUExclhnd05PZlI2Wlc2c1g1cmtjSGFUVE51eElQWnZK?=
 =?utf-8?B?YTZ5eEd0TkdQU0QwdVE3MWZ6Q2dwTlJXNmpKNS9aMW0vVUdJd0dHekxtZGRW?=
 =?utf-8?B?Ui9GOTVqazBIcmJVQWdOcEJBL25jc0d6TGxCcjZWVEtFWUlINEFBdnhtd0NU?=
 =?utf-8?B?WWVpS1JrNWVRZUhvTkMwVUxZK3QwWm4vWXRFWk9XbVlnOThJQXFYcnRoTjBm?=
 =?utf-8?B?Tkt2YlRDdENOWGJvRFEramZ5Q0JkdDRoclo5dXpNL2JLQU85NTVFczA1aFkz?=
 =?utf-8?B?eHBrSXU1SHcwUmlPelpIdkwwdVR3Smw3RzdEU1IwMHNENnYzdFNuT3RNVWNh?=
 =?utf-8?B?d1E1TlFFejRSc29YZGNKM042SllyeGFsQVk2c2RvaU82VzZZam1TNnEyeTR4?=
 =?utf-8?B?cDE4bVg3Wk1XbWZJRGppbVVrWVorcXlNWmFua1llZy9VSzdBYy9tZzNyZmlm?=
 =?utf-8?B?S25ERGdqc2VWaWQwRU5kVHRCaVBrOTBoV3QxVVRzaWdRNy96ZlV2amdjNTBa?=
 =?utf-8?B?ZHpkZkE5UlFpVEx4UktEbTFuVlhyTG1GTXZ4V1dJMFBkOGcxYlVodWV0Wm82?=
 =?utf-8?B?cHViV2U2bkxrTEQ2VVJRbk9GWDNjdno0N3hCeTBSVm9JTDFLd3RvZG4xbUVF?=
 =?utf-8?B?OFo1T3FDOFJhbVJ4RTNGZmtKSEsrYmJUN2VvVG9Qakk3VVA3L3g1elJPQTB3?=
 =?utf-8?B?bzNrdmlWSFc5UWtNQU5WSXNwckRtRlpSL0FVYk5pWU03M2FzdHRDUnpBNHZQ?=
 =?utf-8?B?N0FNMllzejNaZFptVUdHMmJkN3pBMkwxdjRhcmdXK2l5M0pDb1dnRVp2dzlx?=
 =?utf-8?B?QUdIYlBpSG45VWZpSHN2bmNVMDNYU00rbHV3eGMxQVZDMkZ2SjdOSllBczRo?=
 =?utf-8?B?eTlwelFPOHFqakxmL3BOTDU5M3VmOHdVS2E1dndSVEw1bmkyejFTQUE1QnBs?=
 =?utf-8?B?YWdPVDg5S01lcWNIc2tNZjNSRW9sYzdZKzBTanlrV1NpSE9rYzlaREVFTTgw?=
 =?utf-8?B?dThudCt2WnR5bFhIVEk1aXQ2YjN6TDJKcmFsVk40V1drWVN1SWFyWGFKRlYw?=
 =?utf-8?B?Z0RvN0c5bi81UzJmY0VMV1RGN29PZk53QXBxb0pzdlM3WDJDdE4yd01CWkdM?=
 =?utf-8?B?eUljQklaNzV5T2NiakhOKzlZYUpDenpEZXhBTGVxNTRqd3lGaklGRDEvWkkz?=
 =?utf-8?B?MlYxdk0wYlkwTXV4aUtuanNZWndDYWdLYTR6MDRhWHJYeXdaMVpLd2tYSW5J?=
 =?utf-8?B?aXlwbUxaVnFCM1JicVg4bWdRTm5XN1ZzM3lKQjVsUHFwSWVhQkFpN1lvUHpn?=
 =?utf-8?Q?GSDtG+IQ3xb4+a1ZUgAQ0u8Ml?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf9ef4c-6e11-4436-1ced-08dac0ab2469
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:30:51.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vqsnl/1Rtk2uqJUO85mkpcRVwrzde3yOdir3PzPEVvlJt2KFG+sdEdcUK7ebDN/FBC0N0NpUTS4QFwB6upxgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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


On 11/2/22 17:02, Mark Brown wrote:
>> On 11/1/22 20:01, Mark Brown wrote:
>>> On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu wrote:
>>> Right, that's what the code does but why is this something that should
>>> be controlled in this fashion?
>> This machine driver is common for TDM mode and I2S mode, user can select TDM
>> mode or I2S mode.
> Why would the user choose one value or the other, and why would this
> choice be something that only changes at module load time?  If this is
> user controllable I'd really expect it to be runtime controllable.
> You're not explaining why this is a module parameter.

Different vendors/OEM's use the same hardware as one need I2S mode and 
other need TDM mode, using common driver  to support  I2S and TDM mode 
with this parameter.


static int tdm_mode = 0;
module_param_named(tdm_mode, tdm_mode, int, 0444);

And this can be runtime controllable by setting permissions as 0644, we 
will change and send next version patch.
