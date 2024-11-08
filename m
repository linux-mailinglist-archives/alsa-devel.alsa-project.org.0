Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA779DFC10
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:38:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE52F50;
	Mon,  2 Dec 2024 09:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE52F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128729;
	bh=h7IvNSzsMVut5p+ncQeOwlIiz5Uj7YZRgD6A6OhyroA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e2bzr5g48jI1kqTgS7LUoqD+2nc9OG0eeamGNfM4d7GLuPeBWuWigE4xhzMYhXzT9
	 mrZxZmJMM9HCfR4YnnUAlzKKAqjWrRQZx464vyWeEhdmZmROC49mGq/o3Gl1ZMPpBK
	 6P8aJpEn1KyzUnem0EDq+1R1HXDevCWVqmNfYGto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AB60F805B5; Mon,  2 Dec 2024 09:38:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A49EF805BD;
	Mon,  2 Dec 2024 09:38:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D1B5F8013D; Fri,  8 Nov 2024 06:25:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D463AF800BD
	for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2024 06:25:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D463AF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ID6+YNWA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4A7Mbgq9031634;
	Fri, 8 Nov 2024 05:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2X09eKHs4G/CJ1FZujTEPVpt
	LaCdfzZG7wXeUqdcZF0=; b=ID6+YNWAwYD62SYN/cmn4vxXnnoE4jFGsnLFZ4V1
	+C0YE8+3RIdIHLiiUydUaY3AdZDAI1vDjSwgdK0On5leC73Cxikpco4zj/XJtMbO
	j32PRafJBJL/tRabeSnSQPi7eY95l20P601MVhqe/Lhrno1/i2OOXDED4tkGN9q3
	20fC1yCL8WylkWm2X6MAPVJ2tzkjT8APaX2GLI5n8hP+Mglmpt50P1OsLVWUzVCG
	kgwN2U7ANA3l8IpqBoOnzLpJI3mom5brbpWkOwhZyPI5otyOshOZOy8PDDL30dIk
	XOJLFhkl7rwQTJg+Xm3WMLfWDZM91VMcPbKQfHARD1vXbQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazlp17012013.outbound.protection.outlook.com
 [40.93.14.13])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gdrqmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:25:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWC6Ri8HfoR6RgwGCX2STuCViqjvYffqrnlyCshxNgRmBfsD4PWweuy3glosvR7WhKgCZR7mUdt2QQIHBuTO5jjSajA1AN+uWp+ljuJYQ1+pt2MJNmGSvZFpVND8SQJuZWd6J0/k5EMXql6CU7Gw/Tmd9/NLNniujUK/1KjZ3oeIhGP29waHehdcMg8GdJFGWqepLK+TYwTAS0Qy0f3UZ1qwvZZ99pQG+ITjrH1IAvQxAk0mfJ8YRi1XYnscoJBaSWdFmr4rntnAUQVhR3KwFz1+mZPOYUeR1+ChacVngVLfvt9lwo+0xR3R68NKjgqlAgm+dgXST8TB1BopkTp+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X09eKHs4G/CJ1FZujTEPVptLaCdfzZG7wXeUqdcZF0=;
 b=ukK6UUV5ZbLgviTiJabqTcPSaJsUGmBx7iyrV8E+UkT4PPoxcV8IDy6XjoL/FFFUF01O2JH1GHSU7k+ztgoskLJfoW28yMGH18OZkqJcJqh2hOKk0NmqLNfBa8BIXEK/q/06CacdaibOduVJp1++BYLlkrKrV6nQjkxtPnUYwxsCs6ZWJUvCUuGsY3MSJmmrxd+bFd9YG71dWCVbubQu+VBlJCKowtyugTvY2yCpE89G9XcaKWktKISJzT2sN8S+RN2eYth1gB72c9Y+b7Jrezri1KoMF1Qvr7lMLRC+KnPfNKCYXh/wmSQiaMkvJmuCvGE/sX1MF/ohVbB9SAVw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB7269.namprd02.prod.outlook.com (2603:10b6:510:1e::24)
 by CH0PR02MB8275.namprd02.prod.outlook.com (2603:10b6:610:fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 05:25:46 +0000
Received: from PH0PR02MB7269.namprd02.prod.outlook.com
 ([fe80::24f9:d69:898c:265d]) by PH0PR02MB7269.namprd02.prod.outlook.com
 ([fe80::24f9:d69:898c:265d%4]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 05:25:44 +0000
From: "Shalini Manjunatha (Consultant)" <c_shalma@qti.qualcomm.com>
To: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>,
        "Raghu Ballappa Bankapur (QUIC)"
	<quic_rbankapu@quicinc.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
CC: "Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: Re: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Thread-Topic: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Thread-Index: AQHbKe1Gc5S8n76XiECQmF66Dv9tsrKs6UPM
Date: Fri, 8 Nov 2024 05:25:44 +0000
Message-ID: 
 <PH0PR02MB7269C77CFF58B57CBD2B3637D45D2@PH0PR02MB7269.namprd02.prod.outlook.com>
References: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
In-Reply-To: 
 <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
Accept-Language: en-AS, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB7269:EE_|CH0PR02MB8275:EE_
x-ms-office365-filtering-correlation-id: 628174ec-24d9-4a53-4e0f-08dcffb5cb90
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?oMjKOuIUerRUu+MdPPrncLulb4gn2SA7lpzqGzomY9P+OKkk4675yQVoYD5H?=
 =?us-ascii?Q?m0SflnaJZmEltW4/PH4JjYaa/ABOZMjXPNb2wyIdc7ikRhx6QE7mxg9zB32h?=
 =?us-ascii?Q?7tol+X3+F3PJje6OXydB4lOQ2K5cJq80gJDyqMVK4hTnWlpBQ6iHemn7CJem?=
 =?us-ascii?Q?3w9MZDjlUaOMk+tgf/wBOr8K3sPyqNDgCDP/CC671Znq13o6LLVLcPTjabdY?=
 =?us-ascii?Q?reXBmRkLdTgjJ1TjjUBc/VUOSAsV0DN0hCW6yjUqXE4Ufz2CIAzFxKaUy/6u?=
 =?us-ascii?Q?q2vVx0GzhdCKNwJXsXw6JXire0+7sT4jwxDqYN5SrOIX6AAXRqCDO51axAbe?=
 =?us-ascii?Q?97bVVysSC4Y+TPfCiXbd8St6vd80NVGLYkowfanIBMNmFqkmxGon/JewJr30?=
 =?us-ascii?Q?/MbohI14iuN3TYxElEZEXXo/giGQ7UCOTLgPmSpZ3W/cHr85bm83qIamev9r?=
 =?us-ascii?Q?dFKINoSAs/FVOEelGkP6+iVRrwZShLRxHsd+8r/+KAaJoK1X6IoM0oNBT68k?=
 =?us-ascii?Q?UNxNhhd8Yhg4WsWJo0ar9PwEQ9CILkOQQ4D20F/fwty5L4/Kg53mcL/QnciK?=
 =?us-ascii?Q?IeIQ9+edrHuRg2OgCTmJ2s+aW6Tilg2AhzNvbExbCzfSJ/beU90rrFX/G5GB?=
 =?us-ascii?Q?GylPnMbjsMIcMPYD6l/FbUIMNwtX3GXqBpCGQ4jbUiRlzSAtgLlo5lzlc+b6?=
 =?us-ascii?Q?PFBQ1L885lGqW7C1pTNh386GRiGmHvRYVKCtwxoUs/TaovJNKqAXAz7Ki7Vp?=
 =?us-ascii?Q?BOfEaEhfAYXzmk80kse1aaoSKlkqyBfbkht8ffpJlAOr5LWRbOVBvCT3EdOp?=
 =?us-ascii?Q?GFBBPAP9vBlmvtGOu3y5q+WVqDibt4uOFcbexBbnrQcxgGSfwasvGwrHQEdG?=
 =?us-ascii?Q?FxUmtb6gWQ1XDup69zLMYNKi8ZXmclcBD66ipWZHTOXXByAdHdOyxZj4O6ku?=
 =?us-ascii?Q?1pQs1r6n9fGR93OiLG+1EGoADBiGpNxICwLa+opLJ/bRE/uDarhj259A3dWF?=
 =?us-ascii?Q?WfaG2dVHZ5yaj7dPQzm2QxV146JIZ3A3uQTk1skJs1Ph6xfY0CUcudILKqHW?=
 =?us-ascii?Q?7C9+ubXiglnJAbtGZVwYf6O3zROPIW7UMoRzukEeMqTvOBATIa7fVJx6KG8o?=
 =?us-ascii?Q?d50kz7KqGApflVz/3MDx92InILzZgw2QZQ2MRWuI7qoNpa6fjcXRgNjsiYE4?=
 =?us-ascii?Q?z5+ImqORlCiov6rWu6vyRCNlDTGo3gkVDfvk1jt5sOKwsWdKqkeHxWzfaFpW?=
 =?us-ascii?Q?WQE5ajbRMEqPtuMnUYZhIMYVIADEZ8ZYlwSMxQiyk0Y2TkVl62SbVAwx8+Ia?=
 =?us-ascii?Q?m/IakVfV309P/HHFcAgWz7zAa8K9LuomvpF7dkttUc+DwLjpB8CjrnL2HKcw?=
 =?us-ascii?Q?40GJqAQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7269.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bQB8MACohNN0HfetONR2tW8skkhSZ3FoBPjphDvYYGQD8OH4u86tn6bdLhiU?=
 =?us-ascii?Q?JuXOFQW0z8I5YscXQZowQivO8uR4c4YkKa0ZBf/38MqartW4IUdmFya1l8H5?=
 =?us-ascii?Q?zkFIg7u62Fsp7SpMgq3WIJ+NQIYYekm0xeexPPtje+TGD7J+pc1BQ+QWfSuh?=
 =?us-ascii?Q?w/BmUki2at5fsLEc8Tps8HsRje2NYnO1cHTPJkC2LtfW97BY8wpWeUtTKe97?=
 =?us-ascii?Q?Iyca2dBrFae6FnM2GcXXQpYkcsev/iXigE13vBx2CJ0bFMf0AMKiFRbs6oE2?=
 =?us-ascii?Q?q7MJQeMJTQwewTdLC+H0bl03n1W8YVodO/ye0mQ66ZDeV3KSDUnMrrnpQEOI?=
 =?us-ascii?Q?qz7WAw/urXlpXAoHAY5M0d2Fq966rQ3hkNiv/JolbCAfItHqK8YGdd6FoKIn?=
 =?us-ascii?Q?p1BaofXC49IBIvAsNqIkSD6//Ow4RxZjqjlDir8SZ3KN2/peLYjkQFBMtfv2?=
 =?us-ascii?Q?Nn3xpT+uC9mxb8HDN2P5CpWK/tP/xeq1n0NCee4KMGt29K2PLsC5vf4lVHac?=
 =?us-ascii?Q?w7O0VbGLuvZgP2FNqivY3Ku+pDVTEOG+X7KVUlaypwZKQoQ+hphNLR3BUa5T?=
 =?us-ascii?Q?mso8N3SzkCP6EJP9+ukR89i7AfRS99X5O0vLe+FARn8fTtihCrEMKwuHTMjc?=
 =?us-ascii?Q?FP4fgJDyGMLhPLypqyixzKTa0d9yfVp7jNChlIKX+ioPq1iUbQnXNsi+hDvS?=
 =?us-ascii?Q?jGUMBnoWmf2bU6BhiA+pc5Ny4p8w+UMrMSYMTtex1wAjPRLP+Cox9X5huwKn?=
 =?us-ascii?Q?oG3y04RxSxsnkDU4gbd9tRCyvnmPu8bs3iNxrf6iV41onlWJK2TgCWjRgwOh?=
 =?us-ascii?Q?SvgpFTE5LCSjQyp42UfaoQNQPd/+aT1Dn/ZSfSaf18nFEPuJGoA1hFHFhUzr?=
 =?us-ascii?Q?ekRNQLtx4/OvQupn8WufXxegss/EajWkEQZlYb0o7MKQJxlPUvoTVKRjRi17?=
 =?us-ascii?Q?v3vB5UNV1lDXxsWW2Ix0HS4oMyvrIHW1BEhZH0hBFyOqK+E8GUVZlLf4hCiY?=
 =?us-ascii?Q?zIAwMj3UY67J/7ZK8YCPyZX8dEv3C2grP8UXSlIYLTd+S3ZgTT2PYebMyfx+?=
 =?us-ascii?Q?U4UqeGxDilib8G8NDudNNuERJdZ9YSE3nLu3CkWQVRVmVpGaiVlKFMR0SFOE?=
 =?us-ascii?Q?337XnIqICNevcfuTTR+YwPsBofOuEK+s/yDuWHboOF9pLyEjYzZ12wDAaikx?=
 =?us-ascii?Q?rPf68MjylP8MSs5iui9cs2EOE8VroqYYrDfvOleVednMsLLZS/1e79URor6Z?=
 =?us-ascii?Q?r8ZpB0Q8KX0hNK1dvZhQUef2C8LNIu4F/K4umImQYuEou6dGddnsC9cXxNV1?=
 =?us-ascii?Q?5QGe6x0Uzm4GUCQznyXaulGW5mHd14PXuxOmeudIfLHaWSOFGRMyRvzdaHLS?=
 =?us-ascii?Q?wtPL/kbTu4Or3tbcOihKeo7bs7pIDBYrBhgW25W6HS5BUGOEkQliwbjcRbv9?=
 =?us-ascii?Q?6bm4lFF1u9c7taGW8orL+hwkJMpKUlWoDbmZ3FEUBUqv5b46N7GhD5Fpl9o5?=
 =?us-ascii?Q?aMkJwJuLM45lBk5J1VIIzr1e3weBivhj7YYFpxaM5CK4q+3GnEP0TbB4Kq5A?=
 =?us-ascii?Q?URnDexm9xIFaNqXezGK8vjt+jLRiGXdiRvrrAyJ4?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cANT91OyrsY5/ysWEhYLlyYP2gUik3dCqFDi0KXWT/+qC5jQDO32h2Qams11nwrksMIfkANP/zuySJ6ay5+0+6WPRsPs0xk9kU4zGTSueSt64Uqu38ZdBpc0yxHPX6F5ZX57nawE2sMeQIosW5T2UDlf7t/aOXNr+jFo0G8fy6VWHCr5wVaJXtdnhH8xrrrSJ+aPiCCB4YH2Mc/ClkXix0H5iPlJXv/ukc56TIgbhTHIZs1KIjjf/iE43Cv1qs2P6KRXLMEnz6hvVIg5Pblspr95G5lnFY8ab7o/pkQUfI9ojGd1EwS8FxE4tiCnre5cyIuPRZfOTgjjbotbt3U1mSGeMkXIGsAVOiEZdxc9wreKi8K7ew31fZfe9MFMSRXJ4xEz+ZAhrxuto6NO4Mu9AsS42tZCfbkPn/dctJS2sOYi/i2apTFMqH4x/0SljPWefl57lBg+lci3U3hwxrGFufvm7a6qku0DT+3tMXBUxvpmNlUYyV2uL0lMdvbcB2MHxWb1qyBMW3IHLRH1g1+7/QhDOfy8PkVCLQ26FWr3+v5EDxLanHCy0uEzDK5xiT/qNTaOI4HWOD7maVJSzbnmPC1MelMPnhZ50mzqHzmRzMQ/xj/9/rLXuyG8GJhd0srp
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7269.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 628174ec-24d9-4a53-4e0f-08dcffb5cb90
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 05:25:44.8782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 fAvaGwKMSIXkKKAnUDYT3NZByloPrbTl3m+ezCPKxjtyFWJbnZRktXbumPRoWy9RBLvHk3Wy9B/yLgRySS8rQI/FuxDJ3qDcFfbox3TTaPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8275
X-Proofpoint-GUID: ku4a6hbmfJrwk5x7T5hUO3XL06WsUH_7
X-Proofpoint-ORIG-GUID: ku4a6hbmfJrwk5x7T5hUO3XL06WsUH_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080045
X-MailFrom: c_shalma@qti.qualcomm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WAG3BKQ7FF2FAIKOI7JCBKJCBXQQTOW7
X-Message-ID-Hash: WAG3BKQ7FF2FAIKOI7JCBKJCBXQQTOW7
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:38:07 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YUKRR6GADXK26TTNY5G6ZVEJZL5ADMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

Could you please share your input on previously asked query?.
We are waiting for response. Thanks in advance.

Regards,
Shalini M
________________________________
From: Shalini Manjunatha (Consultant) (QUIC) <quic_c_shalma@quicinc.com>
Sent: Tuesday, October 29, 2024 11:35 PM
To: Vinod Koul <vkoul@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Raghu Ballappa Bankapur (QUIC) <quic_rbankapu@quicinc.com>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-sound@vger.kernel.org <linux-sound@vger.kernel.org>; Shalini Manjunatha (Consultant) (QUIC) <quic_c_shalma@quicinc.com>
Cc: Krishna Kishor Jha (QUIC) <quic_kkishorj@quicinc.com>
Subject: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm registration during bootup

Hi All,

On kernel6.1 based Qualcomm target for automotive platform based on Android U, we have a feature early services to launch certain early apps at early init of android bootup cycle. Hence in order to launch early chime sound of audio at early init of android boot up cycle, we need to load all required audio kernel modules at early init stage in order to get sound card registered.

We have certain KPI goals for every early apps to get completed within lesser duration so that we can achieve final KPI goal of android boot complete as per the target specification.

In this journey, while optimizing the sound card registration through machine driver probe to achieve lower KPI for audio early chime sound, we find that for early chime launch we required only selected pcm front end dai links only.

Hence if we keep FE dai link structure in our machine driver with only required items for early chime, overall sound card registrations gets completed within 200msec from the time it starts, which is a very good KPI number to achieve.

So we were trying out code change to split overall FE dai link structure into two, one for early chime and another for all other required dai link's, then some how we need to register early chime related dai link during early init so that sound card registration process gets completed quickly, later stage we want to dynamically load all other FE dai links.

Could you please help us to suggest on how can we achieve this?. Is there any possible way out to avoid static FE dai link registration for all required ones from machine driver during machine driver probe, instead register only limited list of dai links.

Later can we dynamically register the dai links in order to get PCM devices entries created based on use case.

Currently we have this API devm_snd_soc_register_card() being called with snd_soc_card parameter which has all possible FE dai links populated at once.

Queries:
1) can we register sound card twice during bootup, once with limited dai links and next with all required ones?
2) can we register dai links/dapm dynamically based on use case requriement?
3) If it is possible, could you share any reference from any other vendor who is able to achieve the same?.

Regards,
Shalini M
