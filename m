Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8599A5795
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76CE1950;
	Mon, 21 Oct 2024 02:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76CE1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468922;
	bh=sHJceF9qgO/8XgkLvZwhXK/dmYnmVfIJIK1XVUgl0l0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pwwWuY4BV1stpm+R7qcqCrV4BXidNOPTqWKfd8lZMwp2+tNOLlqSGWvLlbTLHALmV
	 kAzYXQI7SVFFQGRDaB1VOyZtheZk+sHcYUYcErdyfqY6X9a/oQOnlO+O+EhteAGz6P
	 YTeJ6Enau7DgX6snYm2n5mQ8URNYCjtXH8cysCJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4202F806E9; Mon, 21 Oct 2024 01:59:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 044A6F806E9;
	Mon, 21 Oct 2024 01:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3868F806D5; Mon, 21 Oct 2024 01:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71AD0F806B5
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71AD0F806B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CbgxOqLh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBUg/Mzvu8AuKMbwc+o8fkjvCugUKvsQzZ+PWAv1KsDCr6H1OfZiG90tp7rbrSEFQy0oIEvEwaquCrDpefB3Bofgcc+rGRbAuzUkOMl4t50If6aIGrK8u6IdkU+JzSRppXNrNEvsx07jwOHGs3i88Qj3UWdpnjC1wSgOYe9xF8pmdYzSexHkEL5LXGgG9MeZtd2blCCOXPila88T8YEn4zPM1yzGvuzEtBmzdp7Xli5rqRy0RlNd/wEqJZ6FEfZIjkcCiHyv2ruKjstdMDPj2hjwBbPiURIrBSMbrZBRnDBYEgva/mZJdbP7qijLT7eVvoYM1IK0teAvdyc8uH/7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qs4JCdG53zTFye5G/+UbLM1QMcObGvrEDohoMWSvXQ=;
 b=tY2Uq3k8HfKvcPtnWA8pbZuKO7fUzB8jvl7wNtF73bpsjOo8enS12Yz/Tr0rFuEdELFkEzkXcBUebk6sl01qLXn67fl6ctmOB+dlYsE3AMFBEF9An2OKs38QRu54r29Q/1khS1ibuvM07LcNwRM8sEAJyrgq9QN2y97Q7NrxgsEB3DapF/ChVs75MARvDztAgNOWXo3jGEisIDmaSFIL+cKpDrHB6EjjzpnGDSjXSkhwo1int8cXSJSDtsFYpfneaHrRfjcTQZ9wgORU29T474KrJ8PRvYJYCRdU/AXNNqq7TB0DAPwLg1I8nWPznhiQ4FXwPV+QXtvDBJF8SwbcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qs4JCdG53zTFye5G/+UbLM1QMcObGvrEDohoMWSvXQ=;
 b=CbgxOqLhgxZ+pNFU06XfpWgoGvLP9eLPkwrwjucdUYMDZesFL50VdN35cGErXRd65jMjGZzUfhJfs1jQM9632ejjixZQvdwqI4bqNyPTz5k79cijYzPu0DD3N+5C7TjN2Z7eNYg7T17o6T3S6kTw/UWfbZ/qpmCK0ywKnMG0yRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:31 +0000
Message-ID: <877ca29vh9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 10/13] ASoC: intel: boards: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:31 +0000
X-ClientProxiedBy: TYCPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:1::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 288cd4ca-959d-4d01-bf8d-08dcf1633d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DXyTK5S3SyFZF2x9nQ+7+BltgL2GEiG5yi2Q2LMuBRv2sux9JPuARJgCvrmM?=
 =?us-ascii?Q?eBi4P1zrxdRODMgd40/pwnj8JJycUtd8AE5luB2HC/t0a3jpi8oYW/G2GDOR?=
 =?us-ascii?Q?DTbAI7RARtTrw/USdMYKhiRge9EHKNq9LZJWZJ7N/TzPlLGJjYhuZ3GERZZ4?=
 =?us-ascii?Q?bAEtRe4+10xfIzL9HViTSogaRN7vQuDqVJ/XcXd4jVbCDBPd8QsnA4lhuleD?=
 =?us-ascii?Q?Ig9B+bS1BiyKAvX4+GFBjAwjhFs2ip5UYZDwwRg1HP1iEVG7D8GMylRAqqaX?=
 =?us-ascii?Q?WJ2wk+O7axBq2Y0XVF9xR8bNgfnr+cQg6HH8J7mJvPH4KZqkEwML8dexQPSm?=
 =?us-ascii?Q?wreIMIw+pa1rinXFFvyfO6s0eZ7PSe2r9XJSA4DTXdl9dKgZbuySM+H4hFN0?=
 =?us-ascii?Q?4XA/rS/y8Y2jWw8mErZ/39gNkaoOsMucsCSH8p4ASSLeFjjO/7VW0cieb45B?=
 =?us-ascii?Q?om5dbRrp3SJfvr1lQS93B/4thkxUaVjejwdOYGo7BPK7DE04gl/C68CIjJ9F?=
 =?us-ascii?Q?QADc9gV4Ov2kngs3wRmHWReHCOqB+c5GGfyS2ZD1sTBVV2oQCKeZuCDh/f0h?=
 =?us-ascii?Q?adZZhbrdk6o48oDmsTmbBzXnpyyyUJ/mm8TbY3IP8FeWx7Nu7/4Xm3JIo/H+?=
 =?us-ascii?Q?WFJbYsgtBi7V1sLqMMguaeaB8w+Gg4qmfuX4irtVQoI2NRonCDdGVOjbTHiZ?=
 =?us-ascii?Q?ddfdoF88MVJLD8rY5H/AgY5o+PPyO51qsFfs5Tk3GQH2UPlU9Nijt96bhEqr?=
 =?us-ascii?Q?uJ/64zQvlHnNkZwMhIGJmv/RTHDuw6XXvGmsqynwYfCjrEYE0HFmCABnydfO?=
 =?us-ascii?Q?vk6QRxmYTibW8xdwtChxftRXmIxTzgjRClvuTBdvDke5YUs/nnqXXvQ/X7xK?=
 =?us-ascii?Q?+EV/lfmamWuIxg0uMXs2Mn2vGhY02lESIxgBKMpKIrBv89SuyTmUZpw16D9C?=
 =?us-ascii?Q?yaHXY39h27iKftPxSv/ufwwGTolHl4C+ycV2rSMyf8yrQdwytb4T7L2hjhRS?=
 =?us-ascii?Q?/Q0o93OHB/7GRnZDdlBf8sNj4SiEezMLCY5xYMG0Yre5jIs8ziWCjV7IEOQB?=
 =?us-ascii?Q?rXZAPQmRnxc+cfEI0tNh1s9XUk5SdrKlsh+W/FEvi4fgyKhGQr3iYTBThUzc?=
 =?us-ascii?Q?nJG92Y2cYfkEQdE6ICOX0JkzrznhNTox2ORpiGIeUydqSLpvdqVmAdnGam0v?=
 =?us-ascii?Q?njjjyNG/BP9QxetQWm46j8v4OkumY0dwdOfD593yYRtFDPMTQp78dn4DJIa2?=
 =?us-ascii?Q?f59PNJSDOvHddhYyqeRwZp0b+uFQi7QkeM6tM5PpAoIKfX0GYGk+wVwB7GDc?=
 =?us-ascii?Q?hr5ABZrlo36GXYXa5+5N/2tZxm5tFmG4AU+/+ot+MXDm8wm/6RkI3D82KAgO?=
 =?us-ascii?Q?B2Vikko=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XYBZETK3sbMC/fEgnL9g/CAjVReAfzGy8qQUUFsgLEO9TABH1tsSleGRUy3L?=
 =?us-ascii?Q?rpa6DnQv8JJQTflK8Po9KizxemZ1sk3aqirhjjLe/eKxCAvI0OLD0HaRqW1w?=
 =?us-ascii?Q?Ei+sy1foddg1LhkMSCjPahiFJidkXzLf3wTXW3uqyLZiZeqFtBCExjJGNRWE?=
 =?us-ascii?Q?p9oIAaaaZlFb4OrrySeSIqmQcJ/kXAMV4ZMC77ixW4RrpB7q/uW6gwwhPj+B?=
 =?us-ascii?Q?6cdgr11s+6e8jTRNdixJaFuDZ7qPwUYKbsn/gpzXX+RHP5Y0HDhQhfOyEY95?=
 =?us-ascii?Q?59UbGnW+rZAHtZB2/l6PDYjDIp/z9gOEGa5lLe3NtvNOpS/V1q2L7ujlLZ50?=
 =?us-ascii?Q?513vkm/4cxWdZIPnJpMxk5OSRC3PdXPWksh1M3xjJh+KyDX1KW1K3EZo15ON?=
 =?us-ascii?Q?TeCv6cOQfzP4SajQcshRacEo5BOakp9oQL5x/bYyYWIyS1R/8ouiegBHlNNJ?=
 =?us-ascii?Q?BzVVrWU33ZrgDRF+bf3tXxelj2odmWsu70qbFwAyzplM0Kb1STpS89ZadTDc?=
 =?us-ascii?Q?2lMyQbMkH+k+1SkIgf099KwrJMDiATzqbMXcd3NtNhdd/ykRFreavphqtIHy?=
 =?us-ascii?Q?b/sMppBsYMPK8WRqGq1Nxi5JvFHpW5oqQSJB/TK66L6tI/bWkyeZ6ot7Uft/?=
 =?us-ascii?Q?FlNPYwxT8nz45evtR2tsFHxxw+G5/3ZbZpxul8mEM+LHBGuI6+gpuiU0KzJe?=
 =?us-ascii?Q?xaOYbm4vlgMmml1JrQNmvhswfzakmzNu01e6G+kgTin5YjMJAxShatlTo4A/?=
 =?us-ascii?Q?hR687KlFkTkPR/y3OrC6n70jfk4WcfBQ2PQm1dd4Wy4BefeUtqB99HTYjWS6?=
 =?us-ascii?Q?7jjAwQWys3/xcFz8L0BGaoJLCjCJXkZE5S1E9IosPW9dHJDR6Isniwsde4Yu?=
 =?us-ascii?Q?KN+PBCbo0DZtlVop9P5eUfqVvN9p/pumjhdcz7d8LsGVxq5XZDvScENbGHoF?=
 =?us-ascii?Q?k7+e0AkXjDG3UfooObmp18eMJKQPHT8L2Bt/vEani7rbAy3XBq2R3ZxWueP5?=
 =?us-ascii?Q?BtaTM4nZ8KN8muXYkJ+TlxrSccIMdfimQn/vNhcTHNkLay+CltGcI8J0qIzJ?=
 =?us-ascii?Q?kp2l5mrgmF8bzFirlI2Qm5O2FzLFJ5nk5/PHN4s9awuW3QThdC4ON+Uqng+C?=
 =?us-ascii?Q?OLV2O4Mv6aQjTAl/UquKnyqGpkNsKFeeLrFFcA9aQXhoxdl/yv0RWF9CK/Dv?=
 =?us-ascii?Q?zmVgi1dYODBvNmNd7NyhbfT2I1xFkj3T/t7bktrztE4E6u3Ad1dh6CdOn/i8?=
 =?us-ascii?Q?I9nB0r6ebNdfKZ7v3LWTRzz9RJ+wp9GZtJxiLPDU7t/5Ve20mkE+OROjQFZ8?=
 =?us-ascii?Q?rchWWHafkENH2MKiMxiHKsuYHQoV0HI/emzZlHzQ971x0qHmneTu1/YXJvSA?=
 =?us-ascii?Q?eHu2vdIiSxGKbDsRZxJUKHfFF0T2IsI2U5cFta2eTS5lE5EiHjKy5xre2npI?=
 =?us-ascii?Q?I5bkQa0PhTFz9eY3AovseTacTba226Zin9YKNIajQjgKCCDflHe28d+ZxBsZ?=
 =?us-ascii?Q?AMBUzQNl1BAH4HNDkGt1pv4vK3PY6UoXVCqjF4lQyrrk6y9So794MQrT7S0g?=
 =?us-ascii?Q?iI63m7CJFCn5P5t1TQIGTMOCsKPE3N9T0Ktev5t+OorylAFMOTPsQ05RCNT9?=
 =?us-ascii?Q?GzCNWDbOibuLYhUfmvC2Dd0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 288cd4ca-959d-4d01-bf8d-08dcf1633d4a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:31.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +rrGGD9gZeGy8Z5vNBVZQTs1UR6yW4VeY7kWUE960+xt0A2ZW6liRfITww4UEn5VXqVofbSvY0HbG4YDX1OeHJ/02D/kmMFsLSOaAPyaFigDxu9zCNsHWmN3v7coG90A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: PFT42QBKVT7IKUG4HU43KPFNJ4A76GIH
X-Message-ID-Hash: PFT42QBKVT7IKUG4HU43KPFNJ4A76GIH
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFT42QBKVT7IKUG4HU43KPFNJ4A76GIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/bdw-rt5650.c          |  4 ----
 sound/soc/intel/boards/bdw-rt5677.c          |  4 ----
 sound/soc/intel/boards/bdw_rt286.c           | 10 +++-------
 sound/soc/intel/boards/bytcht_cx2072x.c      |  6 +-----
 sound/soc/intel/boards/bytcht_da7213.c       |  6 +-----
 sound/soc/intel/boards/bytcht_es8316.c       |  6 +-----
 sound/soc/intel/boards/bytcht_nocodec.c      |  6 +-----
 sound/soc/intel/boards/bytcr_rt5640.c        |  6 +-----
 sound/soc/intel/boards/bytcr_rt5651.c        |  6 +-----
 sound/soc/intel/boards/bytcr_wm5102.c        |  6 +-----
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |  6 +-----
 sound/soc/intel/boards/cht_bsw_nau8824.c     |  6 +-----
 sound/soc/intel/boards/cht_bsw_rt5645.c      |  6 +-----
 sound/soc/intel/boards/cht_bsw_rt5672.c      |  6 +-----
 sound/soc/intel/boards/ehl_rt5660.c          | 14 ++++++--------
 sound/soc/intel/boards/hsw_rt5640.c          | 10 +++-------
 sound/soc/intel/boards/sof_board_helpers.c   | 15 ++++-----------
 sound/soc/intel/boards/sof_es8336.c          |  8 +++-----
 sound/soc/intel/boards/sof_pcm512x.c         |  9 ++++-----
 sound/soc/intel/boards/sof_wm8804.c          |  2 --
 20 files changed, 34 insertions(+), 108 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3c7cee03a02e6..d25a7188f603f 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -239,8 +239,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
@@ -256,8 +254,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 304af3d06d017..9484f34107876 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -329,8 +329,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
@@ -356,8 +354,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 58db09d9b6e16..523ade9f31ab7 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -133,8 +133,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -143,7 +141,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -152,7 +150,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -161,7 +159,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -177,8 +175,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 8c2b4ab764bba..68a3d345dc25d 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -175,8 +175,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -185,7 +183,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -198,8 +196,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 9178bbe8d9950..31141d4b6b256 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -174,8 +174,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -184,7 +182,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -197,8 +195,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index d3327bc237b5f..62594e7966ab0 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -315,8 +315,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -326,7 +324,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -339,8 +337,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_cht_es8316_init,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 4a957d1cece35..fec23bda9e643 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -119,8 +119,6 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -130,7 +128,7 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -144,8 +142,6 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2ed49acb4e36e..410eb36c37c93 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1546,8 +1546,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -1556,7 +1554,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -1568,8 +1566,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
 		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 8e4b821efe927..67c62844ca2a9 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -770,8 +770,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -780,7 +778,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -793,8 +791,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5651_init,
 		.ops = &byt_rt5651_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 0b10d89cb1892..a6dfbcfdf74e3 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -462,8 +462,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 
@@ -473,7 +471,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -490,8 +488,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_wm5102_init,
 		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index d7c1148588331..36984de8a0679 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -351,8 +351,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -361,7 +359,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,8 +372,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 7651b83632fa4..4afb292d4f13a 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -193,8 +193,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -217,8 +215,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index ac23a8b7cafca..b977a2db73a3a 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -448,8 +448,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -458,7 +456,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -470,8 +468,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index c6c469d51243e..aaef212cf44ec 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -358,8 +358,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -368,7 +366,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -381,8 +379,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 90d93e667bd9e..ebc417c04a500 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -178,8 +178,6 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "SSP0-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &rt5660_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
@@ -187,7 +185,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic48k",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -195,7 +193,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp1",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -211,7 +209,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp2",
 		.id = 6,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -219,7 +217,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp3",
 		.id = 7,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -227,7 +225,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp4",
 		.id = 8,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 1826a4dfd0f35..9bb2822ba63e3 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -85,8 +85,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -95,7 +93,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -104,7 +102,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -113,7 +111,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -127,8 +125,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 24f716e42d6a3..50e846d67c194 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -217,8 +217,6 @@ static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -268,7 +266,7 @@ static int set_dmic_link(struct device *dev, struct snd_soc_dai_link *link,
 		link->init = dmic_init;
 	link->ignore_suspend = 1;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
@@ -326,7 +324,7 @@ static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link
 	link->id = be_id;
 	link->init = (hdmi_id == 1) ? hdmi_init : NULL;
 	link->no_pcm = 1;
-	link->dpcm_playback = 1;
+	link->playback_only = 1;
 
 	return 0;
 }
@@ -361,13 +359,12 @@ static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
 	/* codecs - caller to handle */
 
 	/* platforms */
+	/* feedback stream or firmware-generated echo reference */
 	link->platforms = platform_component;
 	link->num_platforms = ARRAY_SIZE(platform_component);
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -407,8 +404,6 @@ static int set_bt_offload_link(struct device *dev, struct snd_soc_dai_link *link
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -448,7 +443,7 @@ static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
@@ -496,8 +491,6 @@ static int set_hda_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 	if (be_type == SOF_HDA_ANALOG)
 		link->init = hda_init;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index fc998fe4b1960..a927078768519 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -455,8 +455,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].exit = sof_es8316_exit;
 	links[id].ops = &sof_es8336_ops;
 	links[id].nonatomic = true;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -496,7 +494,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -539,7 +537,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -569,7 +567,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_only = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 8d237f67bd067..68380b738d883 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -246,12 +246,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].dpcm_playback = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
 	 */
-	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
-		links[id].dpcm_capture = 1;
+	if (!(sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE))
+		links[id].playback_only = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -294,7 +293,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -341,7 +340,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index facc6c32cbfed..51922347409f0 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,8 +167,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &sof_wm8804_ops,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
-- 
2.43.0

