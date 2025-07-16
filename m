Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F6B11008
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 18:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC1060247;
	Thu, 24 Jul 2025 18:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC1060247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753376327;
	bh=MzDFi9fwNSnlVpB90KG5+8SzkZ8yyBLPcbGpBKKVWh4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vlXFblZa38vNXcQ8kXS4M4urAff7DDoOLrA+CD+35CUs6dFPVbBkQvAKS9Hcmraz/
	 fpqzAXNO709r/os5MsmxGlW4d6K3EpTgPBVNqa54A3xKTVqmWUAnnHT23iidUpF9pD
	 oC/Zb5/rYRDUQCdZoKQRWamFvy06EV7BtZ1FLQ+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44359F805BF; Thu, 24 Jul 2025 18:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBF0F805BF;
	Thu, 24 Jul 2025 18:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8562F80557; Wed, 16 Jul 2025 16:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_GOV_DKIM_AU,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0f-00379502.gpphosted.com (mx0f-00379502.gpphosted.com
 [67.231.155.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E513F802DB
	for <alsa-devel@alsa-project.org>; Wed, 16 Jul 2025 16:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E513F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=llnl.gov header.i=@llnl.gov header.a=rsa-sha256
 header.s=02022021-podllnl header.b=xtCDlsZd;
	dkim=pass (1024-bit key,
 unprotected) header.d=doellnl.onmicrosoft.com header.i=@doellnl.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-doellnl-onmicrosoft-com
 header.b=QBQqH+Rs
Received: from pps.filterd (m0422210.ppops.net [127.0.0.1])
	by mx0f-00379502.gpphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 56GC0P8n020376;
	Wed, 16 Jul 2025 07:42:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=llnl.gov;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=02022021-podllnl; bh=TzwAQmga9AhA/AFIvv15E7p1bVKaz/vBTYTZgwVhkIw=;
 b=xtCDlsZdpcNTtKc1ZkN37xPCPf4aTAjuHaQvTrPauH14ZfEGXEDGA4m4fim3cAis6mHY
 6fDN7PCoKc/JbH/ZdhEIiR0bIkrpRZ/Zc10PR1BkIjRjq04s3yIdoJS98kFFohs/e2Oc
 wWuB4oBxayXgzcXhklCbOgCSyCvrenjGytmvFLEzge+ZO4Q1Xvdd3sDUFgpfcOudy1VX
 yHC9Krl3/wDfF41zUKA1kZLoU0aUDOET/mKk3ZGnVWy/KcP2XyC/eASGfmLNCXo9bu7l
 i5BZ+QGstujAHBp3dCCCte+/hVx8maFUkdsQNWtU0EXR1KcWxRVXmYpaYouZNKge1TKO eA==
Received: from sa9pr09cu002.outbound.protection.outlook.com
 (mail-southcentralusazon11010007.outbound.protection.outlook.com
 [40.93.193.7])
	by mx0f-00379502.gpphosted.com (PPS) with ESMTPS id 47wvm89jq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:42:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLBK+eom8AnhjbFnDL3ZU1Uv7gCii2W5HLjNPpY+ykoum7jHnzDWusw63gTGI6FSuF1yKwJFZOC1jFao2Byvyv/aF2qqDc5439O8qQnfVSO3EOBLXVsihjb7Pcw85Z9wo5ZUnZ0bezICOwR6NnpGMFzqrQwe2C2CYLbIjE5M3RSglFOE0jXrpjwJe6mXluaLvdA9qyg47/VTZBSiz6dQZvY+dbFoOAk9WLfzBFtsB1ia5MFN2wqNwD+XxkGs10Phy3jQe00kgxEoXrbFhayen5Ou6dxEPku0a1tcx5txIt34zV2LwUM4NS+RBl072GdMJ6JLwFxr78o0RFY1Q4jcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzwAQmga9AhA/AFIvv15E7p1bVKaz/vBTYTZgwVhkIw=;
 b=ribohG89m2Ivk8uM4rz6PBKfGGeu0fjh0Ad55rVdWRqO2dYDW1+JOx4XoF3enJX4X/2XdEY3jQJ8aEDwzq8CLaxPn4nUB0yz42+4nClPRpsqwwV0JnFyIW1wGwrA383ltKMuTWx9MwI01UnoEtcpmfN++lZnvA4cXRJ99ahDg58G8S470zAMS4xiEE4tzWNLGZV3e87mxkQPIif5JfMxZptJPgoYKtME1IgiFERUmqq1x5ISLoJbeLouJ+Roh1lwF05LTv1dkpU6NyZtPfQo9YqqghPhFcumvmVtOaaVzQOUxf2ohUaYnloQ2C0Klc77HBtYsz/afJ3CAeYahGINPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=llnl.gov; dmarc=pass action=none header.from=llnl.gov;
 dkim=pass header.d=llnl.gov; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=doellnl.onmicrosoft.com; s=selector1-doellnl-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzwAQmga9AhA/AFIvv15E7p1bVKaz/vBTYTZgwVhkIw=;
 b=QBQqH+RsxgMNsgTZQriLGwLwVGvD+j4rXIjOas4eETfx7TtwqfNRw6nfN/2LqHxbMvYoJwRqyPkQi5zYoc2bTBEc1IWfkcLj2hwBE2/eRY/V4BmrzfKOkAQpmC7auJl7l4+Bp6vnOKFtzwpanM7CAsum+sqIGUACwpAZp9q4xDs=
Received: from SJ0PR09MB6269.namprd09.prod.outlook.com (2603:10b6:a03:260::17)
 by PH0PR09MB11964.namprd09.prod.outlook.com (2603:10b6:510:34f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 14:42:55 +0000
Received: from SJ0PR09MB6269.namprd09.prod.outlook.com
 ([fe80::8f91:906f:e300:abb8]) by SJ0PR09MB6269.namprd09.prod.outlook.com
 ([fe80::8f91:906f:e300:abb8%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 14:42:55 +0000
From: "Harig, George William" <harig2@llnl.gov>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: George Harig <gharig@comcast.net>
Subject: Alsa speaker-test dose not generate 20kHz Sine Wav
Thread-Topic: Alsa speaker-test dose not generate 20kHz Sine Wav
Thread-Index: Adv2XUz6O6GZZMoMRwCDSLo9uvW+kw==
Date: Wed, 16 Jul 2025 14:42:55 +0000
Message-ID: 
 <SJ0PR09MB6269AED570AD2B2D0573EC70EF56A@SJ0PR09MB6269.namprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR09MB6269:EE_|PH0PR09MB11964:EE_
x-ms-office365-filtering-correlation-id: c6393f7e-fa76-4de0-7b61-08ddc4770d09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|19092799006|8096899003|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?YwY0rLsv0e5px7g2vwYUm5ZthFVSegb0QSB2/7Inhv/i+n+b0HXFTqVpomKM?=
 =?us-ascii?Q?5J+hol316/O6/HwovpPVMzGVvzlov3xf4L7AE8GMy0sbSirEOB4GUUhMrft4?=
 =?us-ascii?Q?eko3oZPM+oBmVyK34WP93E2Ex6pBCNFd6zE/untzdX3OGqbQ6sBvon8Cio5K?=
 =?us-ascii?Q?BSM0RKOVheLd329Z0C9g8FKDj7vgPn9ny8D2JcIaIsqX3JojYp3dzkBKCDZj?=
 =?us-ascii?Q?GVSXLx6jsoKpB5gfQ2YDEgLusxZG0bvRMyBStWUJekPL5rUOJg1a0Yhpo1Or?=
 =?us-ascii?Q?gtkjSDchSnOdDxH2o1Hfp/hUlmvVifACthA3iPwzsH9x6H82UPvy/+Hai9kd?=
 =?us-ascii?Q?3LrCicsevumpW2q9RcGjRaP6Rp2XcAYCJFIV6z6FZYkWsbyE5ona0Tfc/a0e?=
 =?us-ascii?Q?X5D6liNqtT1JqqPL54SHVQhJ2X+gTxdD3eip2G0qqbFEdjioZak04nfaEpbo?=
 =?us-ascii?Q?oujhqCatH2R7oxA38jRB3X289W6zkBMUJBMfyExqlYMVY++WwfXOYtOOk1Rs?=
 =?us-ascii?Q?G4LSyxjCUf+UTPDcu/aweUaTIpQP48Cv9KSJTbY27l6HK5DrhA1KWEGYiESa?=
 =?us-ascii?Q?T7Lh3P2ysDNqZAiW07uwnYkoGofhhDh3tE9tSdz9h/oEK7Q7qgrQS7IHEt2O?=
 =?us-ascii?Q?rMHKn+BplEVYV1kYx+ZBemC+W1vKwmcv7RSNyTzs/YUeIR9H1EsJB84AeuUJ?=
 =?us-ascii?Q?5Aram9Q5hp3JWnqLWswPH2iJcYrrmHUbcsN6mjKziC3NSMd+6fYqAgfNM+b4?=
 =?us-ascii?Q?YmSHIr55A+UP73AMXXFUwaqApzav+Sp7Tzq84hfsqwVjuy9EgQD/2s8ZYSbj?=
 =?us-ascii?Q?0MvCVX6zsyj/QmCOJg5n4IgG1mscjK4V4pHnKtNrbQZHsdIBTncGdW2MhgF5?=
 =?us-ascii?Q?zdgiS575Xhp2gviw+I2YGsBUTi8oxT/WKZFVaLWauHLAwzOob8pKhxOh0Qeu?=
 =?us-ascii?Q?CWIAKkyuJ93AnzJOCmhe8/uuHhj+qL3trNjny3R/Jod+yEPNycB81mgpLclE?=
 =?us-ascii?Q?cTsisqq5GpggsBiMSM41RwRaP1IDW0WhXikwNhZW19/qur4dr8zzpH+TZYRV?=
 =?us-ascii?Q?WjvFSdmwuVHvd+GPaYqYC9GzN0iodRzl5YUGfkasLgz7Fn98Sse0xmNB3ril?=
 =?us-ascii?Q?TjkNlKvD+kxZbEXQDTHva4+T4vp57KtF6cHtHsE5VyG9mi93p6Hi80G8QDz9?=
 =?us-ascii?Q?ddzwZjsRMWaKTA0EkOE1rUhrWkaWeuc8mzRgR55EFNO9gmRyULqBos7amVPW?=
 =?us-ascii?Q?5zk2ekQrWwaiAVo84p1UD0ssnum1ikrHFt570HlCWI6dDb+PxzUItzYsa4jx?=
 =?us-ascii?Q?4kiAQq8MvHdERgeOGx3AW8Mr4LeJRFlak+9Hv4A9J7uLe7lYqFGveAGwEzgH?=
 =?us-ascii?Q?JBUcHGyOy88pPt8axLQSJzHkxQwRsaKcqcL0Gyq3BqczqPM/V6h0HNGDCeg9?=
 =?us-ascii?Q?WJC3wDmzdiQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR09MB6269.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(8096899003)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WIoA0bh1Eje9FaNYp8G/gyaPLX/7y7wkdqsbFTSDiGubkWf8anBXPx+wUIvQ?=
 =?us-ascii?Q?QVuqFwA6bAnAaYhoWVttBAV6V5J4t4z4SGFMWwLdFymwmFYcAhrxEh0BhGFs?=
 =?us-ascii?Q?3DTAqpcK7+pwdVdUqZFGwm7Zrq7Bs5Lnz/IJMVelA5KZshew8ucS9SUMmE3b?=
 =?us-ascii?Q?MV0dEBQAD9v27k2VUD8Y6k26bhHr+Z8OGhNKSrdM+Sv+Bi4JlZyxjB7hkAic?=
 =?us-ascii?Q?l6rSb2x90Jv6OpBHSBCeqT2KVoMYmibstsXGP84f50hOqS74TQnJYIU4KSv+?=
 =?us-ascii?Q?mDkcChoBLgYltBRZckbO1adL6/PJxJYfHcwmWs/4vrluQWY0UDCG7Bd1IqTV?=
 =?us-ascii?Q?qLTc1hxwNO78rCApihQahIE3fH4NrVrwVCRiXeMzqpBng5BGUF0TshE0Qx1r?=
 =?us-ascii?Q?QCRMooaMJ9aKPHSQirtXIoi/033bNK2bdaARgxFf4Q3BankXLAvuRafEh3Je?=
 =?us-ascii?Q?xqDGyRjFS8D5uI+D0HqHjiQK6sP2IvlUwy1PSNOduWZ9lNOU+gMSACXU8qs+?=
 =?us-ascii?Q?0KisqGH2r3FWrRPWU94di/pDbnu6NvsSsylMIbJ3ZQBIt1GIQW+euYhlDgbJ?=
 =?us-ascii?Q?j4rLaaSGjQ9I1zB2HTdYBUvVZX5BDkxgdl3EpnR97z0nWAGXpGE6mne8BNUa?=
 =?us-ascii?Q?8DI8ZFGYqNBVNDg3hIdm396bDT7yu9ZcjQLz2Y1IQ0X210HfyvvUHycfJ2VV?=
 =?us-ascii?Q?dKglklzl7+qdx1bcPxnkwB6cpjSnXuGVK4oQPTd13y1MSkCsW6iSKVet05cw?=
 =?us-ascii?Q?KuT3sCwafc/OxbXtS95g7ar5KvWIGRGstC4bIJuxMbLZ7pjiXJPWoxpKbCPW?=
 =?us-ascii?Q?cuAOwPBGVysuhEcXB/Zv1AdL3Lan2y3tgEg2PEfplCMy0CT5WJUazDt2S0og?=
 =?us-ascii?Q?MvzIq5kNPhWdVydhjFaTa6rCusoBuyCKwGloRgMGS6bHpwXI8YXjOEjJihO8?=
 =?us-ascii?Q?rqxZmh+x4K//r30Vt3IbtLaK7MCUzvvICfwCGoeYEZ1YH+jv1Q0RpcAA3Ndd?=
 =?us-ascii?Q?O90/DU7JRGhPKtQYmQQvvtD/eiXjw7PfDqZtc0c+aDJG/QexNu41QC+i7P6P?=
 =?us-ascii?Q?bpqnTqghokvuRi8JfSLJbLPXjOdC028bSrNBTcoZtBcj4v8oBsWIGlQCVDGH?=
 =?us-ascii?Q?Wkqj60xsraW5Jpq/JQ1NNA2NR/qMK72YSYeonH4k0GFN2ryw1G/3UVmsZqzU?=
 =?us-ascii?Q?w8EkfP73XcVblQnjSjP8MSE9zM6OXIw0UeUQXXQsTrFadxWKiZxRsOeIQ4Wq?=
 =?us-ascii?Q?3GKYQ1KZbgSE9RVbu2j2s4XMJ2mxiDBR8+gPKevQHlGxYe/JPI12F3pf/njp?=
 =?us-ascii?Q?jkZBbv2lzaaoiwp1dgBmAVDGpJgLiLUc8uuCuyC5BYrZWER3WO26l5n2d+G5?=
 =?us-ascii?Q?o2pT2T+aBIPSSIHYBGe9c8ZbV23MfitxV4pF6LYmMDdLj2gGPQhz82Spy7Jq?=
 =?us-ascii?Q?w9709iCpyyE57DpJQPmu1YSNLhZZCxpplRYxUkh5w35BJcILPWJ/k+5frqk6?=
 =?us-ascii?Q?ofRBCEPTW4aFpKB5xTnDsxy1VIbJqI8gAt4CWpb+hYg1gwejhO872L0TQt4E?=
 =?us-ascii?Q?Z29gqDU4hNvm2xCZK2o=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BndDu8/J+9O0buf8eI0IFuBmkY//4jKB+ypeCCcETvnpshUVqR92yMcS4oQ0Pk7Lc/XN6cT/8ClX7xseoSSFTHrxXB3t5TfWxJKLajLsdSQjjlMSv9rzB1cbfIQ9dVVj+1wJ5/QzDhZjNkubN32C2TEG8ckEwZ+pUqmbMz8Vq0ywgizhxlZ56ni97B0cjTz4xS+6jCPkTX0jETdXENqiIcYLt0Ne44SvTo30eUmlUw7whv+ksodwJap7zpE0x3luih8HkiP24JAxugGga8Ye5Bqd+l8B6h6JEyatuvmMe6bb476X/cZ9149VG03kEh0T6Gk9mnJz30qH0TiY5kiQChn3YIb7SYgbUFrYyzXREHz84u9C2X4L/LymWrfrr5yyJ+g9FWGRmERaMuyk4/ohR7GlzozMkwOiVrXzWOOcF+1S5OVx3CKuUb1bPK2O8CCRIpqMdPwg8XiljzmPxVUcBhRbHNIXGQJpuVcl2Nz8/2zvrQ98YRVR0whTiOqE/d8dW/sISnSWH2d3ZBM5/T7R8DAxkhgj3r5edDAKrJQS6vTw1uGVXWYF5NApPUwJtONifrTdr9GkQsSELddb4oZ8S8H3PEkYx6Pqu6qIBC9bM+YSy9gk1dNKX22i+N2IFPlxyCOLk6YRuMC0j+59JsQDXg==
X-OriginatorOrg: llnl.gov
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR09MB6269.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6393f7e-fa76-4de0-7b61-08ddc4770d09
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 14:42:55.5152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a722dec9-ae4e-4ae3-9d75-fd66e2680a63
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR09MB11964
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzMiBTYWx0ZWRfX9rKYT+Mwwd6s
 9FUaNM4bqicYcPNN0wwrst0p805BOL87x1zwDSY9Zv6kYVYjTDzBG13Ax8CiuyqkZjCYPP48vH0
 /vd9xFWDZ0hxX5gHeZE6P/EiCmcmQJD5V7YoUa1JiKhA9MYFDIlBwE3iBlYFIxavX5cBHiLrLEW
 MCA4LYTvMB1y9dlVtF66gXxOY8ascPJ9IthZLa76hOi+FlDETWv5xcrUW6FxieqR167kPIBWowS
 XMtUOp1P4ScPnXOqaodpDNneY0Lkd65A/znyOrorfg3x1Z9IrfV77wZ2OixoafQjOsq7nmT+LME
 ULqSMW1Pffz7ckIp3rmCvrNdrk4zWmMIxoMI/kLQKcE+ahovc0PmlXTaJ6XLv/bgB5PKDqnr734
 Xae/SI0m
X-Proofpoint-ORIG-GUID: 2zZwdqqEzp7sMxnso7vPqNuD--qD79zK
X-Proofpoint-GUID: 2zZwdqqEzp7sMxnso7vPqNuD--qD79zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507160132
X-MailFrom: prvs=62924f2056=harig2@llnl.gov
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K6JR6AF7GQW6AHCULVNFK27PNKMDIBSU
X-Message-ID-Hash: K6JR6AF7GQW6AHCULVNFK27PNKMDIBSU
X-Mailman-Approved-At: Thu, 24 Jul 2025 16:58:05 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJKQK6KHQLAN74OCXZ2SE2QQPGZ3GIWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Alsa-Dev,

I hope that I'm writing to the proper place to report a problem, please advise if not...

I'm not able to produce 20kHz sine wav with speaker-test 1.2.13 Running on Tinycore 16.0 .

Below is what I submitted to Tinycore Team, and they suggested that I contact you with my findings.

The hardware I'm using is Winsystems
E3825 dual-core, 1.33GHz
SATA 2.0 channel mSATA socket (shared with miniPCIe)
2 GB of Soldered Down DDR3

Link to product: https://winsystems.com/product/ppm-c407/

Tinycore Team;

My problem today is that speaker-test does not produce a 20kHz sine wave on Tinycore 16.0 to the line out.  speaker-test does produce something just not a 20kHz sine wave.

Code:
     speaker-test -t sine -f 20000 -X -l 0

However, using the exact same hardware running Ubuntu 20.24 or 22.04 the following code works and a 20kHz sine wave is produced.
The difference being that the alsa versions are different between the 3 Operating Systems.

Tinycore 16.0 Alsa version is 1.2.13 - failure
Ubuntu 20.04 Alsa version is 1.2.2  - success
Ubuntu 22.04 Alsa version is 1.2.6 - success


Through my testing, starting at 8000 Hz, and incrementing by 1000 Hz, speaker-test does produce a sine wave, until I went over 15000 Hz then no more sine wave.  :)
:)
Code:
     speaker-test -t sine -f 8000 -X -l 0
     speaker-test -t sine -f 15000 -X -l 0

:(
Code:
    speaker-test -t sine -f 16000 -X -l 0


The work around for the time being is to configure speaker-test  to play a 20kHz wav file,  this dose work and produces a beautiful sine wav :)

Code:
    speaker-test -t wav -f /opt/20kHz.wav -l 0

Now for the people who will say why on earth do you want to produce a sound that no one can hear, and my reply is "Exactly".
I send the 20kHz sine wav across the audio line as a way to supervise that the audio line is fully functioning. The second the 20kHz tone stops we are notified and send someone out to fix the problem, whether it be hardware or someone accidentality cuts the wire, we want to know.  Basically the 20 kHz sine wave does not interferer with paging in the system.

My first thoughts on why the 20 kHz sine is not produced, is because of missing driver.  But I made sure that every sound driver that was loaded on Ubuntu was loaded on Tinycore.

Code:
     sudo modprobe snd_seq_midi snd_seq_midi_event snd_intel_dspcfg

I also loaded AlsaPlugins.tcz just incase, but that did not make a difference.

Code:
     tceload -i alsa-plugins.tcz

The last thing I tried after was to set the format sample -F parameter to 96000

Code:
     speaker-test -t sine -f 20000 -X -l 0 -F 96000

At first when I did this I thought I was so smart.  A sine wave appeared, however I did not have a speaker hooked up, but when the speaker got plugged in I heard a high pitched noise. So the parameter affected the output but not the desired output that  I need.


Another thought that pass through my mind is could this be a configuration setting during the build of alsa that need to be turned on.
After all 15000 Hz does work.




This is slightly related to a previous post linked below.
https://forum.tinycorelinux.net/index.php/topic,27673.0.html


Thank you
Any help is greatly appreciated
gharig
