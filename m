Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE496B6CE2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 01:50:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31BFA142E;
	Mon, 13 Mar 2023 01:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31BFA142E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678668631;
	bh=HZpjx30Se9SsQHbHbRwxCn11/vC+ZfXM4QSlLyjUbl0=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CkJnDxeaAEruoxsVhAMHS1T9VHh2LuxX3GxSWrCHRoHyoZ6DE9mhhyMCKVIJgLtnn
	 eQ0CYvyI8ibLJL6AA/9AfuPjrA+2ig4aNGibyiewo+eU3niRPprnPQM7ptERFFgBMm
	 JegH0p4U7HpyyeJU5Hfq4E/D8CxqLmyZABvFZZP4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD1EF8032D;
	Mon, 13 Mar 2023 01:49:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14239F80423; Mon, 13 Mar 2023 01:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B39BF8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 01:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B39BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Uo9hAFMM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOFVoCUmhi8axfWPenvbG4iea0Urwuxz1uZf48IHT56lmRbTvH6NR6IymJiaIIJyep3Xs9y9YB7TJVzLvxbjnjVsAezNSJBryItgW964pJx9Y0hPtYmm54y5qRxcOPTWxDvsjNELtmSxWRaPdeJTVCaz+plEjrvq/TteeZXSYPsyVBKVzUYQIUACoqwZtL2Wxd4IqYOj3n1puU0Y53sK++LXR1FyYDsHzcYS7lXEQRMpYLZNOg3jdC2ZvJDNG0GvyMir3x91bfPokFnPczqRITZBdBl9H1iTHbX4QTk0WtbAVo+iBQq+KFWjrIZWFpJalzVOxKQhAGWIw7EOb5InxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=X9US47nuD35xEvqRoZnacdx7zhhNPe2CgNalVRs4cqv4kZ+bv8ruqL+0ICJDeexGLCya7hb6Lwq8fiq6yqZYmxy10AyWlklvBRP2P6rRkFFHXOe2OknST+86gZZKV3L6UMoy1w9YdM3OeGSm3CbuGwE5VjSsI+DzUEXp6s7oARvWLmYc4xWRzdMMi8oKy3mD2TSjZpV512YQIhG5uFe2pAEb5ahCak9nAUtiXVlqR9ZHdO7T2CRk7spibJfxgoNP1kscbm9+OYx4K+kun98PwQ49rvFbK5OEb+FA6O6L0dWKYj8PFNlWAfYSwhncJpCdCBeky/s0Cra1d1ExHxCfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=Uo9hAFMMjU3Rki5PF6cvd6HNHTgbyC5afHEwKjwDeaMaiyppovcViQt41E8KGgfh2T3PHhewdnf75+T1497o5wwaplth3YkgUcqMl+1PXH+/jmR3HyFAFSX7kxl7nZ+FcpGQQZ4D1v4Cqi+MDCfdL3v5tJP+oMJPv0Vnmcrd5Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7823.jpnprd01.prod.outlook.com (2603:1096:400:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:49:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:49:25 +0000
Message-ID: <87ttypeaqz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ALSA: asihpi: check pao in control_message()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Mar 2023 00:49:24 +0000
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: bcac34ba-e2fd-44ec-472f-08db235cca8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oa2s7k0GGHuVdKOTGuZnMyoJL/U9pGz3vN1zmsCeTgJ/qi+IBDfwduV66Inb9pW4+S4Ql9wDeYk6zO4I63IDAYdShG1+7QZAcTvk8sxPPpUlE8QqegRmC87T9W0d0pUMhX0YPeq6xrrhuXgsy5AtSiHnF5SBDne9d5tORNykZDMa25nBv2Jn6g7Qycb6D9OUi/vYCDC8hcElNzvk0iXmlYUPVWszht1b5pFy3wBob4Q0Xsa9rSgzKBanuFgyN2liIeUkf8K+Pba75QIKkaQ9LfeQvMim6lcfIOZjvLEdJZa6SWIAldzg21juQC8sQXHQPta8F8rRh3/TnHCQEPnlZLxbSUlPffY2D4MhnDnEfojELynaexEtS0KSb+o38hw288wioaTwc/rYtwVj+36ayx63Khmj5t7kFK3ehF3jWDMGmpTTwutxSvmkslLxY2eObLd6yrPjnY1w/kM5pfcrnK4kudABuTE5NhfB6E+Zg6XrrNbtsXR8rD8ejWv8lqlyiKFsdkggEa//6PP/cinP1SoZxC3FPD82V6t7i/sJw25+TlLRGR0t/OhKZ9h+7J1clfAYcP6AsOgymljbupNPKnVbfoGXnz0obzHiOnin44A48F5dUQ7N6grTgQvmbyX7IkFIQtUp7VBo6oB74vAFvSlFX7EZmYVIkPaq4XMjemIr5CajwalGeehS82b20viKOc3OIbL4eFQYyF6hbevnJA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(2616005)(186003)(6512007)(6506007)(26005)(8936002)(83380400001)(38100700002)(6486002)(5660300002)(8676002)(66476007)(66556008)(4326008)(52116002)(38350700002)(2906002)(66946007)(41300700001)(478600001)(316002)(36756003)(86362001)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RbiZd/1qQnscAnOfCaZaEzvZRGoUv/Zxs/44l7OI1Z0Mcb//L/nFSPUB98rz?=
 =?us-ascii?Q?f1SFhx4TvV20MQ+EXniFPHM4IzuI9GPndxy85PXtR+YFovuiqahQblv+BfXG?=
 =?us-ascii?Q?2EnFclBTxGTPDvmu07rt8E9pzvXI+SdFtCgl/R5IYzcWKBwivr3233tMyDNa?=
 =?us-ascii?Q?moMQOYihaKlg8dk2Ta1IgI1ZJNAvLysdKrVQDtYlLbFM1SNplMHqaVnQH5+T?=
 =?us-ascii?Q?4qH3KxXkdP+sg+rkBMTGLowt/X1wHV/CGZq1cfQbYLOjrgDKLuX+dFNehgnr?=
 =?us-ascii?Q?dVxWhzbkgu/6DyvHqQLWAGfBm1tReT5+gQIQ1cZDwBC4aqWFFcR4KuFmC0NQ?=
 =?us-ascii?Q?lz2pOnaNzMw0EpkTL8Sxv50w66SdAmyHHo7/MlzxJG7OREZIT1J8dzF1gYTQ?=
 =?us-ascii?Q?C3P6iApJtImZCEUMki0Vch5gs7hIMP0LPUOlsUO8AbyHTLxh6WCv7eQexW9V?=
 =?us-ascii?Q?USoqHZ0/Pybp3UBgc7ca/7y0zGk+v/spsmTZKA25cMVogZszFMkthWvoAOM9?=
 =?us-ascii?Q?TVH4MQMvnOUqmK+dTKMUL+Cb6R/n+usaQFNs4a8wRzqvOcyahWGf5jlsRldb?=
 =?us-ascii?Q?/uA6Mhgp2B47antFjQWQH3N4yvZdLXJnpAWj1PZkDy1lROwdChFaXW75mLJP?=
 =?us-ascii?Q?NRuNWqYZED99zfjGpZ/0pAtIN0iTna3ysfoHkYEsqveRaWfvdlgZluwu2c7p?=
 =?us-ascii?Q?jwx5Atqf2xFBPcSjvcXXTT0O1/UzANQ8skJk6bSX2AV8egn28W1BYr4L0mLw?=
 =?us-ascii?Q?QaNrdT6R5HN9PHvpZZ5h4ascieFVtcTYMKUwOIEDpqWXwSkUxUPsE7cwq4oN?=
 =?us-ascii?Q?1i+wtYM8yNYInQ++LXF06/x/TKVmU0vCaXZAfiuJshp86/01+1+TkOOnfI1A?=
 =?us-ascii?Q?4n3ehMxxWgw04EeWsv+5rtamemiFvQTu6FDbqgf+cAXxvaqPH4+vVIl1bcv5?=
 =?us-ascii?Q?w+u7HL2BZP6uhTaV3jxUXOEJq7Q5BHUWGDQ9Qvf1XDSJv1Pe00CIgEWyWh00?=
 =?us-ascii?Q?JmQBThLi8yD6tKZyvIrFxQmmuh5+c9EhrrhPnivVWkXGehD3ZvPQ/3q1WC1U?=
 =?us-ascii?Q?rdSW6+xdr1yDHnJI5dh3fRf897J66k87cRYSghi9/KEJuibpc5pB82GsCW6C?=
 =?us-ascii?Q?k5/iNGL9gYIXp6TaZxaI1BFvm9aSKGRAggAw8crz426RPwOd5GJ/yHa0HHBQ?=
 =?us-ascii?Q?4LAjlFPIg27g6aRIdjuwA8hFLBecOVQRCzZKrUxD14WiECZBgRBbZUz4WQ4g?=
 =?us-ascii?Q?vQi07Mz6G32QTJm+SI6wNldjr++F8RhGZNlp/LJ86s4UULUlWBmpTRWtrf1S?=
 =?us-ascii?Q?owtYl6XaCkKpAneG9bUgqa/nMEJY/i6Prvk8cbARvfpaoS7nZxByiljV2FTR?=
 =?us-ascii?Q?D5+HPA/tPlUheqvEqFZ7D9bfs6ypJ3slo+SqFXO0wYyLapW1lCi4MfCqAd6X?=
 =?us-ascii?Q?Njltb0A/MOrVuBw6mBjHdxpy0x0Wf+7x7Wou+1HnrZFerDnlJajE5WL/QGMr?=
 =?us-ascii?Q?hD1VDna1fUxgqUnOc6sukp0M5qM8yFHqUTP9MdbKyJJprSrRswtq7hrvYtG3?=
 =?us-ascii?Q?K8PMvW7Q/PJHDz27KMascwuspT1NYnr24Htj0CMdeXhg0X6YizDR741L8IyF?=
 =?us-ascii?Q?yRLISn1CKvhtmNsBAixOi2I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bcac34ba-e2fd-44ec-472f-08db235cca8d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 00:49:25.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8+ndyqSm3RagKe/lfANDYdLs2oU+Ey5SeLal5DT25CEdmmQ4rXjg8cnlR/AL/sebanLhoYQdHdqcgNGea8+uxI1jSyyoc7lPVTiqT3k3fmbkHKo754v9or45/HsX1HmS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7823
Message-ID-Hash: K4CJJPQKOYTLI3EH3Q2CEAGBD4V6BNZ7
X-Message-ID-Hash: K4CJJPQKOYTLI3EH3Q2CEAGBD4V6BNZ7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4CJJPQKOYTLI3EH3Q2CEAGBD4V6BNZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

control_message() might be called with pao = NULL.
Here indicates control_message() as sample.

(B)	static void control_message(struct hpi_adapter_obj *pao, ...)
	{                                                   ^^^
		struct hpi_hw_obj *phw = pao->priv;
		...                      ^^^
	}

(A)	void _HPI_6205(struct hpi_adapter_obj *pao, ...)
	{                                      ^^^
		...
		case HPI_OBJ_CONTROL:
(B)			control_message(pao, phm, phr);
			break;          ^^^
		...
	}

	void HPI_6205(...)
	{
		...
(A)		_HPI_6205(NULL, phm, phr);
		...       ^^^^
	}

Therefore, We will get too many warning via cppcheck, like below

	sound/pci/asihpi/hpi6205.c:238:27: warning: Possible null pointer dereference: pao [nullPointer]
		 struct hpi_hw_obj *phw = pao->priv;
		                          ^
	sound/pci/asihpi/hpi6205.c:433:13: note: Calling function '_HPI_6205', 1st argument 'NULL' value is 0
		  _HPI_6205(NULL, phm, phr);
		            ^
	sound/pci/asihpi/hpi6205.c:401:20: note: Calling function 'control_message', 1st argument 'pao' value is 0
	   control_message(pao, phm, phr);
	                   ^
Set phr->error like many functions doing, and don't call _HPI_6205()
with NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/asihpi/hpi6205.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpi6205.c b/sound/pci/asihpi/hpi6205.c
index 27e11b5f70b9..c7d7eff86727 100644
--- a/sound/pci/asihpi/hpi6205.c
+++ b/sound/pci/asihpi/hpi6205.c
@@ -430,7 +430,7 @@ void HPI_6205(struct hpi_message *phm, struct hpi_response *phr)
 		pao = hpi_find_adapter(phm->adapter_index);
 	} else {
 		/* subsys messages don't address an adapter */
-		_HPI_6205(NULL, phm, phr);
+		phr->error = HPI_ERROR_INVALID_OBJ_INDEX;
 		return;
 	}
 
-- 
2.25.1

