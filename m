Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757E8B485C
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2024 23:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74BCB6A;
	Sat, 27 Apr 2024 23:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74BCB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714253664;
	bh=dHtvDTyJIW7Xrx/QfdxalJYNmgDw+FUIY1MpPsFgze4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FUzd/BnC4pqyyWhKLwSlBj9TQcsQTB9HuvI7iWSKF3EYjS61+bbLdPuo94KiXuz4k
	 YBfO3wXXS88JSltWXjDKb+ZX1yqJo2uhWmpz9+jAGSVZxk4pCcu0NPL/e+332ptg3r
	 M7bvC7KyvuAjVjmR2bkTKZ/TpUMO3JVb7S7HEm1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57899F805AA; Sat, 27 Apr 2024 23:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B9BF80423;
	Sat, 27 Apr 2024 23:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF8C1F80423; Sat, 27 Apr 2024 23:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD8F5F8003A
	for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2024 23:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD8F5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=STZLqOlG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714253619; x=1745789619;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dHtvDTyJIW7Xrx/QfdxalJYNmgDw+FUIY1MpPsFgze4=;
  b=STZLqOlGJSbAw6q3Hc7XX6/JaE8F0c48hEqiGEaVhAqns7BvFQEH7jHE
   G/w5e43Q8JUew+Xloe/HhAiDyVsWABJhHzfLneOAQFyIXj7/cIfJcR60S
   ovOzmOhY31jmRTiu2NiKtlOTIYiH6wClfCKeVjdiWZx1iSWkRbxzyYDgU
   7PAsrpGJNXMoJE5yY/Qg1TmJByYiowtsGvG25O2w9sfTHdB8BtoicsDU3
   tYs+44o30ttLYuOEcKFwJn42ZN8kg6O2KsFP6S9buNyejTQ51KoaFIzTt
   iDpZFOoah5oHuD5Y+1+4otGjAOiXqmka5f0QsAbb9L1ju8mkNP0HV5JzH
   g==;
X-CSE-ConnectionGUID: TA+ja18sRDGclukXvLgV6A==
X-CSE-MsgGUID: s9r1a6ziQQyMyxe6Fs0DXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12897726"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000";
   d="scan'208";a="12897726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 14:33:29 -0700
X-CSE-ConnectionGUID: yf+Vl3SHT8apU3GhEMbSPw==
X-CSE-MsgGUID: ABA2yQZ5RHaelLPkj+BsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000";
   d="scan'208";a="30198315"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Apr 2024 14:33:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 14:33:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 27 Apr 2024 14:33:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 27 Apr 2024 14:33:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4Pi8n1+UrfZbg5aYXq1yrANqNmedDMJEvq9lLtbA8LfQdPfNoS9PNusbhzKNj+Yi6+0/h7KEJh+sc5no4kuvOdOMSKgzhcqWGp7SPGd2lW0PX0uCCxUaxuOAlYTzTpGVS1PRDwi9gT+MREi2p2TqHiI3vB3RVSQzjWqr0nv8EfHbjxrkp5qLW70o8uwfb2zgUYp5uyDKjGUpzjSPPDONuyHaTwvL+fzYbAj7yzfATQnZe4RAgqGD59q1TNmZAw26zI/hrfYWIKH05pkIoYUoyf8i1cTy33C737lvJx4WbW2NB4Q3H1SmV0GiU9FW7I3qcyMIazxzdjkVaREXmxKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRvOy62EiTh2dOCBLBJt4hQxH3720a81WzLwI5Ri8i4=;
 b=XQlq+nBulELQRwQGWHINZuleTLvjDmZUyut2PjRYwU6u1H5KVDxy+0qV3/0Wewg/NVilvuSitXL+XYmnbcNNwFkgnv0wTfqqUBNUZICb5qOtCZdeboiD91IHBTc0okrwTVbxjZa4aNJGZwE4mzzgQVk1hZH2PgbN2sa9RCwhwawXAes0SYEhBldfE08P/J2UjJc5yG+ITmM23lC7nulWghTqH6dqFdisNpOfCIdQh3MATJsXhJ8a00a3VUDp5BT9UhaOXIX+2SqZWDqQ872RFIeL3b511U/yHEPoHLqYE+s7MyeduZEEUymKP15T2ICf1i1zL5n3Mh3GT8BO/3G2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sat, 27 Apr
 2024 21:33:27 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.7519.031; Sat, 27 Apr 2024
 21:33:26 +0000
Date: Sat, 27 Apr 2024 14:33:24 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Lukas Wunner <lukas@wunner.de>, Dan Williams <dan.j.williams@intel.com>
CC: <gregkh@linuxfoundation.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Marc Herbert
	<marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: 
 <662d6f24528d7_b6e0294d2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
 <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
 <Ziv9984CJeQ4muZy@wunner.de>
 <662d2ca522cc6_b6e02942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <Zi1qtKNwcyydP4c2@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zi1qtKNwcyydP4c2@wunner.de>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f8490-26ce-4d7b-ea4d-08dc6701ac85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?8pd5/xXhWqlrkcalcnh8XZai3KjE7WRIBHJSQTCAx+raVBi5EXcT1ie2SrIT?=
 =?us-ascii?Q?pnN7Av1sjR8ZBtts2havm2TmM9D5qr+C+sCu1PkbYF/g93hVjg4p5IJ+N6BC?=
 =?us-ascii?Q?3u81kllGRdUnXcMFJKi5f1COqu8/GfsxpL3v8AnDiZG/NkZVIFsDBaDswi3v?=
 =?us-ascii?Q?NkB9xwEbAqqj2dLeYtuhHPAYI4k0Qy67Z2xWuieU2f2qFSn2/BEF3eKyUuk0?=
 =?us-ascii?Q?7sxRxvkyV9GaT2spsXEShB5EQZQCxxRwBZWnycTylRir98zpind9rlwVgvym?=
 =?us-ascii?Q?6iPx9MBulbkYedAcWVN4LuIVFYhLTafsI5i5B7o+GWPxA2piYMR3prsSVf/0?=
 =?us-ascii?Q?yKe3Olw7OdfRtQtaEy31Giox4Urjzb9GIHbSfOQfLRDtjG9CtIxGD8cfyqLv?=
 =?us-ascii?Q?hX09bMxdoR9FYUmylJpJGzuP2SayqR5q/d5LHAPI7Yg/nKv9tmtXIOxGX6p6?=
 =?us-ascii?Q?y8rLap7P/RmZkiODiwS2ZbsqfEdZk069nKS2UhtPMS7mdgqVyd3ZLmGzwbT5?=
 =?us-ascii?Q?qIK+9ZzyG/64lmdjU6DpDqmkPg3lUCvcJS7UDD4f5x2l/4WdR4692BjcyITa?=
 =?us-ascii?Q?eZzxhoC2zoUVRSxMMftVwuvFXHcQQJISGv5ez3vvV5tgOQd3sIELYmIyjab2?=
 =?us-ascii?Q?zanBGHzhaZ7X8sBscYuaiNSeuZYJ17tEKaCBbQTBzUtz83TfkPXgTjoRwt1m?=
 =?us-ascii?Q?fdmAjlflUealJxgMRgeF6xE4Dm2C+mD6HX5LNf8zL7PkZhzstpUtwxtho/ok?=
 =?us-ascii?Q?Qv3v1XtJN4NrJx13IyQoyq66qz/djaJ+BaD114FdNEPVwi4r/Rp2G59Qj5yD?=
 =?us-ascii?Q?UsV7mWneByMT37q1d/+Dy8fPtLEWpP1cADTfRbc7bqZohS8sXoy60WfrKIl/?=
 =?us-ascii?Q?zehJiGp9TDags6eDRf0UQwkbRi8DghcyrQ/tAFigBvRTR/n1ImCQkgCLkkMY?=
 =?us-ascii?Q?ssU+VUb09x8N+ap+4r1aInRwRunkMg/Itf+scyoVPZ9ACsj2spxIAK90whXP?=
 =?us-ascii?Q?mY8HcvZRT7qfEQQd62DcT7rPbdHmST4tmwHeAAcKC0k0k8bF774E9u7iduRp?=
 =?us-ascii?Q?IjV1LIzAI7v9mDt4wCnd/5TXww/3LxP7917C/lHBu6QkuxXQdOywAwpwxZ6P?=
 =?us-ascii?Q?ZG4T27qkRo4Bgqz/Ecv9rSoX6lqv/G+y0kTY7V0KSCzmpdHj+nUjPzhXRQU4?=
 =?us-ascii?Q?ZYckU3Yhc/SNIMGwXNiyw5ftNxzcHaeRjrGIL+FXWxrMC7LmgIl+EwdjboJi?=
 =?us-ascii?Q?kQOPhJ1GWucn3a4KJSMadonrfUvNPM9FYW2A7SjkxA=3D=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?9ZqRktJm2AY5zuPwhGB8rA9Sm6VxKUjtJrTWLZPOp23TqP1497d4Zog3cThc?=
 =?us-ascii?Q?VJLWuQCcJo70P7mlYPj2iWl5CoxEpgNoYDjXlpY8JMcPj4EBVtNlpAe1Anp7?=
 =?us-ascii?Q?/2F0hWmpHkpDgVgkb1itTZ004k5HGoaOd2wMmBR2xIB7e17J0KX28ttgv1Nq?=
 =?us-ascii?Q?k6O1XnVkRI+EGTtSSN4xzg+RlpGFaj94oVUEuX9N+UMy+vKuzOqPzsAjpu1V?=
 =?us-ascii?Q?dz3C80vkpXeXx469/b/NjJyrP16fhoTYmPKcCz99EZzppIDI8JymIWMALqTi?=
 =?us-ascii?Q?sx0n71+lV1DO9mrsvoU5BX1AfiQsuxKT7UTAiSCVz7Z7ghj9QD0JJwN3KADr?=
 =?us-ascii?Q?IvUwgH/8+lee9Vv3H9H59CyVRHGE5GUM8pqMDPooRWJwyR8WgTXkpj3amFT5?=
 =?us-ascii?Q?URIwFdloOD7Bfb6KIWPCd53bfhRDSl/NoILpwhQPgI7jo3IBPUhNuMObsLMg?=
 =?us-ascii?Q?YIZpCh3xH6gRbE9Bt5XCeZdcyAkuvVojvhNCIiFFZu4AF44VS4Pm1BSidssB?=
 =?us-ascii?Q?wlnGgKrvZNMZcppSWtgLLP7SVTSD8mWWfUuvuFWFSotY5eVYBvczIdfQViop?=
 =?us-ascii?Q?/XTUZc4u++0TExmdYZBL9xgnlFkZu06NBhytyQlYmkcmTa0ttst7aXuw8wkO?=
 =?us-ascii?Q?kpa8PdaPtE9iahs6gO6momZbGCZwQBoC101z6Qvoms26F1yv+xX1RDrYtO6r?=
 =?us-ascii?Q?qC6m24EXhdGChlNhkrKnWq142kyXXh2ZnUJmjj0NXDERkHs/BTfPXQvlILYh?=
 =?us-ascii?Q?YmE5eEc+7r8voywyEDmYPXqRlXrKqj+IhX9g0UyXBnTdsvHfj+sOC4wCu4M6?=
 =?us-ascii?Q?XBDDZYfnB3FZRs6Uyh1F1lxSrwzQZjnH0AcUNDKx0pf9i9xY85t/4iuRjR4o?=
 =?us-ascii?Q?adJ7FLZP99l/PHz28acv+A5ZIt0ZkWC0uSVg7VqlZcMUxP3nPDtBcT++MJhB?=
 =?us-ascii?Q?n4FvqkNvTtSEi0eJIUFJXqXx9UZeW4P06z8RDbhx10uY0HJLo0xcFjo4Ujgp?=
 =?us-ascii?Q?3EcoBBAVkKUW+weI/d+GVlydHuG2cOTfCW9b9qCCmTwGGXaTKrOAPe+RG4Ey?=
 =?us-ascii?Q?oO206Ko/gd72K7JmkT9AyW/scm19azJ9+id8nPY1D3cTgqlG+O0eyjUmzkQY?=
 =?us-ascii?Q?uPrOUjvuyqG0lBq7KsCWByde7atcLggirJsfbPunhU9B9xgmASYxEy7AgMK/?=
 =?us-ascii?Q?tvnafIn7aDw02Fop/C6QyJ5Kzr4ITxthfGtnTk4RqziINr8cWJLAys9Iv7Hk?=
 =?us-ascii?Q?myWLEiu6qTfegsrrnn6I3jis34f6KqAm0GlZOJ8ZSZI/14Xg/r7GD2TpWLnq?=
 =?us-ascii?Q?d9mqSLsBqRTgyhF1q8+ZcMfrQO/0/tuPXl9sJLWdO1hlOIKoOHWkTr4XY403?=
 =?us-ascii?Q?lQaHPKa+DbxvUV9kQob4+QZNLlXxdUgYbTWYBnwNN3RcTyNm0+GJtjKS01Nj?=
 =?us-ascii?Q?ZtVi59tLXre6PkquarApgT+LXe5RvwQ9fzK9WZ6b3rkdptUSBy1KbMEh+sn+?=
 =?us-ascii?Q?45bJ8yEoKZklFI5Dl+UKnuDNHkbGR0gLbgTSgAkvjh7ErY/x4zuNaX4PSaAe?=
 =?us-ascii?Q?2U6f8e0Jsz2nlVFkxawLx5XW3xX6FeqgPnG5airJmOLFFMAsL87QXuSQl32M?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 104f8490-26ce-4d7b-ea4d-08dc6701ac85
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2024 21:33:26.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BOKexdtfjHwmnLSbYOJW9TJbXVqOcqbYdM5Mb+nf7t0ZjJi1xeWaI5dnJcvS8bxIEhCenBw0bUqcZQFo1ij/REK9yZXFYfOamwaxoYIod68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
X-OriginatorOrg: intel.com
Message-ID-Hash: 2DQ7LGYQVVH5D4LIZBNFUC5CUPEMZT4K
X-Message-ID-Hash: 2DQ7LGYQVVH5D4LIZBNFUC5CUPEMZT4K
X-MailFrom: dan.j.williams@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DQ7LGYQVVH5D4LIZBNFUC5CUPEMZT4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lukas Wunner wrote:
> On Sat, Apr 27, 2024 at 09:49:41AM -0700, Dan Williams wrote:
> > Lukas Wunner wrote:
> > > But I want to raise awareness that the inability to hide
> > > empty attribute groups feels awkward.
> > 
> > That is fair, it was definitely some gymnastics to only change user
> > visible behavior for new "invisible aware" attribute groups that opt-in
> > while leaving all the legacy cases alone.
> > 
> > The concern is knowing when it is ok to call an is_visible() callback
> > with a NULL @attr argument, or knowing when an empty array actually
> > means "hide the group directory".
> > 
> > We could add a sentinel value to indicate "I am an empty attribute list
> > *AND* I want my directory hidden by default". However, that's almost
> > identical to requiring a placeholder attribute in the list just to make
> > __first_visible() happy.
> > 
> > Other ideas?
> 
> Perhaps an optional ->is_group_visible() callback in struct attribute_group
> which gets passed only the struct kobject pointer?
> 
> At least for PCI device authentication, that would be sufficient.
> I could get from the kobject to the corresponding struct device,
> then determine whether the device supports authentication or not.
> 
> Because it's a new, optional callback, there should be no compatibility
> issues.  The SYSFS_GROUP_INVISIBLE return code from the ->is_visible()
> call for individual attributes would not be needed then, at least in my
> use case.

That's where I started with this, but decided it was overkill to
increase the size of that data structure globally for a small number of
use cases.
