Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C043721B16
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 01:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E3C74C;
	Mon,  5 Jun 2023 01:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E3C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685921591;
	bh=u57hoL34k8CU3O7XtJE0oMswg9fbLaSxDTdwt6OOXsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cdjPih+N+HBvQ309/LgrawEjPbjYeYT+pCeLsFEfUNF2Jh1yu665Zvo5JWAy4gGCt
	 E15t7eZOxQqYBZ8Ybz7hpFJe6Ww+1hP6Z+eehjM4iBq3EiRkz33GDppNEtTlabc1Ip
	 JmcFxrtNuQHsmXKVaLd2/rHsUQ8B0bDTAxdh6/Es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4696CF80527; Mon,  5 Jun 2023 01:31:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E64F8016C;
	Mon,  5 Jun 2023 01:31:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8323BF80199; Mon,  5 Jun 2023 01:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF4A7F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 01:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4A7F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CUb2AVaS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/QV5na0xluI1bWrrzjgwik146il79H8Kl7DDI5ofl1J69pxpWF1pZ6TRv5yJ7YPSwWMssXhudKYPJuraFAAV1XxGR+henOA3XNY+EBqB4kgi/3vIQXOe71+TXJ2bly/PbvPs/6g0vDH5tWJUTzL1Yoar/+6JEj35CWX4lLOykqzh2wHqLUL3d9B80oVxkIjKz5o7B82G+FVn/agSacpu5wvRC0cnqii8WyfIwS2/dJXZ+IHBGGaH7q69otmmGtSxhHsUDns9wXYyGY9nj/+fAF2lstveO4mKEND0xNPFfxknZphz7p9/1uDJyMFp11EgHwuPbBwP7cLd6ErVxS4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPpJD8w40ZwosqipFHs9QphPaW1JkQf3kCje51RD3ZY=;
 b=HgwbNcHq3hi0a5bL1KptRMEFbJqCYWJ9bJFlG669tja1i2DrLS0Xp38LnRb9iwE4pkxnhyy7BAmbEyZAgElBKbczGDy/D8CR4DXmw45oip3OnTbENJRafXEq+By04fVLBSuNpcFtyhHSzIWPMdSOQo0KVxigLg3IzgUM68dZzZR3BG7Wey7V8HLydriWshyKa4b0dzDqxIQPN5SPig7UOKFsPteIQ3GEtRtHgFIBpIe6x57JeP2MzSLeJM2l2ubaTV/CbpAQSOeEkaBpmYKJe8S3ni1vwbdDXR9kvnp3jX/DSeqjVeVQ2YU1unj/8wTVzpgIolneDC56eAGKBVih2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPpJD8w40ZwosqipFHs9QphPaW1JkQf3kCje51RD3ZY=;
 b=CUb2AVaSwfTyd24VsY4K13kJa76T8fl1Ev+2LBuEJDXT3GS+Cshr+X4Ia9n0G1Rr05S2o/lBL7t9hDfR6SJfPdI459q4ykbms+d0uqeuCuObYSqJW2d6BCE7774lvepuNrtDKwliyMCPVrJY2nVPS8/MICaRXmGn1ziUhACBAWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11251.jpnprd01.prod.outlook.com (2603:1096:400:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Sun, 4 Jun
 2023 23:31:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Sun, 4 Jun 2023
 23:31:06 +0000
Message-ID: <878rcyiz4c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <5fa212c1-26a4-4449-9f90-631b91fa8ccc@sirena.org.uk>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
	<ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
	<875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
	<87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
	<5fa212c1-26a4-4449-9f90-631b91fa8ccc@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 4 Jun 2023 23:31:05 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11251:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2dab12-a721-47e7-cce5-08db6553c4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fu7ikL1yBFAwD4VvPSdQ8jV9JbbTdjTdg+v7pw3ugj0adJrp3xjfAqoqlX5OVop2a6l2MGa6kFfEdpt0ygjDSXwnQRpgtkF9t92zvcGDU0H7e4AiOXIp7E90+jLufJ4OcU0aGqrEBsw2GtzoDa7RgZSbGMJu+gBVeIwBa7dA3NEIyk1h4gqQVgpbDY05ymy1jJ7M2af6NCMCRzO3u5o3QmKCpxsHvQCWdhZv+iuUtlFti9StsGHHvxtL4mOd6MrX5VTHwJxvlcwifG8uus3BixaGIIGIvKPk5o8AUIaLLdUz0HXVV7MhlQYaysrFr0iS1QXuQYEau+yesnPjK3SsqzmAzOu/QKn+DZr5eNp2RMlDKnPvHrYB9IGQQMTKq1Suv4EaCj3kl/cofXellmjiAMYW1bSWjRVZ6sTbfwrYo8ka0GU6M1LigcOAAFeZF5qIHPom7LomMZaeKrv3sByzr4Ohyq97dND4oeEoxOPKT7GM5BFbcvRD6cky0kjZx2y/3KUDbPSQjUylV0RNJKZ4fNiYblCVQ1iYcCHVn/DeMwjVMm3b0FJHMH33tGqPZHYnSyDutajqET34+bgVE65YJC8TS04YfTXb4rNAOTftG8iJ7ajispP7vzOE0xR5Wg6S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(2616005)(26005)(6512007)(6506007)(38100700002)(41300700001)(38350700002)(52116002)(6486002)(186003)(478600001)(4326008)(66476007)(66556008)(6916009)(316002)(66946007)(8936002)(8676002)(5660300002)(2906002)(4744005)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nIL/I7bUns62SRnUKtAx7OWCuic0X6FHhJKDZqcWgh0vvTDmOrkki13bTG8N?=
 =?us-ascii?Q?a0d6ehjQM6hJpF2j5VV1YN2IBmGqknjP43O/9U8rpjC8RY0mEqa+QyHWwcTo?=
 =?us-ascii?Q?p+QHA72jvMaY8cTgSQTafVCWhdq8JQyg2GQBD6JLG6X+ic/Ap11VCvwwTRtJ?=
 =?us-ascii?Q?pMstTIN9XWT29MEJWkKCusV0jZBLEIcayDz54VKmA+FIQFiVyQbL1JqTMSFE?=
 =?us-ascii?Q?/5cUswgKTNLM1nRWKgha1ZdC8xFqy9fFdMRyh4n38VPHqfWjK6LiSPhaqfcT?=
 =?us-ascii?Q?+7t2F65oKlRr4D/8UzKSygk7E7awKa1uP3NbfLTxqjBGgaf5ZwD87wzpUkb8?=
 =?us-ascii?Q?aYrdv7i4ZmDRpMrJLCdyyfd+2cf8jfbQG6XYbmuwB/Z2hegd+qVukyts4RZb?=
 =?us-ascii?Q?1rohbZb+tx9Hmm4lNS9ZAn8QoD8hQE7JiGyrt+BVsh1MdYoHe7V8/S/dJTHF?=
 =?us-ascii?Q?0Vi0WjptsOvvuo33Fd/g3DeWkIuG2VmLLp61hh+co7RME1B2qD3O9VH9pLyC?=
 =?us-ascii?Q?MM+u8NC7IppSvheG8w2wYKdxKl3Uda8sW9utDOHWiSNeuHgaEUlwEgj+BYKs?=
 =?us-ascii?Q?Jq8sCoIwTlOLMly3TxGK6jgpK5V2+1VwowUQZ0l+pK9NXVYoCGKJXnSLY5D6?=
 =?us-ascii?Q?jhSeMjklrKr5hhApWoOuOn56YKdBO7FXWYGP56cqwfUKMsesCAspjJdtXa6a?=
 =?us-ascii?Q?cgZ5rZRdA5xtIrNbdPv0w2Vb3JuaBSI3gBDgQxaqfC0IiuoxeT0GkvVk5nek?=
 =?us-ascii?Q?PoGsYTQnWiySfS1Jwf3xA2JASOvGorlfnD3X9aVGKDyvrb/V2otL7JHvj4UP?=
 =?us-ascii?Q?05ROyocqZcVE3XQMEj5j6wkkl8lkDimy5HDw66L0/xg8VGm+QL8PP6HmiwQR?=
 =?us-ascii?Q?h/hABymiXzlHzjqlvamjX77SXvNDt6IwoOWpZnk7A6v8g+E8bke1ifLgBkJ2?=
 =?us-ascii?Q?EBRCvMsY5qFRq4sUXCiOHf/GsdPCZkqwdn7idQ+sQNjImHg179GvCr0ipaGC?=
 =?us-ascii?Q?abZdlix7AOe1gW3ENZXykT1Bttq4/lgPYjlVyA1YkefANM1kWgfolc3D3z5Q?=
 =?us-ascii?Q?xZqS1ykzt5gViSsG2wfCtu5INM1Ms1j5LkrVdmlgNquwCON7ePDB5txsiVrv?=
 =?us-ascii?Q?BPkPw1SP1oUKlNu6Kyf1XdKOBbvBm7HI+/TfvVndnMlwwSWpWLo7NBxDWFtw?=
 =?us-ascii?Q?MIrxUB3+IS5mquyOctWASvDSiu8LFpZq7A+ojzsmHgOc/hegEG/dCzEs40FY?=
 =?us-ascii?Q?2oxohg74j1HDUZX2X83xfS/LMgfW2qYofnSuGgV57FltMPr68mFWiQ09Z7Ky?=
 =?us-ascii?Q?lFnfr7i0qGzBfNFNVorEDEJinEM9/RkYwS5ruDze0aF5UOHHmxIyIEHc4F8D?=
 =?us-ascii?Q?gAStiMlD0MB3Yt/4s1emUZjLYSgX8c9xAlvnRMj9QykgytjP0iDy908BOl+G?=
 =?us-ascii?Q?sOrTfN0HVv3314vaPSomBB44EmwXA+I2li18jBBqpic5SkHIBFx8CCWETaON?=
 =?us-ascii?Q?fnZIkVAC6gnG7OzLTsdp5G2l2iKf4GSHe55tUe9WQvTd/xeOvk0QGc6IqzX4?=
 =?us-ascii?Q?TfycaTJ83HQgSYRh16TLbSuGgI2bIk3dXcF9E3GZYiDHcE5jOdmkg7nDBx6q?=
 =?us-ascii?Q?KZW4JHh9VnmOy9Iux14Luro=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb2dab12-a721-47e7-cce5-08db6553c4b3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2023 23:31:06.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MzsxS2IzU08JbaTLpnn6Zrj0Y5D55g1JmiUzZiRnAVhIPpmen2zr53TogkHKdXMcyQow5DYjzfCgAPjAR/lCgwKgnHo0v4dzEKynNkNOuQpnvJ9JbAkg3Tk1uBajHVk8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11251
Message-ID-Hash: VD3LPTHSIOBVSTXZ7AZ5AOZXUABHBHRO
X-Message-ID-Hash: VD3LPTHSIOBVSTXZ7AZ5AOZXUABHBHRO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VD3LPTHSIOBVSTXZ7AZ5AOZXUABHBHRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Thank you for the feedback

> > In case of CPU:Codec = 1:N, and if its validation were
> 
> > 	CPU   : OK
> > 
> > 	Codec : OK
> > 	Codec : NG
> > 	...
> 
> > Current soc_get_playback_capture() will have has_playback/capture = 1
> > evan though one of Codec was NG.
> > I think it should be error, but am I right ?
> 
> I guess the question here is if anything is relying on being able to
> play/capture to the other CODECs when one of them is bad for some
> reason.  I'd need to spend some time digging into it to refresh my
> memory, I do recall some systems where the TDM has a mix of things on it
> (eg, HDMI and analog outputs).

Hmm.. in such case, we want to know whether it was acceptable settings
or not, otherwise it is impossible to handle error.

But in general, apart from whether actually use it or not,
I think it should have available settings, but I'm not 100% sure...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
