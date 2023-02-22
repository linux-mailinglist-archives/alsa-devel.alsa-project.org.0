Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C929269EF06
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 07:59:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3098E85;
	Wed, 22 Feb 2023 07:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3098E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677049165;
	bh=HZpjx30Se9SsQHbHbRwxCn11/vC+ZfXM4QSlLyjUbl0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e4RySE4UnWZXcEDoAVMr9OGQ9sgQMCAJQQRp8Eb5Isrzd7b2yOUy0DPbuddXc0YYx
	 kE8eNI/IQrxfpqxxK04R/QaJwnqNDJS1o1oa3LOC49uioLr5aPSmbMWoKOmnLEfB8G
	 yPLxYaxrICC2sjPEJqDy15TFic6nJb4hq7VwxIlk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E59F80496;
	Wed, 22 Feb 2023 07:57:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF63EF80266; Wed, 22 Feb 2023 07:57:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5723CF80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 07:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5723CF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ovWFWn5Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZdeoi8sNXEGBPVA/yVf92PU87Z/6/pOhxYy02N9zZvDcXOqIOKYbPxk0GgyF4uPLzK+lmdexMtFpg6SiWTflky3zy5ScbY4hC7Xxi2cYJFqJGo36hv36HLiRDGbntbL2ZE+VkdDT0pFwR30Gi1BzTvfOjkn22UmwD7PEJQuqXaoi9dfCUNipdhljvBN/m82FULd2sS+P0gHf/HW6/wq9nJjqC51tOtTeVy8Y+drvWJmf3mI7Ek7tCS8icYw4Tgv0g/kOmmCAshQIqxK4zDf5EpqLxXZSLhvGSBLxrpvh9o4GXQbR/ACCFHLaXb7vvM3fUsX09D9Xj1QvsNgMAX/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=i+UEAl1r4+26rdQtDFrW2oGg6iW8+BZUD1qdavjZOF5VqNZa9ZD9TvZfJz+gv/NlsGFu7hlg9N2o/2uKnhJQ1bOxxmwxEzM0LY4euX5qy74XyeXeyBPkrRAFEM1tXIDKyRCv7R9M/H21rmyeFKHzz80yESVRwyz7jbHDShi6bP83IIomQZe1NWYLnf0rsGhRESzREee8ARDnngj2+pev7u8h1TsOWIY8ql2HHFyJXOcVlxDtuEL7pgOH7+Ik7ysO5dA9bOgOgRkeg+x57tQNe5BJGrXqbYt95q7LIWLsuHqRG3IjY2PyogNZ/d5seTlkCjEpLyad8d3NHWPrSrczKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=ovWFWn5ZhxHwRhckhVaXrOUMrpETzHJPYKNr9mw3lLs1UuHPk//OpMRm7BV7nEw47qGv1iD0TAKwHnDpBA1Y050CiA0ddUroYH7D3BD07MB3MCuFIRW83z/m2AnRO87/HBX7BhJ3T+Iu0SMrhXRVg86RoBRQkPzHF+c5pjYowls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8892.jpnprd01.prod.outlook.com (2603:1096:604:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 06:57:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%5]) with mapi id 15.20.6134.018; Wed, 22 Feb 2023
 06:57:25 +0000
Message-ID: <874jreqjaj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <875ybuqjcg.wl-kuninori.morimoto.gx@renesas.com>
References: <875ybuqjcg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: hpi6205.c: check pao in control_message()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Feb 2023 06:57:25 +0000
X-ClientProxiedBy: TY2PR0101CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: dcedda34-b579-4a68-d5a9-08db14a20de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KaQslfJbjANEAJUea/FH8VcSenty8Y2g3+J6/DYOuzLGqCw5FUXTsSBJV2wef3kySvu5syCerfl9EvKzl+vl7lUOu8lKsMBwONr/FJstICtHqJhzdsZN0TTk1It7azC6o8S/jHbB5CzIHxMhmOVAH52gyX1YrUZNaOgju9dEGVunl4592gtLwegaQR8F0oqdYuoLuZnoqJDKRQFvVHo4vVrWMdd5hi4Ba9nZxQioJ1DuZX8JdzPLM3GQ+y/acT4RuQh6vRqljOn0nxhojnxHt9YYWXcJZs/WLh2PYlhfWbqE21QeCCe5yPq8hRhmfr9AB6qzEivTsXzG49qswYeAJL5AfvhBLavJVSVc7dN2jCwnP4zCgY1DAJbqAhQA+4QRAIYqSYWV3ABUZ9z+TygbpMuzeGoyMazCpLKxptvn4sAFeBvcL3ZvWbhEf3ncFm+9Om9L1rk7WkRnnt+wKnNMgEGkXUX2VBX5vLsAXNjimFeVat8TEGLe66TmgrTTRkzHnAK3cdxe3wPkbFIM+PIRIB4W/3p6+wqMl9h+scMmIsdGCZbDJXbhOdgQFHm5nTozvYUi6ZepKuB03J4Cr2qYqxsE6n7ciuoCNDDm4VEdOI9NWCw2xs58wawF/6tDhinsUK7B7KK8Yew+84maWzCtPJKdREej/csRBiZCymLJFVuuNcwUme8HxuNhfBxUf7WIvlYWB7CMXcPUIZPve4h7CQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(5660300002)(54906003)(8936002)(2906002)(41300700001)(2616005)(6486002)(52116002)(316002)(4326008)(6916009)(6512007)(478600001)(8676002)(66946007)(26005)(186003)(6506007)(66556008)(66476007)(38100700002)(38350700002)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VPsIYGemdR0i4EO5aPNHeT9IhZZVuQ6LVWIxfFvpS922Hz8+ILTjBN5sw1sx?=
 =?us-ascii?Q?qHdbHfTEY9k1xvtWVz1KitLR0SuVCzoKllFLzlPo4ARIkHXgqaf87zJecRXM?=
 =?us-ascii?Q?vFP0ekrcxrMPVFIGWw164zaNTaSH7giUU2bYUx+1O/s132fVloaO1ZkpoNzJ?=
 =?us-ascii?Q?opajK7M0XVlPkKHNNQwCr81x86inq6vFcPPof2NmLVdxFHcnIGuwbf2VNd7n?=
 =?us-ascii?Q?Is9gXnenltIcpEROP9U708JhrVPkxFy/VAJNSPHHjzDe2+4lTXcpq1sBu4Fw?=
 =?us-ascii?Q?sxnY1RHtF9T4w7nfwQmSmkt/4tKYp/9qmW49mc2wejpdummVoYlWv139uMyq?=
 =?us-ascii?Q?TLKuCDFP3vZPcnZF2H+panEyBPuEScC6Zr6PYBVYMJUJ52DkSp8CP9liYBOz?=
 =?us-ascii?Q?VjpDCyo91N399rMLfLo28EofC+k05DsTaOL/g2xNfdDJ+8v1PFnsBRC96NWF?=
 =?us-ascii?Q?riWZpIaCZXyUQHqjPkSbhhCIeqJ7fOqR1owoG4WplOiDj+FBhm7hgXY+D2Bk?=
 =?us-ascii?Q?4CI2sAWoPeaudRy73giA/Hx1zyeGASH86bP7tdogSSlbthI1nXlZoRcAvOdm?=
 =?us-ascii?Q?3rhKcYR7AtSmcUTc1QICSFzF9gAsF+xknWkC7mm0T/QFK2eBEoLYNnwWFnfe?=
 =?us-ascii?Q?sMPHB/qvu9lLSz1wT/ZWw5wT2x/geisOf/pIgqf+fgKz2LDes+ByfZhtFciK?=
 =?us-ascii?Q?sjAVnU/ZP4eoHNLjNiJsFr9ijUr8RJx5Bo09DqO+hnUpFMYuHaVwh7zkKfnP?=
 =?us-ascii?Q?Mxw/+Hz3NpGLSRtrXTL4HTHloBCpqmw/JN37QFFlo/euWKJZF+Xv4G8QePgA?=
 =?us-ascii?Q?OPpPpkFN79vOj1ZXDdVzjtue80tzQdUy0AJ7eUu2Ht/wdb1vAzZOPew6sGHj?=
 =?us-ascii?Q?C581+kEz/Fn6svhYxoCuM7lGqD8PtIVrCWo3/rNL53Cw1PSkv/dD6o1p5c6W?=
 =?us-ascii?Q?ikj1hIPMIup3JQxCArQX6+zBECCUmmyUmXe9QmnsUWypNtALNU7v/tlcWlwU?=
 =?us-ascii?Q?2Vh92piS0VpQHW0S27RQ2MCKhi/osbnp32NJ6bmzvS9s3YRnW++4AVIzCatR?=
 =?us-ascii?Q?F1L1GshV6LlNK2HaUGH/0pRA53FkmXyOgZ+2BhYEDXCmW5MZU9R/um02iThe?=
 =?us-ascii?Q?fwevDl2EP/cUQb8XctsRK//DONIQL9GQIlPkHao7/4ZRM8fjjAM9kXxt8Geq?=
 =?us-ascii?Q?cUmasug4ajtzHoGNmtnlg6QOidfpm10o7mx/IgIss37uhW4YfCaMaxTRrDQK?=
 =?us-ascii?Q?VCLLeEf+J8WIUjfPZXUuEPumvWAe7PWES7MMTnR++G5wXjQGgwW7PC4XI0MU?=
 =?us-ascii?Q?g96eP0mY25YzmqvrRx31PvJAGwpusO36J8+l4gYJKimpvaPMdbId2M1Ljuk2?=
 =?us-ascii?Q?JsCxqWSNZwI/HEY9BfDYPINIfOxkpDZOqK2GIk8BNpZMYKDC5kwFUyOklcf3?=
 =?us-ascii?Q?3l207G3m+d4gQYky7NIl0RX3FFlopJVaqwwvx3fW1YifSbHLphmdw5y298QF?=
 =?us-ascii?Q?5iLyiSSpdhG/3tEuc/6y6VhTKDgi3QizNZJSAmgAKh203cThQL7kSC0A417L?=
 =?us-ascii?Q?pAUlUlw6WYal0z0aXU/9Ox3v8kvnpR212/zOV2iCb00JPcwsjcbf/sRQjUXz?=
 =?us-ascii?Q?c8FImtcoxprTxP57O1w9jUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcedda34-b579-4a68-d5a9-08db14a20de2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 06:57:25.4690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fALmeLK4RYaRqMKKnIVDjBbC6LfWNG5bVjbnWhc6/Zc/qDvIt9tdsQSngJg5/JTxlwZemS6dwtnUVKvvr/d9FeiiguMsBxePoiGbwu+Ul1CB9OMl2dLSKhAJNQfMr5Q8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8892
Message-ID-Hash: OVPOOWUCDU55SSCL2KQFBMESODECML3S
X-Message-ID-Hash: OVPOOWUCDU55SSCL2KQFBMESODECML3S
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 shaomin Deng <dengshaomin@cdjrlc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVPOOWUCDU55SSCL2KQFBMESODECML3S/>
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

