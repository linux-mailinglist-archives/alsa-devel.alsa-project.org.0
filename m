Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4A678E01
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:10:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD79BE79;
	Tue, 24 Jan 2023 03:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD79BE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526254;
	bh=CTcchOkvpob68bMHwkywSzJcRpjmweYX7cPtxyy04Ak=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PbXHJaBMdg+zFPyC2e9y+59B7XPCG1Csv6ORxhaPrFBLJleaCsZ6lBsDLVSegZS60
	 on8Zc9adwakN8w94SFUgtVDVu+0qlRLtJeiPxJfj99fuKr7e2KHLoK+ONnqYd0dojy
	 tZdMv6H1VPdR+9Pt3t1R+QThOFxk5V2g0ZvIXExQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40412F80163;
	Tue, 24 Jan 2023 03:09:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7223F802DF; Tue, 24 Jan 2023 03:09:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81039F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81039F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ExSrsItd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHqF/DQj5w2sAO8oT8ebUM0vfRUGzf+TRQpI9B1AywPAw/NlaGAIVBY5w+Czcz4TMk/TLzaFfojb2nsHll8qmDfMXmNiJIM6nHCFzZu7m1JC2kxVGLgzdNUwsLEHil+zdSo21t9lnrXiV9ymJLvgfmFjzWUtxDsNk8PSS8kvzpvGVRbX5Y2l0yT0mWbtKQsCUWX8l/3meoqprnNjeLAtqCTBk9o3rhZo1kvIWb8opR8fLUeEwZk5rJ9h3St3L+RnGlWpvnz16GTEMXa9V/mfeUpmRTrR5LKLbrAbXS44jhPz1sctff8M1fqyfZbaxQ/TYT7gmcPOsjUZgrfSOO9B5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=ZWWYkxOTOqJPWWwxCvn8+E/XpJ08v0Ni5Y0yF52zU6Iv6pXUUY6oU9Ntqgm709XxGeYQQ2sgqkjiDL2WcroKNTo1OezvtWKwLDvMwXwed/he1VPADhRLeO7f9RpSnXMfxRxFix1K0ypzkHxaDKA1+ZguVchkONHBC4IdxKAXQF7PHRej60dSXx1v2aqyYpRlxF0JP/cCIXWKYW8CWslnuwDpyCe2Nkb1DGS21+KRRTZbDs+khT6PKjE6YLOVc3prpoZ3OK/4RIClND4IsuMqth9ra9kRzxlsEYVb03TlRMzYNlOcTL1I2/7IzkHa2AjZvctP8r5c/AmmPhH7FelPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=ExSrsItdqlPYxbRVBMfA4FMs4nHUdJ8UXNo4BqmOYf20wScCdBVTlSUX8WtTI5q1kj4XthvbRM/lz3UxABkK2754bIatnISGuK3/L6mCgm9DfiGyEORpIlF6ZGf89UYJZsE8oQUC2N3aOPJQ84bjXbpPy0qFgRx1T4i1FVce9aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6128.jpnprd01.prod.outlook.com (2603:1096:400:61::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:09:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:09:25 +0000
Message-ID: <87o7qou1ii.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/25] ASoC: hda: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:09:25 +0000
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 643f416b-2f5c-4dc7-f3a7-08dafdb00454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zfa8VAOYqUf+GbY6XbjOJY3lAKu3LWLsFwWwlDdG6ylLGEmPIBwvL1QjlZHQbooovGYDBclSP2dPPH/lAsf+WdqxMIEf6q9X3LvFVyEv27X74zj2zSk0t3MkqtXpg+EG8JDXs5fUq6KywLM+zFF9BjV2aiTVozpSy3xoPonV1yaufIspaMFGu40MXKnbo5pXNNN6CiB5gbIzI32cYIzHAu25JnvVYmwhdx/xWvDPk4O7/bc/CC6JuEFB+/wElyECOW/cNWsU8EyThpb8j50GB7t0abYnu9ckR8TzZv82518klwN5yWIdqsbi/245xTGCFk8HhUwKZkZvQX/vPNXwJhxranMgsax0E3Xffn69gmKG8W+L0wC6BlRH7LLSSP4GSM4bxDBUq2qThicnp3LIpY7PlwZT/IixO80qfNjG+4Avd1RfTFdIrnxR+4UG2uCXCFBXJFYaq+Ww4tiMFZPtGCGXR+s5mbLuo++gW32ySXLPELserQoMWfxWIWIRcR+mWa0rE5AFT5bbAM9KXRYy7ObtrGH8V9wiwfC/H0SiOm/YdXULi6eFA2cnVdxI0ihCqLDEMgSABxZly1rNRZUt2dzOGVpH/P8BqSiegDjTaqcfXa+JOIh11TLLedy6FOpJiDVi8WeCz0e5bogVyMjm4gHadYIYYGVrKG/ksDPNXaJvNz2uo1jF4hVgMqyIV9Ke16eDIkpHFk/mHbZwS/rMCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(36756003)(86362001)(66556008)(2906002)(8936002)(66476007)(6916009)(66946007)(4744005)(5660300002)(38350700002)(38100700002)(6486002)(54906003)(52116002)(4326008)(316002)(8676002)(41300700001)(478600001)(83380400001)(186003)(2616005)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RQGIcUy5/mLJpFG5jnrMvfhTpQAVeGZshXEdGZDacKinu2GrnJMbk4SFMEvP?=
 =?us-ascii?Q?NR8/JADKcBmMVLXUhuV2EWgQCt3v2NmA3RRgL8bco3s+qc4MgrX5hyEK/tPD?=
 =?us-ascii?Q?MzD30exu2KuM0g3gYuzx8tDIJP92eYfIPRXCKP5zBQE+mXs+45nsWPEaQjYW?=
 =?us-ascii?Q?lQCHdmwCCruzr3v0/SvdNwLGlEsZCtIkugQSUa1JP23ktD7/D3MmWCiz8fsn?=
 =?us-ascii?Q?IyxcPVmuowwO200PzZxxy28A5mPUziApbUU6Nw0r614HRno8uleR5UAFa6Wn?=
 =?us-ascii?Q?gIikOETwMslsiG2wbg+gREvJ2CK5HBWrBbsvUttp8E061geiDQkykefrgxxr?=
 =?us-ascii?Q?uVih6jvxvpCh673wr4iRCxbUO1Hpu++hCzN0QDBz2zDXqEwhRW6L8WEGpvwN?=
 =?us-ascii?Q?dLEiffI4HYugifqttiG397DGqMb4MnJFlv9fjqw+SbRZzfb5JTA3FW4obMbE?=
 =?us-ascii?Q?Ytv3vtIqpH0UytfJ+V9mgBuhEk9Uv98/bm0D3g+Gz3U4mI0aQGFzGLxiyAkf?=
 =?us-ascii?Q?YYOOq3T+SBzP0DFlVPfk70cjT3OOt0G+y1Rj+0WSgWLwurSEWNlC1Rn1To1O?=
 =?us-ascii?Q?FJ04nqpBONmjDalryYyLf9eoXK9jMvSK6p/Nqn6txKtI5KMHClPNDxhPtX2M?=
 =?us-ascii?Q?tvZayrsLGrP6KrpADpEdpkFTO2mZCz3M8YeuSsfSSggXpuwEQPdSWzENwvpl?=
 =?us-ascii?Q?Y7xQFr1a++q3RznO2NsqNb8p73sUsOj8s7g0pjSF51MZ0tEC85bpltxxBLem?=
 =?us-ascii?Q?5kss4QMjxX3P/W8DAmdBZuIe0X0psS9lVH+WzRD/gZvBKyEQogcHh4smUK9P?=
 =?us-ascii?Q?M5n+IvBfunqUnSCQoIlY7DWRIwbTFzBJZLdicVreNrP9czFgBekOE0Xwlcdi?=
 =?us-ascii?Q?Nx4VcDGhL2CAqnb+wrPgERzZahc4w1v4HaOjSQYf4kMGOUkrzb1hcctxUxNG?=
 =?us-ascii?Q?ENXJnO5bGTeSUa20ZusO+tPbZWaDGl0KVL5Q2fpMgUp1VAbODCBLlHvXYLg1?=
 =?us-ascii?Q?MOkTVOTBFdwhaLghdNfzNV0HzF++BKMlEzAg+qT++nPnDyHNAAaiF7nu8dkG?=
 =?us-ascii?Q?Qgy73lC990zNVLIt6kDMjNUXXPEPX/54laiX+iNM+Ti4ISBNxqgjqCaZsrpa?=
 =?us-ascii?Q?QVIfGZYQqGFL1KXWXJdW5OHcd/74ObuLASyOgOjck4Jys0IAPuLt+McN4yx+?=
 =?us-ascii?Q?kn8nJ/OMfORQx/8VeKvZQKNjwFGMaMNa9G9JbsIeyy3JevxEIeeLRH4k0dW6?=
 =?us-ascii?Q?Ta2NDmSFs4WtrA8a8/twZ216ViqxsOfyfiJ+fMZBTgWjwR/qUDg0+RgNUqLz?=
 =?us-ascii?Q?eEtI7nQFulSncHeFT5xVG5jeVXUJgfz/16rLki6feedUAjUXEf0lD5jZe/4B?=
 =?us-ascii?Q?zkEwqz4Fq21A/OUgjg6QhPU32g/MupBBgp2iQdq1P60wkhMXboGeYYJmKF5E?=
 =?us-ascii?Q?0a1WNpAPRy4Sfzjlj2r9poXNn8DuN6KYDGkDQbUj5eg+f3r8r9emiVRpbhQC?=
 =?us-ascii?Q?CgEUzRN31fhZy1zg7ZB+86c11Xgn5lEFm3W/q8EBFA18dI3hQPFq2neGlexZ?=
 =?us-ascii?Q?cXhReXvX5NPXvNZ9MPc7y6JIV7GHrkIzqvXGx9eYD4BiVqlHnC2dtfd4gVqN?=
 =?us-ascii?Q?6w9eoS47L2Evly6thKxDwBM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643f416b-2f5c-4dc7-f3a7-08dafdb00454
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:09:25.6187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTK3YgKWYkgp+TOkQ6IzcD3/b8SmGUmJPS18oYVJgFnrckQyNy1JXtAzojmJ9RsgMpQOwQp2zRYuJxv9sNMDS54PR5adSlp1kqo9nrRHLbc2ELLMFp/ppB/XEaZQV0qY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6128
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?ISO-8859-1?Q?=22P=C3=A9?= =?ISO-8859-1?Q?ter_Ujfalusi=22?=
 <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hda.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 4b8ec6f77337..d57b043d6bfe 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -126,12 +126,15 @@ static void hda_codec_unregister_dais(struct hda_codec *codec,
 	struct hda_pcm *pcm;
 
 	for_each_component_dais_safe(component, dai, save) {
+		int stream;
+
 		list_for_each_entry(pcm, &codec->pcm_list_head, list) {
 			if (strcmp(dai->driver->name, pcm->name))
 				continue;
 
-			snd_soc_dapm_free_widget(dai->playback_widget);
-			snd_soc_dapm_free_widget(dai->capture_widget);
+			for_each_pcm_streams(stream)
+				snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
+
 			snd_soc_unregister_dai(dai);
 			break;
 		}
-- 
2.25.1

