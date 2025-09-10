Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B156B5181C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 15:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57E860200;
	Wed, 10 Sep 2025 15:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57E860200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757511649;
	bh=ZRkMQV8wkjh9u+fqAUCiFZxDp0+/0SV5F2FpYvSxzCE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y29MfZxWcAITHUl3ppx+EFqIemvTrBCE/yzLw1RX+UOacitYo8BEi10v330rTV8Fo
	 SLD81fI9jswPggcgXQThHtF8YRPhgiKmruss9pc99SkoDHON5wvXcG3h8psjPikum9
	 AN8GfFl9TwTp9xIQtyWMaRZe4kwzgq71u+HTFQ0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514E0F805C3; Wed, 10 Sep 2025 15:40:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF562F805CA;
	Wed, 10 Sep 2025 15:40:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C94F8042F; Wed, 10 Sep 2025 15:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08447F800F8
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 15:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08447F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zrOizkli
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmppn6cO1XZeAvIhRJbpSoPXFkbzusDbskLOMhgGsWAs6wfNT9ylGaiOK5qCuBzM/UkDAMqiHiZFbriY9FaTomTGF4iLoD9trcEAntlWRkXHzEGzyEg86rzckJ91mZTchNeYTON7IHqn5OYP0rgC51arFlzKxLPcCxJMFtp9+CbW+QNEZcQTvyzv4/k+sUj/8rGM9t12u6gSpqLLeujaC8J9sPfu9xNU/35xlrskLj/hYD+11zF4PGoLaaq8PZdJuVvRMvNO7H9Se4OuqBu2vW6XdKyHQO9zkqLpykw0okmLYwEEP/ThzKLxWmV6a2ZPHpCdFRbPfEc2K35kcr6Hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRkMQV8wkjh9u+fqAUCiFZxDp0+/0SV5F2FpYvSxzCE=;
 b=gLwUhzzH70EEgleiBxyr3VWVjfdpsK4kMa+MsJZkubLa1ZHUt6zHBAK01E0FIQKHBwX5g3X2zoPOFKF5i6LLheBII+yBnYHv4g/IuHaiW+b93T7Rku8Vv0/OD/10J2R3zotEG+CX6a7WrrLEbGvLbMCQjYlWkvnkJIS+fJwpvVMn/vqi+YOOOcc+tWIvunHuBfCUab484yrnSXHZ2AVshZpC5QqQqjdkopxhFPCVl5lw4dOWHGqxvArUjOQuGEg34G8BnI/ccv3rj/SZb5tgv4Bbq3FSZb/U3ugASS5Ai+F582iBG6EACHk8nQOfe5gex6l0BwEmW6M7Enp90TE0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRkMQV8wkjh9u+fqAUCiFZxDp0+/0SV5F2FpYvSxzCE=;
 b=zrOizkliUC4HhBAWlyssXP3tMfP2BYfWXAky7r8EqgkL1Tm7TUVqdBFutaspXE6qK2Rc0pcoYXfMby5et7cflrvhuaJ78DMsYZ4JdntyI3geBoFGzDJ7RIy519NOrh1Pe9WItxzmJuUk+wUbSj36VPnkAe/6XC52yQbqvN2N5iI=
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.33; Wed, 10 Sep
 2025 13:40:00 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:39:59 +0000
From: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
CC: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "Hiregoudar, Basavaraj"
	<Basavaraj.Hiregoudar@amd.com>, "Dommati, Sunil-kumar"
	<Sunil-kumar.Dommati@amd.com>, "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
Thread-Topic: [PATCH] ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
Thread-Index: AQHcIVHNgnBOQNmrYkKHPxEtatjNV7SMIxmAgACm/IA=
Date: Wed, 10 Sep 2025 13:39:58 +0000
Message-ID: 
 <PH7PR12MB5951638E3C707F3B97B46567E90EA@PH7PR12MB5951.namprd12.prod.outlook.com>
References: <20250909061959.2881158-1-venkataprasad.potturu@amd.com>
 <0f631a47-d487-4770-a046-af2c33ad670a@intel.com>
In-Reply-To: <0f631a47-d487-4770-a046-af2c33ad670a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: PH7PR12MB5951.namprd12.prod.outlook.com
 (15.20.9094.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5951:EE_|DM6PR12MB4386:EE_
x-ms-office365-filtering-correlation-id: 6022768b-126b-409b-c41d-08ddf06f8938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YTBvS1pXR21wTC8rVDJrSDV0aVE0dXpKbkFQQmUvSjFNMk9vSGV1YXVxOHRK?=
 =?utf-8?B?dE9heVJoRmkrN2RhSjh1dGY3Y1pFbUI1dUFOSlVlQUVLVXhhRFc3QUN6K21K?=
 =?utf-8?B?OTBwMXIwUGQ5alZTYkFCWHhlQWFRRzE0ekgvcmFsUmlVazVER2NnN2s4STBt?=
 =?utf-8?B?cXMzZ21jY2pPcHdBT0M1MDRibmtJaGprMmlCSGZlL2swL1dpSVR0NkNVN2Zk?=
 =?utf-8?B?UWsySDZ2Yjl4WlhSSUVKODZMUHEvYlJLSXFkWXh6Zm5MSGJ6QktCcnE1eDJN?=
 =?utf-8?B?TU80M0tCdnI0QlB6eG1lanRPRWRvc3JJbjlXeXpZSks1RmNNdWFTUlhvVXZH?=
 =?utf-8?B?KzF4THdXRStHcjlBS3U1dGpxS2VxWHZidnJQUTJQTmNUOStadDZmZDBOaWhO?=
 =?utf-8?B?MndEdlhsM0tSZFYzZGplRVNvMXpPbzhPVCtFUm5iL2ZYSnV3M20vNTlwUFU3?=
 =?utf-8?B?cXZpRElGN1dUUk1pcWZhMEtzd1phUU1PVkc2Q3BsTFBZSFRCTWFJcFdDMW9v?=
 =?utf-8?B?ZzA5ems2QXJob0ZQenhwcWluYThLWHBXd2Q0Z2pUb25RNjFXQ3UwZk1Oek9v?=
 =?utf-8?B?QVdabGNVMmk0cDBxaHhDTUhFaUdlVXhOSHkrS3paQkppU3doSGUzOVczelRW?=
 =?utf-8?B?OWtTZ3RBbVp3WWFoa3kwUS9HVWFZT205Ulh3Tis3NUZsak5Vemh1SnA0U2Fo?=
 =?utf-8?B?NCtISjQ3UEtMb1FlUk1pbjFmcTlRa0dWZGRaN21VTEtKRlFuQzl6cklqMTBx?=
 =?utf-8?B?TWpid0VOZXlGaEgrdThvdk1vUVg0WGF1VFFDaGRuY0VaOXUrajJFOUljWmth?=
 =?utf-8?B?MHREM3MrTHYxYWFtclZ5TFNpZmFLWEIwcGFPVmxIVzA4ZUxGVSs4bC9hckNy?=
 =?utf-8?B?bjFoWnZRTXFkdHF3S05SeThvckRsdGhWeVYrTElNOXpWWm9uN3JtY1ZuVjJr?=
 =?utf-8?B?cHc1VkVNVFhLWVZBWjVmcVpYSkpzY3NVNkNLaSsyblN2aHI1Qk5rUmdjMUJr?=
 =?utf-8?B?NHJiVjcrb0ZPZHlKVDgwTGxXbkZseGxyYWF4OWlNSmswNXgvVGgzaWtMS2VI?=
 =?utf-8?B?NkNyQ0xGak1NZHE1aHM4U0VYV1ppUmRIQm10ZUxrRU5IWVR1NGNoTWZVYTBU?=
 =?utf-8?B?Mk1OQ0RrZFpVS3ljYXVzRy9sYmJPZEZWN1FheTVJelVSRmZQZWMvQ0QwUk84?=
 =?utf-8?B?TCsyYm5IdnNhdVcweThFV2FPa0VGbTdQcm1mTXZId0VyRlpla0RodXdBZnRH?=
 =?utf-8?B?SHl0cGZaNUpYUTRIUHNweno2OU9mUDk1aXJndjl0aTJwckttN0ZlSmEwRUVE?=
 =?utf-8?B?STR3dmNiYSs5NzA2TkNxajVxQmhZMVZkbVErQVJhY1dqT2YxS3BiQmtFRHNT?=
 =?utf-8?B?T3o4ZGxQOWpDUFVLclcrR2VEak5lQ1FBa0xSMERHRHBwanJVS1JINUdaQURm?=
 =?utf-8?B?SkRTeXljUDlCeVhUekhLQStqZnE0N2E0dFg5RjJVdWxTa1FBTHpGbllpb1lF?=
 =?utf-8?B?QTR2MWRVRGJGYk5rdEcrWGxqd2pMUlY2eXZMM0RDV3RaRFFsUlZmbnloTVJ1?=
 =?utf-8?B?ekI3SU9oSjVMWnV2UzZjZXRoY292RHJlV3VDbWFoYmp6bjEvdExCVHFtYkRL?=
 =?utf-8?B?a0twODNhWnhBY2p1bzE1Z3RqaUh3VGxnZmtuK0Y2akh0ZlBZVStEK1NFNWxD?=
 =?utf-8?B?bEthUk96aXFjaW1rNTJ3YVUvL0VjSVdVblVoUmdONm0zZFBEdEU2ZG5ORDJh?=
 =?utf-8?B?NU5vcHRRUG43MTh2QlNidmY0YkJ3UDU5a1JkRis2eGhFL1Q5Z3V5SmRpS2Yy?=
 =?utf-8?B?ZWpTZTR3WnlkMEdobDFyYVZQUWNxOWpQWFFzdGVEdUtKMVpJRzdraU8xdlJn?=
 =?utf-8?B?dUtaUm1RaVNodTdoblNlTlVWOUhhK3RlelN0YWNjWUtiVHlYQ21CNEUzczNk?=
 =?utf-8?B?KzQxSC82TjFncXVlY3NRZVptNUh2ZHBKbEZzNVBhbDNwK216dmw0d1RUd1h6?=
 =?utf-8?Q?3GWQuKmQQzdFeRzxYP2XqoDO2YTjKI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWFWczlYVWU1ZWZyaVRhQkVyTVRWQmZBM016OUlqWlN4dDBJV1l5UDYxRmVs?=
 =?utf-8?B?azJERExiajlBb0JtTjRORmx6bXdOSTdLM2hpa29COHpMb05wTHB4dEI1QWR2?=
 =?utf-8?B?Z1Q5aU95NUh6cWhyem9UUjNsOXhlSktGUnJGS2dnZytUekp6NFdoY1JIa01D?=
 =?utf-8?B?R2RrWFhwWWw0UWl6ZEs4OWhldWNlWSsvdDNIWnZxajZqL0lQdjZZcGVpL3RZ?=
 =?utf-8?B?MzBKZk05VUg0V0J3dXBQbWgwT0pueDhSVDZxZzV5czc0cCtqbWZkdHliQmJy?=
 =?utf-8?B?Z0Fjc1hQOTh5RHgzK1dYUUtZeHJ0SGRXdFBSaEJDSWhxUXoxQU81WFJ1T0Rl?=
 =?utf-8?B?SUxJMVl3Y3haelFqWXNobG9ieXArbWgycGpvblVncFcrYjdHblZ5KzEreGt5?=
 =?utf-8?B?bGd3Q2pYWkcwemlvNkZ3R05qaVJRZkNnMFp0WGRzaVlXcmd6UGxjVE5mY2Fw?=
 =?utf-8?B?Tm9UL1lDRkNHeWw3YUt3NUgxcXFFMG9BcGVuMkdleDMrY0pWUVQ4aEJHUERZ?=
 =?utf-8?B?aG50U0hXb2lpRGp6SGM2YlFMaUZmdm9BNmpoSjdjL2ZqQ2dQd0FBNHBkQU1u?=
 =?utf-8?B?aytGazZySE9QUVJPT01oamxudEltbTZWVGZhTk1RMUdiSGlKd0l6QUd3N0pO?=
 =?utf-8?B?OEhUZTBmbTlWYjhlWG4yUXE5U0hNQjZqdkVTNHNDd3ZKYUJiekhISlBvMkdF?=
 =?utf-8?B?dG55NGtRaGM0YVZPdWVPeUE3dTBQd2ZmdFo2aWNjUXFXeUNvSm5CZDROOUlF?=
 =?utf-8?B?VXZyUGtkODNTQzBkc3c3dWJMYXduVzRjajRxc2lETkxNeUhiWVA4VlZHMENq?=
 =?utf-8?B?VUdaVDFkMDFMQnpUVkl4azB5V2ViajB4c0FNa3RRTGdPdDhnalRHOGFmbXRv?=
 =?utf-8?B?TTcweENIUDFLbVNwYkEvTlFNUzZ5eTZzVURXeXNYVmR5OTZYTkc3N3ZxRnBN?=
 =?utf-8?B?U0pFQmRBNkRtQ0h3R1RwUy8wa0xsbWNrSE9NREFYSjNReERwODdzemhPUWpa?=
 =?utf-8?B?b3JrSTFva0ZUWWd4SXdUQ2JsTGhEZEQ2QkliV3NEYk5iSnhrRVAzWDVUcnJQ?=
 =?utf-8?B?VXF6U0dKRCtRVTVoSWZZNVI1WXovUWpwRko2MTZ4WEhFOGJrTFV5YTVrMHFU?=
 =?utf-8?B?YTFqMFMxOWlqRnBnWlNhQTdJVjNuMmtlS3dFdXBtUmNKWkN3Sy9jc253YlUx?=
 =?utf-8?B?cVRrbmhWd3l3NTNZd2dQdldWV0tacnhhQ243YkdIR1BiRnhCb1JjSWo2SXNB?=
 =?utf-8?B?WlozNTdMVU5tTFdrTFRNRnNNUjVXRWFVcHBjUzRmY2UrSm91OFdSY3dYTi9U?=
 =?utf-8?B?VzliN3lqRXZHYWhLNkpYdFUrZlhsdFVnVzBjOHU2SHFxRlp6dThaa29ZNEpX?=
 =?utf-8?B?amRSUGJVTFcvazF2a3loOFh4eGNsZ0VFSGVMTmhPRDIxSW43OVp4bEZ4WERi?=
 =?utf-8?B?dTJMcTgwbmk0b01zYk83Y211UkdDZlcvNjAyMUVFaFl6dU9HY2VyYTBaVTVN?=
 =?utf-8?B?OWpnMXIxbEdsbHNneEFBWHBDKy9jcWRkSVREeklLL0llbnMxeE8xOXA0MW1O?=
 =?utf-8?B?S2tXcWZWcTQ4SkU4YzBIVnpLbDNvb0pHaExLL1UvWXJON2NUVW5SaDJKc3ll?=
 =?utf-8?B?eEdDRDQ3SG1rR2ZHVTJWdnJKYmlzemhjMHlkMmhGRUVrMldOMjRxd0FScXFG?=
 =?utf-8?B?d3ZtbnpYTW1RSzhTOTBTT0U0TEF1Z1RacVl0Q3BvT3EvUmhCZHdBWE5VN0xE?=
 =?utf-8?B?ZW13dGJzNWMzSWdFRHp4OEUrenpQVlFTUU9kd1pFNmtGUFV5QmtoUFhjcFFT?=
 =?utf-8?B?NENZYmFzTHhia0RtZmhMT29tRHE1MDNKV01PdktBemwxQUkyNkNJUS9FcEx6?=
 =?utf-8?B?TkdZSEY1QzJzSWhzV1ZERE5rMHJoU1laNFFhY2piM1dqTjhGVTBpMlczZFdZ?=
 =?utf-8?B?UW1NQUhxckVUQnV3dVlSNmcrNmJzejJ2eDJiaVZUaytZaHZpQ1RSSHlqVllF?=
 =?utf-8?B?Zmg4ZGFEcmR3bkxqaUlLYno0MU5vYVBRTGdxcmxneE9kK0EzSDNwM3RQVjZu?=
 =?utf-8?B?VGl3OUZiM0VWTmNoVUc1UWZuT2RkbFZIU2l2L2lnNSsvSUVmcUc0RXpJb09w?=
 =?utf-8?Q?o1Tg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BA6CA9BC264E440AAC9B697C411A938@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6022768b-126b-409b-c41d-08ddf06f8938
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 13:39:59.0501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 X5o87owELEM+i92SQF7+rJh5Zz+ni98COtVJf77X7uu1wRi3QqZl882fwJJeLRj4DvdITEUmA1Kiuj7pkMljkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386
Message-ID-Hash: AJSCR2BTT2XOTXZYQUGE4JTPJ4W655SW
X-Message-ID-Hash: AJSCR2BTT2XOTXZYQUGE4JTPJ4W655SW
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7LGAUSC46ZLKVRPQL36H4U44U3UW5TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA5LzEwLzIwMjUgMjo0MSBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOg0KPiBPbiAyMDI1
LTA5LTA5IDg6MTkgQU0sIFZlbmthdGEgUHJhc2FkIFBvdHR1cnUgd3JvdGU6DQo+PiBVc2UgZGV2
X2dldF9kcnZkYXRhKGRldi0+cGFyZW50KSBpbnN0ZWFkIG9mIGRldl9nZXRfcGxhdGRhdGEoZGV2
KQ0KPj4gdG8gY29ycmVjdGx5IGdldCBhY3BfY2hpcF9pbmZvIG1lbWJlcnMgaW4gYWNwIEkyUyBk
cml2ZXIuDQo+PiBUaGlzIHJlc29sdmVzIGlzc3VlcyB3aGVyZSBzb21lIG1lbWJlcnMgd2VyZSB6
ZXJvIGR1ZSB0byBpbmNvcnJlY3QNCj4+IGRhdGEgYWNjZXNzLg0KPg0KPiBIaSwNCj4NCj4gJ3Nv
bWUgbWVtYmVycyB3ZXJlIHplcm8nIG1lYW5pbmcgbnVsbC1wdHItZGVyZWY/IElmIHNvLCBwbGVh
c2UgcmV3b3JkIA0KPiB0byBtYWtlIGl0IG1vcmUgZXhwbGljaXQuDQpJdCdzIG5vdCBhIG51bGwt
cHRyLWRlcmVmLCBtZW1iZXJzIHdlcmUgbm90IHVwZGF0ZWQgcHJvcGVybHksIHdpbGwgDQpyZXBo
cmFzZSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uDQo+DQo+IEdpdmVuIHRoZSBoaXN0b3J5IG9mIHRo
aXMgZmlsZSwgbWFpbmx5IENvbW1pdCA2ZDliNjQxNTZkODQgKCJBU29DOiANCj4gYW1kOiBhY3A6
IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWYgaW4gYWNwX2kyc19zZXRfdGRtX3Nsb3QiKSBpdCdzIGtp
bmQgDQo+IG9mIHN1cnByaXNpbmcgdGhhdCB0aGUgaXNzdWUgaXMgYWRkcmVzc2VkIGluIHN0YWdn
ZXJlZCBmYXNoaW9uLiBXaHkgDQo+IHdhcyBzZXRfdGRtX3Nsb3QoKSBmaXhlZCBzZXBhcmF0ZWx5
Pw0KVGhpcyBmaXggd2FzIG1pc3NlZCBlYXJsaWVyIGF0IHRoZSB0aW1lIG9mIHRoaXMgY29tbWl0
IDZkOWI2NDE1NmQ4NC4NCj4NCj4+IEZpeGVzOiBlMzkzMzY4M2IyNWUgKCJBU29DOiBhbWQ6IGFj
cDogUmVtb3ZlIHJlZHVuZGFudCBhY3BfZGV2X2RhdGEgDQo+PiBzdHJ1Y3R1cmUiKQ0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFZlbmthdGEgUHJhc2FkIFBvdHR1cnUgPHZlbmthdGFwcmFzYWQucG90
dHVydUBhbWQuY29tPg0KPg0KPiBObyBuZXdsaW5lIGJldHdlZW4gdGhlIHRhZ3MsIHBsZWFzZS4N
Ck9rYXksIHdpbGwgc2VuZCB2MiBwYXRjaC4NCj4NCj4+IC0tLQ0KPj4gwqAgc291bmQvc29jL2Ft
ZC9hY3AvYWNwLWkycy5jIHwgMTEgKysrKystLS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9hbWQvYWNwL2FjcC1pMnMuYyBiL3NvdW5kL3NvYy9hbWQvYWNwL2FjcC1pMnMuYw0KPj4g
aW5kZXggNjE3NjkwMzYyYWQ3Li40YmEwYTY2OTgxZWEgMTAwNjQ0DQo+PiAtLS0gYS9zb3VuZC9z
b2MvYW1kL2FjcC9hY3AtaTJzLmMNCj4+ICsrKyBiL3NvdW5kL3NvYy9hbWQvYWNwL2FjcC1pMnMu
Yw0KPj4gQEAgLTczLDcgKzczLDcgQEAgc3RhdGljIGludCBhY3BfaTJzX3NldF9mbXQoc3RydWN0
IHNuZF9zb2NfZGFpIA0KPj4gKmNwdV9kYWksDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgZm10KQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSBjcHVfZGFpLT5jb21wb25lbnQtPmRldjsNCj4+IC3CoMKgwqAgc3RydWN0
IGFjcF9jaGlwX2luZm8gKmNoaXAgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+PiArwqDCoMKg
IHN0cnVjdCBhY3BfY2hpcF9pbmZvICpjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldi0+cGFyZW50
KTsNCj4+IMKgwqDCoMKgwqAgaW50IG1vZGU7DQo+PiDCoCDCoMKgwqDCoMKgIG1vZGUgPSBmbXQg
JiBTTkRfU09DX0RBSUZNVF9GT1JNQVRfTUFTSzsNCj4+IEBAIC0xOTksNyArMTk5LDcgQEAgc3Rh
dGljIGludCBhY3BfaTJzX2h3cGFyYW1zKHN0cnVjdCANCj4+IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sIHN0cnVjdCBzbmRfcGNtXw0KPj4gwqDCoMKgwqDCoCB1MzIgcmVnX3ZhbCwgZm10
X3JlZywgdGRtX2ZtdDsNCj4+IMKgwqDCoMKgwqAgdTMyIGxyY2xrX2Rpdl92YWwsIGJjbGtfZGl2
X3ZhbDsNCj4+IMKgIC3CoMKgwqAgY2hpcCA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4+ICvC
oMKgwqAgY2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYtPnBhcmVudCk7DQo+PiDCoMKgwqDCoMKg
IHJzcmMgPSBjaGlwLT5yc3JjOw0KPj4gwqAgwqDCoMKgwqDCoCAvKiBUaGVzZSB2YWx1ZXMgYXJl
IGFzIHBlciBIYXJkd2FyZSBTcGVjICovDQo+PiBAQCAtMzg2LDcgKzM4Niw3IEBAIHN0YXRpYyBp
bnQgYWNwX2kyc190cmlnZ2VyKHN0cnVjdCANCj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJl
YW0sIGludCBjbWQsIHN0cnVjdA0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYWNwX3N0
cmVhbSAqc3RyZWFtID0gc3Vic3RyZWFtLT5ydW50aW1lLT5wcml2YXRlX2RhdGE7DQo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGRhaS0+Y29tcG9uZW50LT5kZXY7DQo+PiAtwqDC
oMKgIHN0cnVjdCBhY3BfY2hpcF9pbmZvICpjaGlwID0gZGV2X2dldF9wbGF0ZGF0YShkZXYpOw0K
Pj4gK8KgwqDCoCBzdHJ1Y3QgYWNwX2NoaXBfaW5mbyAqY2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYtPnBhcmVudCk7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhY3BfcmVzb3VyY2UgKnJzcmMgPSBj
aGlwLT5yc3JjOw0KPj4gwqDCoMKgwqDCoCB1MzIgdmFsLCBwZXJpb2RfYnl0ZXMsIHJlZ192YWws
IGllcl92YWwsIHdhdGVyX3ZhbCwgYnVmX3NpemUsIA0KPj4gYnVmX3JlZzsNCj4+IMKgIEBAIC01
MTYsMTQgKzUxNiwxMyBAQCBzdGF0aWMgaW50IGFjcF9pMnNfdHJpZ2dlcihzdHJ1Y3QgDQo+PiBz
bmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kLCBzdHJ1Y3QNCj4+IMKgIHN0YXRp
YyBpbnQgYWNwX2kyc19wcmVwYXJlKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFt
LCANCj4+IHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWktPmNvbXBvbmVudC0+ZGV2Ow0KPj4gLcKgwqDCoCBzdHJ1
Y3QgYWNwX2NoaXBfaW5mbyAqY2hpcCA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4+ICvCoMKg
wqAgc3RydWN0IGFjcF9jaGlwX2luZm8gKmNoaXAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJl
bnQpOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYWNwX3Jlc291cmNlICpyc3JjID0gY2hpcC0+cnNy
YzsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFjcF9zdHJlYW0gKnN0cmVhbSA9IHN1YnN0cmVhbS0+
cnVudGltZS0+cHJpdmF0ZV9kYXRhOw0KPj4gwqDCoMKgwqDCoCB1MzIgcmVnX2RtYV9zaXplID0g
MCwgcmVnX2ZpZm9fc2l6ZSA9IDAsIHJlZ19maWZvX2FkZHIgPSAwOw0KPj4gwqDCoMKgwqDCoCB1
MzIgcGh5X2FkZHIgPSAwLCBhY3BfZmlmb19hZGRyID0gMCwgZXh0X2ludF9jdHJsOw0KPj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgZGlyID0gc3Vic3RyZWFtLT5zdHJlYW07DQo+PiDCoCAtwqDC
oMKgIGNoaXAgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+PiDCoMKgwqDCoMKgIHN3aXRjaCAo
ZGFpLT5kcml2ZXItPmlkKSB7DQo+PiDCoMKgwqDCoMKgIGNhc2UgSTJTX1NQX0lOU1RBTkNFOg0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkaXIgPT0gU05EUlZfUENNX1NUUkVBTV9QTEFZQkFD
Sykgew0KPj4gQEAgLTYzMiw3ICs2MzEsNyBAQCBzdGF0aWMgaW50IGFjcF9pMnNfc3RhcnR1cChz
dHJ1Y3QgDQo+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBzdHJ1Y3Qgc25kX3NvY19k
DQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhY3Bfc3RyZWFtICpzdHJlYW0gPSBzdWJz
dHJlYW0tPnJ1bnRpbWUtPnByaXZhdGVfZGF0YTsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmlj
ZSAqZGV2ID0gZGFpLT5jb21wb25lbnQtPmRldjsNCj4+IC3CoMKgwqAgc3RydWN0IGFjcF9jaGlw
X2luZm8gKmNoaXAgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+PiArwqDCoMKgIHN0cnVjdCBh
Y3BfY2hpcF9pbmZvICpjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldi0+cGFyZW50KTsNCj4+IMKg
wqDCoMKgwqAgc3RydWN0IGFjcF9yZXNvdXJjZSAqcnNyYyA9IGNoaXAtPnJzcmM7DQo+PiDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBkaXIgPSBzdWJzdHJlYW0tPnN0cmVhbTsNCj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgaW50IGlycV9iaXQgPSAwOw0KPg0K
