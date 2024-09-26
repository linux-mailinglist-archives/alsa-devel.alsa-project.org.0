Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AC98BC4E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1D0EC0;
	Tue,  1 Oct 2024 14:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1D0EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786348;
	bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rZ53igm1rq4NKqv3m6mM/6z+5USZgUFiM037C7LFgr6iKvcFjTHt76VRNX1MQcMY7
	 wOXS7C/piXsluuVp5/UStR4VIeEXWnOMSG4vhEgK7Y2ai9RdOSmscS+0eDc3LaOo61
	 NlHqAus/LeNPcCZuAylZgs44Ggtadxf0OrMvfwwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3619F805FB; Tue,  1 Oct 2024 14:36:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A29A9F80600;
	Tue,  1 Oct 2024 14:36:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87C78F802DB; Thu, 26 Sep 2024 22:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D28F6F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 22:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28F6F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=unist.ac.kr header.i=@unist.ac.kr header.a=rsa-sha256
 header.s=selector1 header.b=W7/Z2TXn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL8jj6xc1Uw2ZoyW6QiwiXEYEtF1eYKnrxXdZlxtKtXUAHlNdjsNwViwyqisEVpHx3o42RBksG2MkayZsawUSyPtVPW37wIGs4fuKPQjbG+JbzbOasdxQvYsLQXa9F9mrLpzPAGiM3Zicnr8eT51yAEkN4VGKgf6ooOzJjd5k/LqVBkZVyLZ1xKAkJhlRxJWNy7aZDs5k+6WsBKCQZ8513XdzNSup0esB8gLqb06rjk8oPkB9jXO7i1Ja/p1wuF4CRUKoZhrxIAjLhQX4Pliwy4LwzMbAenBFSqhy7mKnhyqtoblwW36KDTG+Tb4quxNflQRHbxa2TSCR1aH73OaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
 b=pjvK6ZI/AZYXcRBAfZlwweGeul6Vl71cbqXuqJXOfiUclKaziNNCjCMqWxFWIldf/ogb4VuSy16uNxe78+ou1R/lCS3oQbEIG3tsH9cn9bvdE8/lWzfPXI/EiYNnZOFYD4gpmzOskCl2V/FJ8ojE2bBmow8+ItOpkucGoXio0BeMUnWpWvnGJWBykYW4uzGIpSaGZt1GF1w2CPYYTc8LlUZXyEP6zWu+0knkDhR9zZfDYHN7FFWURzKr+oQrepUQPLh6Hx2fxA/v+/cmtTAoN92cKDMbT91mj/nt5vX3smseOprKhy/rgwAkyhdg+MQDHHqF4tfobdt4fLwX5SyeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unist.ac.kr; dmarc=pass action=none header.from=unist.ac.kr;
 dkim=pass header.d=unist.ac.kr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unist.ac.kr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqL3Pl6zhZE3g7J0nUEAS8V+gUiZy/QuIfE5rvizv98=;
 b=W7/Z2TXnUxp+UPz3+Veq/yGW0utIpgaJ3fJqLx4x7kfp+JAPvuFCwn4uRUCOHkESziLxkLl28TGju9fyVJ2Jtss0OSErvXdIhL73OsGtE5SIENTmcmUf39JryY8zqqDnXGvOMYpebPdVdti3e41/Rw1eDfBw/cZ8b2wNz1O++WY=
Received: from SE1P216MB2287.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15d::5)
 by SE1P216MB1242.KORP216.PROD.OUTLOOK.COM (2603:1096:101:16::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 26 Sep
 2024 20:58:19 +0000
Received: from SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
 ([fe80::abfa:51df:7a24:2f06]) by SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
 ([fe80::abfa:51df:7a24:2f06%4]) with mapi id 15.20.8005.020; Thu, 26 Sep 2024
 20:58:19 +0000
From: =?ks_c_5601-1987?B?KMfQu/0pIMDlwM6x1CAoxMTHu8XNsPjH0LD6KQ==?=
	<ingyujang25@unist.ac.kr>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: sound: soc: uniphier: Handle regmap_write errors in
 aio_src_set_param()
Thread-Topic: sound: soc: uniphier: Handle regmap_write errors in
 aio_src_set_param()
Thread-Index: AdsQU4oY8jiNqSUtTyyPxLSWA+I9ig==
Date: Thu, 26 Sep 2024 20:58:19 +0000
Message-ID: 
 <SE1P216MB2287FBC798A38F4F5624F2C2FD6A2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=unist.ac.kr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB2287:EE_|SE1P216MB1242:EE_
x-ms-office365-filtering-correlation-id: 8620dfed-f9da-4812-2249-08dcde6df347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|41320700013|366016|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?ks_c_5601-1987?B?cS9VZ05nK2VrRU9tN3JtTHRVc1hMRWw1WUwzMlZBNzN6cGYzY2RW?=
 =?ks_c_5601-1987?B?alFBazlGMGU2SGVKUHZHTlFwdk5Cd29TMkV1SU9RWnY1WExaK3JE?=
 =?ks_c_5601-1987?B?SndQdjFrbTM1MlVBbGVVemU0WE9KMVRRQzg3R29Cclc0ZlBMZnlG?=
 =?ks_c_5601-1987?B?MEVKSzIzWHlIMVowQjBKdys3NkFLUmVxVld4eXF1M2liVi8zL1lN?=
 =?ks_c_5601-1987?B?a0VSNVErQ2pvR2JDNFNqcHZsWElteXd3NGluaFBoNVNuaFFXMS9x?=
 =?ks_c_5601-1987?B?RlN3Unl5cUFuaUNEN0dwUk92MjFFK0RVTWxuOVdiREhGYWRtTEhW?=
 =?ks_c_5601-1987?B?WktxNTlQRUdVWktTNDRaMzlwcGpzWldJTWdFWUlRNWxOOGJGRWpN?=
 =?ks_c_5601-1987?B?U0dzSHl2akczNDUxL2VQUVdDSldjcjNoeHc3NWZScjlDV1paaERk?=
 =?ks_c_5601-1987?B?ZXRxUHdVenl6N01xdXJUemlLd1UyQzFCYUdWSUhJaEo1Uzg5VERi?=
 =?ks_c_5601-1987?B?MkJka3JxOC91ZkI5N05mS28rOGxlMjZnT2pSb25jMmwxL2ZTRWpa?=
 =?ks_c_5601-1987?B?TG9ZVUlUK05kSmdzcmtjbVpGanptZGYrM1l0MDVzdHA0Z2VmQXJm?=
 =?ks_c_5601-1987?B?NFIxdmFmTFY2Vi9kSS9zUk5rMWxMaUxmYysxTFAwYTA3ZENEbmk5?=
 =?ks_c_5601-1987?B?bWs3SmRPNW9xeExBWithSXNMVkN5ZGNVUUV6TWhOaklTYnVXa2g0?=
 =?ks_c_5601-1987?B?QkQrYnlZQUtkRUVjbU5KVG9FbHdwalF2aVVid2RjaU92QWw4NVQz?=
 =?ks_c_5601-1987?B?WWRBakdEc1cxbW1YRkRDWUVjNEJHeVV1SWRKUFpuSXVoYUQ1dVdh?=
 =?ks_c_5601-1987?B?VHNDNXlVZldhb1Z0aktBQTVoL3BDVDZ2VFBVSC8rblZBQ2N5TFdL?=
 =?ks_c_5601-1987?B?SUZsNytra2tMR0tkQ1NySFZqN0piVjdRbERyaTEwQWNoZ1hQWHJp?=
 =?ks_c_5601-1987?B?WEI2d2UyOHVsZEMvcWRlNENPaFppY2hraVlSdzhBenVYOGV3ZGwy?=
 =?ks_c_5601-1987?B?cnJWb2lHK1NFYzU5YVNxaVVWQUxGYldsVllNaFF1VDZtNmMvRDI5?=
 =?ks_c_5601-1987?B?dmFrd3ZkTzB2RFppdi9ZWHh4YlUrZ0xTOXkvYitJbzkrOXA5Zkhh?=
 =?ks_c_5601-1987?B?eFhFNitpZEFGd0VGVmpuNmVtSlFrQ2QvK08yUktva3c0OTd1MTdu?=
 =?ks_c_5601-1987?B?eEhMclU3SWZhOGlhdzRaOXdQMGJYekdKbTV5YzNjUjh4M2dTcjdQ?=
 =?ks_c_5601-1987?B?RmI3cnZGL3Y2YVJwSGxsZXdBaWVNdjBaL2tTYVc4Z3FtcmZpdmxo?=
 =?ks_c_5601-1987?B?Q2xWUXNVQ0F4VlBXVmZnNE01Wk9odkNBU20wcWxMYjIva2FjWnVW?=
 =?ks_c_5601-1987?B?czBiSFh1Y0hOalVoQldGbnYrV3lxalkrSTJlMWN5Vjl3NVMwNTVi?=
 =?ks_c_5601-1987?B?bWFEOVoxOXFidW4wdUZLZzM0SGFJOVpuSUFFVzNXNGhRR3krcFNm?=
 =?ks_c_5601-1987?B?a0NyUzU4TUhYbDJiNUQwQy9VOEdFWFpVQTdmNFYvWHlrVk5ndDdK?=
 =?ks_c_5601-1987?B?TXg5a1ZhbGI0VjJrMUlodHhSOWZaQXdqOEdJcHN0MndYYXRJTHFV?=
 =?ks_c_5601-1987?B?dGpZTXUxT0Zyb25WYVpHRllwdk1SUU1wRm40ZWxrZnFpOGtMMlg5?=
 =?ks_c_5601-1987?B?clB6UDdWMzVUd25rOXdISGVpUU1uTDYxWjNqTGJUZ1BBT1Q4RXpB?=
 =?ks_c_5601-1987?B?U1ByTTlac0tSYXhxRHhOOHFrTm1paFV2T0x2Lzh0bDh2a2xPTW5t?=
 =?ks_c_5601-1987?B?NTR3S1JPRTEzTGZkcGlKYnh0ZHhudUhiZWhDeE9FSWFkVWVTenkv?=
 =?ks_c_5601-1987?B?UTY2Qy9QaVJYd1JSdUs3Q1NhUThQSjlxY1lSZ1ZnWkg1ZGZBa1VM?=
 =?ks_c_5601-1987?B?OUNYd2NJRmgySWFaSUJRdVRGMExwMUZxMXhBdG9LVCtkcllBU09I?=
 =?ks_c_5601-1987?B?aXE2aDFSWGtzaXJJVFBhU0dGeXdENTZqNnloSGw1dG9MY3U3VTRu?=
 =?ks_c_5601-1987?B?VVJ4UTQzY01VQmlrb09BTWJ4WFdKYVBtNXIrZzFmaE1QTFBhazRC?=
 =?ks_c_5601-1987?B?K2pFKzRjSHB2U1V3dlR4VHh3Y0kzN0F5ckE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB2287.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(41320700013)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?MUJTYWVleGs5RS9RdmQxc2pDNTNJRTdpazdxbVlwRmsrMmZVZ0hQ?=
 =?ks_c_5601-1987?B?ZDM1NitMaDJEajU1T2xpL1lwbTRqTnFIRFA1U3ExNVRBRnh6ejRt?=
 =?ks_c_5601-1987?B?TUZsZGNDdE01VkR2eHVtd3lLNTdGTnRISTUrWG0yd0I2M0pjMklE?=
 =?ks_c_5601-1987?B?bE10dEYrRFZmTnAvNVMvdWNnV1VRcmVoOGQzOEJpZkVyblRxOHcx?=
 =?ks_c_5601-1987?B?ZUY5VnF6NkNpYjNFeXJId244SEc3L0tyZXV5Q1pjME1HNHp2b2lF?=
 =?ks_c_5601-1987?B?Y0w0NlJNZzRVcmxGcjRWY21aUno4dUh3bEI0Q21xNVVNQ2pMQmlt?=
 =?ks_c_5601-1987?B?OVpvZ2Vrcm1OOGowa3JrUm1CZDZDeGhJZHBkRXdrSGFpQ2l4QWJF?=
 =?ks_c_5601-1987?B?Slc2ZHZ0RjR4K0lGZHAxVFlXZW15QXFqcUl0ZVdwdTJtL1JMbitC?=
 =?ks_c_5601-1987?B?dWo5VXA5TXI1OFNrbkZKQjNoeFpDbzU5NDFHT2llSGZ1NkZEbzBI?=
 =?ks_c_5601-1987?B?ckdPVWl0bTNkNmJKenBxSHQwUm1seVR5ZmdPRjE0RUErS25XUW8w?=
 =?ks_c_5601-1987?B?eVFFTHJST1IwRVdIREJFQS9BQkpPd0hqbk5sbjhDc2doemFIaG5j?=
 =?ks_c_5601-1987?B?cTc5WGNXNDJEYjVIcVV5dHZzSy9uZlBxeUtyU2FjVzNZQ0FXQ2VD?=
 =?ks_c_5601-1987?B?MkxyUk5MNUlQRGh3WmFBaktjelVEdk5PMTdNeGRoK0JUaVlVWTQw?=
 =?ks_c_5601-1987?B?TzQvNWZwRmFwQitwOGpQZkR2bDM5R2I0bFRncWRFNktQcHdkQXlK?=
 =?ks_c_5601-1987?B?eVBJd3RLZi9IYlBKTVRZV1dQa1Q3Mk5CN0dyV0prZWVnUGdSdkFX?=
 =?ks_c_5601-1987?B?d2d4ZjNiQnpmQzdTaTRUS055dGpzZC9ZZUFOZUdES0NyVW5jbjVU?=
 =?ks_c_5601-1987?B?azZoVGk3QWtQWnVUSmV1K1I2clh4elM5d0UxNkpQemFTUmNhMFA0?=
 =?ks_c_5601-1987?B?VXJ3Sm9SYVJZb3hFSnV6QzFWOVpPMHpLVzVUVFNTYVJXYlF5YU14?=
 =?ks_c_5601-1987?B?SnRwT21maEZnOXhPcVY4WmhodzlCU0Y3UGdld2VWU0hiQUFZUTRx?=
 =?ks_c_5601-1987?B?SXZVUlNGQXkydUUrTndoa1JEcjJqS2hYUllEWFkvQURQMHNNRG5B?=
 =?ks_c_5601-1987?B?RFEzYm02cDNneXFJdDNZRkRWMnZFUHluYnZjbFMybkNLa0IwMXRK?=
 =?ks_c_5601-1987?B?K3NiTzNUcXU5cjQraXh5WG1UeHkwOVpiS2pOOWN6d1RoamlBalF2?=
 =?ks_c_5601-1987?B?SVZtdGR3Q2Q3bGp6ZHJldHVPRzZpYXY4YjYrUENzOEdSTGlad2hv?=
 =?ks_c_5601-1987?B?a2lvY0daYWJJWTdLVlJNaFdPRVRzMkUrazk5Ulg2V3hvRkZMQkdh?=
 =?ks_c_5601-1987?B?NENmd1BNMnVQS1RkbjUxSnRRdUR5dXYxSk5zUElvdEhwZ0dFSEYy?=
 =?ks_c_5601-1987?B?bldWRmtET1dzYURzdElwaTc4ZHkzZW5xWloxMWtwci9jbDUrcUhB?=
 =?ks_c_5601-1987?B?ZEJ3SXkxdktqTnBFNjB2eldRNkVPZ0FjR29QS2Z3azZwdnJVWXZ4?=
 =?ks_c_5601-1987?B?ekdWRk05aEE4U21zUHFvRGZ2VCtsdmNpa0dHaE5hcEFvU2EzdUJT?=
 =?ks_c_5601-1987?B?S21sak5RVEErSXF0L3NxU0pBaXgrS2h4d20xQU1IeTk0eGVCOEV3?=
 =?ks_c_5601-1987?B?eFRVdnlZYm55cGk3WFRGY29PWUNCTm14enhZRmVVbWlKb3B3b3FN?=
 =?ks_c_5601-1987?B?UVowMDhxRldOam1rNTVsT0lUK2dYM1VIYnZielR1a2ZDNTNBSHdk?=
 =?ks_c_5601-1987?B?azdDbWw1V01ITjRhNmp4dDlNSUYvR3l5eUZGMXlEazhQRFBvaEdU?=
 =?ks_c_5601-1987?B?YklmNEs2TFFoTGZjT25JN0FRQnhralJPekFINXRKZmtQVy9FOVhK?=
 =?ks_c_5601-1987?B?YkdGRTRPUnJmOGRGM0FHd25ZS3N1SzUyN1dlc0xSbXd5eHk4RkdX?=
 =?ks_c_5601-1987?B?cWw1dUxzUWx5VG82V2JaRm9KaFU4NGFzQjRGREhHTFR2U0FhN1Nj?=
 =?ks_c_5601-1987?B?b2FONkkxL3E1UUErQ29VOEljRjNac29Bb0E3SGJraVg1RDQvSUlj?=
 =?ks_c_5601-1987?B?UkdEOG8vTlF2L01TT1puYXZXZEREa1FqMnJyYjFlVzNoVlo1ZGFB?=
 =?ks_c_5601-1987?B?U0I4Qmp1VUhqMU1QZ0ttcWpjbXFxOG81RHVHcHZGV014ZmNBSEhP?=
 =?ks_c_5601-1987?B?Ynl5dEpNWnB4T0tIVFZ5VXJUQ09VK3NHdndwbEtVMnpvbFBjWEZm?=
 =?ks_c_5601-1987?B?VFF4Y3pLZEVTQlFUanl3UmFHSkVieGZ4eG5BV0tFMzZIbWxvdGlZ?=
 =?ks_c_5601-1987?Q?aj792dQocjtH0dt40/6KfiGDbsYKsam5b1DIfalp?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: unist.ac.kr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB2287.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8620dfed-f9da-4812-2249-08dcde6df347
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 20:58:19.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8715ec0-6179-432a-a864-54ea4008adc2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Xxqc9Y6RqAFlcOqUFSL1levAA8q0wppTZxra7wxAPia+LIPjDnUQBBH8zYRTgk8Jj3/BitJnSunjPFiRoscEAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1242
X-MailFrom: ingyujang25@unist.ac.kr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S5IQOQQLC444BHZ5NAF6MI7LQAPVRBBU
X-Message-ID-Hash: S5IQOQQLC444BHZ5NAF6MI7LQAPVRBBU
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:36:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCXLIJABED43WRGQMHGN53SOZEAOX7E3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbSA3OTE3MTZiZjM1OWI4NTQwYzUxOTgxMDg0OGZkMWY4MDA2ZDdjM2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSW5neXUgSmFuZyA8aW5neXVqYW5nMjVAdW5pc3QuYWMua3I+
DQpEYXRlOiBUaHUsIDI2IFNlcCAyMDI0IDE5OjQwOjA0ICswOTAwDQpTdWJqZWN0OiBbUEFUQ0hd
IHNvdW5kOiBzb2M6IHVuaXBoaWVyOiBIYW5kbGUgcmVnbWFwX3dyaXRlIGVycm9ycyBpbg0KIGFp
b19zcmNfc2V0X3BhcmFtKCkNCg0KVGhlIGFpb19zcmNfc2V0X3BhcmFtKCkgZnVuY3Rpb24gZGlk
IG5vdCBwcmV2aW91c2x5IGNoZWNrIHRoZSByZXR1cm4NCnZhbHVlcyBvZiByZWdtYXBfd3JpdGUo
KSBhbmQgcmVnbWFwX3VwZGF0ZV9iaXRzKCkuDQpJZiB0aGVzZSBmdW5jdGlvbnMgZmFpbCwgaXQg
Y291bGQgbGVhZCB0byBzaWxlbnQgZmFpbHVyZXMgd2hlbg0KY29uZmlndXJpbmcgdGhlIHNhbXBs
ZSByYXRlIGNvbnZlcnRlciAoU1JDKSwgY2F1c2luZyBpbXByb3BlciBiZWhhdmlvcg0KaW4gYXVk
aW8gcHJvY2Vzc2luZyB3aXRob3V0IGFueSBpbmRpY2F0aW9uIG9mIGFuIGVycm9yLg0KDQpUaGlz
IHBhdGNoIG1vZGlmaWVzIGFpb19zcmNfc2V0X3BhcmFtIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFs
dWVzIG9mDQpyZWdtYXBfd3JpdGUoKSBhbmQgcmVnbWFwX3VwZGF0ZV9iaXRzKCkuDQpJZiBlaXRo
ZXIgZnVuY3Rpb24gcmV0dXJucyBhbiBlcnJvciwgdGhlIGVycm9yIGNvZGUgaXMgcHJvcGFnYXRl
ZCBiYWNrDQp0byB0aGUgY2FsbGVyIHRvIGVuc3VyZSBwcm9wZXIgZXJyb3IgaGFuZGxpbmcuDQpU
aGlzIGNoYW5nZSBhbGlnbnMgd2l0aCB0aGUgZXhpc3RpbmcgZXJyb3ItaGFuZGxpbmcgYmVoYXZp
b3IgaW4NCmZ1bmN0aW9ucyBsaWtlIHVuaXBoaWVyX2Fpb19wcmVwYXJlKCksIHdoZXJlIGEgZmFp
bHVyZSBpbiBhIHN1Yi1mdW5jdGlvbg0Kc2hvdWxkIHJlc3VsdCBpbiBhbiBpbW1lZGlhdGUgcmV0
dXJuIG9mIHRoZSBlcnJvci4NCg0KU2lnbmVkLW9mZi1ieTogSW5neXUgSmFuZyA8aW5neXVqYW5n
MjVAdW5pc3QuYWMua3I+DQotLS0NCiBzb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYyB8IDE1
ICsrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3VuaXBoaWVyL2Fpby1jb3JlLmMg
Yi9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYw0KaW5kZXggMGViYTYwNzU4MTM0Li4yYzRl
OGI4NzMyNTMgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWNvcmUuYw0KKysr
IGIvc291bmQvc29jL3VuaXBoaWVyL2Fpby1jb3JlLmMNCkBAIC05MjEsMTYgKzkyMSwxOSBAQCBp
bnQgYWlvX3NyY19zZXRfcGFyYW0oc3RydWN0IHVuaXBoaWVyX2Fpb19zdWIgKnN1YiwNCiB7DQog
CXN0cnVjdCByZWdtYXAgKnIgPSBzdWItPmFpby0+Y2hpcC0+cmVnbWFwOw0KIAl1MzIgdjsNCisJ
aW50IHJldDsNCiANCiAJaWYgKHN1Yi0+c3dtLT5kaXIgIT0gUE9SVF9ESVJfT1VUUFVUKQ0KIAkJ
cmV0dXJuIDA7DQogDQotCXJlZ21hcF93cml0ZShyLCBPUE9SVE1YU1JDMUNUUihzdWItPnN3bS0+
b3BvcnQubWFwKSwNCisJcmV0ID0gcmVnbWFwX3dyaXRlKHIsIE9QT1JUTVhTUkMxQ1RSKHN1Yi0+
c3dtLT5vcG9ydC5tYXApLA0KIAkJICAgICBPUE9SVE1YU1JDMUNUUl9USE1PREVfU1JDIHwNCiAJ
CSAgICAgT1BPUlRNWFNSQzFDVFJfU1JDUEFUSF9DQUxDIHwNCiAJCSAgICAgT1BPUlRNWFNSQzFD
VFJfU1lOQ19BU1lOQyB8DQogCQkgICAgIE9QT1JUTVhTUkMxQ1RSX0ZTSUlQU0VMX0lOTkVSIHwN
CiAJCSAgICAgT1BPUlRNWFNSQzFDVFJfRlNJU0VMX0FDTEspOw0KKwlpZiAocmV0KQ0KKwkJcmV0
dXJuIHJldDsNCiANCiAJc3dpdGNoIChwYXJhbXNfcmF0ZShwYXJhbXMpKSB7DQogCWRlZmF1bHQ6
DQpAQCAtOTUxLDEyICs5NTQsMTggQEAgaW50IGFpb19zcmNfc2V0X3BhcmFtKHN0cnVjdCB1bmlw
aGllcl9haW9fc3ViICpzdWIsDQogCQlicmVhazsNCiAJfQ0KIA0KLQlyZWdtYXBfd3JpdGUociwg
T1BPUlRNWFJBVEVfSShzdWItPnN3bS0+b3BvcnQubWFwKSwNCisNCisJcmV0ID0gcmVnbWFwX3dy
aXRlKHIsIE9QT1JUTVhSQVRFX0koc3ViLT5zd20tPm9wb3J0Lm1hcCksDQogCQkgICAgIHYgfCBP
UE9SVE1YUkFURV9JX0FDTEtTUkNfQVBMTCB8DQogCQkgICAgIE9QT1JUTVhSQVRFX0lfTFJDS1NU
UF9TVE9QKTsNCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHIsIE9QT1JUTVhSQVRFX0koc3ViLT5zd20t
Pm9wb3J0Lm1hcCksDQorCWlmIChyZXQpDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMociwgT1BPUlRNWFJBVEVfSShzdWItPnN3bS0+b3BvcnQubWFwKSwNCiAJ
CQkgICBPUE9SVE1YUkFURV9JX0xSQ0tTVFBfTUFTSywNCiAJCQkgICBPUE9SVE1YUkFURV9JX0xS
Q0tTVFBfU1RBUlQpOw0KKwlpZiAocmV0KQ0KKwkJcmV0dXJuIHJldDsNCiANCiAJcmV0dXJuIDA7
DQogfQ0KLS0gDQoyLjM0LjENCg0KDQo=
