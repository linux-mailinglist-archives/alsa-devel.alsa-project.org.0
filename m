Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609E85876ED
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 08:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECD5851;
	Tue,  2 Aug 2022 08:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECD5851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659420085;
	bh=vKuinpmPqFMuebio+cTSALVTHtwwTQQM8L8eC6ZOUJg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hi4tFrPER/vDKRm/0LPkmEGD1yQXHTN32VCNMIYw6bX8eek3yy/9kkabPDLs/5A6v
	 qrwF4TsIkNQ1lXUXAo4vhzb5E44Hz2UuKMlj4jxHD5Bz+cCMwTmh2FqSY7+8K4N44X
	 yYgyG6Mxl1p8B7dXEvDi7m0aPr0IE2QvOi0WTCSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FD8F8026A;
	Tue,  2 Aug 2022 08:00:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8D85F800B8; Tue,  2 Aug 2022 08:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AAD7F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 08:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAD7F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KySyTBbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659420022; x=1690956022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=umCyUoT/MAAfQNAY1df+tTaSvVixHfvG/ohsEnzI7mI=;
 b=KySyTBbfYFXniIzboaDopLjxuvmc/IDLLyW3PW+KEJKJ6Wfnmoiax/wE
 ocaYqnU4OYpymGzP2k9sb5wQ7QE+6znSqsq/X3CPHWMXndGzZe02cu7mQ
 qYaBwRve9caRDW1liM72c8ZIy8lFM/cRBDDpakQiv3iEfkOtnXEv+q+ms
 6qMTu7nFQpgh7cArEEGn1oFl+FF16E6xo1lWF+NXaZibZWrMeG6FSUmGz
 d1nhMYjjo7k7jEVz68/EFnnluaPu65R+f3juQV8PmfyCRbqO+2JN+2ibG
 2HGDwwuCezNvjMfIsD1YddiV4SiyrLf+oLlcgHfwZcsTadftPp7Pgqv6c Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290103078"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
 d="scan'208,217";a="290103078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 23:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
 d="scan'208,217";a="552796403"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2022 23:00:17 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 23:00:16 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 23:00:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 1 Aug 2022 23:00:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 1 Aug 2022 23:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk6+CrRWfPb3h7jIShXrYzNRNSxrti6yqWcMFdJa/X1FoDAyaJrRtSzU7LosuZy0xsS+HijY6q9Kk8ik2rjzZ6Y+/VnpeRIsU7/9Ba1XT6ArF/lxJoXsDPxEF3S/MU5tSNRHHeUfwNm3SL3hss768zhxpfGJa4mIXbrvznlKEnDKb7aD+A6X9Q+ZK2yEs7I62C9uYnDcxID20kVZ7gFfhuJnzBkL179T2nOjyNWUr0PJP4e8YKLbBGS+V54zEMyR5KBr5vdRqc3FIjvFGKOb2/52Ycwm5NBg0dEcHVdGiBpSojvRzpWvrBghfLrKj5hKXcg42WsPefoM8bdx4IzvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umCyUoT/MAAfQNAY1df+tTaSvVixHfvG/ohsEnzI7mI=;
 b=e3oFY0Zemeez0Y60NQsyll3dFoNTB8EhdPxRSpARtNM2sVjXbsOpRReaDy5EybrF3X5sh4t1iQC5cDRVJlxtmcOWFvyG5avCSS1P5+5PxdwJNgK7tTioX30eGRbHi+LffWhKqVZ2TfY2O6bVs1NfLjO4qaeWz/d5A0W/+RaKYFY1wx/VrliRFpl7BtkQoScJrXECIGGL51ZxwvqUKWV83FsHvIjtZsXP9gDDykOD10U+rOoEri3A+2qOgxYMQXia8WG51/vdEjsUtdRQfw0r20ITKDP55EWRAtaiqS9craYUjn1m5Xs570YwAzmHK50CPVB/zo2oJY3HgAijmW89MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 by DM6PR11MB3433.namprd11.prod.outlook.com (2603:10b6:5:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 06:00:12 +0000
Received: from CO1PR11MB4947.namprd11.prod.outlook.com
 ([fe80::ec11:54b9:a6a0:f9bc]) by CO1PR11MB4947.namprd11.prod.outlook.com
 ([fe80::ec11:54b9:a6a0:f9bc%4]) with mapi id 15.20.5458.025; Tue, 2 Aug 2022
 06:00:11 +0000
From: "Song, Gongjun" <gongjun.song@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Discuss echo reference feature
Thread-Topic: Discuss echo reference feature
Thread-Index: AdimMc36Hpmkz9pIShOIwAFJfdj2YAAAFCZAAAB7VrA=
Date: Tue, 2 Aug 2022 06:00:11 +0000
Message-ID: <CO1PR11MB4947CF05871D3FBE4D34D16A849D9@CO1PR11MB4947.namprd11.prod.outlook.com>
References: <CO1PR11MB494760DCFDA04827A70037C9849D9@CO1PR11MB4947.namprd11.prod.outlook.com>
 <CO1PR11MB494762BA0BAC1D1F25652592849D9@CO1PR11MB4947.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB494762BA0BAC1D1F25652592849D9@CO1PR11MB4947.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 292cf9de-d441-4991-220a-08da744c4307
x-ms-traffictypediagnostic: DM6PR11MB3433:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f7OosJXJkRchXSF71wDHTLECW05Cni832tE1XHcriQRiQn1Wa3afS8SOA6OdfPCEo+b/S+5fSWZYTfNjUUc1xNLJyaqpAexztUHjo+2NCbpasKeBjIB4KICZJ3PDlNx5KUQFw912Am40xPcGV3L7NCR2uXzEmkTkRLqcxQ4b2dqsJIn4stBNJNojit4kfCjp0mZN5sSYQwVBxgbLNUUtZUyTt+DUax3AcHABkfCmwM/7rh10JdE84XOD+mBW3Btc8w1rJxNBnE/znLl1XotefqeHvkuOxeq/kzwEoy6aQESTdqdS4erHHdkxdsoJk8efcD7nTao17xmVTgp15JVyIX5P1IMP3wV0Jb8QsOQWPdDGcWYaB4XaBT3KpLSwF0ZpraaSikPQmH0uMhXTXCdExVPlpMFCFImdUrOkcRxz8Kb/n517Bb3Ksn3rtSm3o6mZLvE2zbn6eVBpp6i8kMZZ/8GsD/6VIkPGoSEoHM3pseWRwI8SjTKiChZW/lfHY4QoAegPfwOvuOuxHmXBJuTFm34llt+mi87bwBm9WPDBXgLSPMskzz+a1IVwjhd6fS96le6b//5fnZv9HUCTkkwu8CZgSqZ8rA9Vx5vdl0UUEBLGcuSNCjSS+5Tzz7O75RcMlnjx29ghDDRn1kA9/meEd7YF3Ye1GWQMW0/9iJ136llRAA7X4xZqoNnqmSP0hXitI171eiLVFIqzV2UYKW+TQo1rATg4ByGbzXTH4P1g2CegGdpcz6tZKwMvmXTQn7RnwCBnIHpR8Bo7oUV93Oa3X6At8C3PfjqDGXY2vWacE81vQ/veegshv9akm96magMK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4947.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(376002)(346002)(39860400002)(136003)(186003)(38100700002)(478600001)(122000001)(3480700007)(38070700005)(83380400001)(5660300002)(66946007)(86362001)(76116006)(66556008)(4326008)(8676002)(64756008)(66446008)(66476007)(6506007)(7696005)(82960400001)(52536014)(41300700001)(107886003)(71200400001)(6916009)(54906003)(2906002)(316002)(26005)(33656002)(8936002)(2940100002)(55016003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjNFcVc4WEwrUXArWXoyVjZIT3J2MFMwMERXYmZnOHNPMjdYTkJNT2REZEoy?=
 =?utf-8?B?TGNIc3UxaUlFL053Tm9KRC9pMWd5dlE3T2phS2ZYS00zTWtTaEg2Ym1ESFgx?=
 =?utf-8?B?SDZzL05XS25RbFF1NmlITmlMQzRjR3IzMlhYNUhTNVFDTlZxbzIyazJjZDFY?=
 =?utf-8?B?eWoyaHN1a3pXdGpyQWFqVEJER0UxSXY4alJ5SDdNbE5rQVdiOWxNV3RWdXpn?=
 =?utf-8?B?czRhUzlRcktINzdZQXY1Wk9kcEhKMHNBZGR6Qzh2WUFabXVYeUJxVGtNT0JJ?=
 =?utf-8?B?NXZaZDRpNGROMUZOc2t2WXkvUXdEUGE3ZFY4QWRGSE5QQnJNWnVOZnlnT1Y3?=
 =?utf-8?B?bEt2V1luTVcvdzZzcFBCdlRVSEF2K21kRW03ZG4relNxbnEyZ3ova0NlUWs3?=
 =?utf-8?B?U003VFJRU0hXbWl3TmhLQjc5N3JSQlV1RWpZRVh6bi81OWwzbDJORUxGaWFF?=
 =?utf-8?B?UzFyTXh1WDA1Y3dYTzBzVUhiajN0c0xzdjhqd3VScFB2bTBRQTBLak1aWXNJ?=
 =?utf-8?B?MnV2WEYxT1hLM0NTZzlqZXBHU0FGUytNYnpTTGlMZ0tkaFhlUmhmeTl5N1hq?=
 =?utf-8?B?NnF6ZTJpODlVT0hBS05leDZicFlUVmlFdHBvOHU1TytPUmRSdm1ybjBnaVBv?=
 =?utf-8?B?WTdRQXlQa0xYZEpIOWk1R2VpVVVrSXZRUEJPT0NNYndvaXZlY3h1MmFJRGxY?=
 =?utf-8?B?WTRYUG44UXJpb2k5R2NmYUFndUxDV0piaE5BS0lRMTVSeVZhTk42TXg4ZEc5?=
 =?utf-8?B?Ym1pVXI3dVFwV05NTjVKYU1oTU81S1Y0a2EyY2tJSkl6ZDI3QytHMTdXZjBh?=
 =?utf-8?B?M2kyaWJRbDlMMTFVK1F0MXNyK2RjbzVBa1g0RjkrS1lnK2dzSlJlRjQ1amNB?=
 =?utf-8?B?eFptOWxSbElzL3A1anRwY0xGUHA2aUZwNXFIdEFPSFhpY1k0d0hNaGpmZkRu?=
 =?utf-8?B?V1dCd3RkNzhMdHQ5M0E2YW1KYmxsNmtXejVvYWY5YkFYbUJsUk9PYkd4ajcx?=
 =?utf-8?B?YWtIQVowT01IUEgxeWY1MFZ6R2lMdzBtaUIwN2xPQndibzJKRVdtTUpUUGI1?=
 =?utf-8?B?WCs1N1lTOVpEMkdKMkh4M0hMZXFSbkhPQlErNUk1YitoVGZkMjN4V3FVd1NO?=
 =?utf-8?B?QUEweWsvS0xzZGRYbVZFaEYxSWRQYi96b2hRYlVkOVZHWWhzbDlySHVqd3ZV?=
 =?utf-8?B?ODZZU3lMODJKVzVkeFdMTEpsck4xZmZqa1pST1pZdTh5enJ5SUkzUFh0YitU?=
 =?utf-8?B?aXZuNTFtMHRSWW9rZFUrK2F6ekhUU3ZESk5KNXExd3NCMWJUaWtpbjFBbGU5?=
 =?utf-8?B?SUVibzhlcVJzL253T0pNNGJyY1Zhdm1hUjhtQ0dkdWNNa0M2N1FPckhMbGFt?=
 =?utf-8?B?S0ZaWUx3RlgyYmRTVUYyUzQ5TnoyYi80S1ZWcmxXS2gzSTRid0EwTjhHZng3?=
 =?utf-8?B?cDJ6MTNLWmR1UmlTcG44QXlWVVg0VXFvUWMrYm9tdzBzMmoxalNvOVM2N1pu?=
 =?utf-8?B?US84bWhoM0dMSVU3K0JabmtTVXpSWnROeW5NSWt6SVVDclh2UDhTTHpQdDdm?=
 =?utf-8?B?T09sZEtLTmwxUHRwMW5OWXFTT1JCQkxFS2c1WHdGLzlPWlladzg5L1FCSXFW?=
 =?utf-8?B?dHRFYVY4Rm9OWGE5SXRNOEhQNm51QmYydlNoeTdKU01TeGM4WnVpOGlnc2Vl?=
 =?utf-8?B?ZVVublE4dUtTcGxsV2FSVlhqVHBGTGcvMWY1dzFmTitrTnhheEtjbTYyQmVN?=
 =?utf-8?B?b0wwSERDdjJvbkNpdHc0ZkxkcjNzZTNBYzN4Vmw3TjZvQWsyVkw3V0pYLzJm?=
 =?utf-8?B?YW5aTitXTTRqNlZnNGF3RFFVNnR0QzRvSzRGbkZubnp3OGVWMmpJZkgwZnU1?=
 =?utf-8?B?YnVVeGtwVmVneVEyMm9raU1YR2g0NWJHUmYvK3VNRFBlbHljdEFMV2NRZC9H?=
 =?utf-8?B?RGh0SDRWQjlBSnd6ZUtWcGQrckRaZ3Avc3c3NWRFRi8zZ0hJSTU0SzlVWXlp?=
 =?utf-8?B?L1dTclBDcUpIL0lqZnhpai9hT05LRjMrNktsR01NdGxQcCtDUTRkOG9BZXdS?=
 =?utf-8?B?ckRjQWdXd3NCRGxrbVNYelp6STVDWURBZHFSQWF1N1BhNWVFa05VOVJ1cEJo?=
 =?utf-8?Q?RrHvUaxS5ZIltrmGgnfbDXKo/?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4947.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292cf9de-d441-4991-220a-08da744c4307
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 06:00:11.6754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MElYd+69TQdvB3+GsWvYfIwyO6QqerYZF342RwvsBdqc97d/J1fJZy5xJ1vyhF2ctXGjUU5uN35m2HyzZTXK2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3433
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Lin, Mengdong" <mengdong.lin@intel.com>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, "Ujfalusi, 
 Peter" <peter.ujfalusi@intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 "Song, Gongjun" <gongjun.song@intel.com>, "Liao, Bard" <bard.liao@intel.com>,
 "Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgYWxsLA0KDQpDb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucyBvbiBo
b3cgdG8gc3VwcG9ydCBsb29wLWJhY2sgaW4gZW1iZWRkZWQgRFNQIEZXP+KArw0KIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KfCAgICAgQ1BVOiBTb0Mgd2l0aCBlbWJlZGRl
ZCBEU1AgICAgIHwgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQp8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgZGFpICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICB8DQp8IFBDTTBQIC0tPiB2b2x1bWUgLS0+IGRlbXV4IC0tPiBTU1AgfC0tLS0tLT4gfCBj
b2RlYzogc3BlYWtlciBhbXBsaWZlciB8DQp8ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgfCAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICB8DQp8IFBDTTZDIDwtLS0t
LS0tLS0tLS0tLS0tKyAgICAgICAgICAgfCAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCnwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQogLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpBcyB0aGUgZGlhZ3JhbSBzaG93cywgd2hlbiB1c2lu
ZyB0aGUgc3BlYWtlciB0byBwbGF5IGF1ZGlvIGRhdGEgKFBDTTBQKSwgaW4gYWRkaXRpb24gdG8g
dHJhbnNmZXJyaW5nIHRoZSBhdWRpbyBkYXRhIHRvIHRoZSBjb2RlYywgSSBhbHNvIG5lZWQgdG8g
dHJhbnNmZXIgdGhpcyBhdWRpbyBkYXRhIGFzIGEgcmVmZXJlbmNlIHN0cmVhbSAoUENNNkMpIHRv
IHRoZSB1c2VyIHNwYWNlIGZvciBBRUMgKEF1dG9tYXRpYyBFY2hvIENhbmNlbGxhdGlvbikuDQoN
ClRoZSBzcGVha2VyIGFtcGxpZmllciBkb2VzbuKAmXQgaGF2ZSB0aGUgY2FwYWJpbGl0eSB0byBz
ZW5kIGZlZWRiYWNrIGRhdGEgdG8gU29DIG92ZXIgU1NQIChTeW5jaHJvbm91cyBTZXJpYWwgUHJv
dG9jb2wsIEkyUy9QQ00gaW50ZXJmYWNlKSBwb3J0LiBTbywgaXTigJlzIHRoZSBkZW11eCB3aWRn
ZXQgaW4gdGhlIGVtYmVkZGVkIERTUCBmaXJtd2FyZSAoU291bmQgT3BlbiBGaXJtd2FyZSkgdGhh
dCBzZW5kcyBhIGNvcHkgb2YgcGxheWJhY2sgZGF0YSB0byBQQ002QyBhcyB0aGUgZmVlZGJhY2sg
Zm9yIHVzZXIgc3BhY2UgdG8gaW1wbGVtZW50IEFFQy7igK8NCg0KV2hlbiB1c2luZyB0aGUgYWJv
dmUgdG9wb2xvZ3kgZmlsZSB0byB2ZXJpZnkgZnVuY3Rpb25hbGl0eSAocGxheWluZyBhdWRpbyBk
YXRhLCBhbmQgc3RhcnRpbmcgdG8gcmVjb3JkIGRhdGEgYXQgdGhlIHNhbWUgdGltZSksIEkgZ2V0
IHRoZSBmb2xsb3dpbmcgZXJyb3I6DQpbIOKArzMwMy45NTY1MjldIOKAr0VjaG8tUmVmOiBBU29D
OiBwcmVwYXJlIEZFIEVjaG8tUmVm4oCvDQpbIOKArzMwMy45NTY1MzFdIOKAr0VjaG8tUmVmOiBB
U29DOiBubyBiYWNrZW5kIERBSXMgZW5hYmxlZCBmb3IgRWNoby1SZWbigK8NClsg4oCvMzAzLjk1
NjUzMl0g4oCvRWNoby1SZWY6IEFTb0M6IGRwY21fZmVfZGFpX3ByZXBhcmUoKSBmYWlsZWQgKC0y
MinigK8NClsg4oCvMzAzLjk1NzIxNV0g4oCvRWNoby1SZWY6IEFTb0M6IGh3X2ZyZWUgRkUgRWNo
by1SZWbigK8NCkZyb20gdGhlIGxvZyB3ZSBjYW4gc2VlIHRoYXQgdGhlIGFib3ZlIGVycm9yIGlz
IGNhdXNlZCBieSBQQ002QyBub3QgaGF2aW5nIGJhY2tlbmQgZGFpcyAoRWNoby1SZWYgaXMgdGhl
IG5hbWUgb2YgdGhlIFBDTTZDKS7igK8NCg0KQ291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0
aW9ucyB0byBpbXBsZW1lbnQgdGhlIGFib3ZlIGNhc2UgaW4gdGhlIGtlcm5lbCBhbmQgdG9wb2xv
Z3k/4oCvDQoNClRoYW5rcywNCkdvbmdqdW4NCg==
