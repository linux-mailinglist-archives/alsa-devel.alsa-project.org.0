Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E043C5BDD56
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 08:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765A784B;
	Tue, 20 Sep 2022 08:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765A784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663655632;
	bh=PX53MbnYj0aBrS746nGVLhHLge+D1zz60GFMcgLBqP4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXDxCvkvWZXe9UBC33q01BitmTeWEZbEaoX5R3Q+Audm8J5EyzLx0zh5+cOSpQz4z
	 +SJVR80PBsejiGkXI/FkzmIqvT/K6G2ldrqkb4bDw4DX+JTX9t+bccfp+bGB9FZ8vF
	 GwTZjGnYQFs8vsELU7Nptb4j79W6481my/cV0vf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 070FDF80542;
	Tue, 20 Sep 2022 08:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A43F8053A; Tue, 20 Sep 2022 08:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A8A0F804E4
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A8A0F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="LlKSZfPs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgG5DsTQVqQvD74OjIzAFjNHv4k926XFGVEfJjwCXIJwEnOsNz56ZymC9t9yVZAXZ0mUdOLwmANJVakTqH0uKNUAThoZbLqHC/maa0+CiRx6prIG9246FYCCiV0C5Z9FcwhZ/thTbjQgLW9GV/+HQGiRayqsIj4eLtHVN6LlT/sIpApDsSUplSwWbwRyhZeRhoPWcC7xzjtmr6sFw0Eu0rXhjaU3YJGjkxankYfTrxH8/QNubyV5b9bTOkjAjlGuIwizQXvORLPjPKvl3ot0rcjbXN6u+K6pXizYMaAj1DFspT9mdOWwf/MBjdsC3tFlF9Bz4qaDEdc8t7qQCb8GcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag5OpBQZlEta1Rzzrk2llwyQA7M+16WfivNy8X2f5+Y=;
 b=HsqrTI2N4mbQUw6GqHaYB5k1NWYaCtGg1JqZaJY76W/Vo4bC1DRAoTJp94w11oB2rVmMYApucbvwMnDPmZm5x6/TmGyD2vQphH+WC4jz7hjsl6Kn7LUn8J6lvXx5P2xRj4bPle5pB7kP4xls/EZ4MFE28Hd8PuqlCHhCzLInZY8MbiopX4QiANwFKKpDnYoKJV7VZmk/k5YEPvQS5OxaZl4nimwsDTbem7dfqqAzsCmg/UBODRoSSOl/MTymHE0+C+ptBFX3C+ntf5LZv7OrAzs+7HVPGHVa96/0dGqgU7+JkgQXnTiPUHYL0wYWoBikawsdgG5vI+vGrlT+Rk7njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag5OpBQZlEta1Rzzrk2llwyQA7M+16WfivNy8X2f5+Y=;
 b=LlKSZfPs+JdSJ/vbUI4bTYZ+9V3T7/Meu68DIXUEOXq2pg/w4fpXfnevNE8q+9a+n2s6Usrn8NoVcr4Jp+69+rF9OKVTkY39ejZZgI0XHg560MzefsZDsWhnbpAUwrUfhfTQPBjB6gFWlqK8OL4iEGXbezodRN9/Ac2ZDMLEFNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9916.jpnprd01.prod.outlook.com (2603:1096:400:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 06:32:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 06:32:25 +0000
Message-ID: <87r106v9mv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: soc.h: use defined number instead of direct number
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Sep 2022 06:32:25 +0000
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: d7351cc2-47da-4c89-cdad-08da9ad1e1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pM2yspy3VnvRTR37UAtSRbHIhPDY8KntzV+L/l9FbxJ+K4MvieVn74Wtqocq7VCZSe277E2H9P0cHdMMbGwwZhuaZsmfFNK3e2cjzBC+5FWLwz7faE1Uxpe1ySoU56gDHWhRVQ+dA7OXgooWzichIfLELhSOyYiebgSZEeQNXlpdqnLOx++FSR+VGvxGX4jaSz2UKGlMkedJpMf4PmvEjp/mUifyS9Bt7A90awE5Xa8+hc8juhOOg1F5zWlkrZLQqhlqbegHjIjn2MoTTQAHW5ZqtxTrhEpEYjEEmiMjdeul3PMqi+wSS5PpuY1Ua28ccb0ybniIvMUm3QWyB9ulb6LVM8gZEm8Z5w9xxFJr2DWcUTxSJ7pijfujii1W0dpsgEYiWXwfX4AlmtFothHX26GY1FPBslfVsfs/y0xEycG3ol5G+ErkXfPMvj+18jm0/sYqfFQBT7C8ugMShB/ywuFNsi7O5Dh+F1eoCVgnyoLG/e7torqikywHH/qK/ZXKYS0ScnHITwTzNxxMSG00UgSYsb21bt67b6B1qivmNHg2k72raN8U8Q0wMyVi5le42/0nK7Y3Qi6RIf0x/7ycliZLmXiL5i11umuKtJGnnZoX38HNYXTzcJHOxH1cN37EYiJ12ZGqKTrmxGbWh40toDb2n5cOKRu+UccPBW/8krc6RhBXmft41zqV3J4omQSfltSUkPXGaSxiJto/IZz3Y3lIXyAW8j7YjzxJejzR1kqQqMtUIiwrDgMfzuCloRgwcMIppwmQNVbjDipOwg/Njg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(6486002)(2616005)(36756003)(2906002)(4326008)(38350700002)(38100700002)(66476007)(66946007)(186003)(66556008)(83380400001)(8936002)(41300700001)(478600001)(6512007)(86362001)(8676002)(26005)(316002)(6506007)(52116002)(6916009)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lVZcSUURL1DWl2llVCASPylG5SA4J6YUkFDjXxUCU/l4T15BvepGz3yq4LAt?=
 =?us-ascii?Q?+sdWNzBTG1asb6iAxy9nwJ/HoKChE/U/0Jheu7MXgmDtjnWBHwJDvHN1QYqZ?=
 =?us-ascii?Q?0IjMCUltUKWgZZ6Ivo/Z56gmFcxyQIXKWNsfPuLwQf7RlgblbByw+49cJbld?=
 =?us-ascii?Q?B8FXtQrk2s4VEHHeKTAEpP2qNxKwt5FgCdmVeuVMMxzrxxh2Y4n+MJpA85Nf?=
 =?us-ascii?Q?8vMZoU7kHX7Hagdxrj5cEjsANOfgNry308npyJT5xX7HSrNXw+ZupFWmq6TD?=
 =?us-ascii?Q?n1A1Xvl3aQAnYKo+yJIG3hwiv/2oUGo4MXrOFk/9C3NQBQ/5ivdOwdzcrk8j?=
 =?us-ascii?Q?l9wT+h1F43JoZzTGyZwHvAKx1JJBFZhRG4v9w2UVK7cZC2ndoz1sx4rm/bdy?=
 =?us-ascii?Q?CyG1bGmKEcvt+G268EY+/WfBS+yx0SgxwiBpGFs0ESwBY8L7USEZn6vjFDIy?=
 =?us-ascii?Q?zWETxcAZ6Uh2+xneJFd4708TONBiirFdPC5cOffP1uYN1FQmtxXRRlz5BVAh?=
 =?us-ascii?Q?MmN/rtn4fmrjIpj7xfB8F9ufyvtA3HZ4ZKV1Wye6eid+xupkr+ycCkqb3i8Q?=
 =?us-ascii?Q?KuDoVqVhS6CMTaBax62+e65wl5KsY2/N0j1Rbl9gGvID1EXsP+4eWHDdVFOL?=
 =?us-ascii?Q?6RkmfL/s1yRXDpwP5WBgyJzhrGscn6zaSvjBgh6grTeaVqTFRom6xyofKN5C?=
 =?us-ascii?Q?TEWe+FSH6bpMS2MX1EkOV6WBWrZoKgoB6BMY2gENMmQMGdnqjRHonYbOtCQK?=
 =?us-ascii?Q?4mIZIKrE2c7AxCJWuQ51csQ2i8cbyoRkODhM7SAx4y7t4SFNxMkO1WqM8dod?=
 =?us-ascii?Q?YCTs7Ialtiu6vMqtZzUXUsHk41VVQO3lrzUHS8+xAdtwIr7cJabKF6AmgAQv?=
 =?us-ascii?Q?9gxodVfenmDQd6PJ61rDiJxYnCGmuA078UsmQNeHKddCY6ul0+hzf8m/ymLY?=
 =?us-ascii?Q?ocMOviCLned5Bk/eJjlT6wL+lHUtUZk2kAYWDbf7CWGsFVB0nXMVEOMroZ3e?=
 =?us-ascii?Q?oo1k56Jw6rZxpEYmv4y8UAtSLGdFZSVbkf1Xcoa+rxr1GDZik2bocquQettf?=
 =?us-ascii?Q?H2iBJ4lKPBj/0HKRcY9WwQtGtJrU8B+MffN9PHVvvirDhi+DOqSS+YUoDD57?=
 =?us-ascii?Q?z6gzM4dANbNmOcPjePFNpkdxe0x6Gacy+xDzWcUl199jd2kt/l7A+flKdcXI?=
 =?us-ascii?Q?VtpWSCjZe0xQmzrMIVr52bW2aNz0dh6tbxyJzQNWkd5+cWhH9svAkV1ot064?=
 =?us-ascii?Q?UMppKaEVKr/aDsbICWNBkMoM0JiHSwkUMvd6eUH6fmK4fxzMdUjgepUf4qmd?=
 =?us-ascii?Q?sVglLS93svhIXnfUN5EvkiK87PcpAZCLW1K4PGYGJo9bejXugj0PvokfnWul?=
 =?us-ascii?Q?b+DPAeJrhrhfBchGVC8un+FBJwaCn8k8yerfFUJF48zht5qbRTZmvw34nG1L?=
 =?us-ascii?Q?E8gG0sTb45YmAeKZ42RudjMr0EKvJ31Oba7kiiACItIZf4r/3qK0aEPqN8Iv?=
 =?us-ascii?Q?Uw/Sl/b6HD75+jCrUGva1OkpW0Rb49eeUVlHWQizqRRiSOR9GH17ZAE77sFY?=
 =?us-ascii?Q?DKuRxtg3/JW7GmO2RQYvO6sYMs6PSYSC/3v2MYU6hGzHxNxAc7mrDTCNT9pK?=
 =?us-ascii?Q?NIHO4vHnd5mjrq/x1rAg/lg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7351cc2-47da-4c89-cdad-08da9ad1e1a7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 06:32:25.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94qxMPegtBBuV7FOhDOfHdsisj6rK9bODaDmp2Cv1De23R0jiWsx1CncbbKDmiIFp5VyrX+AGFQgTOg06wh5zq/TLmtxPIFiFY+K9ObLxYrnjIUXy/Prtu2O1MeOZL+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9916
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_pcm_runtime has dpcm for Playback/Capture, but it is defined
directly "2". It should use defined number.

	struct snd_soc_pcm_runtime {
		...
=>		struct snd_soc_dpcm_runtime dpcm[2];
		...
	}

This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f5e0c402acb7..4adb6236860c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1062,7 +1062,7 @@ struct snd_soc_pcm_runtime {
 	unsigned int params_select; /* currently selected param for dai link */
 
 	/* Dynamic PCM BE runtime data */
-	struct snd_soc_dpcm_runtime dpcm[2];
+	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
 
 	long pmdown_time;
 
-- 
2.25.1

