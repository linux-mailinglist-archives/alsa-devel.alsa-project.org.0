Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6733704F3F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 15:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F22C11C;
	Tue, 16 May 2023 15:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F22C11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684243579;
	bh=d1mmm0s70maG1iaKOxL+UKeJbxEJHZ24xNV8tsWHiMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LzFd+2+RmJNckC9tX6pOt9X83ojzI8DJv3Rr+8ont+dMaTrwYf5p6NOzDzorbRBr5
	 IhrTJxHkLrLsCf7Km1mawTRqvoZtO40WwgzCsFaouK7S+ZPzFw3XqY6NeB/ndQ+wRb
	 s/F2/7wQT9p3QBhD8fFciL9avB44veV1dOEKLDnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E70FF8055B; Tue, 16 May 2023 15:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05421F80551;
	Tue, 16 May 2023 15:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C696F802E8; Tue, 16 May 2023 15:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 901EDF80272
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 15:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901EDF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=N8N1gm5g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm2xsnmGflIrPzadm0HXrCB+IXwgEJGmW+GjCBji5BSALFtSGUWiahhRgvdYXY1jjSbavliPM6felBzC82pGnvu0+WpSD68LvWjJQOE95wLGrBL47VcWl91X78kZHozhp1pjwhHGGwxQ5E0ERSnFOgZXO7ow9enMHeCuyBjcn+bjjncCpC3rBxksNo9CHCA8lYBgH94wa9S/msfu2ZsD1bmCfHI1L7ftzypAcDb6mY5s6hW9McBwlKnnVI205QNeaeng5pEZYnggte5s/0UfLP1V6ZzLx0/i0f5gj03JzxerlBNzo0F9UkMxO6u/lhiBWjN5D97fgnOlJPnqMQRJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdJB7DfPMN5TpI2aSmxNRf/xXhSL2fePyA3eXXbmOcQ=;
 b=D0LFy19i15rJaRCW0qe1zEqfZr3UZ4ZvH7Anrls34byon3nMqlX1ebt3fNxviibw7oY1y06yMwMSu50geriYxa3YQsufmkYDaZdZFxe2T9GWxyBHS3a1+/XCk6Lqst+EgmbjHfaGOoORkBmwci+nwyIOTsUTSnbbbT6gZVR8cmElGvQA4dLj4fCu/+KwDA8YZpvtyT1cQKBaQyhG/j9xIzCckyU04OYEFE9CNV8Gico/L3hg7oxvHa6SQ5VNaU3yHqUiqed+XruSNRaWYFELLw6or8W2xWetxKHfaVkcsQuDNfizMSRLtK5OAMVWs+O7j1u/L8k/MpDi2h73goKeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdJB7DfPMN5TpI2aSmxNRf/xXhSL2fePyA3eXXbmOcQ=;
 b=N8N1gm5gbxIzAdUsxUWa7WWH4wxjPapxdKyDMC4vDG+NU4UntrWWBpoZpSl+Z4HJitnv+uWI6zbpZBCvLZk6yjfi2VlAfYdWp2JfkAT9wGyUe6aAOD8Iq5WLeQoYuz+4SlbBLxzxr/BsLiSOvi8G0pxgQB6k890MrJZbixQdjZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 13:24:26 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9%7]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 13:24:26 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@gmail.com
Subject: [RESEND PATCH 2/2] ASoC: sof: Improve sof_ipc4_bytes_ext_put function
Date: Tue, 16 May 2023 16:24:01 +0300
Message-Id: <20230516132401.205563-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516132401.205563-1-daniel.baluta@oss.nxp.com>
References: <20230516132401.205563-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0032.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::6) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: afd348d5-9271-4910-c6de-08db5610dedd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jD1xkEDqjQwT0NWJkmIZsAiDlmwutNxa8a9y6AoHj8VGjN6BealkcjLN4hYQFOoR+sDmbG9RjLpFZzDe5nXx7SIEE9mI1Wrrc69WGws2Is4mNN20sPz5BHafR3B8ZRMBztnOCL6jfD2cBoMBKRL/604JEr7Z6361FrXVZ53xvFJQX4bWiO3sLDc7TkI3wJJP8aY9o9iuh1lbtDwaZlfYEi8NAfcU09EyKf85j5gWeEAdJVwwcAqKYa/VdvoNSgO47AxeB7MrN3zt+7tpm8L70Ua+6kkm841gRSLX/8E6xxMwXA52341lTB27GKaqCC3OgSzQys6YKpQkwbUi38O2xyypUClKwPhRMTWJWVoPhec1iaXvmEVwGFuq/eu4duRw9b9wPMzuVBjcv3mUdzRQVq1QZIDwk9ExO8M9veAc9Zv/NGKP0vmhFCRCKbvBGAV1hgLJEKA1e4geBX3bqGaPldiI77+DYOqN0QRSa2DbPt8UdmLVlrWxLcR7P+ZwLzL6fdXOFMY6IJF0dPaRQucY2iCPVjRN7iom14OKlWS46FHH2KAolrHwipKZo/iQNqLo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(83380400001)(66574015)(66476007)(66946007)(2616005)(52116002)(1076003)(6486002)(478600001)(8936002)(66556008)(44832011)(7416002)(6666004)(186003)(5660300002)(86362001)(2906002)(8676002)(6512007)(4326008)(316002)(6506007)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHRrNG15TjhCeFBsSWwwNW9JRGszdndNb3pnb3p3MW1uT0xBbWh6Sm1ESU1h?=
 =?utf-8?B?WlArMFNCMXQyS3o3bWpXL0lORWNtQ0ZRUitCVFkrVEsvYVBxMWdwV0t4TkZ1?=
 =?utf-8?B?dmZ5cUxkbnpUSEFzUTFyZTd3Mk9kNHpwOWkza2ZaaUxHN0lmQzhvdHBvVU1u?=
 =?utf-8?B?N2ROU3luejZPYVQ2WDlJNks0ek1iMExEMkVTWHA0eERKamlpcy82YkVnWDg0?=
 =?utf-8?B?QW1JVmNYN2NHbjdCZk1wMGVXSHRQTE1DbUxFeU5wK0s1WGs2UHpkQVRBMmtU?=
 =?utf-8?B?TFJxZVZsWXM1Mmw5RHVhV2dUNERpaEhCZUxJSCs3NGRwWjFKcGkxa2EvcTZ0?=
 =?utf-8?B?NWVGZE12SUJ6RUtIYVQxNksvb2J2K3NEUTBqMEtYdGJyK0xPNnZ3cmFhcjBB?=
 =?utf-8?B?MUU4ZDZ5VlVRWDIzRFQzTkI2V1ExamRZSHh3elJRcDBLOXBzdVdaUE1JUStH?=
 =?utf-8?B?d1M4RldLdEdZUm45dkpZbWNPZnhTWXpHR000eDlzc3JOK284RXZ5NjNQVDBT?=
 =?utf-8?B?Y0pJRElBNVRHU3p5d1c2OVY2TFRoUVBRRVd1aC8zZXhiOTgrRllMRThPWUZ0?=
 =?utf-8?B?Ty9KeFVIRlEzODdrOVk3VC9HV1c2NXFGMVJLc293Sk5FWWM1UVF6WE55NER3?=
 =?utf-8?B?djZaTmRQNys1T1VYRGZzdnJ5S0krdDlMcDVVcWxJdXpHTG1lSDBWdnYwL3Fm?=
 =?utf-8?B?Smw4bDhkL01NNFlLRlozbEhLSzdhRmo1anR3R2RWWFlNaS91OWs5dEJSWGZo?=
 =?utf-8?B?cnBqdnJPTlJoTGd0aVgwbGlYdklvbW9wT2s0dURtaVcwWjhySlZucW9zeWMz?=
 =?utf-8?B?ZHdudXRSbFdrYmh5R2NaNXZsRXFoQkJWa2xsTnk0bXNUWE9vb3VRV0VKdzFl?=
 =?utf-8?B?OFVrcVI4bHJsSHBOMFBFK0p2M1VmU1Q4aS92aXNTYzc4MjBiS1BEaTVHd2M3?=
 =?utf-8?B?aTdjaEN2VmtKN2FlMjZKayt6WWQ3RHZkai9leWJWdE84SityZ1lWZmc5NC9p?=
 =?utf-8?B?MnI5SHZZYjFJalhmNnZCRzhYTU9YU3RvSDJLNVhTVU91NkNjczMreWlpSURT?=
 =?utf-8?B?bVI0WjBvQ2tsOFpmL1JkbDJVTjM5NlJKZzNUT3ZFYTdCaW4wQ2RuYUF1NTMv?=
 =?utf-8?B?RUdRdlE1M1RmYTZNRTYydEx1QkpteHlIMDFsT0YxNGZRZkZHNnBURzM3S3N5?=
 =?utf-8?B?L05GVHZ6OWNnMm1IaVd0Ymw0YkZaZDhVQmk5VzI1Q3dIeUFSSERwOTRHR2lE?=
 =?utf-8?B?bTN2VGl2MHUwVUQyL1dEZlFZM24rMDhiSUNiSnVtL1BLQmk1b25IekJsYkdx?=
 =?utf-8?B?QS9FRVlUOTZqNFc1dkF1YVpMckZ2UWNrT1NUSXZqaU50ekw1UVdhM3grdEtV?=
 =?utf-8?B?TDNoSDZPN2ZueGR0U1VIVVVhLzNQaGVFaVg0VnF4eEw5NTRJN2ozcGVKOUJs?=
 =?utf-8?B?cXBsRXFOYXJoYktlc2lLejlDMVBIS0x1ZHpObTNxNkl0SHRyMHZuamZ2Ri84?=
 =?utf-8?B?MDBNZlNDTlJORXdtYVprK1ZlTGJvK0FPYTBpYTc5Z1dGamorOGNMSFI4U1Fw?=
 =?utf-8?B?UFh6eUNRZi9jZUkvclcrdEYxcFJUVWpPM0c3Vy8wdzZIMWI1bGFjZE9sMnhk?=
 =?utf-8?B?YkdiSG5vbnFtd1VJRm9KaVkzbkVNb3h5TzJweEMrcmFXcDc5RUZxYmw0N2dV?=
 =?utf-8?B?ZEFERTZUQzFmWEdIN3cwKzFheGpSbVNDRjdudUF4QmIzeGNNYy9NR3gwSXox?=
 =?utf-8?B?SnlsU1pJRVR0R2U1UVFWUWxGalc1a0lJYVRVcU1NTEo0dHcrWkhReXdJRjdI?=
 =?utf-8?B?MUpneHgxSFVQUjZ4TGs5YkxneXlYVVdrK1ZrRTBwNXloSzhwQUs4a1BBUE84?=
 =?utf-8?B?QjN6ZEl1UUR5Tkw1TityZGlFMjdJTkwyV0tJZnUraWV3VTIyVFZjMCtEaHUr?=
 =?utf-8?B?ZndEalBjemxod1pBZGRiU0w1QTBhMGpzZTVVOHp5TmhMMTRiU0dYQSt6ZWlI?=
 =?utf-8?B?bEVxa3ZRbGxpaTBXTHpVMEhNS3VNWFFyakJBVHh2NlhNN3ZqeU1vU0lteDZI?=
 =?utf-8?B?T01FV0MvNkltQjdhQnE2K1F1MkhVdm9yWFNHVk9qb2pzcDcvSkVaQ0s1ZitF?=
 =?utf-8?B?RUVhc3ZiZ2JZaWloNFVoSDBqVytsblcyc3VnSW1OUFZUVHowWTd0bGFrUjdv?=
 =?utf-8?B?SGVOS29DcDR3R3NVRU85NGw3bXpFNUgvK2c5TStHeDFCWjY3aVo4ZlBiWEg0?=
 =?utf-8?B?VDFicDJ5UzFKZ1ZhNFAyQWNzOUFRPT0=?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afd348d5-9271-4910-c6de-08db5610dedd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:24:26.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o5OzjfRBfuKrjGLXjmc9quigUKWWDSN0EcRQBJ3xoPgn2CouDtdtzaSClZV3lCZ/cLbowjjieHZOUggoe1W40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635
Message-ID-Hash: XSF4FG5KIGX2FAJUYCPPATMYK4UU32XX
X-Message-ID-Hash: XSF4FG5KIGX2FAJUYCPPATMYK4UU32XX
X-MailFrom: daniel.baluta@oss.nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSF4FG5KIGX2FAJUYCPPATMYK4UU32XX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Paul Olaru <paul.olaru@nxp.com>

The function is improved in the way that if the firmware returns a
validation error on the newly sent bytes, then the kernel will
automatically restore to the old bytes value for a given kcontrol.

This way, if the firmware rejects a data blob then the kernel will also
reject it, instead of saving it for the next suspend/resume cycle. The
old behaviour is that the kernel would save it anyway and on next
firmware boot it would apply the previously-rejected configuration,
leading to errors during playback.

Additionally, the function also saves previously validated
configurations, so that if the firmware does end up rejecting a new
bytes value the kernel can send an old, previously-valid configuration.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

---
 sound/soc/sof/ipc4-control.c | 39 ++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 6f0698be9451..c6d404d44097 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -54,6 +54,26 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
 	msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
 
 	ret = iops->set_get_data(sdev, msg, msg->data_size, set);
+	if (!set)
+		goto unlock;
+
+	/* It is a set-data operation, and we have a valid backup that we can restore */
+	if (ret < 0) {
+		if (!scontrol->old_ipc_control_data)
+			goto unlock;
+		/*
+		 * Current ipc_control_data is not valid, we use the last known good
+		 * configuration
+		 */
+		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
+		       scontrol->max_size);
+		kfree(scontrol->old_ipc_control_data);
+		scontrol->old_ipc_control_data = NULL;
+		/* Send the last known good configuration to firmware */
+		ret = iops->set_get_data(sdev, msg, msg->data_size, set);
+		if (ret < 0)
+			goto unlock;
+	}
 
 unlock:
 	if (lock)
@@ -327,13 +347,24 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 		return -EINVAL;
 	}
 
+	if (!scontrol->old_ipc_control_data) {
+		/* Create a backup of the current, valid bytes control */
+		scontrol->old_ipc_control_data = kmemdup(scontrol->ipc_control_data,
+							 scontrol->max_size, GFP_KERNEL);
+		if (!scontrol->old_ipc_control_data)
+			return -ENOMEM;
+	}
+
 	/* Copy the whole binary data which includes the ABI header and the payload */
-	if (copy_from_user(data, tlvd->tlv, header.length))
+	if (copy_from_user(data, tlvd->tlv, header.length)) {
+		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
+		       scontrol->max_size);
+		kfree(scontrol->old_ipc_control_data);
+		scontrol->old_ipc_control_data = NULL;
 		return -EFAULT;
+	}
 
-	sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
-
-	return 0;
+	return sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
 }
 
 static int _sof_ipc4_bytes_ext_get(struct snd_sof_control *scontrol,
-- 
2.25.1

