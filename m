Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0B7152A7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03CD6827;
	Tue, 30 May 2023 02:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03CD6827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407887;
	bh=X3jrfTcX9sZ0mJfA334R2cRnau6nF+rMqe41lrrJZG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hswGpgHoE8WjgHmCJ/kkVvI+y45R4d+HcAJDk+zzv34x3r70sSZG3eTHR274PDg03
	 7N/mOttj1HnaAaHtEwGogmA69+iCqx2Jhg0U86LqE0q3vUcol3nyTe3Lt0ahQPf/n2
	 Wvyfzpa1zo9lqs1OA16VnkZoh4UMtOubYx2Wxhjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39735F80553; Tue, 30 May 2023 02:49:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47154F80549;
	Tue, 30 May 2023 02:49:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99056F80551; Tue, 30 May 2023 02:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CC04F804FC
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC04F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Va9avtUX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA7JPoloxe2tBwQdYKoIGscHiGWBJ2e5NdZ6YK2ok7vkzMuaArfNEwX/vLax5XNLehWCCbSnJcdJkjMcKeSSKclZIVlFKmnrZHhf/qMFq4T2TMQOKfk94+FxLGB8R0yXJbZEvnfllzFKdcOgcXfI1q9ZvTR7rcvRJD4ZzL2pIcwA4spkIF6Cl4rvlLPEJTbuJWMFhAN0EWqoV8rhAltn5DYhfTQaeD7wCpF/SW5xjBhYSUfviGRRb2uxwQmH6+Dpes8pw9UD37dZ5piTP665DgWMz1HqzqekaxJqpgNPjZXh0koAkUdeh7TmD28JmVIlOAfhEAGj4qHl2fQA0uwMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=LrVm3VB2fUD6LKgY5dUv9k8WGzGS7HFOXIoav2ACcB6lwM3GopKHWawQqT+Ay2k7fehXLTuejxL5YZS1Jg8EbNFIMq4kLtB0JR3+v2mo+LQpip6e8mrMWyE9gwX65MxAiX6df2lgBPAw3mm5g0PSt745ITSyeIehH1ntMds5rYx+YOpRXlL/muEjRTFH20Hg0RYKOvD+a7M4qLSue/Xmow1yOXsKm3DzYrZ4kB/SeFKpbveTwbcKnkBpqJnPahJhcYOpdBMisGgnPZmqjUX3NZOAd+b0nFjCa3tH6XaVJ8BPcylsX34PIeQftQjGx35rLg4KpzrMyGQzEpl02QWVAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=Va9avtUXlUGRYeOOai9TACdLadecpLLAuSC5wxeAKh6Tbk30ynEI0d8fx7+j7M86QPosfTmYj6LryfjSvrd3d11pOqj9opHhko5gWDWf3GfMvIzAF2dL0Fw2JDP6hFLenervsuweGHcfrs/fY4RZbUUZRdmn4tYC1Wjcm6lXUZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:49:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:49:43 +0000
Message-ID: <87y1l6zlqx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: soc-pcm.c: indicate error if stream has no playback
 no capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 00:49:43 +0000
X-ClientProxiedBy: TYWP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 878797e1-f980-4701-9de8-08db60a7c1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rfnjY1+rAbhYif2zQmybj8ltuL/33kZV/rrZXiGNWrFepqRgsIPzlgCXR5FQVu0ihPHQTKkJFRw7CCT2ZoXwEVHvgAdvhVuup948yKV/ufBeEwVYVmiSvyOaeEz001x6aJ3w3IrwDJqlElU3IiVfKj8DiDIh6YLGa6cPdQ6Qrw2ceZSc89BpKgDv0MAMgVzmm1ij/yPf/LAsp5KE8Q7Z8wbN0xePNxjvQwIf03jdQyglCYBKFmPNYlInqTwl6PBHu4hd6ni6zBgTiGKrv5nUCI4x52MOYVYLGefPRFFe75jJrwaPkG30Wfh9/Iaghv7gB4KMQ9FEh4xIniXTUWnf0OcKA6w1GmWhFY2MVOZ3y8VKUblz0oeIdqZaDp0JdbbBASorXPMOEyu7ues7G5dI/jLp0tUe6y2Dg7R1k6M19aCOOxSzqVA8/bA2xMjSbe/Zy76H6JjseKlip7d3knsg7sRHCmPUYyqI4P4V/nXQGavHRB326NhrY1pY3igV5FiAbtkSvquG/hc3SN2uR2BiPxWtyXRqv8RnAeE1jWGIOLXr06rPeGKXyK2getW5vLEZ2CUqeUu63w2rLyvigu1HQH6pGBRGOyKE+cRjx6a7xaCU0ikNNkvSmKxHVbRdqHtU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(66574015)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?g5C+y0FrT2D7EBrBSMPdGw+A8hzSwAD+TLrXdw0zqWn2Z/FLBW5nbDRkwL?=
 =?iso-8859-2?Q?9/5RhZ44x0dM+J0dT9gQrNpl8QqlAOaTcKPXTN+aj0hfKAUQ9QfVS4kf/2?=
 =?iso-8859-2?Q?lrl7nQlopF5UAP02HBmvAjHba837zyPbMScQ1qKairXB/vNfPng8XqK0ph?=
 =?iso-8859-2?Q?cIhC65Nnppbjit7T6Lx6AQak59+gZEmSiKlaOrsJes1qEBgRd7+c92N0V0?=
 =?iso-8859-2?Q?rVDmViSIz6l0sjM82sC77Csz7ysbzHURGf6jYbTv2xWP1leseuympD4aFf?=
 =?iso-8859-2?Q?LCGl4Mm25393c+cHaYTtJ/3GR03u2liod+a7dZ4epIHTOCSzBmGI5vDxv0?=
 =?iso-8859-2?Q?tj6S++dqpvBO9pdWBi8s2iD5uvSr3NklyA0zDQqtIOrUhkPynLBSfkud83?=
 =?iso-8859-2?Q?PXgYkhpZEGuIdgOceZZosmwip+pASqSSgo2uH+cnvnDP11kHQOOHKB0Ak5?=
 =?iso-8859-2?Q?8I9BtXljY6SAdFIbwWjz/zpAuBqVxsKquqzo3Nvqfd215viQ2kdnZg59o2?=
 =?iso-8859-2?Q?PZtCMDL//1S8L4qtbOaev5Rt5+vj0LFHIg47dQdT5fjcUgPXBGGX/nVU/p?=
 =?iso-8859-2?Q?5gCY1ech3pWEfyBwGmuIJVBPrRNERMzuzoHwJaFR6nOvJR5QSjJSlj2lnC?=
 =?iso-8859-2?Q?BkgJroXIAUq89in2yi8HFKf9auutKUGAHeZ/0p/8BnA1CFdHqe/1K5jJrU?=
 =?iso-8859-2?Q?5Ayv766AvzCRJWBgolwbe5enV7PmNyUtWePv22SEi+vefDPjgfmW1Jrsyw?=
 =?iso-8859-2?Q?17imWf7I2F5IzEBApzUh93xfEA2+mhLIMfISDUSjS6C5O5CieRjtA9xhvU?=
 =?iso-8859-2?Q?1odZ5gi06EmJBa9qyC9GChxwki3x7ljpqA4RlVFRhBJlZHfSR0Wi8MVBwc?=
 =?iso-8859-2?Q?RqtiootuX7pdWhOp06UMPNEesaBQQSm+Lg6yZJalrw2rCQlnxDGY0Awa3y?=
 =?iso-8859-2?Q?jLnqQkzmYSTCFV7hHVGmUuH8vGDSw72gOj7FS6B5zdzadeeD2Ub+KSJIas?=
 =?iso-8859-2?Q?czOaEFuyrQtwD9T8Nr1y0GeONxpng4ywUb6VdWFPvNr4uU1WF0u/UUa0/2?=
 =?iso-8859-2?Q?L38bt5lUE2DmRr6z+j+/7gVzNDmH64r34TFPbfvQm7iNNOuj6Dh9bywsWc?=
 =?iso-8859-2?Q?wl5A641qeP9n9sdFIW2oEMJ2jYgLTaQeeqKbVixY4v19dm3fw+qUnjrjky?=
 =?iso-8859-2?Q?NB3K0qx9I6Q5tmhedzs29p6a6Aqb7ZM2Io3y4glEb9dfe2cpCL79I7NHyR?=
 =?iso-8859-2?Q?OXZlaH1pZKFxUFxyguwQdpH5UImiFWbOT1SNfh99RRAJxfbk85wwk5Em6X?=
 =?iso-8859-2?Q?FT1j24OqsAX1Appo50FI8OCqEY18JxKdjssyk0AKnVrW9FDmkoZy+CMIUH?=
 =?iso-8859-2?Q?wVwfGt7/72TfTRbH9cni2/hxMQNKzBBOurbNzvRaTV1U5ZflKkuNeLZsUc?=
 =?iso-8859-2?Q?Oa2K7GvkP34mBHNrze29AGdFYg25p6UNnsgvzyfi2c96zwU2qsQWl+sG53?=
 =?iso-8859-2?Q?9AP8qCVd+I5eFYFVhKT+UTAUnGMZ+ClWKfBQ59cDnXq4Bc3/ff6V04LGMf?=
 =?iso-8859-2?Q?3JyxLDKXDdr5vWHlXCEaBr/sxTx/mxLkfckBLFYUpq9zVeIgsR+4JNl3U7?=
 =?iso-8859-2?Q?dxgH3CMouXsJ6aEh8EJwl5Bcz0SLhWOcS2W/6pG4GZ+wJQwhzR3hAHeFf+?=
 =?iso-8859-2?Q?9avKcqj7PDgyZsiFD0E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 878797e1-f980-4701-9de8-08db60a7c1f5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:49:43.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XVL3arcO6c2g/lC+e2HCVU162sG9DM7LmTjkkauli391Xe/8NQJqVKhTsY9YKvV36ZDv+CWtDvJtpDvYZodabYzbI69H5zCKgiRdubjAW71iAsDTaKWhuaJc3G8b8hVS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: GJTUPLBOCTZ4GA4SKQ2MH2N7RVTY4V7P
X-Message-ID-Hash: GJTUPLBOCTZ4GA4SKQ2MH2N7RVTY4V7P
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJTUPLBOCTZ4GA4SKQ2MH2N7RVTY4V7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).
ASoC will probe the Sound Card and mapps CPU<->Codec pair.

(A)	static int soc_get_playback_capture(...,
(B)				    int *playback, int *capture)
	{
		...
		if (rtd->dai_link->playback_only) {
			*playback =3D 1;
			*capture =3D 0;
		}

		if (rtd->dai_link->capture_only) {
			*playback =3D 0;
			*capture =3D 1;
		}
(C)
		return 0;
	}

But it might be no playback no capture if it returns playback=3D0, capture=
=3D0.
It is very difficult to notice about it. This patch indicates error at (C)
then.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7247f44faa1c..fe65994485f8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2815,6 +2815,13 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		*capture =3D 1;
 	}
=20
+	if (!*playback && !*capture) {
+		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
+			rtd->dai_link->stream_name);
+
+		return -EINVAL;
+	}
+
 	return 0;
 }
=20
--=20
2.25.1

