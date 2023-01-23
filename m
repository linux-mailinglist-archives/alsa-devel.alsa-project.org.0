Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35B677445
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 04:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8EB41EB;
	Mon, 23 Jan 2023 04:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8EB41EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674443409;
	bh=JzngKEjzk5+DqlgW9k3JMO8jFb/AdZbxSQaiRoGbW9g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rWC2tsWv1v6iAbl0V17aACHXpJ8VNBxv1Ch+y1HUUpITPHzIvox5drwEa7XsTyekq
	 Oazw7jfclIAZOfr/d9r/ITHgcTNwgLN8cGcAWtfrJ4HREncqDWEKT5T1rT8KZ+Xlrq
	 8yRuPTO/2phjxSIg4deCqKypuXD2Qt9hzx8FJWqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4405BF804F3;
	Mon, 23 Jan 2023 04:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DFCF804C2; Mon, 23 Jan 2023 04:09:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=no autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A8E8F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 04:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8E8F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hfQ0Rz0G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAT4u1AiXeQmBUbt/3Jx1EmsP4f0wZiPnoVln7d5aYK/N53QUsq74kMOcrXn2hwj3T6s8pEd7jGel9pboaxsZ4RPU4NuI4gdGm32o9lgAzPWc0a2Oak92DMlP6w+5ve18Yts5OSvc5XBGJ9RH8pIeBuoVER4Egz2Y1Sza/hIktbpRZlEpwALTqdGUCXbL5DQE2NOT9iYwWR330YiuqF+T1mygUnnA1l1YBlNqN3nOnZj56xqXjXz3DQ9NxPHYt2kRfce97zbpN2RNmCeW0AQjOaN9TDHjOpjTfGN4VbzUvVYycNTSuSShCmv2HO1mxCfFBq/rFl0hfGQhrRm5uRXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ewirfxo3KguYelmEBp7NpBatBgdzlUx/O2ZW9OPibB8=;
 b=LoQrA8AzsFYxapi2iu6r0+8kHEz0aAA/Rrx20NXoc/RREff4+XB61GyBSuh2rNlMNYZAqrZubDn48abb+2kTgHy6KICUSdCIw2GKFx+k5YmIo7BRu5KHCSWwxj+Sv7/3LNY4jhglUqWl1UBA7BINPJVLKt2WKa2AgI3mrn8IiW1UoSyz+e/E0XXTJelLhMvPIBZxJ8Frbrj22Y+opqxuU9tPM+B2Er+usCZYIwwdiHN0AaIhYipa4l5N7uiIUS+J9Y2jZfsQYTnyNCQdQsrkF67KgsH73D0jYFev4xVuZZYQhaJ3BfMkJ74d9H7TOi5jezqAilKp+0jIBrecKzkQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewirfxo3KguYelmEBp7NpBatBgdzlUx/O2ZW9OPibB8=;
 b=hfQ0Rz0G2FuxEL8aFEsgjviMRU4OBpU5QrTZj5yoYvheK/DqmRcMw5aEZmVtIcPe4WV/r3QoEFTU5qtqurxaK0P9/C5JP0JAsIW+T51EekK6GwqwQYiiKF1hylK9GDoIh8W2lqvWQZvLV0lAFCJVuCaUIJI/IztN1dbrTpeFPbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 03:08:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 03:08:49 +0000
Message-ID: <87tu0i6j7j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Question about DPCM private_data of soc-compress.c
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 03:08:49 +0000
X-ClientProxiedBy: TYCP301CA0035.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b25c55b-5d56-445e-e41e-08dafcef260b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YjwofG+bXH709fyqcexRs3QaihCy9NavH/HMDR1vbHbpL8VcRDySnEntTzPkJa5RJdZiofwA87CRX2x9TbN+nO6b+nFkd8s3/0QRgguSuP0v10yy0u5ivK758sdEv0QAb7DtEtFOlHV+2nJF7xcXxrs/YxYgUd/iOaC+lrgRSnFYC0TNg2XVG/CCN56yPLXF/qjKhcpIwu/b0W8Q2W87KKde0kKAiI7ug4x1Q18GukSlq1bBLEn5WoDA/9DjHS4j5A1r5Atr5h8rPhvCtAFje+cCp+HTcr0ZoOg3yq9OuhQ5rYAfGryJjaiqRSxaexbF/R4UGqNxWcupRweS70xIk+VXgpjhXDxefhnjQY7jKSrI1b1ys09u1V+wTixZfK3vPz7pvp4W4fMIe8CqfTB1vyN9kKBsM4yJTqJwmWqGcbAdadCZ+kHOzqoq0myCLNi+/C/5W351ZXyT85lDs41kRkZLGlAzRq5p6o6DRNqB9pgX0Bh1jdx/698k1ChbqIbSdMJNIm8xfqQF1vTRtfGr9Txb5k+R0isXBlVdTMb/Q0cyy5XyfCGzZhPyho/kUA9yJ2wrY79FVhm66xeqhkjdf0uMYVdrQ2h2SpuVcGUIR84KUx4v2WUzeBanL4cMlGp7pupoCyXWwK95hIBs7EUJsSOZOMMmZr834sXeshJxKsRO7rS5PWGnIz4/RRH4cV4oV6O7SUvowXrl24NPbPakPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(38100700002)(38350700002)(41300700001)(86362001)(5660300002)(4744005)(8936002)(2906002)(66946007)(66556008)(66476007)(6916009)(2616005)(6512007)(6506007)(186003)(26005)(8676002)(4326008)(316002)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ROBKJIhY0izRLqdo9EEngt7LrbuhcYnwyp4IVC2VGxKXICwTAEc50RS7ypHd?=
 =?us-ascii?Q?7hDpkQJSr70vLuSYFytyAs4Ltch6ETdLFPjWPyCnnzLrPXD3tgtIzW6nbYY6?=
 =?us-ascii?Q?rXQcuBKMhHIQL6Sf0lUtUVU0nQKQ1UaiRHTB6ZAWUP0bxuXS9z9U3+HhuiN1?=
 =?us-ascii?Q?8ZVAILFEDR2T8YyBh5VQGnouIpWzEL44mfJD7QaOjQjJDzqGu3z/r7Yrz9io?=
 =?us-ascii?Q?gx6xBTpVhqTJpyefZAkhubzmCBU+U+1f3A80EY/GOE9jKYQra7yRUWnQtLRU?=
 =?us-ascii?Q?M9CFFkm5BqhTvR9t92tRJIBJWQz4CAOKrF3SeL2G3esDfPZvwaMBkD//+bgj?=
 =?us-ascii?Q?1TPMbu2pnuaES1y9eARIHHxOqWDIPqVVAGUHloDWTesABEdIN1lhuZqZBEQ1?=
 =?us-ascii?Q?o53r8KP16O7Q2F7u4nxtns5UpdZWvyJsf+lTcBDl+2V6FBO5nbxU3S9xAv2g?=
 =?us-ascii?Q?IiZ0fGydzVw+CqTJCVXVqi20dtdzo+KuPf29us6AHo/TrpH8iUINncv8/KQe?=
 =?us-ascii?Q?K1Sy9ytrg0no+z0l+caYxZeeAIlvR/40DuaslNaC/v2qTj/zntvuYy7Jmjqk?=
 =?us-ascii?Q?ZAyFjT3WZxRUuvp96LflNe1PyoabidBsrLqpkQq/ctjuw5To4esh5aEsPPna?=
 =?us-ascii?Q?kiEAr+6cHMIF3oymcmsCKhOBTgxIulRpfUt3v7ppQ2bL3yFmEEo7L4XWhNMO?=
 =?us-ascii?Q?tbr8mIhIuDO5FlKDha2KAFsR+ih2/QbUwZWL7KGVIR0C1bYhZxlOwhaavEcx?=
 =?us-ascii?Q?0Ld6u9p4CC87fMBtSDF9vq3bYCViLVlpn3MGHP0E3IR3tJwS4Uavy5pAwLHR?=
 =?us-ascii?Q?cR1WApt/T+5goax+IcjygGnmrLcx7ozauBilQ0hhCWfdWh/c169yg77wz5W0?=
 =?us-ascii?Q?7dl76ReVrZxFrMabGjrKyTgViDZyL6cu3qaaVN1+37nl4g7bPZSaNoqLGNES?=
 =?us-ascii?Q?XXWL2asOGnI8LTml5JdAb3H3C92WLI8S8lBjitL+CdHoTSpqxQKRzTN/fpVs?=
 =?us-ascii?Q?y84a0Jib0TyBC9++Uy1IIixfykZgm88rjbYIrftC06GgIDaIeTU1rlhOgfFn?=
 =?us-ascii?Q?OvKdpipE+T5rmycmMizG56VX1bPRFY6BaCKYkngr6kJ4UhkeNmsOBltNQzmN?=
 =?us-ascii?Q?XULXinZmnFjM3ImEFMNRik3oXVRuyrioqexFabJynP0t9ThSPqgUck07pNCp?=
 =?us-ascii?Q?3QUFnG8rdY4eb/eHCFD/6hZPa7AScrPkcudwk70QXaW68UjPCiuquA1HVf7L?=
 =?us-ascii?Q?sH4Erz114DBvdJE6AcEh4p+PAK8WSNdYB9PkG9XgbogggpTnW3kHKqVV1jnR?=
 =?us-ascii?Q?AumcQ47ro64BbRVs4cyqNNz99y9vgwOPLfGx/dygcMedpVNOLrNGYDMn7TTA?=
 =?us-ascii?Q?fDxYjX53HaiVjfTMmGrbHzzRTFPGdbIrt6lr0BJ8pQtwFeBWefjVjtDWdiIK?=
 =?us-ascii?Q?lqRHj7CpHdbY2LXrX8WJ5436bc1f0kSg1dx7+9nGReB12kYPikBHZqeAxKHS?=
 =?us-ascii?Q?OqisAnfUQ+QhaAmNMp4BrRu7XuzAbFr0UwWheRBlmctlFE2NX6vbcMuHa9HO?=
 =?us-ascii?Q?M9bqmygkl48zXJZE8Z4PqPBn26y2QsYcCGx14IqPP0VHB9mez2AXUJ5Od84W?=
 =?us-ascii?Q?TiN8Gn+jnj3L2ZQEJCUKdi0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b25c55b-5d56-445e-e41e-08dafcef260b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 03:08:49.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2W88+QL94pH/ZkCy7wIiPcdwEQsOZguZQOjFE7NnyFmGgIIyqiQnkNLt5o+LtcgVAPVIwWSiZAqwHC3Qra3lwv/EAYXG666V/B9KJyswlOdmurnj+rK30vAEDaGJ8Gq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi ALSA ML

I'm not familiar with soc-compress.c, but I think dpcm_capture case don't need "else" ?
I think it is same as soc-pcm.c :: soc_new_pcm().
I'm happy to post patch if someone acknowledge this question.

	--- soc-compress.c --------
	int snd_soc_new_compress(...)
	{
		...
		if (rtd->dai_link->dynamic) {
			...
			if (rtd->dai_link->dpcm_playback)
				be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-			else if (rtd->dai_link->dpcm_capture)
+			if (rtd->dai_link->dpcm_capture)
				be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
			...
		}
		...
	}

	--- soc-pcm.c ---------------
	int soc_new_pcm(...)
	{
		...
		if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
			if (playback)
				pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
=>			if (capture)
				pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
			goto out;
		}
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
