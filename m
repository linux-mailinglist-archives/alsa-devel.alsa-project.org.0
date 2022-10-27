Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CF60F247
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB08232C8;
	Thu, 27 Oct 2022 10:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB08232C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666859117;
	bh=rMbihDoqM8H7gqHAQUenqdb9e3JWzxfwYcive6q/fcY=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HLa7H+tpNAo6WOBB2p/Nh+TyK91NMomnM1AiEa6QTDPVxLeOXINDnyWSp55+VhzWi
	 16Qd91rEIY17xq5RAUnBVpfUabiE9jX9sAO6B+L/06KDGrztb5W8hpGsp5erB+dm/n
	 zFNPxYBzhgAVSHCwdx7X9X+ispD9UTAJy+zCUCwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE280F80496;
	Thu, 27 Oct 2022 10:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED3F9F8025E; Thu, 27 Oct 2022 10:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD98F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD98F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y7i7APu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666859058; x=1698395058;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rMbihDoqM8H7gqHAQUenqdb9e3JWzxfwYcive6q/fcY=;
 b=Y7i7APu5ivfV7+wINUxdVHkTIMMttq97BMhieud8BJvb+EbXkWkM3KLe
 MKEqoe3ewK69mCLJXQlg7OVa+q/OQeZV3xY87VE9uVTixmgcSilTLxDU5
 7fgjLIFpi5uVc/76XT3jhjowKCmjFYLDRsf/nPF279CuiulRH3NnhXTjd
 aIxdmiHyPfm2pdrzcW9Ts7wxAkDs5GF8YdI0vfnVvb4ZzSleKBPJVMPqk
 BHJ4mNt2sRVn+2W9gv4Bph2QWrF8gmnKMfZUFyzPFQ0FQ8auRPsP2zIhI
 j4JtMOX4ITaBeVae/m4rAflOqxaXriQepKk9dfbweca6sNNHsWkWxAKbM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288559193"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="288559193"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877499427"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="877499427"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2022 01:24:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 01:24:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 01:24:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 01:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL4+6Lhf/CyZk8KgsZ+x/LucfhKw8HxzvnHGWO2AdfV5NHHLeJqOdifhS7K7dsqwK80AbOajiBl1onLnNi0rL1Agu8qLgGXWhyMQF19Lx0vQ+yqpo11vdlz/nSOtCcCIX6kHlWB6/1OgAvldblhnj3ndfAjxEQNqlyrR9MMaCUrzkSm7GCFbg50nV6llfSoBN/zYggMFgDhyKdeuFcImDOPN4V5XrUlMUrhkp49kvhDVOTuKTffloKZtt7Yavpwuo/cPLisvWYH5wm/JI5+A+wZlVOXiauUFxdySzA5PYq50MvWOoDogIyhTh+VFSY5fYFZW5blfpWJwBI3czV/J8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkcFeGhWYt4PFMnq3e0EBmVVhsn5KPftsE+YI1RfkUo=;
 b=Q4IDVeT70DbkFTsViYqIHqTXJGHbPlRn4yjnPNgmkROnkmd2h4jF6F7IiMkftNC+lFv2OSqrwipJOj131GVh5ES9Cd0naNhcDdXJCiw+u5CRU2A7eaZG3mf4spgbWZCKRpQpjrySpzw94NKytjNkh9q1q70Ar/7AGoeNP7uRnOwXnBR7lHWnhgQnRadU2+yHFAP/49spNHCy++lxUEcNiakneUyWeiycC/G/QPXme2IhnB8d6SdBaYAvN0imilsOBHSlL6A13FcMNLZXcW0f+xEfYsfMUPKnVOFVuL4kzFeLAu1q4VeyJdO+S+leg3RcmVVcV9m4x5rKnoz4hYih2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.26; Thu, 27 Oct 2022 08:24:00 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%4]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 08:24:00 +0000
Message-ID: <d1cfd094-0bf3-da6f-655b-863133df570c@intel.com>
Date: Thu, 27 Oct 2022 10:23:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: Question regarding delayed trigger in dpcm_set_fe_update_state()
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai
 <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>
References: <73e6425f-8e51-e26f-ad83-ccc5df517a43@intel.com>
Content-Language: en-US
In-Reply-To: <73e6425f-8e51-e26f-ad83-ccc5df517a43@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b15f91-cdac-4d3c-89d8-08dab7f4998d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5rqVNBgrgWgEiz/OaAcjASvHff0VElVxTQUHbz0T9i9NcXJuxMJxrhuhhDuuCSvtFafIqOceoDw+3webcVUyjCpmfVvKYopkDbzWDFUJyF47zC0dn3MnvySvzMFXhYadW1mRnu4HHgGdkFL0qCp4eyybo7NWkXasLcbI6IqRDjaRRHRLmKdN91bAstiDfEiHWpFzSMrFp/aVBcGH+UuB/2I1orcB1su0mArSV9C58ejYhwtb1vEzY5oUdVoG+10ptOlb9m+QKBcGcbleKyKiiCGh3cW+HPbT3ZSSWMRxZz8hwDf7mtnIjaL0+0STwa6nTcoGNaDNaKpTzssm8U2evDfWUGZ2iwmztjMqtJoKHwXAUKxdRwhew95CgtXmddD2Wpd140ot5LuHOb/pV1F9Be9Mv9ZQT60RKRk4CorKkk/BFYKsiBytUI0cJJSXq4Vn9ZzlubxpxwD/4u+fnW1WxCcHmxgvkFt238O0ZdL1tnXG9SmB67Za6/HHf1FRc3xbLCRK+l/bUEDewstWqw49TYC2jvFYhMjDzG2CtdthgnILmrU/j5hJWFkffsOOtJI2W3GNCbChUC2dOytnekLySDJO5So70dy1irUwGkyg6oOT6UbcfFY/1NKxoQq2Krs6Ql7goLE1clfLfomGkgzz8zzkPhP21idgsNzyF46/K3uax53u9prcHJzOI14WfQvDhmhScpLp1sVv+UV3s9coobXZMzRFSjCsLB3eJx0UrOyaUekaPxLgor4iZwwCkidv3ranAUC/TAAxrmqtcfYJYn2gIussUrpTPTM0bxrsZX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199015)(36756003)(31686004)(6486002)(110136005)(82960400001)(7416002)(5660300002)(8936002)(66476007)(66946007)(66556008)(83380400001)(86362001)(31696002)(54906003)(478600001)(26005)(6512007)(186003)(2616005)(38100700002)(316002)(44832011)(6666004)(8676002)(2906002)(53546011)(4326008)(6506007)(4001150100001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzMvMTNaTWx0eUE2S3MwbW9yYUNPSFgxdVIvZGJxUlpROGtFRHFTMkxIeTFT?=
 =?utf-8?B?bVhYdmsyNWttL3JIVTRaZy9iMTFZSmhEL2JlOHlmSHp6TlM3TEp3Y0NuUVhP?=
 =?utf-8?B?eXBnM2hLQ0t4OFBWZWxyckZmVU52R0xjZk9FNElCeGVGT1RuanMrV1pIVXdp?=
 =?utf-8?B?TCtZK0IyOGg0QmxBT3V5YmtaVHkrazVsQ29LV2lpWkU2eXRzK3pYcm1Gb3ZM?=
 =?utf-8?B?YlM5QlJvUWtpOXF6azQ5OHhlSU9GbTJ6V0tNQmE3ell2YTRodktSVmVFUFBD?=
 =?utf-8?B?dlI3dFBVM1UvQitZcFlQSFhlNFBWVmFqZnJERnlJSVdLQzMvWFZscXFLSjFF?=
 =?utf-8?B?UlAvRGt3dkdOZlh6YlZGaXBJWEdIRjZIcDR4NmZYc0hML2lOUFVzbUFkdHlm?=
 =?utf-8?B?RzluRCtxWGZuWHRVclE0cWVER2FDSXU1eXZIWlE3UkE5RXFmZUZyQ3lXRGdK?=
 =?utf-8?B?QktHem1vNVFNN2g1dTFwaG1hT0gybTAxTENMajhnb0J0cHRIdVhOcmFqUlhH?=
 =?utf-8?B?akJ3UWFPdjRzdnQ5aldCdjVhc0ozMHh5aS9OVzFtdDBrVGp3SzNBM0Nka0tX?=
 =?utf-8?B?czZkU1ZocUgzWDRGakk2U255c0VkME5RTXNPYjlPR3NNcFp3SklPN0x5NjdW?=
 =?utf-8?B?L1BDdGNJaUJaNEZ2QXZyNDNWODd5cWpCNnpKaWd4U0llSDFZYXVsQXVLaXJo?=
 =?utf-8?B?VExCZHpCSmdTZ21kelNUeTErbzlKTG1JdjhWMWRKRm9rK0djekNyUUk2Q25y?=
 =?utf-8?B?Z1FDbThJbzZlcEFGSWZkYVlIZnU2WDVrY0RwSlVYemJsV3JMVFVHUVVPOUZR?=
 =?utf-8?B?M0tNbzYydHVUS3V5VDBxNTVCNTNTY0l0MzlsWndiTlpSMWRvZjdpeTlCN1Z2?=
 =?utf-8?B?Zm5xTEZmUGNJbVNlN0UvNXRRMDY3SGU3U2RRbjRyUEhUYXh4dGhzbGNSbnNE?=
 =?utf-8?B?N1NSK3A5NW1zMjFSK29idFh1WGdkME82aEUvQ2hOa1BLcldzbW9HWS9sQW9m?=
 =?utf-8?B?VlU1cTI5eFNpYmdrQmQ4a0ovZ04vQ05WSUlMWXZoWmZwbjB5NG5uWktFelZM?=
 =?utf-8?B?QWhrSytsZFNWNGxKdmFOOUZKUW5TTHlKRUk4RTVibHhIWGpPZjZqd25kN0lF?=
 =?utf-8?B?cFQvU1M2dTZqeDNrcTYxTnNLajJta25ndTZOY2RyVkF0NWlsc3lwdEdoVE9Y?=
 =?utf-8?B?N2dGZDhYR0lyUCs5UGE2bjBSM0owY2xYT3pzR0xRSmdHWTFibDQ3RDVjaFVI?=
 =?utf-8?B?YTBHbk5JQjBHVkJJdFN4Zk1OakU5UnFjUkMxRXBvWEluZERFVy9EbkUyS1l5?=
 =?utf-8?B?OWVNTVVyeFJmVzhDbUpoTWhtSHJDd1UxUm95YTNDa3hNTC9LUTlFdFphNmpO?=
 =?utf-8?B?Y0E2cDU4d1lINUVnUCtaL2o4YU1zdm1waFZJZGNBbGZwZVpTYlJkaGRhVkNr?=
 =?utf-8?B?aG10dkdGa0E1M1ByMlRaTUtxb0pMV1JMTDQ0ZkZXQTRBY2JUcjVYbitQaFIr?=
 =?utf-8?B?aGhJMnhScE1NcWhTR05uMlJZdlhoWi9DUnZSYXk5V3ZoZnBQbXd6RFBsZ2hh?=
 =?utf-8?B?dzRFaEZnRGx4WUtKSENlbVVGRmFPNXUrNDQya1RZZWVaQ3A5SkUrL3orOEVT?=
 =?utf-8?B?Z01PTUZ5VExlWStaZnF5ejgvSXVOLzBIRFdrcGlXajVWQnZMdndHckpXVUta?=
 =?utf-8?B?WDN2WUppUm9GSk8ySjE1cVJUWHYrRGpyMWNGYnNRRjl3ZVlqSGZLSlB2eFBt?=
 =?utf-8?B?dXBaNkJVL21rdmJmdDZEakttdzhhVGpObDF5YWpHOGRNWjJSc0JuSkVNR2xw?=
 =?utf-8?B?M2JleTcwN00wellhaXE5SGY0YTZZSFBaZ29EdlVBSitpQVlKdm13ZUpQUWNM?=
 =?utf-8?B?TXFmTW1VTDQwR0t0RWFoVXV5RDQ3MndpcjNZN2J6N1R1cHRRdGpsUlJWQnRk?=
 =?utf-8?B?U3hlUldmbGpkYTBpbUk3eHZaQmpTTXkwV2VoU1dnYmgxUUJvWEJFK25KTTlS?=
 =?utf-8?B?U0h5RHlVVElMNDZmV3orVHIxTzNiL0JKTWNPbGJBMFhvYW1BY3NhSzZ6S200?=
 =?utf-8?B?ZmlpTUJDaGQvY2Z0aDJXbDVvTlgvMXAxazNsaU5iSFpRSytQa1QrR2dlajRB?=
 =?utf-8?B?L3o3UWFlUno5eWFNMzhOQ2ttQWVDUXRhazlGL1NJNDBUeHVSSzNGMTFndEpP?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b15f91-cdac-4d3c-89d8-08dab7f4998d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:24:00.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOM/bAVi9xujgXLoHYFNR5kqA2zHU0f0eDCk1UM7f7wLCIHYad8TbC3fnpmLhCRYs2ptz5M73tX/66sDgLd/xppPJ0eSvSjG9OoZLzYoh9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-10-12 4:07 PM, Cezary Rojewski wrote:
> Hello,
> 
> Writing with question regarding dpcm_set_fe_update_state() function 
> which is part of sound/soc/soc-pcm.c file and has been introduced with 
> commit "ASoC: dpcm: Fix race between FE/BE updates and trigger" [1].
> 
> The part that concerns me is the invocation of dpcm_fe_dai_do_trigger() 
> regardless of the actual state given DPCM is in (actual state, not the 
> DPCM_UPDATE_XX). The conditional invocation of said _trigger() and 
> addition of .trigger_pending field are here to address a race where PCM 
> state is being modified from multiple locations simultaneously, at least 
> judging by the commit's description.
> 
> Note that the dpcm_set_fe_update_state() is called from all the dai-ops 
> i.e.: startup, shutdown, hw_params, prepare and hw_free.
> Now, given that knowledge, we could end up in scenario where 
> dpcm_fe_dai_do_trigger() is invoked as a part of dpcm_fe_dai_hw_free(). 
> dpcm_set_fe_update_state() is called there twice, once with 
> DPCM_UPDATE_FE and once with DPCM_UPDATE_NO. The second case is the more 
> interesting one since it's called **after** ->hw_free() callback is 
> invoked for all the DAIs.
> 
> dpcm_fe_dai_hw_free()
>      dpcm_set_fe_update_state(DPCM_UPDATE_FE) // fine
>      (...)
>      dpcm_be_dai_hw_free()    // data allocated in hw_params
>                  // is freed here
>      (...)
>      dpcm_set_fe_update_state(DPCM_UPDATE_NO) // not fine
> 
> 
> The last is *not fine* if the .trigger_pending is not a zero, and can 
> lead to panic as code used during ->trigger() is often manipulating data 
> allocated during ->hw_params() but that data has just been freed with 
> ->hw_free().
> 
> Is what I'm looking at a bug? Or, perhaps there's something I'm missing 
> in the picture. From my study, it seems that only dpcm_fe_dai_prepare() 
> is a safe place for calling dpcm_fe_dai_do_trigger() - once 
> .trigger_pending is taken into account. Any input is much appreciated.


Given no responses, perhaps there's something in my message to be improved?

