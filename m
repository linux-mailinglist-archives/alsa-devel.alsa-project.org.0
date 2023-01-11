Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72747665D78
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 15:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0231FE811;
	Wed, 11 Jan 2023 15:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0231FE811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673446504;
	bh=ltELEq0rIqlQ7btiEZz8rGwoc3WKv1gCqP3XZTGWjc0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jT79i1X9lZ/giU0+I2+SPKRFM19AL5/IyVPugxZp65PufRft8WEEW6C4gBHzkj/LC
	 rv+Oli0r5349/DtlctJ0nuWUBRQrgwWdfsEVsrrdz+vys6DT+EDaRvmBN496YiTJaM
	 iWZ6BfgwHWECLjSwS6q/0bmRxTkTriI/SyA7mlTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AB3F8030F;
	Wed, 11 Jan 2023 15:14:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 944EBF8030F; Wed, 11 Jan 2023 15:14:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C4E3F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 15:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C4E3F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2orbtGIH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE7O+VBjz9QW3Im+NVugNgvVkAAsTYCmCBLGGcb6k+ROwwzKAFJAxxCgV+Thhw3mCow6rZkBjqFZTC29eGDeHGGRGEo2UXVyVYHqYUN0LfHBxOlzcS0T28p1kGozf3Jocl+roCwOF+uosTGTInO7R3M//NM2vZd+wfoAXOSV0FelzSLGLwzL6o6fHMLecBiSUInO+kGgMIA44C8SUfboEeFAZLYT789fAaVfpq0qjFaPGFjQp6bKBYP6lHyB8txU5tTiYNj321MvTqtTTRMKyqP1Jwrn0+mOC6c4Gsv3091bbrbsCaVcMsCsUP4B/1zbiaMbAuLYNbZgsdaA/aeSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltELEq0rIqlQ7btiEZz8rGwoc3WKv1gCqP3XZTGWjc0=;
 b=XcrbE7RIVSLAjLkvFNBm6EWGoK9HLKdlol92oFB6ct2b3MLfMvoum3XxAKdnJuLBLTRky4ochszHW/TK4FJ1kJezQ8/3HAK3FSGrs/VnKrL3a+OZpohhVP9AWTUA3cbvtxPKmL22ddKAjkMiTh53JN2FKoZ1o9KmEp+kO122ManHjiTnAHTIyPArH15DgrPU+RioUkuYLK0WKUMfQZ1jLQRF/8emA4YwzL9BzkO4uTtJgbo35+JH5H1YaY8v2SLymt5B7UJQqC99G0Nsym5UBQJVrJpLw5B2YCJJRTeNBsib15wQTpu2wdhBS/bJImRdqeyxsGibOpGsjkkwtljahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltELEq0rIqlQ7btiEZz8rGwoc3WKv1gCqP3XZTGWjc0=;
 b=2orbtGIH9vqqsOQUfCFq2OLNk8m7HYjO1nq1ZaRlaVLf7glYJuFxDoDEc7jQgdi3TxK9/Fq7apdf3iR8ErS0pLpB3H20rgILzTMCJ6j0jZWtcIuttsgpiYjiXuTMG+I+GnCyYNcMq0dxJmOyxo0r68rNMzmHAJ+N3AF96+k/xCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:13:55 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866%5]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 14:13:55 +0000
Message-ID: <2e5dbd97-b4ea-3846-b9a4-67b0064ad4e4@amd.com>
Date: Wed, 11 Jan 2023 19:46:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/19] soundwire: amd: Add support for AMD Master driver
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org, vkoul@kernel.org,
 alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-3-Vijendar.Mukunda@amd.com>
 <5dfc3961-206c-5a42-b648-74944de9212f@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <5dfc3961-206c-5a42-b648-74944de9212f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BN9PR12MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 579c8f38-a1c0-4726-9eab-08daf3de12a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uc8tu0WJ17/95K2LIchyJwd1JX8aRZVFpgRJ8WEJdRPHWiz5iTc/KUJeEf7XLFf6wuRTl6GzKCs94bgysN0PTBNjLO74YFSRzpHLzEsdE/dd4ga+/w6mEVqruqCc1L43IA0oUf1DTYIl/H7lESZj2807gE0WgUiMdw+LVsOxJHAvx2M8BEjDaJ3VET9dvYbQEeFZG5GI5Hk2SZUBx74paUPoIh+SHN8ClAo1XYivkdycGHZMQitIrOfnW3ugp4LSAzxzXRCL+4MvrVpzx55eK5uUvfTr7+xvnzn0G1wNHPceW1WRWAGRu+FNmVg+eLNn+bU+qwy1847Y4qrpenRZear3ZLmDsxP7MpGM4aPezFyElV4JFCfQQLqLD5IdE4u+AFUJdxP10s/HdWckYU1/M3Ihzhw8/e1nX5T4p8kI16TxJfIWLtw5zdPNW7QJLNU/nM/lwuyr4s2bBTd+8b0mV/M1MdwCXR4uzjzcd0DScUp7YPMDYgrDiGMcVSL5pHo/c9EzCDgQBOzYVDauu1KDjJiV1scRhvfob1N3hI/QFr6ayHhHyd4yF5qLtjaCtXFQ2h4UFvoEXGtjHw05GnHN5B1CJZTJKBbJJKNFdn8uN8hf1hHw+bz2t5wpAMC2tqJiNgsW8iB79pGXsC9+SZWR3BYr0Fe/tD558fw9ha3o8qugUmYaWM+R0Er2nfh2/kevRRFV2mQi/VEMMui4mrQKr0Sj9mm7oc/t2bPtuZoGEKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(66574015)(316002)(4326008)(66556008)(8676002)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(53546011)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29iOTZHOHNFQ3NDTTFsUUhDTFRVRkZGNnYrVFV5cWdFM3RTakdUOHNCeTc3?=
 =?utf-8?B?eTV1Vlg1T1pPN3lFbnRzUVg2N2RUa3dJS0pNd0xZSU5nSHFNMmp2dlN3OUlQ?=
 =?utf-8?B?VEZwOGRYeWNYbUNGMTEzazhWN2NkdTFOZ0hJamg2dWk1WU0rTWFpOGMzWnN5?=
 =?utf-8?B?SVZpRCsrOE42TloxSjNuaVFVZGtwa255cG9kSWtNbWhsb1ZkTlZuMmNURC95?=
 =?utf-8?B?NkZqQThndnc0OGZQK0hveG9ocXZVdTFkVzZkMmozVGVIVnZSZTFBVVAzTTht?=
 =?utf-8?B?UlBjNVBsNCtydGl1QUREWmlWc002UnJuRjlGRXlQZWZ6QjVxSTE5Lzd3YVU4?=
 =?utf-8?B?WDlzU1VQR2xjRmExeGM0QXdSeEUwb1QvMWtRN21TeXZRM1lPVzNRUnlBNmVS?=
 =?utf-8?B?eC9GTzFvOW0rSVRoenFXRHNnTFpPQ0JFKzN2Tjd1WmNPdkU2a3BuNmlIbFQ4?=
 =?utf-8?B?WXNzL3pOQVYyUjJCeXE3WmtKK3NJaS90WHZxWVVuMmc0SGlSZHBudG5JNzgw?=
 =?utf-8?B?YUY2OXgybWY2UEFxbHhCME53TDdLYUZ1R3RIOGtmSjNqenpxODl5aVYram9Z?=
 =?utf-8?B?VWVueEN0bC8wdDJqTEIyZ0U1MGU2ZmRaRGEyRXUvK2llL0NnWHYzVFl6SEFE?=
 =?utf-8?B?eUEzT2d0Z05zSy9OZFZCWjFhNXFRUi9RVmNuMk9xTG5Rd0c4aSt5Z3ZINTNl?=
 =?utf-8?B?MmxWYnV3SHBDanJJREExK0FqU0tnZXNWb2NlODg2U3FqNndOUEpnYVIrOGU1?=
 =?utf-8?B?VGlOTkduTENvRnFRZ2xpZWJYUWZmdER5VVBET3h0WjdmR204RmRzYU9sRmF2?=
 =?utf-8?B?cEE2QjFxaG5PYnhDTGV2MXB0cW9mRlpZV2wvU3NsMFkwRlNhZkh4Z3Yzd1FE?=
 =?utf-8?B?UkdlMmtMMmd6NnlwUENucE9FblhQc0RyZ0lBdFZKUURvdnFSZGxRTy9TOWxj?=
 =?utf-8?B?KzRMK0lhUlg3ZVk5ZVBWMm5IS0xIbE5YOFlKbjVCUXVmbTIrRDMvTGIyOWQ2?=
 =?utf-8?B?WVJkL3ljaU9WV09rYlREUHl6Z2g0QTFkK3lQZnZvcFVRSUoybTNoVklDWFZy?=
 =?utf-8?B?K3NscEVEZnVmcndjWTNHbDRpVzFSZkFSVEJQRCthQzFJQjA3MVBwMTN6elB4?=
 =?utf-8?B?MFRDdkp4R1V1UCsySGZyTEZCQ2d0UVNHelRqemI0eGN3Vjd1UTJxNC9POXVp?=
 =?utf-8?B?dVRldm1PaEhjWndsYlc4TS9QdHVtczdIZWkrNTB0aEZVZFhCMkpJemhITHVF?=
 =?utf-8?B?N1VOQnEvODM4ZllPVnJoakZrM21qYWZJOGt2NXkwejROVHJNN0pOSHN3bVV4?=
 =?utf-8?B?OGZmWVpuQ29qZWhLU285MGdaU0tMdzZRNlRGVlkyTlhCUllZdnB0VEhDYUti?=
 =?utf-8?B?U3dCZUZqeDM4SjZRK2R1RXhMYnFyU0IzNW9Sd0d5NksraXczQXp0MlVxbE1X?=
 =?utf-8?B?c2xvZXBsMW9mbzRkcTh4VWloZHh0Mm14QyswenlOTUdSdWtrSDhtYlN0THRm?=
 =?utf-8?B?MVF4allDbkNYR0pRdHd1Z1FRaU14WVdub2RmRUY2Z2pTa0pueDQ0WHpHMGJ4?=
 =?utf-8?B?VTlhclVUcDdxbm5ZVk93c0ZLSElwVXF0MmZKZHBSUERIWGtQZVFhL1Rqb3VT?=
 =?utf-8?B?MU9kaDZ3cG1qOXVDcytEN3RKc01YTWJLV3l6L2U3dVVwWUIxd0RQenVSc21z?=
 =?utf-8?B?cXhOdDVuRmpPZzdTZzlpVjU3dXQrTU9PQTNkS2NTYk83UzdaSU9FUWVpclBR?=
 =?utf-8?B?a2hXUjVyVVVobmtHcHNXWW9saHkrcmdZcWlNNW56NXVDdHA1Vmg5dXVCTHFO?=
 =?utf-8?B?YURLVnk5cjdIVnJickFIZ3lwV0dWRlFTVTFWcXhLWVh4dDZIRHFEWm1iOGFK?=
 =?utf-8?B?UzZzbTc1T2EvSjR5NkhER0tkMVZmMnl0VWdpcG1lbEk3RDRQM1UzckxKZ3V6?=
 =?utf-8?B?aHBsMGNoUkVtTlI4TkxYZDNjMkcvUVpsMHl4R21qM0FuaEl2QlhnTnIwblBq?=
 =?utf-8?B?WU52cU84UUhLeVcyWUJQck9scmlZUTNaNit2ZHdJKzV3TFNqWkhCdElVeWQv?=
 =?utf-8?B?eThFWHVtbVQrQTFXOWxIYk8vUlNQMEVoUUhXU0xrSzdCWU43Y1dldkx4TDZX?=
 =?utf-8?Q?zU8wEc7EEKqlaeoa83duQG1KM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579c8f38-a1c0-4726-9eab-08daf3de12a4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:13:55.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOCNx0MyQc50n5HgWRkrnFcJ/zD44YVfWday4rI3QDrPz+15pKSmktyNImSvZdPSOYhj5HGZk3Q3W0/mzE9nXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/01/23 19:29, Amadeusz Sławiński wrote:
> On 1/11/2023 10:02 AM, Vijendar Mukunda wrote:
>> AMD ACP IP block has two soundwire controller devices.
>> Add support for
>> - Master driver probe & remove sequence
>> - Helper functions to enable/disable interrupts, Initialize sdw controller,
>>    enable sdw pads
>> - Master driver sdw_master_ops & port_ops callbacks
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>
> ...
>
>> +
>> +static int amd_sdwc_compute_params(struct sdw_bus *bus)
>> +{
>> +    struct sdw_transport_data t_data = {0};
>> +    struct sdw_master_runtime *m_rt;
>> +    struct sdw_port_runtime *p_rt;
>> +    struct sdw_bus_params *b_params = &bus->params;
>> +    int port_bo, hstart, hstop, sample_int;
>> +    unsigned int rate, bps;
>> +
>> +    port_bo  = 0;
>
> Double space before '='.
will fix it.
>
>> +    hstart = 1;
>> +    hstop = bus->params.col - 1;
>> +    t_data.hstop = hstop;
>> +    t_data.hstart = hstart;
>> +
>> +    list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>> +        rate = m_rt->stream->params.rate;
>> +        bps = m_rt->stream->params.bps;
>> +        sample_int = (bus->params.curr_dr_freq / rate);
>> +        list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
>> +            port_bo = (p_rt->num * 64) + 1;
>> +            dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
>> +                p_rt->num, hstart, hstop, port_bo);
>> +            sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>> +                          false, SDW_BLK_GRP_CNT_1, sample_int,
>> +                          port_bo, port_bo >> 8, hstart, hstop,
>> +                          SDW_BLK_PKG_PER_PORT, 0x0);
>> +
>> +            sdw_fill_port_params(&p_rt->port_params,
>> +                         p_rt->num, bps,
>> +                         SDW_PORT_FLOW_MODE_ISOCH,
>> +                         b_params->m_data_mode);
>> +            t_data.hstart = hstart;
>> +            t_data.hstop = hstop;
>> +            t_data.block_offset = port_bo;
>> +            t_data.sub_block_offset = 0;
>> +        }
>> +        amd_sdwc_compute_slave_ports(m_rt, &t_data);
>> +    }
>> +    return 0;
>> +}
>> +
>
> ...
>
>> +
>> +static int amd_sdwc_port_enable(struct sdw_bus *bus,
>> +                struct sdw_enable_ch *enable_ch,
>> +                unsigned int bank)
>> +{
>> +    struct amd_sdwc_ctrl *ctrl = to_amd_sdw(bus);
>> +    u32 dpn_ch_enable;
>> +    u32 ch_enable_reg, channel_type;
>> +
>> +    switch (ctrl->instance) {
>> +    case ACP_SDW0:
>> +        channel_type = enable_ch->port_num;
>> +        break;
>> +    case ACP_SDW1:
>> +        channel_type = enable_ch->port_num + ACP_SDW0_MAX_DAI;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch (channel_type) {
>> +    case ACP_SDW0_AUDIO_TX:
>> +        ch_enable_reg = ACP_SW_AUDIO_TX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW0_HS_TX:
>> +        ch_enable_reg = ACP_SW_HEADSET_TX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW0_BT_TX:
>> +        ch_enable_reg = ACP_SW_BT_TX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW1_BT_TX:
>> +        ch_enable_reg = ACP_P1_SW_BT_TX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW0_AUDIO_RX:
>> +        ch_enable_reg = ACP_SW_AUDIO_RX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW0_HS_RX:
>> +        ch_enable_reg = ACP_SW_HEADSET_RX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW0_BT_RX:
>> +        ch_enable_reg = ACP_SW_BT_RX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    case ACP_SDW1_BT_RX:
>> +        ch_enable_reg = ACP_P1_SW_BT_RX_CHANNEL_ENABLE_DP0;
>> +        break;
>> +    default:
>> +        dev_err(bus->dev, "%s:Invalid channel:%d\n", __func__, channel_type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    dpn_ch_enable =  acp_reg_readl(ctrl->mmio + ch_enable_reg);
>
> Double space after '='.
>
will fix it.
>> +    u32p_replace_bits(&dpn_ch_enable, enable_ch->ch_mask, AMD_DPN_CH_EN_CHMASK);
>> +    if (enable_ch->enable)
>> +        acp_reg_writel(dpn_ch_enable, ctrl->mmio + ch_enable_reg);
>> +    else
>> +        acp_reg_writel(0, ctrl->mmio + ch_enable_reg);
>> +    return 0;
>> +}
>> +
>
> ...
>
>> +
>> +static void amd_sdwc_probe_work(struct work_struct *work)
>> +{
>> +    struct amd_sdwc_ctrl *ctrl  = container_of(work, struct amd_sdwc_ctrl, probe_work);
>
> Double space before '='.
Will fix it.
>
>> +    struct sdw_master_prop *prop;
>> +    int ret;
>> +
>> +    prop = &ctrl->bus.prop;
>> +    if (!prop->hw_disabled) {
>> +        ret = amd_enable_sdw_pads(ctrl);
>> +        if (ret)
>> +            return;
>> +        ret = amd_init_sdw_controller(ctrl);
>> +        if (ret)
>> +            return;
>> +        amd_enable_sdw_interrupts(ctrl);
>> +        ret = amd_enable_sdw_controller(ctrl);
>> +        if (ret)
>> +            return;
>> +        ret = amd_sdwc_set_frameshape(ctrl, 50, 10);
>> +        if (!ret)
>> +            ctrl->startup_done = true;
>> +    }
>> +}
>> +
>> +static int amd_sdwc_probe(struct platform_device *pdev)
>> +{
>> +    const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
>> +    struct resource *res;
>> +    struct device *dev = &pdev->dev;
>
> Same as in previous patch, you assign dev here, but keep using &pdev->dev below?
> will remove dev.
>> +    struct sdw_master_prop *prop;
>> +    struct sdw_bus_params *params;
>> +    struct amd_sdwc_ctrl *ctrl;
>> +    int ret;
>> +
>> +    if (!pdev->dev.platform_data) {
>> +        dev_err(&pdev->dev, "platform_data not retrieved\n");
>> +        return -ENODEV;
>> +    }
>> +    ctrl = devm_kzalloc(&pdev->dev, sizeof(struct amd_sdwc_ctrl), GFP_KERNEL);
>> +    if (!ctrl)
>> +        return -ENOMEM;
>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +    if (!res) {
>> +        dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
>> +        return -ENOMEM;
>> +    }
>> +    ctrl->mmio = devm_ioremap(&pdev->dev, res->start, resource_size(res));
>> +    if (IS_ERR(ctrl->mmio)) {
>> +        dev_err(&pdev->dev, "mmio not found\n");
>> +        return PTR_ERR(ctrl->mmio);
>> +    }
>> +    ctrl->instance = pdata->instance;
>> +    ctrl->sdw_lock  = pdata->sdw_lock;
>
> Double space before '='.
> will fix it.
>> +    ctrl->rows_index = sdw_find_row_index(50);
>> +    ctrl->cols_index = sdw_find_col_index(10);
>> +
>> +    ctrl->dev = dev;
>> +    dev_set_drvdata(&pdev->dev, ctrl);
>> +
>> +    ctrl->bus.ops = &amd_sdwc_ops;
>> +    ctrl->bus.port_ops = &amd_sdwc_port_ops;
>> +    ctrl->bus.compute_params = &amd_sdwc_compute_params;
>> +    ctrl->bus.clk_stop_timeout = 1;
>> +    switch (ctrl->instance) {
>> +    case ACP_SDW0:
>> +        ctrl->num_dout_ports =  AMD_SDW0_MAX_TX_PORTS;
>
> Double space after '='.
>
will fix it.
>> +        ctrl->num_din_ports = AMD_SDW0_MAX_RX_PORTS;
>> +        break;
>> +    case ACP_SDW1:
>> +        ctrl->num_dout_ports = AMD_SDW1_MAX_TX_PORTS;
>> +        ctrl->num_din_ports = AMD_SDW1_MAX_RX_PORTS;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +    params = &ctrl->bus.params;
>> +    params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
>> +    params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
>> +    params->col = 10;
>> +    params->row = 50;
>> +
>> +    prop = &ctrl->bus.prop;
>> +    prop->clk_freq = &amd_sdwc_freq_tbl[0];
>> +    prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> +    ctrl->bus.link_id = ctrl->instance;
>> +    ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
>> +    if (ret) {
>> +        dev_err(dev, "Failed to register Soundwire controller (%d)\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +    INIT_WORK(&ctrl->probe_work, amd_sdwc_probe_work);
>> +    schedule_work(&ctrl->probe_work);
>> +    return 0;
>> +}
>> +
>> +static int amd_sdwc_remove(struct platform_device *pdev)
>> +{
>> +    struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
>> +    int ret;
>> +
>
> You may need to cancel work if someone tries to unload driver before probe work completes. Something like
>
> cancel_work_sync(&ctrl->probe_work);
>
> should probably work here.
will fix it and post the v2 patch.
>
>> +    amd_disable_sdw_interrupts(ctrl);
>> +    sdw_bus_master_delete(&ctrl->bus);
>> +    ret = amd_disable_sdw_controller(ctrl);
>> +    return ret;
>> +}
>> +
>
>

