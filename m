Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC85AB9B64
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 13:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80ABE601B9;
	Fri, 16 May 2025 13:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80ABE601B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747395856;
	bh=FPuRz4jJ6+vmfAUwiEYcV4YowU6YM/zHhkTzsCgA+NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBoYwepY0A/OZSg3TkNDVKTiWDIHG6091jL7OT7OESi3ijqXupi+XqR8D1rhAKGwO
	 1P0fvlXCOXa45sOpWtyUI71U98GDixZcCAlm224QEmCJRAQFpmeLjkVYVRZI6EaxtT
	 DWRxRj/Xhyp8reUGNyrtNATUX16lZdhv9oYZstUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B60EF804B2; Fri, 16 May 2025 13:43:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C5D7F80217;
	Fri, 16 May 2025 13:43:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C1AAF80134; Fri, 16 May 2025 13:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CB62F80075
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 13:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB62F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=HtPySUPT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqMm6JXYtn0fuyqhiVucryyEwzIkR7uluIafaRG4lYqzfAiM872CVw6ovmmQac6FTEQJFaAfgrggLj9yn/VC5+X13w6xgb6IiTO7EEiRWzdILDYsbXbCCcdcES5qMKwNnBY7Ur9A/rFGVP7PPgiyPyzQzOius1SEKkkJh3B2e2XKiU+6LeIuBVg8N5HAa7+PH6aVUUhSLBAnS9LCoImSudvf+cv9Y6fxpbxS/yngLOoOEvId7eI9yLq83klm0Uq+MhVAaqWvem23XZnAnkKNQZFSmLGzaK1FPYs/fNRPXNk7YgF8+mdwG2LyWHkm73fHGahR4mVsoqenrPM7ZMO1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud+F31C/vJwiFzuo1kebSn/JWSNsbkEdpEE+uvDoXzQ=;
 b=vo9vwjAS85kKuhJF+Xw4BXyxhEK2/5h6Gx1qZ+F0tKnoIYwfGTqWmq7lscAPX7TDYevRG94NxLCGVxvEp+aDO6sV5OTLGL4GUUJFZ0NywE/DQN2RAF1qidojh2kbGT1QTLsoxeyT/M1dtuKY4O6fiwRikCZzNY6B3FNeMS8rP1kEwWYdfj/ObIJ+xHbSc9Pi7TDfwURTqB8NMH/Bn8yrSgDf2CAqFUQlRSIYSlASb1n5MEplte+AXikci7gwIONs4ke9yIDyxD4MH78HBe1Q0mAAEo2wtuIErbMzx8QwsB0TCKCDobUQ12WxtYQy8MS43sdF31V+cwKnLo+Q33Oo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud+F31C/vJwiFzuo1kebSn/JWSNsbkEdpEE+uvDoXzQ=;
 b=HtPySUPTrDzU0QY0ZfsY4X+BxDm6dB3l/9RETetvBx8kwOIt8tvHj/5M+f1LBJUz/2bZ1grRb/7UoF/xHMtfuBEvox2PaIy9g9LU/H1HUU8OBLlApRYTY1f+F73XRVc62SHfBnSw8i1MFS26zWmG5p4bm1yY76XjzJLQNrhnDtskGFYCSaICxo0BlxyHiCL5moYsk8KQWtcFlrGtV3oBYWEA0f6ATy5WtD8D84cBNmeqnw/l05opnQA9dOZI6PrccEzQ9rUnInNuYtninr6YEW77fscrYq4JCZNKCuo50bsvzrxOtebC4kktZg6hg2a1qHuTZ1VNzyn1VpWpU4+O1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 11:43:31 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 11:43:31 +0000
Date: Fri, 16 May 2025 06:43:29 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v4] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
Message-ID: <aCck4fQH13Vq8euq@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
 <87zffdvvj6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zffdvvj6.wl-tiwai@suse.de>
X-ClientProxiedBy: SN7PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:806:122::34) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c799bde-617c-406b-0c59-08dd946ee1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aRC2AMEcu6KB65v9EMTWTR/4PnETLLt+LwhK1S+b0MI8C+om4YxGg4M5yUu0?=
 =?us-ascii?Q?S3mrInzx/ZphfJx/wYFGQYPhevQMYPUeGjFm3u2Xl87aNnChK29XjaWL8jet?=
 =?us-ascii?Q?Zw1IKq8zvklaRCv7+eal7+XkG2aHgwbf7/BEF2WfoIgUgGg+yyfwY6Vtseg1?=
 =?us-ascii?Q?DLzl5sMkdM5EDwrLuDdbo9PJesh9LXd/uGSqFMBSTixvyISo8wxpAWopMsar?=
 =?us-ascii?Q?pNI7VhM/+rfcvIL37ahQ4tlZb8KqBZDG0PuQ3OxQV+oO/koAfdpgVvJ3UIQg?=
 =?us-ascii?Q?JiUFOM/tPxA1tatU6pfDAXkhCDAeNp3f5apEJcYe5ANNkcU0s+YoZ3V6faEp?=
 =?us-ascii?Q?SxXqoZNoSt61fmUMMonU1z/PFvHyG5AemnNkIjw3u36BlsiQ5HfYJJRJiFSF?=
 =?us-ascii?Q?aNIe746h030PQsYQQ5l4CvaW5ltF5YR9wtjG5F+cUXAWWqiNP7ttgLvky1FP?=
 =?us-ascii?Q?v+E5Ty2/ilRKt7EQdiTtu6aaEPg32jF2S1aLLAztvcb3Dif9VbLBjKJLy/GM?=
 =?us-ascii?Q?a67RESXxnP5gpxVUmLJ0g23l9INlgQoiomueQ8g0993yppoa+HIQazhFyDNS?=
 =?us-ascii?Q?oKT87gjavxw8IuSlBMTXPNYFcYWhVpbW//2FziUbfe/LDGsBLCAsTV7cfdi6?=
 =?us-ascii?Q?3n2yX57x0Tu3fqN4PHSA4QtDLl2D7xBrqvl7KcGbGKad+3+4qHJvtRkmyN6B?=
 =?us-ascii?Q?IWZMFG9ccBK7jIIRvuxQ5mzeB6WG0SdfCoRgS145aL6zbMH/ioMTJWveYp7L?=
 =?us-ascii?Q?qh6uD7hDy//xW+3YTVwNFjhzDM+LYfKSFLxc+vBEYxaEQyLvKi0bDSFY8AsG?=
 =?us-ascii?Q?/XjGAb8lkVH4KXjAis/hmiDXP4BQhQSlRrCh/Q+FwXJqraWlu2mS0vH+STYb?=
 =?us-ascii?Q?2rof9TCuKjpFrKOo9XyLtVvILpuzneQeVu6VJRW0IB0HPd375lNgQWC4agnY?=
 =?us-ascii?Q?9vU9+h0wT4poetukeOe9RWKDzfDkkhl9w6OTlxfJ63nxlW2c5IMZ3qacLrbe?=
 =?us-ascii?Q?FJUDk/Tvi+S2zlqIZk+13YgeySmIOUazNZ/ea8+m/QY5ykeyN6Ebtar6UqMM?=
 =?us-ascii?Q?wvSMH6yLeC9pc2bhgxx+azS8QHHfybxN4ezc/wh7XscJmCrPgic/F1M+6lLG?=
 =?us-ascii?Q?XS6sBJ4ndIAQP56Hu/yt44Mg6qT+N1R1JBVV9WN1Cxa/Hu9kYPFnU3Tb3iOH?=
 =?us-ascii?Q?Ais24wSajH5WfMK+8a5VFOMMhzGeWfsHlmA+tA0ASgXClZQfhEkSQE8OaunN?=
 =?us-ascii?Q?/a0tET2j6bm1TSVY7HhvdqAiSA9jTp/EeNdctAsuhjnZkHG1hvExcc3A1LLr?=
 =?us-ascii?Q?hF9Lofa5cKgaZ+uhRuq9xxMZEOToRi7XWisbq7pIkVNOjsiX6tux7vaXDuQN?=
 =?us-ascii?Q?ZCVJp8yk8NV/68LSKfCCJEQIhwYzqdfFkvC/bzvPNEQFSBRKDWTkX/g9OYWv?=
 =?us-ascii?Q?Zzsl302065g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rXl2/KN6m14eZZ15LDie4o8I/vBgYv8UUx3pbM5JugMrUmEaOz4qmzkVs9nd?=
 =?us-ascii?Q?41kGAIqt4A+j0IpbcPYX7sHJw+b+qCR1X6KOUeM9nZ/lxDt7AuCU/p7u0rDQ?=
 =?us-ascii?Q?BNPOea7x6/urpUs7my0grR200+do4V83ysAYTfjnStE6EpKyq0aBKmlgNUB7?=
 =?us-ascii?Q?R2YZvZxMqiFOP2ljiKJVQmEzeU32MPZegPFfSWOtAJRx8YlJHqi+NoN+O6DO?=
 =?us-ascii?Q?XSSuJ2qC2pyktiT3EMcS8VSvIXfPGKFcVfb/PGCHVRHLbo7Go3hSXVcepKsZ?=
 =?us-ascii?Q?NMmNDvONz27eCru98/T9BPQEfguOPHuSbCzc24rh0l4zdfsSoG1fVOlHUsht?=
 =?us-ascii?Q?aNDnF3gj0j7xiMTODoR8V7G71kBF29iWHwavG30WyF+j6gwMYBQZBBdVbFlf?=
 =?us-ascii?Q?+8htIoTt0FAxOG8AvqPATbeXjij+NyDaxPoxNG7ZRnLhXaWLJPCm+cZjvm0h?=
 =?us-ascii?Q?+PzjJ5/2ZQCryI554VThbfY05gwzD5f2hXUngzBSOQ6LsHZs6y2ABse1HveW?=
 =?us-ascii?Q?fYMXmBfvj6miQVHBLEnvOptghnh0l4N3zIOg7wf4Ig4zhqN3RSVfMftDRawM?=
 =?us-ascii?Q?hz6hCz2tJ1P8lYSqQEoWE6HRKEieA3NcN0URjvB2ahZN1w1STT0SELpGAPr4?=
 =?us-ascii?Q?v7et4jwLTbFyZ+g0FgWMtfeOnd1LlPcwYD1dVDT3bGBQ1vAUn8gxmuCUr6mT?=
 =?us-ascii?Q?BDtqgofEbjxvOJfvInmurzQ2b1RzHnaE+7DKDV+V57Arxu5157qVPPEM5W8H?=
 =?us-ascii?Q?KxBXDiB3XALYqIiYGBUGL6nn0uZkin54AwlgRWos91iTz/eIwWt20JseG01g?=
 =?us-ascii?Q?NRSHkij46PGgVHyLcFl3586RVYntfY7KYngL0Hdysh3MgcRZeg/TQ0amyKZk?=
 =?us-ascii?Q?zIh7Vtq/Sl1oQt3aJwfwbQdd6HLjfLTLYd39mUIy3Ilq12LcBR6w7bJ9QsTj?=
 =?us-ascii?Q?itDuyo7Hr6GfYoSHdaepxgT0LQKhz4MNSYWKRF0ZKtrjTJ8xyAKWHTaA9eVp?=
 =?us-ascii?Q?/Jkh/mnFL2qTalXdTGOFyFYb+QfgvFPwJOx/EDaLVga9m23axTSg9A3mEJ1h?=
 =?us-ascii?Q?Ut5VWssQWMxLSSuMpE9GMeLeZAQhlxs1cE0vZymtwMFQEpUvBqRhDfwxVzJJ?=
 =?us-ascii?Q?G47cf3jPFigFP5ba0D2HA1gnvUkXb6z9oVCrqBIqvKLa/b1xMYqiHEdORNe7?=
 =?us-ascii?Q?beqCEvfMJz7SrfVBiReCFRxcDKl+lO1dGuxgta7sOvF0aG9inM902aagPYQf?=
 =?us-ascii?Q?4uWFqJxmbgRDpQNrh8zSLn7uq7Pr9YiomEbHapdwGyhbpasHl5NvWGmtgshc?=
 =?us-ascii?Q?aQercyWmYIf4r0cONuuDbZU+X7zTsYmyG3LiaQt39hXw9jNNEfW+tdWSN6Zu?=
 =?us-ascii?Q?8u6rhGeVz3GmL4/gI0uwD0dumcF+e8xaJYNbGCSKib39CI3VtESnLvhLX1nr?=
 =?us-ascii?Q?MfuTtfGjdJiAhXHrKcrUNOM86OQM5wClr5WVuEbfwqH7x9ing5ULKwwnoof9?=
 =?us-ascii?Q?hToAy3E3/8kF8CP8tk+BwPUdwIWAh65jp162w5pRA6Cji5zhE21flz38rm8E?=
 =?us-ascii?Q?Nre5uILIoVEN2XFVWkDPERyThpw6sNyfWm+5WVDv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c799bde-617c-406b-0c59-08dd946ee1c7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:43:31.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 67prjcz/QAObJFiMJQIOMNv6oFGEoNBz2OkjasW7SvoOPU6WFDgT3LsJknPYcyyMm+hoDUXZpgQsh1uuNX76PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
Message-ID-Hash: FPNF2HBI6QA4ONDQ24W2HLRGZ6PLDDS6
X-Message-ID-Hash: FPNF2HBI6QA4ONDQ24W2HLRGZ6PLDDS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPNF2HBI6QA4ONDQ24W2HLRGZ6PLDDS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some systems expose HD-Audio controllers via objects in the ACPI tables
which encapsulate the controller's interrupt and the base address for the
HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
table dump excerpt:

        Device (HDA0)
        {
            Name (_HID, "NVDA2014")  // _HID: Hardware ID
            ...
            Name (_CRS, ResourceTemplate ()
            // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x36078000,         // Address Base
                    0x00008000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive,
                           ,, )
                {
                    0x0000021E,
                }
            })
        }

Add support for HDA controllers discovered through ACPI, including support
for some platforms which expose such HDA controllers on NVIDIA SoCs. This
is done with a new driver which uses existing infrastructure for extracting
resource information from _CRS objects and plumbs the parsed resource
information through to the existing HDA infrastructure to enable HD-Audio
functionality on such devices.

Although this driver is in the sound/pci/hda/ directory, it targets devices
which are not actually enumerated on the PCI bus. This is because it
depends upon the Intel "Azalia" infrastructure which has traditionally been
usedvfor PCI-based devices.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---

Patch history:
v2,3: Remove __maybe_unused, use SYSTEM_SLEEP_PM_OPS (Takashi Iwai)
v4:   Address checkpatch issues (Takashi Iwai), allow NULL match data

 sound/pci/hda/Kconfig    |  11 ++
 sound/pci/hda/Makefile   |   2 +
 sound/pci/hda/hda_acpi.c | 325 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 338 insertions(+)
 create mode 100644 sound/pci/hda/hda_acpi.c

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 9c427270ff4f..436dfd182a09 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -42,6 +42,17 @@ config SND_HDA_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-tegra.
 
+config SND_HDA_ACPI
+	tristate "HD Audio ACPI"
+	depends on ACPI
+	select SND_HDA
+	help
+	  Say Y here to include support for Azalia-compatible HDA controllers
+	  which are advertised via ACPI objects.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-acpi.
+
 if SND_HDA
 
 config SND_HDA_HWDEP
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 210c406dfbc5..7a7c16d705dd 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 snd-hda-intel-y := hda_intel.o
 snd-hda-tegra-y := hda_tegra.o
+snd-hda-acpi-y := hda_acpi.o
 
 snd-hda-codec-y := hda_bind.o hda_codec.o hda_jack.o hda_auto_parser.o hda_sysfs.o
 snd-hda-codec-y += hda_controller.o
@@ -80,3 +81,4 @@ obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
 # when built in kernel
 obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
 obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
+obj-$(CONFIG_SND_HDA_ACPI) += snd-hda-acpi.o
diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
new file mode 100644
index 000000000000..3303cecddd94
--- /dev/null
+++ b/sound/pci/hda/hda_acpi.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ALSA driver for ACPI-based HDA Controllers.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+
+#include <sound/hda_codec.h>
+
+#include "hda_controller.h"
+
+struct hda_acpi {
+	struct azx azx;
+	struct snd_card *card;
+	struct platform_device *pdev;
+	void __iomem *regs;
+	struct work_struct probe_work;
+	const struct hda_data *data;
+};
+
+/**
+ * struct hda_data - Optional device-specific data
+ * @short_name: Used for the ALSA card name; defaults to KBUILD_MODNAME
+ * @long_name:  Used for longer description; defaults to short_name
+ * @flags:      Passed to &azx->driver_caps
+ *
+ * A pointer to a record of this type may be stored in the
+ * &acpi_device_id->driver_data field of an ACPI match table entry in order to
+ * customize the naming and behavior of a particular device. All fields are
+ * optional and sensible defaults will be selected in their absence.
+ */
+struct hda_data {
+	const char *short_name;
+	const char *long_name;
+	unsigned long flags;
+};
+
+static int hda_acpi_dev_disconnect(struct snd_device *device)
+{
+	struct azx *chip = device->device_data;
+
+	chip->bus.shutdown = 1;
+	return 0;
+}
+
+static int hda_acpi_dev_free(struct snd_device *device)
+{
+	struct azx *azx = device->device_data;
+	struct hda_acpi *hda = container_of(azx, struct hda_acpi, azx);
+
+	cancel_work_sync(&hda->probe_work);
+	if (azx_bus(azx)->chip_init) {
+		azx_stop_all_streams(azx);
+		azx_stop_chip(azx);
+	}
+
+	azx_free_stream_pages(azx);
+	azx_free_streams(azx);
+	snd_hdac_bus_exit(azx_bus(azx));
+
+	return 0;
+}
+
+static int hda_acpi_init(struct hda_acpi *hda)
+{
+	struct hdac_bus *bus = azx_bus(&hda->azx);
+	struct snd_card *card = hda->azx.card;
+	struct device *dev = &hda->pdev->dev;
+	struct azx *azx = &hda->azx;
+	struct resource *res;
+	unsigned short gcap;
+	const char *sname, *lname;
+	int err, irq;
+
+	/* The base address for the HDA registers and the interrupt are wrapped
+	 * in an ACPI _CRS object which can be parsed by platform_get_irq() and
+	 * devm_platform_get_and_ioremap_resource()
+	 */
+
+	irq = platform_get_irq(hda->pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	hda->regs = devm_platform_get_and_ioremap_resource(hda->pdev, 0, &res);
+	if (IS_ERR(hda->regs))
+		return PTR_ERR(hda->regs);
+
+	bus->remap_addr = hda->regs;
+	bus->addr = res->start;
+
+	err = devm_request_irq(dev, irq, azx_interrupt,
+			       IRQF_SHARED, KBUILD_MODNAME, azx);
+	if (err) {
+		dev_err(dev, "unable to request IRQ %d, disabling device\n",
+			irq);
+		return err;
+	}
+	bus->irq = irq;
+	bus->dma_stop_delay = 100;
+	card->sync_irq = bus->irq;
+
+	gcap = azx_readw(azx, GCAP);
+	dev_dbg(dev, "chipset global capabilities = 0x%x\n", gcap);
+
+	azx->align_buffer_size = 1;
+
+	azx->capture_streams = (gcap >> 8) & 0x0f;
+	azx->playback_streams = (gcap >> 12) & 0x0f;
+
+	azx->capture_index_offset = 0;
+	azx->playback_index_offset = azx->capture_streams;
+	azx->num_streams = azx->playback_streams + azx->capture_streams;
+
+	err = azx_init_streams(azx);
+	if (err < 0) {
+		dev_err(dev, "failed to initialize streams: %d\n", err);
+		return err;
+	}
+
+	err = azx_alloc_stream_pages(azx);
+	if (err < 0) {
+		dev_err(dev, "failed to allocate stream pages: %d\n", err);
+		return err;
+	}
+
+	azx_init_chip(azx, 1);
+
+	if (!bus->codec_mask) {
+		dev_err(dev, "no codecs found!\n");
+		return -ENODEV;
+	}
+
+	strscpy(card->driver, "hda-acpi", sizeof(card->driver));
+
+	sname = hda->data->short_name ? hda->data->short_name : KBUILD_MODNAME;
+
+	if (strlen(sname) > sizeof(card->shortname))
+		dev_info(dev, "truncating shortname for card %s\n", sname);
+	strscpy(card->shortname, sname, sizeof(card->shortname));
+
+	lname = hda->data->long_name ? hda->data->long_name : sname;
+
+	snprintf(card->longname, sizeof(card->longname),
+		 "%s at 0x%lx irq %i", lname, bus->addr, bus->irq);
+
+	return 0;
+}
+
+static void hda_acpi_probe_work(struct work_struct *work)
+{
+	struct hda_acpi *hda = container_of(work, struct hda_acpi, probe_work);
+	struct azx *chip = &hda->azx;
+	int err;
+
+	err = hda_acpi_init(hda);
+	if (err < 0)
+		return;
+
+	err = azx_probe_codecs(chip, 8);
+	if (err < 0)
+		return;
+
+	err = azx_codec_configure(chip);
+	if (err < 0)
+		return;
+
+	err = snd_card_register(chip->card);
+	if (err < 0)
+		return;
+
+	chip->running = 1;
+}
+
+static int hda_acpi_create(struct hda_acpi *hda)
+{
+	static const struct snd_device_ops ops = {
+		.dev_disconnect = hda_acpi_dev_disconnect,
+		.dev_free = hda_acpi_dev_free,
+	};
+	static const struct hda_controller_ops null_ops;
+	struct azx *azx = &hda->azx;
+	int err;
+
+	mutex_init(&azx->open_mutex);
+	azx->card = hda->card;
+	INIT_LIST_HEAD(&azx->pcm_list);
+
+	azx->ops = &null_ops;
+	azx->driver_caps = hda->data->flags;
+	azx->driver_type = hda->data->flags & 0xff;
+	azx->codec_probe_mask = -1;
+
+	err = azx_bus_init(azx, NULL);
+	if (err < 0)
+		return err;
+
+	err = snd_device_new(hda->card, SNDRV_DEV_LOWLEVEL, &hda->azx, &ops);
+	if (err < 0) {
+		dev_err(&hda->pdev->dev, "Error creating device\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int hda_acpi_probe(struct platform_device *pdev)
+{
+	struct hda_acpi *hda;
+	int err;
+
+	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
+	if (!hda)
+		return -ENOMEM;
+
+	hda->pdev = pdev;
+	hda->data = acpi_device_get_match_data(&pdev->dev);
+
+	/* Fall back to defaults if the table didn't have a *struct hda_data */
+	if (!hda->data)
+		hda->data = devm_kzalloc(&pdev->dev, sizeof(*hda->data),
+					 GFP_KERNEL);
+	if (!hda->data)
+		return -ENOMEM;
+
+	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &hda->card);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Error creating card!\n");
+		return err;
+	}
+
+	INIT_WORK(&hda->probe_work, hda_acpi_probe_work);
+
+	err = hda_acpi_create(hda);
+	if (err < 0)
+		goto out_free;
+	hda->card->private_data = &hda->azx;
+
+	dev_set_drvdata(&pdev->dev, hda->card);
+
+	schedule_work(&hda->probe_work);
+
+	return 0;
+
+out_free:
+	snd_card_free(hda->card);
+	return err;
+}
+
+static void hda_acpi_remove(struct platform_device *pdev)
+{
+	snd_card_free(dev_get_drvdata(&pdev->dev));
+}
+
+static void hda_acpi_shutdown(struct platform_device *pdev)
+{
+	struct snd_card *card = dev_get_drvdata(&pdev->dev);
+	struct azx *chip;
+
+	if (!card)
+		return;
+	chip = card->private_data;
+	if (chip && chip->running)
+		azx_stop_chip(chip);
+}
+
+static int hda_acpi_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_suspend(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+
+	return 0;
+}
+
+static int hda_acpi_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops hda_acpi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
+};
+
+struct hda_data nvidia_hda_data = {
+	.short_name = "NVIDIA",
+	.long_name = "NVIDIA HDA Controller",
+	.flags = AZX_DCAPS_CORBRP_SELF_CLEAR,
+};
+
+static const struct acpi_device_id hda_acpi_match[] = {
+	{ .id = "NVDA2014", .driver_data = (uintptr_t) &nvidia_hda_data },
+	{ .id = "NVDA2015", .driver_data = (uintptr_t) &nvidia_hda_data },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, hda_acpi_match);
+
+static struct platform_driver hda_acpi_platform_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.pm = &hda_acpi_pm,
+		.acpi_match_table = hda_acpi_match,
+	},
+	.probe = hda_acpi_probe,
+	.remove = hda_acpi_remove,
+	.shutdown = hda_acpi_shutdown,
+};
+module_platform_driver(hda_acpi_platform_driver);
+
+MODULE_DESCRIPTION("Driver for ACPI-based HDA Controllers");
+MODULE_LICENSE("GPL");
-- 
2.39.5

