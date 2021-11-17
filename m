Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254145441E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:46:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F32931865;
	Wed, 17 Nov 2021 10:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F32931865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142365;
	bh=pj1n55cUazJIaQ0JVm06ysLOm6iTbrTmd5zdWZfNV7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDEGYo4D/Nx+thinZZjk8SAGRlz82LYpcU+h8buKO+ynQ8aQhucAMX5/p6eMqp12B
	 rg02vUX6Qm57TaE7YIcGJJgTurbZuwPKwFc8sS22kENYd1sd26qa8yA9XhoMYe0OFK
	 8KSQNCYDfz77r06633p1NBGQdsY+N1sDyf8gAu2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D1DF805C0;
	Wed, 17 Nov 2021 10:38:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FBD2F80588; Wed, 17 Nov 2021 10:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A0AF8055B
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A0AF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="IYgNiZdj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IATM/a3SxjyiPOC4YS0ydwfPxklZmvXxEq8I5Ww3oZlFOtF9XjFI2p+FK4fsunF+gILp7/phAaEeKAeVQe3QWMghDok9A7p9aGScRq9O9VvygK6GCPzkeKMboh69mBtimlF6cnQrf1ffl6C65ESrfT/Lt0HURpIXf/AmPN7ILViJc6TXfsxYjLOyvxyObPhynjANWxvyAavNKd1RwD6FFS5zCsE56d090bVWi07IinIy9csIxwZMLrnHL92MX/3OTvPgxPMPLgdkJDkk2ZjXjeej2+2mi6LJZFuoXvd8AmcnZ7VRgMwlatsdWyFIXGqRtP7ynMMsdSIl3aiohKJjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AVYMsqdqT5aML5ASjU1X5aJtq7rcirF8wH6DONBBzQ=;
 b=JmDNoEryvPFZAs5wXjT5Febf9C9B4kUgm16h+nEdP8RY3H3nJZ1QJmQxqP28Vxa2RrYUBSPORujZx4C4qyAWdq9YkAA7U2h2nriS/uESgXBedi+lbOYEYdQMsWsSRXLZF1/tPRp3EnPD9pO+cC0G2K2FRlaUnBd0dQoecrd5nsEvzs3uznvwN5PaOacOIzFm/J+C3apvFXIx1ELJ61qKNt70+OBVL0AKMZuEa1iM+xNJNDZNtIgg5QObUnpMEdhNIAZESMDfXns+rZPUAvwKzzvdfEAGWijJ4dRQWLEB+1WQMNBhvEzybF9bz8e+xhMVUKm5l06eSv3pVtx9ttOCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AVYMsqdqT5aML5ASjU1X5aJtq7rcirF8wH6DONBBzQ=;
 b=IYgNiZdjv6oxwKwjKQXV+xWQqPvUi4d5wW6zT90abbI3QN+iTnGOeJQDvxO4zO1kXo4VrnC9RQPI9ulzgS4p+vhMYUzwa/fSxQDBtYuwViqAjoIyJkKAiNu64BbqC1xHHxnTfYecEZ/sR6fH4ex6byL6WCiHAAGdYVM0mNReNO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:36 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:36 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 17/21] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops
 to load firmware
Date: Wed, 17 Nov 2021 11:37:30 +0200
Message-Id: <20211117093734.17407-18-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49bc8cf6-098a-4eb1-f4e8-08d9a9ae0775
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66232F469A3B34847B84B5CEB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Zssx2x38gZVAe6zZj6cLZ+a9zFTMRQlInkH3mvO049NZhrK7RgwKE+R7sKIs3NeoxX70TzlupTk6+slgYAVSh3fwYb0Jm2rpm4zOc+RpLR+faj1PPzeU+tFCERPe5t3QISylWZD2IzqiHk/JTbrhIx//DvLo3sMNEtwQhPoafoFgCLAAnIEkRJ0uiKkJc9D9Lj6wRU7bMn1NpBVliOMhI3YPUMaLQkIokrm9iEEp4aT8P+RXvE631FauponxAcxlO2Y+riplRCiJo2FdecMShc29VjNQQ0EQQ4YnDct5L628sFinYOqg7+lMaOPrnIgZWLuFN8AQqzpJF//lVI6WA4rFaurZGEdcehb7ACfEO3WaDPUCkWe1HqH82wKJQSsAWYVGJaT316IEGgnFp+X/DY+xBTXa4DDE5911xEtsdMFIVi+rHjpyYnSC+mixsUYQQPP5K1Lnfa0B/RB/UTsX4g1cs+psgwuiy/FtrEf8aoZf7Tg/3w09mRdgX+IMP5OsctU1HOR5TYS7/OFdOcwJn/2ttzjnLe3wx4stBU9qos8ac3OqdP6OAHpaP8Y8nkrqxatGGPO82pP2N3T8vdRRrE2LekkOv+XITfMNIYhXCFpyo5ITIvuFNM8f9H3aUI2diZBGN81LKcPKsjEc0GRjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(83380400001)(66574015)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU5GajFvV3dEZGp1M2xYaGt6ZGVFaE0weHM3ejhpVTJmYkxHQW0yY2t6cmtS?=
 =?utf-8?B?OXJ3SjBPVEtGWjQwTmhrVEt3bXB3RjlFUlVWWVo2RzE5WlhCczd3WG1DZ2Fj?=
 =?utf-8?B?dFFWWWFFekZkQ3FZeURRQlU2ZUQvNytESkRwZ3V0MUVDWlIyT1RnRkVZQWZM?=
 =?utf-8?B?S2pkUGlUOU1BQWVsbVZYL0xqSkhiSFBYOGNKLzZLWG9VbHNpaGtER2Z6V0ph?=
 =?utf-8?B?UVBFeEFOZVhEbnpTelNKeDFTM2NDb2hnZG5YK1lsZkpCaVE0eGw5c241d1BE?=
 =?utf-8?B?OUIxNjk4RENHeFBhclJpeW14RWdIckJWSW9oZlo2S2svRkxPbTZNZ255YUNW?=
 =?utf-8?B?SkdRM1pQdVl4ejFlUlFMNkdlaVlwUEN4bDJXcFZNU0dqRW5PNU9nUTZDd1Vn?=
 =?utf-8?B?MFlsU0toMVFjV0I0Y0pheDUwQTJURmRPMzVEcUJxRzhkaDZoa3lDVWwvUGs1?=
 =?utf-8?B?OHF4b2dGenJNaXNFdjI4RHB0S3M0ejV3K2gyUFNjbWd2dVU1eHljdVpTSE85?=
 =?utf-8?B?aFJIOVBMdFNqcnRhTGpBZjlyTDdCdEwwcU1xT3ppRG0yNEdFUk1SQ3ozSktt?=
 =?utf-8?B?WndBRHdaM2ZiQ2NHWmdPNm8relFNVEM0cVUvWnc0cWhPekpYYXRZTkdacld5?=
 =?utf-8?B?cWtMcHBDcENSVlV1d3piWi9nRDBabG02S2NHY1BpSFFMRmhwT005dk9iVzhF?=
 =?utf-8?B?Qm9jZzZUTUJueml5aE5vY0c2VWtQRWFmU3pFbHVoNFlIbXM5akMyVThQcjh4?=
 =?utf-8?B?WjVlbU5Cakt6WGZSb2tFR2duTnVXQ1I2a1FneTBkYlFyOXlEcURhRll1NnBi?=
 =?utf-8?B?NXJNaUJSSmVwWEFpdzdPZndLK09EcCtpZ0FMN3l2MFNSZC9KWHlXUUJEZFA5?=
 =?utf-8?B?REVFWWZWVkRFTXFNYlBmbzBDNW1XcFI4ZUtJTjVTRjhFQWFMdlllL3NuQWQ0?=
 =?utf-8?B?U3RwNFpZYUJ6K1RYSE9lenk5QUZZVG1YNWxZSkFCdTZPU0JoWjZnWitCc1BY?=
 =?utf-8?B?VEFmcmMySk0rbGwyeGFZZDZ2bDJ6V3R6TFd1WnpmV3RSdFpucGZ3NkJjdmdh?=
 =?utf-8?B?Q1NEWlEvNjIwVFJOTzZJUU54VFRLWEYzRmJUWnQ2WTUyNzV1RTlKamlqZFE4?=
 =?utf-8?B?ODR6R05uVW9Wc3B0TmpvQ2NuVmFFTkV5dGpxSlA5Skt2NGk2Y3Y2akhrYUk0?=
 =?utf-8?B?eGJ4SXV4L3FLYWxLYUt2YjhxV2FHczNrZ0p0U1A0NE52d2ZLckxlc1NxRklB?=
 =?utf-8?B?cU1PMHBzZHVlWlFYa1gzSmtkOXVyUTJjUFZaVG9pKytDcXAvemhiQnZoVWE4?=
 =?utf-8?B?ZzhMUHNFS1BGWE9sem5pVlJnVTAxdDNhdkpoUEJpZkVTSmJBa2ZXOFVsT1pU?=
 =?utf-8?B?akg1dEpRSGphOGZ2ZFUwbHhJeEw1d042cSttRVlVWDcwT3QrSm1IaEhSb1BC?=
 =?utf-8?B?NVdtTDZjdmFackNXN2p2b1BvREJWZWRDZUlraE84N0hXSXVFQXpyTkh4S1JW?=
 =?utf-8?B?dlNTdTJ4K0FrTkZJdzhkR1JZakVuTUZBUlpNd1VJZnpwamE3VXI4MFRsWlNT?=
 =?utf-8?B?K1ZoZGp6U1JTUCtJU0lXeEZaWmdPOWo4RDhPbUpza2hlZ0s4OVBKcmY2NVBj?=
 =?utf-8?B?WXZST1NWbDRGbjkyRndxaHhFRWpKdGhoV2pwcExZOGJZWEZrbHBCcTFuM294?=
 =?utf-8?B?ZGhtRHNTdWp1Y29Yc3hDazd1OTFCUDFWZXdtVWtLYmxQY1BPUVB2a3lkMVJo?=
 =?utf-8?B?RjF3ZUxGYXU4TnFqQkxFZ2hOdy9KNWxwUVQxQVhvelF3aWxoeS9SNm9FN3lO?=
 =?utf-8?B?OVh5V3NJR0RtOEVJV1U1UHJaTHRwZlI5ellDbGY0cjZMNnRDd3JKN2lEeEQr?=
 =?utf-8?B?bDBIQUZQS29yTWRGWitsWTVNcHJSR3BKVWF6YWVYYTZNOFM2SGFRNUhOeEYy?=
 =?utf-8?B?dkVXeXR3VkhqenFsMzdDYzNQUGVXMWU3akRTUkVJblZIcy9sMlBXQldkOTFG?=
 =?utf-8?B?K2x3MVlsSHNkYi9VUDNtbkNNVEsvcFJDOXJJVGtjWGNuckNyaXFNalFlSkUr?=
 =?utf-8?B?clUwOWovRDF6RTMwaGNlbzl6V0dJUlcrK1ZoR2NJTTFPMmNNS01yaDhMNjZH?=
 =?utf-8?B?Y2hnL1BzOXp0bzhoZWtpckcwOUg4ZEJIOWxoNkNQeVdBdGVMQ1ZPTkYyRTMz?=
 =?utf-8?B?VVpzUitLUDFhRDVHWkZnRUNEMzVtSGh3Tmx6ME9XV3RKd2pMckI2OFVjcGNE?=
 =?utf-8?Q?V+T/iFTHuA3undb5kXd7XX6d3Ka4X0ba/ArpVYEyHc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bc8cf6-098a-4eb1-f4e8-08d9a9ae0775
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:36.6639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP9tkuGD0GuMz45ibjLTmWQEoLuRtSN+bp4e8jSdsfEvGtTQBGppIlZ4IehNr+fDEo41S37jZu/i1GR84gijMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

From: YC Hung <yc.hung@mediatek.com>

Add mt8195-loader module with ops callback to load and run firmware
on mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/mt8195/Makefile        |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c | 56 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  8 +++
 sound/soc/sof/mediatek/mt8195/mt8195.h        |  3 +
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-loader.c

diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
index dd2b6e4affc9..66cdc0e7bf3c 100644
--- a/sound/soc/sof/mediatek/mt8195/Makefile
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8195-objs := mt8195.o
+snd-sof-mt8195-objs := mt8195.o mt8195-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
new file mode 100644
index 000000000000..ed18d6379e92
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright (c) 2021 Mediatek Corporation. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+//
+// Hardware interface for mt8195 DSP code loader
+
+#include <sound/sof.h>
+#include "mt8195.h"
+#include "../../ops.h"
+
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+{
+	/* ADSP bootup base */
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, DSP_ALTRESETVEC, boot_addr);
+
+	/* pull high RunStall (set bit3 to 1) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, ADSP_RUNSTALL);
+
+	/* pull high StatVectorSel to use AltResetVec (set bit4 to 1) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				DSP_RESET_SW, DSP_RESET_SW);
+
+	/* toggle  DReset & BReset */
+	/* pull high DReset & BReset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW);
+
+	/* pull low DReset & BReset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW,
+				0);
+
+	/* Enable PDebug */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_PDEBUGBUS0,
+				PDEBUG_ENABLE,
+				PDEBUG_ENABLE);
+
+	/* release RunStall (set bit3 to 0) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, 0);
+}
+
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+{
+	/* Clear to 0 firstly */
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, DSP_RESET_SW, 0x0);
+
+	/* RUN_STALL pull high again to reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, ADSP_RUNSTALL);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 945601a0dc37..88da6c2de070 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -305,6 +305,9 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,
 
+	/* DSP core boot */
+	.run		= mt8195_run,
+
 	/* Block IO */
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
@@ -318,6 +321,11 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* misc */
 	.get_bar_index	= mt8195_get_bar_index,
 
+	/* module loading */
+	.load_module	= snd_sof_parse_module_memcpy,
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
index 48cbbb5aacb5..929424182357 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.h
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -10,6 +10,7 @@
 #define __MT8195_H
 
 struct mtk_adsp_chip_info;
+struct snd_sof_dev;
 
 #define DSP_REG_BASE			0x10803000
 #define SCP_CFGREG_BASE			0x10724000
@@ -152,4 +153,6 @@ struct mtk_adsp_chip_info;
 #define DRAM_REMAP_SHIFT	12
 #define DRAM_REMAP_MASK		(BIT(DRAM_REMAP_SHIFT) - 1)
 
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.27.0

