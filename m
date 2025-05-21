Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77EABF822
	for <lists+alsa-devel@lfdr.de>; Wed, 21 May 2025 16:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1D6601E0;
	Wed, 21 May 2025 16:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1D6601E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747838817;
	bh=CfvXDNQa+y7HGm+EJJX88NAA782jORG3/+M613lVVpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=twFMcS3tIshZ6OyYZRv6X3m63ApGaxCYdsIMy2f+8yrJty+3AtQyVSFGCb17VGHrv
	 skcWjKvlPrkOs+Pv1TLTAom4SE70YdASWWlQ0RN69ogISHL0oN0IIzVSKmuKRn9shp
	 4Qk0FXsfXCEdRgAGbIe5DQB9cuN8s5fP/QvEUEZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770F4F8057C; Wed, 21 May 2025 16:46:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34597F8055C;
	Wed, 21 May 2025 16:46:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5160AF80553; Wed, 21 May 2025 16:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A274F80269
	for <alsa-devel@alsa-project.org>; Wed, 21 May 2025 16:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A274F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Oxv1i8Yk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEHnHPi4bNTP890vXRXtWCUQPKQZ2LMs5Jzn5A5GU+WiIlnM//DbpkMgWsYBXD++L/G3s0Rcg9uzLbqNFMoNXQNd0O1L2u5RoSJluhQFMEWiNSydcFnbcbYMKfV1bLwCNYUnSv8c1VLAlN3pxQ+4NiixnMdNo8gneSp51ihpjzc6ssk3vjcrSMHb1TvTibpZLOZ0GgZ+G1nH+tJcoBelNJR0nVw2MKCsjjVhk4dCnLauZ1pcQEBtV/BoArQGCFtYxyO/Pe+q0Or2zF77Ag2Q6GBWBoYYoggmHOGMjOlplIjpsVV/Eq5mpssXSK354oNIINJYE/Xa5LGheOSyk01RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ocD4l7p42o86eDXo3IHMwMQVY0EJ7QdKmqgPH8iQs4=;
 b=QtoFVzRzvpvHDAEyJlyGl5kIVll3fb+4dPCO5TQbB/4MXyxHk6/Vx4anT35usq813UKvAnc1zoItN4jEoP/YS0kDcUBwVEH/rp2a0IsOqJqtcTGp8Js9GUwP3IexiZN2aqMmvjY/3v7j1rjMNsgadvC0u0JdIAxV2WAOWO4Ctyz6X+X8O6Bk/SYQObdo1vojtI41VrHfQI+2YBa82xIfRnoFlXhF5Z0nELQ3UHfxN+SspKsvRKVJIvnZWcLSnMfe2qjD7GQyaYgTxpt73jemTzqbY8lYErZnJE5zse8tHxT2sPVOaO82EcfT5Cd+gmub4MER9JIpjOjaGB85MowwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ocD4l7p42o86eDXo3IHMwMQVY0EJ7QdKmqgPH8iQs4=;
 b=Oxv1i8Ykj4X2RGTLngqPnBKpanzAGcJIUNRJZ4OQWeupU8xeWTE7h+qYafPkUuH84EGven8Fv4ZAonTAR1TD+fAixD5UwkRT64a3wcp110DuW05Wlnz1VWXm0CyTTpStaoMObOnBcOdLW98nBdjLcGvlLy/LlT4NK7Op32+hulWTL3LsM69LsvyhJ5kdXak8j6YwxYbQLUiDL3YnxngzWjAcLRJUr2LFifPWVPzOz3JEVnJyfCxHHK1Qoqj3sideLiyDcHOsIiSTjwNr2iPxIbLd3RV0uJcBoKVOWSAOCr3zte1Elx2YKmrL42ba0vihlVp6apaM2LNEEc5z5vcqJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.19; Wed, 21 May 2025 14:46:10 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:46:10 +0000
Date: Wed, 21 May 2025 09:46:08 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
Message-ID: <aC3nMHjiSoROekkP@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
 <87zffdvvj6.wl-tiwai@suse.de>
 <aCcjbp717oux8hA6@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCcjbp717oux8hA6@ddadap-lakeline.nvidia.com>
X-ClientProxiedBy: SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::6) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 04044c3d-589f-42b1-f321-08dd98763a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M/eF+H5uDqWCxwsuUID2G0+DhjEfsgUM6XC3XsgNxsOD/pDGpu45pWiGy0UK?=
 =?us-ascii?Q?ujmrSEXmbEg2Uc9zPtPbvPSWIMqOKaboD21S4kADMim3/ee1J13d3XexKbJJ?=
 =?us-ascii?Q?I/W+QWqJruaH7CQDrRwpQyjPrlQo564ud2pW7K39dMBIF5W4ynwOdmNM8KsZ?=
 =?us-ascii?Q?UY0qb01aVpcccjqZOMqqPDUlzdb0wqdHLuHEyjxmbWus/a0CjcQyyfF7jDi9?=
 =?us-ascii?Q?6r3Gnb6NnZ6PGWVbxDMvUQ9h4xJyJbe9JsvkYoSx/6lwNXLxzUjBq2Vs8ULF?=
 =?us-ascii?Q?rXCzi6keUA6/HBWGKqdbhUL4kxjaX3zO61fY6xQ0MHl0VAEKPZbtRoitM5c0?=
 =?us-ascii?Q?oXOh3RAiI6OuTyGkMMPyrsU11ATrel7kELoMao3q6DKoOqsUx7wWFaIot+ZV?=
 =?us-ascii?Q?WwHrIC7Zlr2TCXhyzVjnjKeHA+spzy8e03VyOJdJLm7HPvAa1emC4KZyq31o?=
 =?us-ascii?Q?OZrCYWkkkZ09D6KoxcL0x2WRbDboCHMLND4tgmPyAEhTPD5MEfQxhd5kMtd3?=
 =?us-ascii?Q?PIJa6rC2PcdyRnQKCJvm9rUk2OGW3O8xdoC5UOenf4CXuKaurUkEp0jK4AH8?=
 =?us-ascii?Q?aDzvhdYNkCpopFfVhV8zUDh6CvjX99zWmOjv26qD72sbPXgjhCvKZMM3L/W4?=
 =?us-ascii?Q?gaOJeeY9MF9r6agWBDIOr6jAumAj7SQaV68lXdwT9NV9PvUFxm+ApIrLYTiD?=
 =?us-ascii?Q?haSfEQ4s/SEuk1b2CZVJwXxOXmq8YDijGHMiY3/0TJtwHK9p/Jq95XvaVvHi?=
 =?us-ascii?Q?AJldZN/uEYrGv4cs0DaNPIYBQqoRmSr5apWTLFPfpoY0oaB8YPdHdaT9TM8V?=
 =?us-ascii?Q?EXYXTlOjZ7AjZqIoRUBxshXsPUgAkqlChP1zHdVeF7w9nG0Rmqtm5gQVAmpu?=
 =?us-ascii?Q?s6VN+NHXPvblU8Q5N0J2bSVTOSUkjiNqWVaD+VyQZkvaVggVgZUXmqBl0pc9?=
 =?us-ascii?Q?TTwr8nEUdwlNivTqqYI0D3H+ybKdvvs+HzGRuMLJG1lHOPNDcOyXOABgQ59T?=
 =?us-ascii?Q?bum9NP3sPFwmHdDjQwjwga+OAmbi2RtHguHveIrZNiU72sMnrBRFbICXHUIl?=
 =?us-ascii?Q?wmyd/1so165ChgjOzCyDUK1daBb5FN9Y1zv5QXxkZIE3dMvyBMKidzftLeyu?=
 =?us-ascii?Q?1LxHSXkMvh4M3XTO4GlRXvTBFyyA8SNwhrN8sRrva3OPKpxhDgKa6we6JyzF?=
 =?us-ascii?Q?It5VTpVWGlxMemwBrm0mMjZeTYvy748Y5aSP8XxXx5ImESJY/9eWwkC99Tjb?=
 =?us-ascii?Q?RADf4uxxcCSoUtRhaLGTmBwG2tLd4KygCp2MQAj6sF3Tds0S6TYwmX/EIYXJ?=
 =?us-ascii?Q?RVtyD3I4POCFA0UEKLzAK9zUGAHB2k15wIG90EgxsjIl+ZmBa5r8UjEUx9Rf?=
 =?us-ascii?Q?MvMq898DPHMnxXMW9Aygn/SpMKkWYu+SJTtvVL9sFsTk+xOHsYFZeAsrIzOH?=
 =?us-ascii?Q?8EX26kpbqpE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RyaJYc1OzDBNPCxhvqmtqt4TmkvButq7g+zXBkmSo9dXFWznxgU3uAyhWwk5?=
 =?us-ascii?Q?ZFpFs0+nfmiORLCPbE1HsnAo+FCz1lWnzO1XkAr6EAngToZ5gYAfdxaF8QLo?=
 =?us-ascii?Q?Jy90zSni8tAJ3TMFgeas0KHUpaaXBaZUk3zRlHlh/RfMle2hrLlaYOS3Rruy?=
 =?us-ascii?Q?Ps7a5BrISOxtMTtFdG7zap1v5J50sa/1ZdSUQlmMItvpP4JG20jx5552gDZn?=
 =?us-ascii?Q?KbrLLmMGKbFzsQyz0kmcsmKUhhOP4fA0nr/hYkE+p3yNvYT5ZrWAGj+l8jT2?=
 =?us-ascii?Q?lZi6R5ZdLFaml8uyIzpo5AwScmSKZcojyxsPVdlyFmhe85N0BpJiqkBsjcPy?=
 =?us-ascii?Q?WTOdu4jidKvOiZfD1yVjN4Y5mOLDHtj54d+QRct+Y+qMqWQiTH1OQQcmaU0X?=
 =?us-ascii?Q?vVNpTald9hD7aCP8lTkz8pbEWD932TklfoMHWpNwM7/0/7oV2Ne5WEpNOtmN?=
 =?us-ascii?Q?IxRj4tTdKmssvfw1mCNCvkqJh5Eujuktt/tKJnK+7ESQiVfQQZccxLQzX3ZE?=
 =?us-ascii?Q?VuOqf+QQowxx193QfXBoxXcRNIyeqCH9gu1RhyL2woaKFm8cVmP0x/SYecph?=
 =?us-ascii?Q?UVDXmXwVrVf6ewTag9FJAUTTBeiba7oVJNybRWLgaWdnjPTJ4l+8tm5rbulD?=
 =?us-ascii?Q?mBJtG3be/pUNrm5JDRgXkYSJQSqfIXTw42cRLe82vPEAsUCTCPUyLIOlgpcc?=
 =?us-ascii?Q?UDsCe+y9w+d/AXQGsOAlq3mJrakgRHQ8PFdH5wpIEuJuME+YfAn02SYG3V4M?=
 =?us-ascii?Q?V/r9lmfJp8hDM8Nc+if8wZG9AIlRDSuOZvPyz4xTo1yaBOXtQAe9MH9ZzPzR?=
 =?us-ascii?Q?uVcF564WyXfji2X24Pzihndl92lo+XAyf9LTztf/VX7tAvfVWgWFXXs8urLG?=
 =?us-ascii?Q?4Xmvxo7/JFyudhaMNsbGNGWr4AuG350bZHeVYNU15pRrVhCb9Immom/ECBy+?=
 =?us-ascii?Q?JmVX+n5Wwh2Z2NSW+MdWo6HYIemV4zQ6TN9Seq36csX5DIB9P7ROUcxHMmS1?=
 =?us-ascii?Q?H0JD6TUCo41ChVTF9I+fpN4zo73HdKzt321td8FgCQGYMbmFWXWS1LLGpmaU?=
 =?us-ascii?Q?lDU4XITwyNZQ2e3JFFNF9mVf3mlWl9SuOu8xrDWfGQ8nzKbr9o78BwahoW73?=
 =?us-ascii?Q?vXFbJ1WCuUYPgTd0mnXFf7g3liWCQOxvlv9hbc0TXadLjfWX8q/I6hz597iN?=
 =?us-ascii?Q?F59HWMr38LTCK+RItP2+oi+zD0Ix/qIlv7uZENV6chHua9ZG9qdkeT3cRUid?=
 =?us-ascii?Q?i3g7KbBv0BfcjZptBLCm/OiwVVoDjx+Fp5XBBrkzuz/I5rYESSgaBssJl9wK?=
 =?us-ascii?Q?r23l56cYc717kv+z0Dsv4uarMmMyWwQwF9ZepbkziaHBbnFd/r6WrMyM7oZX?=
 =?us-ascii?Q?hBif4+ycCXvkfrgpPNwZdukbKdENYH1zOBZd2/GYuf1VFY0IeyJ6EKAImi+n?=
 =?us-ascii?Q?jG2FN31fpqCG8uOJbdIMTIdtyzmFVfSJXzTMgM/U6eFZhc53aOYN3eo6p4G+?=
 =?us-ascii?Q?NU2fW21lgUlIkN/LENZ7hALYRdC2XHgwRn7Z+5wzDD8HbCFpdLcDY0A6bN1M?=
 =?us-ascii?Q?a9sjKaLqIMmyk4N6iT6ltGXrysGfiRdWrXcMZO7A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04044c3d-589f-42b1-f321-08dd98763a22
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:46:10.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9JoRJiAEcLotaofDBN6zso2B/kCkM7qt0bYEjMHN9RQ0uX85RnZphHCq7ZPM0dRO+hYjDh7E2vbCw0u8ZxofKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
Message-ID-Hash: 3FBY3MQ2XTDZN5C4GAHZ773FN2NULEWF
X-Message-ID-Hash: 3FBY3MQ2XTDZN5C4GAHZ773FN2NULEWF
X-MailFrom: ddadap@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FBY3MQ2XTDZN5C4GAHZ773FN2NULEWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 16, 2025 at 06:37:21AM -0500, Daniel Dadap wrote:
> On Fri, May 16, 2025 at 09:56:13AM +0200, Takashi Iwai wrote:
> > On Thu, 15 May 2025 17:47:25 +0200,
> > Daniel Dadap wrote:
> > > 
> > > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > > which encapsulate the controller's interrupt and the base address for the
> > > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > > table dump excerpt:
> > > 
> > >         Device (HDA0)
> > >         {
> > >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> > >             ...
> > >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > >             {
> > >                 Memory32Fixed (ReadWrite,
> > >                     0x36078000,         // Address Base
> > >                     0x00008000,         // Address Length
> > >                     )
> > >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> > >                 {
> > >                     0x0000021E,
> > >                 }
> > >             })
> > >         }
> > > 
> > > Add support for HDA controllers discovered through ACPI, including support
> > > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > > is done with a new driver which uses existing infrastructure for extracting
> > > resource information from _CRS objects and plumbs the parsed resource
> > > information through to the existing HDA infrastructure to enable HD-Audio
> > > functionality on such devices.
> > > 
> > > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > > which are not actually enumerated on the PCI bus. This is because it depends
> > > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > > PCI-based devices.
> > > 
> > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > 
> > Thanks.  Now I checked with checkpatch, and it complained a few
> > things:
> >
> 
> Thanks, Takashi. I forgot to ran checkpatch. I addressed the ones you called
> out, and a few more that you ignored (I think on purpose), except for this:
> 
> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> I can add myself as maintainer for this file if you like, but figured it
> could also just fall into the default maintainership of the directory (you).
> Let me know if you think it's worth changing it.
> 
> > WARNING: Block comments use a trailing */ on a separate line
> > #168: FILE: sound/pci/hda/hda_acpi.c:79:
> > +	 * devm_platform_get_and_ioremap_resource() */
> > 
> > ERROR: code indent should use tabs where possible
> > #182: FILE: sound/pci/hda/hda_acpi.c:93:
> > +^I                       IRQF_SHARED, KBUILD_MODNAME, azx);$
> > 
> > ERROR: code indent should use tabs where possible
> > #308: FILE: sound/pci/hda/hda_acpi.c:219:
> > +^I                   THIS_MODULE, 0, &hda->card);$
> 
> I disagree with the above two, but I changed it anyway because it's easier
> to do that than to argue with checkpatch. These are both continuations of
> long lines, and the single hard tab matches the actual indentation level of
> the code itself, with the subsequent spaces serving to aesthetically align
> the continuation. If someone is viewing the file with the tabstop set to
> anything other than 8, using hard tabs for the alignment portion will break
> the intended alignment, whereas using spaces will keep things aligned well
> regardless of the tabstop size, since the single initial tab will resize
> consistently with the tabstop.
> 
> Perhaps this style point has been discussed before, and the policy that is
> enforced by checkpatch is intentional for reasons I don't understand (I did
> not check), but if this behavior is unintentional, and using spaces for
> aligning continuations of long lines is supposed to be okay, I can look at
> updating checkpatch to allow it. But for now I'll go with the recommended
> indentation since that seems to be the style followed by other files here.
> 
> > 
> > WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure th)
> > #405: FILE: sound/pci/hda/hda_acpi.c:316:
> > +MODULE_LICENSE("GPL v2");
> > 
> > Care to address those and resubmit?
> > 
> 
> Sure, I'll send a v4 shortly. I also took the opportunity to address an
> issue I noticed while cleaning up, by adding the following:

Hi Takashi,

In the meantime I noticed the recent commits in the sound tree to convert
some string copies to use strscpy() with two arguments, so I sent a patch
v5 to also use the two-argument variant in the new driver. I also sent a
separate patch to update hda_tegra to use the new signature.

> 
>         hda->data = acpi_device_get_match_data(&pdev->dev);
> +
> +       /* Fall back to defaults if the table didn't have a *struct hda_data */
> +       if (!hda->data)
> +               hda->data = devm_kzalloc(&pdev->dev, sizeof(*hda->data),
> +                                        GFP_KERNEL);
> +       if (!hda->data)
> +               return -ENOMEM;
> +
>         err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
> 
> My intention was to allow entries in the match table to omit supplying the
> pointer to a struct hda_data if they were fine with the defaults (hence use
> of the language "may be stored" in the comment describing the struct), but
> without the above the driver will dereference NULL if this is actually done.
> 
> > 
> > thanks,
> > 
> > Takashi
