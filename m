Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB68B91EB1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Sep 2025 17:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FCF601D1;
	Mon, 22 Sep 2025 17:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FCF601D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758554915;
	bh=mr1RA1iG0NXl8VUvfAfyvMJbmdRJU3UazMLWYoytohM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tZOz20ocSR9XaXXfwlQIvyXtktRl1anToy8TXMweortPiLVJv5MkC1AVT9Vtx85yM
	 WrFr4LKnY9YEAqU/oeoYQdGbHET7CqFdc2V4VGVVDZF9rds7vxgL5qtrY56hiKGM74
	 DZN+H3NWqeyO6OcjBGBui54NTmTbJTYBrqP4JUq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F844F805C8; Mon, 22 Sep 2025 17:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EC17F8051D;
	Mon, 22 Sep 2025 17:28:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2466EF80254; Mon, 22 Sep 2025 17:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06531F8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Sep 2025 17:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06531F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fnYXKe7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758554871; x=1790090871;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=NDKKzTKv5VYMnD1RgBzIfOBJBJ09VFk2dzio84tv21Y=;
  b=fnYXKe7hWfFyKgXDa0ivCagHZwA1gmnffY3gPJbMgVQ2HphPf9ZrFidt
   LMy6R40wS5k/T0xnwm++GoVQ32wS8udhwEPPPzm25WrA78qt3mtw0gWDp
   UzeXdwH3p2EhBC5NrIICniL7DIwG6RxKAdmFPPKV73n5uHdzZpTh6hWzy
   Rp3beRmOfdjBOdNCy/Rs1TSgM166g+cY5O6olI51L1sAosJbCKZWPxX8A
   zEVG2EVov9skLNR6UxIDHRwL/+YvuhWapW5m03oEKHLFvhqGWB6nEFG/8
   7Odui+nJAAezbdMBYz6KkfzodRYfoedEeZvLwxRFCDrhnMC23sw/kQjmi
   Q==;
X-CSE-ConnectionGUID: sGC53N0sTV++T1baiWQsCw==
X-CSE-MsgGUID: l4TA8gKCRn6SoFtdUODLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78261427"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800";
   d="scan'208,217";a="78261427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:27:46 -0700
X-CSE-ConnectionGUID: qQBIk4/HRTevBi12SbQdCg==
X-CSE-MsgGUID: Rcyl1geqSPai7YJOassQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800";
   d="scan'208,217";a="180767244"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:27:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 08:27:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 08:27:45 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 08:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvPGUiH9SPlG828JRGg+DyklOAQAxihC8Sb3p5Ae057XzhZH1a/QrIZVHw8jGKDVPLwdA2cB4j/QQGDhMY/Zo0peFVIc2ZGnhbyf9dKPrQpO0QFWqylQ2jqQuNVzAopCm1fgxMoRvmvXqh1h8Df4oDd8VhQrlVGYz5IXibtrkitMhcSlBhnfBfTtqtbHuWqEOAJ3tONWUkl5mG0uZAkpjQo/yplpcJ4hWBC5U2iGBIHNPg4g4ng2TqVfOsn7ImyTSDQr2p66Pcjnwbq3b9wia2PjI5cu+MEgQ/Ov6q6Mk8FWvrjAFrXsqvs52z4MtrjFC47WEAVI88bl3ms0cwdJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDKKzTKv5VYMnD1RgBzIfOBJBJ09VFk2dzio84tv21Y=;
 b=bHJKSRwP7eyihBtVQL9zgQJKbSfETY2x9YaV5KfOpXt7JEQnBuhLHm3omrObofxk/sWf2ktRonzyPoTfgVWgkMWPOWCFciZbQQ+mrcZXi07W5Av9WqXg7QlcVhnYppqFY0VggqchXjciARKZH20y6Avl2fZVkt8O4hkYLNfHFydqtCB1qTPCMb1xYIy96dy0IkT0kBYmehmskNBFOwbaZAYUUVWplcTszDcscAq7zdx8I+C9A+tJLPn7XK149YaDQj3Su6x+g9UyUNIQxA2cp2EHqzXgmS3MYcHqeiKoyVBIMw9AkMUtVfFmFGbpYeuffa/uEUTkqYrCtNrYXWFnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15)
 by IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 15:27:37 +0000
Received: from CH3PR11MB7916.namprd11.prod.outlook.com
 ([fe80::138e:4e07:c935:53a7]) by CH3PR11MB7916.namprd11.prod.outlook.com
 ([fe80::138e:4e07:c935:53a7%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 15:27:36 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "Girdwood, Liam R" <liam.r.girdwood@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>
Subject: Looking for inputs on hostless playback with the DSP
Thread-Topic: Looking for inputs on hostless playback with the DSP
Thread-Index: AQHcK9RCXIUwp6Ux/U6ziX+5gUESFQ==
Date: Mon, 22 Sep 2025 15:27:36 +0000
Message-ID: 
 <CH3PR11MB79166FB88C912EC164D2670AE812A@CH3PR11MB7916.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7916:EE_|IA1PR11MB8149:EE_
x-ms-office365-filtering-correlation-id: aae62185-a0f1-4674-ced4-08ddf9ec8ef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?KF9p+RVr3aTCCQInDRPQOlm7cmG1K1Dq+4wjk1HHIAqAseAL7eMMGmscyP?=
 =?iso-8859-1?Q?ogVY8LJAdjNr5JNn8+yl7cwqt1GcbrdAZ3ol7TZ2nODSIiO6jAeucsZazN?=
 =?iso-8859-1?Q?W0Z/uxDnzkYr+An2pNqSHilebZkI67uzpuKY3hFXna0Dgml+otKouEZcER?=
 =?iso-8859-1?Q?4vJnpNk6U+DaO6tJ5/Kwe5VklqlYQk+dR0mZhmqgddRS3sdNzZeeWaSFSC?=
 =?iso-8859-1?Q?iFCJ1hFX8YxvwPTBZSwfWY/Tg8qNCw2dsHfywtgq8zVgtbqQBtA/GX9N3X?=
 =?iso-8859-1?Q?7BisNkjnEHPyssx341028yE1hyx8DqHs4kfX1ch8JxpThzpup17dqPO2OM?=
 =?iso-8859-1?Q?u9RKYTjuAK/u8fJmsMSKSNHX0i3js28JQKONejYA27RnFk0BV4Uh0iyGr2?=
 =?iso-8859-1?Q?CUCxT9Bbj+TAh7L2RsNu3EZZl/3eDO+h6u7KRvi9aieRZnTvNNn7eWiGm5?=
 =?iso-8859-1?Q?3dGglyEJdHQA3eaUV+NItUYUYDq/T9Y4YC4PyE/MuugoqEnnaoavlo35+C?=
 =?iso-8859-1?Q?Ro8QeJ2C8kCfpsx2ZhLslD3ClBUiGX3bJ4FUMS9d+XqujseePD3gxwNYAc?=
 =?iso-8859-1?Q?lLILCBch0046v4yKw1i8IXSulJpwRRDvYNgtx625FiOMEDPwsBbJB8+Zda?=
 =?iso-8859-1?Q?Tb9D2X1cbfB485Jmx5t7p+0NcE0zAQOwOY/pfLNZCOwshuS8TG9bJBE/9M?=
 =?iso-8859-1?Q?20TIaXcj3+Bd1OeVtdQQnBOeZXG0vVS1hE6yiqZXxmIcHXP76R5WPpgFyD?=
 =?iso-8859-1?Q?9e7NkILMP+ZFue/tg0OiIYTQyaqxWbnIUlA9bmMYvGkNITGomCwRjYW31b?=
 =?iso-8859-1?Q?Sb8RQbCnkGxwtjipyr8hZ4l8iT24Vo98YNmch4lrzDIrIhkBCkmQYJD2xe?=
 =?iso-8859-1?Q?lL20I923fQ8j1obfg3LQzPwUXr29GQvRsi0bqhdstY7p5QeD60qtE3CSBU?=
 =?iso-8859-1?Q?wtzHHbi8wX+TM0b3vZV5MCr1NLhZ1HhxomUpNarYISr/ovutLB6d9MztKX?=
 =?iso-8859-1?Q?qfOLG1hUjtKWoclIbknBGobnldiWQFBPuAe6wPB8zWCNXu857gfnt11oCS?=
 =?iso-8859-1?Q?J1PTD0krirsyShByoFMtKZ2C4OCWbBGydJbUWjHZ2ASnFbJ5OEzkCeGY6p?=
 =?iso-8859-1?Q?K1prr6+2YkK0ucJFSkG14M7XSt4AuuiVfISKQUTQh4GE9XbLhygkfr8NRX?=
 =?iso-8859-1?Q?PtHbErjp4r+/PxMUExjAIgo/u5VPPdTX4KF5rrflBP5X+TkggYkdUmUIWH?=
 =?iso-8859-1?Q?Jodl7Tv1hqumAWP+C99E+GKjLLd+0w0QsZG+m9IpurF8v1khf5AbkaoMus?=
 =?iso-8859-1?Q?DFI/m6I0i1wyWrmXelvFAXNpZskFbSXyVnD9e6ivReo5+q2Udncv3W945o?=
 =?iso-8859-1?Q?i66EeapIIKl4dUbvNTATlz4qHizXbyF8ouOIdGl4MBoqVkyMaXCHNrQAjN?=
 =?iso-8859-1?Q?eAhk3Mm3e38B+1cj30JwTes/3+BPpwYvkTCz9NTtcMMQIf+YiV4QaOHauT?=
 =?iso-8859-1?Q?yJr4VUSXGMdIHrt0qWQD/d4HIIzz6baD8sv/TqMohf8w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7916.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?OhJaCxcztNCcFcLgROmbgJwYtQNjIuGUF1tOfXaFrZsvmpSkZNDm65ZEzD?=
 =?iso-8859-1?Q?4UJjiUveARNxDX4eNZ0MiLldDbyrn59PgjvY4AhGM+ENdEzbyzWXNjnoXM?=
 =?iso-8859-1?Q?lADt+ist4Wix9VAfSVYt/fpR6C8eC1m5AIrcpMijh03zli3H+iH53jJUd+?=
 =?iso-8859-1?Q?y3Wkuttk1g7xSht2u6mu3fyJpXeEJc++KuUoYk7sS0jUiVciqZrziH7O9S?=
 =?iso-8859-1?Q?GbUI1cRY0CEt1A09yxWIDtNgKPftAclSij+FhVsdAjkI8gFgxP53fqS+VQ?=
 =?iso-8859-1?Q?laZmSnsFyxF/7O2b5CZftxKwPcudVd2iHEaBJX0we6jsWy+V3y2AIege1p?=
 =?iso-8859-1?Q?JdQejRfQYg7xw8KrT6Go8V3uOa88BYCo9MvO1f5OTaWL0+OoBUvW+hc2+W?=
 =?iso-8859-1?Q?RjngI/a//6+gE56wJOzuVZRQwEF8ZPnruLYuzKBG+lmIkkqcq3XWJKoiHV?=
 =?iso-8859-1?Q?sJ16iJANCcCP6w1WYL5e0bKYDwNSQFlczVdmaWrNPVJNjkyl9IJsMYV7kn?=
 =?iso-8859-1?Q?PR+QV69KKWQ9zKdtu+/gYwgx96BlixJj+ZNdrL5lP+d1X/FefN/QozwWEM?=
 =?iso-8859-1?Q?s33Z/mVncUAez2spAmwTrYE2zk/7hjHU8ntK1Jf0BHwsE0IxXbCNcDTFll?=
 =?iso-8859-1?Q?GXr3z4lNtUw8OIYnxbBw2vGusSB3N/jjxIlcUWNyItVjZa/AoDyZqltdvx?=
 =?iso-8859-1?Q?Ngo1Yhu4jnimqdw6I3r8X7ZwHrrP3cogf55cAWoFz/dTwiws8Bi2RodwvT?=
 =?iso-8859-1?Q?uIYVVMh0NY/Yo/mGy/Qv4rcWtupaHZuRo6gB6FYLo/bbu053s8/xudCoQu?=
 =?iso-8859-1?Q?zmIW9V0UzHI76zR+BYumO3XqpY0Om+0QuRrO735Hci3Zi67PKQkqiVnvut?=
 =?iso-8859-1?Q?+1RVbsjYuQLXPoITiMbTDspXbmxBxEIfN+KyZIv79/daAKkkRiZ67bsFdE?=
 =?iso-8859-1?Q?BCONGDyL6Kjl1A2AQuNB/RXqYpQJBYkuzQmt/vUfj7wdAieLSChhfu57nn?=
 =?iso-8859-1?Q?o9xRCRWz1aKt1wFNCmtrJaaZasPNxWz7db+4YmMrf4P10BC6pMdlWbovP6?=
 =?iso-8859-1?Q?sT/CmvlFRFcZ31Dl4iSczjkIq+KTLddFA8ns/T4Qd0BIrsjYq9YySPBqts?=
 =?iso-8859-1?Q?ROFR7W2Jbje8gvhILzFjFzwf14gurdzClF7u/T1IeETbfTw6PDPkVdjfDK?=
 =?iso-8859-1?Q?OBPDMpraOs9aRGWXmHce0pBYWB8ulIr8NZBVQzgHkKaNkpCt2ICRCvdkpT?=
 =?iso-8859-1?Q?12OiHSin0+wJ4i7UP9uucVL5oDRnRRuCAfTJr+rMEngivqmqJUeTGv+Xs2?=
 =?iso-8859-1?Q?QlDgrUJg88bfipuUxkauxNOEtpbRLkwp1zs4cDFwPdTS0Oj2bXsndDxnql?=
 =?iso-8859-1?Q?Ebzn4TWMnmVznUbJdCY6juKsZHC1XIhmkTDNiX1CCtubvndw0Yjz/NsUBW?=
 =?iso-8859-1?Q?kT0yknlqpz6qheLLHWvi2qf2cXI0XM0+sKFxtDghZkgWZ5cjaBjBzYL1tT?=
 =?iso-8859-1?Q?6t6WqwdB5kFO2J8xjayKBTCnVfXSsqcd+iW16FrJC5XxZDfWKokhcpCOO2?=
 =?iso-8859-1?Q?inCwAEILbWE7HoXfmG/XH/FAcZNbKMLjCjURzFHyg+s7xl07145wVlQE6t?=
 =?iso-8859-1?Q?oVx7qnvL841KSXlmpzd1pGkR3xHiQPimG6?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aae62185-a0f1-4674-ced4-08ddf9ec8ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 15:27:36.2182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 G2molP85if+gJrxVqCa2qrjWf05GOGz1BttwRnjzK880P3R3YDfdS8Yvko2cl7gFyA2t/3pj1kiYlcljLzIkB5GQYQH9kPR/ur8Id7E5h+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
X-OriginatorOrg: intel.com
Message-ID-Hash: INAR3K4R7IHHQ3NC42C7F36C4N4KA7VQ
X-Message-ID-Hash: INAR3K4R7IHHQ3NC42C7F36C4N4KA7VQ
X-MailFrom: ranjani.sridharan@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INAR3K4R7IHHQ3NC42C7F36C4N4KA7VQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark/Takashi,

I would like to implement a topology with a tone generator widget running i=
n the DSP that is connected to the speaker codec at the backend. So, my pip=
eline looks something like this:

Tone Generator Module (DSP) -> DAI Component (DSP) -> Speaker Codec

Without a PCM frontend, how would I go about activating this path in my top=
ology? While I can think of adding a kcontrol for the tone generator widget=
 to enable the pipeline in the DSP, I'm wondering how to do the hw_params, =
startup/shutdown for the backend speaker codec. Could you please help me wi=
th some pointers on how to do this?

Thanks,
Ranjani
