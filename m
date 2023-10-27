Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBB7D8C7E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 02:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40AEDEB;
	Fri, 27 Oct 2023 02:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40AEDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698365485;
	bh=AUIr9ERMTcJQ+hw2qoW2jaIGWZXpEFgQt6rtTSlIUQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AAPanamdiDkwjVFWHtfRNpA+GBNlkKU+I3a7wW4u6gBTCIRrFYvyHsGk6AdzEhjM/
	 RSHOv64gsdj9Mn/k4HJg6YJCBCX/8Tpt8BkD3N87J9SVMkcOnMDsmTdGGqOHCCjmsE
	 pLDPzScSvroLXdR+ZZ/IdMkLfJtjcfj7DcaS65go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E2F3F80578; Fri, 27 Oct 2023 02:09:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3E2F8055A;
	Fri, 27 Oct 2023 02:09:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57D68F8055B; Fri, 27 Oct 2023 02:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6793F80557
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 02:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6793F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e8PGBlkZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhN1s4xB8PSrkOsf26zlPOpMAlOZnxIkI4mvlaCqwhQQZ/st3sr4XKl8duumjNNt8c5tWM9f19iFQeNgNO2dSte0A9CddIa30aEbdiEOjaAnvqQhWVeeaCSIifGm4hwLW1GvQnbhH9A01KRx+QLQD6oETc/bRhgtvbKMtriSNMKskgBbfz3qLQmz740rWEtg36Hn4kHx+8bCBI9AvhZ+LPBLN45ZhVrmim9r0io0ZG0H/kpuIlAdkFbzVYdBYiYbqGfVp6XAINLIYFWheM/4cu3f2Ok+dTmI0F1sIt+JJUWM7ncdeJW+diIR+PruNjbDKzr7NxHa2wRZNDyzZuZ8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GY2V7hge4FijZ1C6Q6h5TcQ49Qr1BHfb3NymKkle7Sk=;
 b=KMp/9+8KNV1dbRWuQhRFXoaOyAj3JkN3AwUNxtNfOCfO0hjGGusiZpyKpvbWqiFicG8up9D0kWlLphL1j9lvlVnqqUUZ/1SD3yXWmDl5Pa1QrUAtehIfgnZw6d6d//93h6ljS1G/1FIsJfaDav1xue4boII0Kf8sUAycITivR1WS6bZVLgZdETOkw7ycJxoCAkYm625pMW5hhTs/EfB/CNKdH11Kx6dJwvmLatIct0J+nzG04bv1QgbWydcl574cmVaBUS1WPJjnu2Q6dguyiPS9i3P/kE0t1paS4C176RO1H9w8q8F4/nWRBbLSwJdHH1JqOj0TNNZmUXgVVNfL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY2V7hge4FijZ1C6Q6h5TcQ49Qr1BHfb3NymKkle7Sk=;
 b=e8PGBlkZ+Cn+BQz+oQvEpatA9Hv61tQPWMeCI0SIRGb75TFtPp3Aff3vfzrQ1RF7FlcCuGnIAjx/kI6tKj2nSgvpz1tOpwOPmJ8U5BJpfARGj4QGR9mdflx0qP6I6QNhJQTT7JtOdWPqhlxLvn/GLgDof4r5autEdjJowuy0tp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8788.jpnprd01.prod.outlook.com (2603:1096:400:18e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 00:09:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b%6]) with mapi id 15.20.6933.019; Fri, 27 Oct 2023
 00:09:42 +0000
Message-ID: <87v8atq62i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: ams-delta.c: fixup cx81801_receive() parameter
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Oct 2023 00:09:41 +0000
X-ClientProxiedBy: TYAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:404:14::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e1cf19-fd94-4212-a9bc-08dbd681048a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iJrk+svhN8jDzTym/jMC2Tx2SstcAgOBSlRPGGicv51FENUWVwtShkR/DYjJv26oHdnpb289u2d05EJJRAKHw9SxCaBrsp73HUotJQLUAJRR0C7cfQD9RRdKcDFbfY8vxhFIsR4JnLxLecY71SM0qw3Lk0YzPsTaRtabmwGaQj6DZYY+D+MUXYNov8vpAaYicukQRtjqWuKvirAvV0CwGpsB88M9/hBuivTRddqd8UCGs4Uy8JAKEinnXQWqpYkqQi3C8wO/lgTXdX19ViGycALpt+tVWex+3EKL5JN/N61RXF6BYmeryc4AMvVWaHxB2sm4MAZ+tLO2xcKqrdmD+ZIKgrYR5oyFlevlalAhljxutsW2r2CDIM8N7u5QOA8vdYbCPPempQaU0SyWZA0FT43fumOpSKLUJ6XGzcgC1R/2BbsTUIDxJZrQV5PBqXU+6uaZc9nY4oxedQBqUbyPG6/knk+bAhPzp4RuCXv3LhGX2Ki9U5Tmu9dsm56W3U5Taa3lBWtpRmkbF4jCirabYl+5xbZW7u+ctCuCqta9lHFv/QcrV8bikxQOyCPiHURDiG/5v36P4sMKeIqYiP6Y0hQ4KOWDUU+6yfRPdZYwP4LZ2v0c2CQEr3tP4Bsc6dKz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8676002)(8936002)(2906002)(38350700005)(41300700001)(4326008)(5660300002)(52116002)(2616005)(36756003)(26005)(38100700002)(6512007)(6506007)(83380400001)(66476007)(86362001)(66946007)(110136005)(316002)(478600001)(66556008)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4WEYI3kh5Zo6BpxbdKHmwUy2MfD3XBaESuPZ2q0vfUYue2liV97f5Vl/3KQE?=
 =?us-ascii?Q?W5ISylUfxbCycp48VzMG/K78V8lhQVqiMELdy8bk6HKFf69a6s05/TvlYFg9?=
 =?us-ascii?Q?bQcwDOADHrXdFmWI56V/fuU9JCHfFiiLoHAhzGVqy3sXixuboxylk4+IayuO?=
 =?us-ascii?Q?bzlYZQ3vN5cagE8gSmTRfPFY2/ACE4M2lufrN+L0QGtBtv1kw7Ehic5DUsnB?=
 =?us-ascii?Q?Yp1a4LP7VHPkijKeXC49cp0OyssQcvCYP2FQf39KCyKvXxIwfNfSaSEegCW2?=
 =?us-ascii?Q?q7Q1tkixlh0EkLeO5k8wmlhBcYZssWoQ30eHUUwYm3XV2SHwydSHJDztvIUq?=
 =?us-ascii?Q?VEk1ZwVMivueYxIWB+HJDOcGz8kPXoXBaiIQXMpurfw/BpkQ8k+XBzyZyAGZ?=
 =?us-ascii?Q?gOAlmlDA+6mFoT/G7GEyY3y4XsIZEALkyp0Hw9seIoZRb2d8iqOFzIsCqm8j?=
 =?us-ascii?Q?/Hy9ChJaAEh92sYSMZK9DKnYX0x5f26nNIUMTFQwgW2xzfXrVL32McJOkYBE?=
 =?us-ascii?Q?EK9UTJ9lYO2xl+2/b33gFmfr8EeP2KDJTpHSWBokbbVUzRZW4FaWWTwHwREE?=
 =?us-ascii?Q?7zwot3PmzL7til1gvZgU0Cr1vgYoM3E4I3PCFwMe0HR9FWSdaSMkzfNcTX4+?=
 =?us-ascii?Q?FtvxO+BaUqCMilOBB/i4tnUHO415/DIj7QbmR9sDzH7uwPdwK8O1nVxqc5W5?=
 =?us-ascii?Q?WPWUq/t0+1O+/W6YTwKEsREV9pnuzA0s/cCREQSBKPE/u8M93oewYOK8p2QY?=
 =?us-ascii?Q?He3dWHbKvYtBJvfhyDwSlquDTNH2Hntx1YHrjbHK7WppQDbfb4pC8URjBjQV?=
 =?us-ascii?Q?9RAMpnxZwGhFDrF9ajH8eTuTkLOcSpRbMWsXCYr5Q/IC+Vr1m21crOeK6kl5?=
 =?us-ascii?Q?76rkqFpOhv4ci2C594DJtCnLnGUc0hWjPkfpQqQu3eFlTdZCFOntYPbpb1H7?=
 =?us-ascii?Q?otXRvF/A7iwm0IzhBbP43yN6tHgWiKYJ6zD0vO27veB8pzcrE/kDRLA9eNXA?=
 =?us-ascii?Q?Bm0scdObakInKTeF+RqSJsCsx8NblxBnU+frOg9zxK19CRqZbgAtw2zVBJ6H?=
 =?us-ascii?Q?VI6blLmQS0+xZhKcRNNT9aGoTO/VEDkvTsr3Lw5grZxWj47ESTodEgT+S9eB?=
 =?us-ascii?Q?7Fe1/0tJQOh5HN8tkkUhW574xpbIzw92zbLf0yWSmsIv+GkC/9iHdhFAeuzg?=
 =?us-ascii?Q?NrNGRB+S90CAaeRsmM4KRIlf2OObji4HGXhzz6JIDGghdbK4Ufo5UYncNcJs?=
 =?us-ascii?Q?TxGPklwmh9UkOKVTKLcEXb+p3dmERkSG7UqMtDKvVMIz9umXt2GX0vTo6hJG?=
 =?us-ascii?Q?iuaT+L9be4rnOayUHWYM/piZ3hED5Fc7pFJJDrzDahaTktbB63WknJ4B4cdR?=
 =?us-ascii?Q?YCJdIYZSDGUCKZEvGtFzG3/PliYRc//PopNpsdmqACFuRA2BE0TXWzwX5vKO?=
 =?us-ascii?Q?s71bALtKakrgzvRfIjJbBQbhxI0cP4Nj5fXVcxNcN1VmplNOEoXqb9CtQkXm?=
 =?us-ascii?Q?bl/e4jSyypxWb6BlVHMfhEsfUUN6EMj5pR15r7JiLqXsLXzRIRw2ZIV3H/Yj?=
 =?us-ascii?Q?1IUwkyz4kvExS26Gwmk7Ofc3YwJdwONGKbAoAN3Rzwr/MbT4jmXNrABlVsGY?=
 =?us-ascii?Q?I/HFHGqX1695xuit8Hv2Nsw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30e1cf19-fd94-4212-a9bc-08dbd681048a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 00:09:42.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fht2g/0HBLRBspic78GY3/MbiIIxPvHJgz+Bns8c53qgDa3Su03kX0cguFFbuJuHJnX02iC2CTLRWn46elfhn+8divV4Y1Ys5v9aDo0BBtALuURNKFWRcRKs0TiummLd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8788
Message-ID-Hash: XPUQ2SJ2MIUVX7ART5X7DTLNAAA7I7JP
X-Message-ID-Hash: XPUQ2SJ2MIUVX7ART5X7DTLNAAA7I7JP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPUQ2SJ2MIUVX7ART5X7DTLNAAA7I7JP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch solves below compile error

	${LINUX}/sound/soc/ti/ams-delta.c:405:24: error: initialization\
	  of 'void (*)(struct tty_struct *, const u8 *, const u8 *,\
	  size_t)' {aka 'void (*)(struct tty_struct *, const unsigned\
	  char *, const unsigned char *, long unsigned int)'} from \
	  incompatible pointer type 'void (*)(struct tty_struct *,\
	  const u8 *, const char *, int)' {aka 'void (*)(struct\
	  tty_struct *, const unsigned char *, const char *, int)'}\
	  [-Werror=incompatibl e-pointer-types]
	  405 |         .receive_buf = cx81801_receive,
	      |                        ^~~~~~~~~~~~~~~

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 687c1d969285..0c1ff65fcb86 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -337,7 +337,7 @@ static void cx81801_hangup(struct tty_struct *tty)
 
 /* Line discipline .receive_buf() */
 static void cx81801_receive(struct tty_struct *tty, const u8 *cp,
-		const char *fp, int count)
+		const u8 *fp, size_t count)
 {
 	struct snd_soc_component *component = tty->disc_data;
 	const unsigned char *c;
-- 
2.25.1

