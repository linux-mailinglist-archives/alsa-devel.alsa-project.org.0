Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25353FDE50
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 17:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473451739;
	Wed,  1 Sep 2021 17:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473451739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630509299;
	bh=qe/r8mdUVBg9wzIfqHt9p29VA2a0sKBFqb/B1haAY6E=;
	h=Date:Subject:References:To:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyWuzuYsMX6n147xPNPf62hG5Or7KRJG4A3DbAs8SBPk9KADLwF7GszslDBTCYRuB
	 CZXe6tUJPDkLqw4ku2QYBW7/gmXHWmx0n2mcHKEtKSaja3uvf298oSUdSYUC2zFUEM
	 kl4vVWkIQoMPaw+VSF12iiyLm1+b+DBWYU1cRZE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C2C0F804E3;
	Wed,  1 Sep 2021 17:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E132F8025B; Tue, 31 Aug 2021 09:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC446F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 09:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC446F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ownte/z7"
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="205635678"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
 d="gz'50?scan'50,208,50";a="205635678"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 00:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
 d="gz'50?scan'50,208,50";a="530980670"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2021 00:11:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 31 Aug 2021 00:11:02 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 00:11:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 31 Aug 2021 00:11:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 00:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoDy4qt7jhUR6pdWp6J9C+1OFQmAfr+WI8nPGYsTtErCYnBPDblFN6TlX3sWEyYoRUW8lRN8SuajrGfdzgjznswnuIktcpr9gBuw8SJeOjjiaL6H7y/+hVXpHUaKrnGUEEz6HDCdv6cRNEp4hU1YHchCTvUszmYWx62ag1giSZpgMkHtCu4YuyYEECMlZde48fqorq0UpvewYECIp5GsI33PPs3cv5rFHyTDZxzf9KFmIVQ4MKCNcKJooersE6nPbxXTkIpIVzIP/lsvTBKd4kyLf9ZR9BXzmytdGn5yW+QdlJuEsKTHYJa3fP+zP7poxnJWFfaNPvLVX9ZSuV61RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FdQe6TV4maG1PvK9KqESUDpRbXvgtcOBHaULipeRVEY=;
 b=BDeqvaoONfeC7sDHaxc7tj+KoA9fDMc9ZRnO0vV491rMnDoU0Q3QyXOuJ3WYdFux7i9clP6vpBk7+UZFV2TDwxVFxjT1YlfeSVNL6ghEe5Oq7q+FOoEb8dRi5OMPGXLzbqltEs76KWewm9twA+Lr2tnrScW1901Hov1MeoGcNO/gQk/rl52f++YHQKNpWGcpjsPDUPzxj9LU0sXNieaIQRAJTZr+bgAsEJnQ3g/yPU4H0qTX7uZjqFfwiwXnGtY8l49Ra+t/AogCEOr6Vy5KE+AgJ1bHkgSGJnnt2YxOWjiRTM6W5IZBov35/Cu3AkOFhnG1NyXO46QVDDX1/10lJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdQe6TV4maG1PvK9KqESUDpRbXvgtcOBHaULipeRVEY=;
 b=ownte/z79V7so4mL7a76Y4a4H5y/BNfl8H3Ntme18fICRp0ErOL1plGPRXzPnUEjCo+UP6VOkJaIo/q8FnnWnccUXr+LP6EHdpfkCFj5+CUaMoJsuXJpgRrXBwEHV61k0E68AC46inklN6apdMyliTXcfaka3QPV6hvoZD37wmc=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 07:11:01 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 07:11:01 +0000
Content-Type: multipart/mixed; boundary="------------mCk2tcYcZn2cIWfsAS98mZia"
Message-ID: <ff821ab3-00e8-9ba5-b783-f93f7f28a2ae@intel.com>
Date: Tue, 31 Aug 2021 15:10:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.0.3
Subject: [sound:test/usb-audio-lowlatency 198/198] sound/usb/pcm.c:1322:12:
 sparse: sparse: context imbalance in 'prepare_playback_urb' - different lock
 contexts for basic block
References: <202108311506.RCzaPFH6-lkp@intel.com>
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202108311506.RCzaPFH6-lkp@intel.com>
X-Forwarded-Message-Id: <202108311506.RCzaPFH6-lkp@intel.com>
X-ClientProxiedBy: HKAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:d0::23) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.238.2.112] (192.198.143.21) by
 HKAPR04CA0013.apcprd04.prod.outlook.com (2603:1096:203:d0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 07:10:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 797d8607-519f-4ac1-c9a7-08d96c4e7cb8
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5615:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB56155BED9A790411D504C0EFFBCC9@SJ0PR11MB5615.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AivWtALJ/y97s0k4X9rSzjcDBqYP67oOGRRem2wAk/6qmOsUCpb0MuUFC00jmbI+SGT3xnKORVvmPNxLdjCok4a4wiWDJG/jCwhMdbDeuTJqjSsnruemJ9jTZY++PO3b7LVUSoqESQrluakCNNPax+FLGrjTb6+1T3bBluKAvyaQNF73/tj9MqEJeSYHCZ2c1sks4NZ1yZYegzUNFngFLIZS0NN/KYxIfIqMbx8TP1HmBw3x9REOaA1YvBsbNFUhDd5plzloF0NzSgTtESu5UP3Wom/SM7sfVOe6iN8URrEEiXhbjvw4wLYwqp35AzrUyUOeGP4MlELHK41FpS2QMCXv4bHfhsBjdO9PN58IELeCmqaBPfg9F94rKMqFWZ7PDbeC6QWCSTmnjxQuJceCYnTblDv9LYrwhV0kzsfV8d1EObi89fqS5fDNqVO5eCG6gO52etDVZjNTR9fu921FRakL/C45q9Be6u9tmFcFH2i1Pde6FzT0r4EKiHQbsV7iq2SuMq68k0i3GCxmDipsreWSL8pWMtJvZ3Qb7poTFusbuX3dVukkIIiK+fLOZ3Uv3TjNxsVK8PUACIJC6UsKfDPqn5diMsa5Q67X/wMuW1SspPdp45zH9bUmRExxMlCGXKcwpswPGZKXIcAsX8tMvp/2QijwAyT/5yjJXhxamjFr0RzBFLJxzCu1Em10Ph6xNrNEd02VBZdJeYV+uFR7Pph90nIQnKFNOn7KBf48b20LJJhaUuzX043vBEDrPuo+1ATTmylhC/exNxVMo9mBN24ATQ7SoWqaZgU0vDlyNzbQnNxNyCCTPMcwc+2cw5sG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5598.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31686004)(4326008)(66616009)(66476007)(66556008)(235185007)(186003)(508600001)(6916009)(26005)(2616005)(956004)(86362001)(966005)(5660300002)(83380400001)(31696002)(2906002)(36756003)(8936002)(6486002)(8676002)(6666004)(33964004)(316002)(38100700002)(4001150100001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2NTRlZOTmw4UFVHTk1xak0yemdNNVZMK0hianNNWTc2ZXZpelR2SUFrbURs?=
 =?utf-8?B?VWJUUUxZazJuaXZpbm0yR0RISmo0aXFQT0VMY091KzBQZGEza1hwQml5bi9C?=
 =?utf-8?B?TTA0d3RUTmlVZGtOODdjc1ZYbUNyRzNuTHhLNkNHeklvV3pHV1lWOVhIaUdx?=
 =?utf-8?B?NUM1YWlZckgrRDlUTGJhZC94N1YyUjNVUFdJbmRTMGtkd2ovUVNVeFVJUUZK?=
 =?utf-8?B?VmxLREF1N1cya1NLdjc3SXFCUHowVGFIQ1BiL05MbXErcktvbkNycklhVGVO?=
 =?utf-8?B?dUh1bFc4T3FxcGtCVm9VTU01ZlR6UjBqY1dNYVpSTDVOY3BwTzBkbTVmK2FD?=
 =?utf-8?B?NEpDenZZOW84MGFrNEpuQWxUY1RTcGlaRlUwN1ZBb1dhZnJWNzV5SDFGTlRE?=
 =?utf-8?B?ZXVNdGpOYTRMcEZweENhQ1g3UjdYOUlqdkZaNVpoQitjY0VEc2VhbkRnSUFy?=
 =?utf-8?B?M1FCYzZuSUkxSTBvYjBsZUJGdGgvOWVpeHhTT2M1SEdQQnRCR0xraDdpejRJ?=
 =?utf-8?B?aG52ekJRSFNERU5hd3JzS0I4ZHBVZ0FuTjZGQUVPczFBcWRrcVJUSjZ5Z2No?=
 =?utf-8?B?eFlNNHhOdnZSY2lCN202SXJodDU4UlhPTjdua3VkQTJwWE95c1VoZTB3LytJ?=
 =?utf-8?B?QzFDL21ydVJtSmFvNklYa0VUMDViOWptUkVUM1pncmgrTUxxeERLUjg1Q3cr?=
 =?utf-8?B?dEIxR3N4aW1kNmNyN1labjdPVGh6QnVYYzhMMFk1T0ZrZWRvSEVrVXRzcXpZ?=
 =?utf-8?B?YWhvMlBGeU5Lb00yejI5ZVBtOEc3cUFVQjBDY0pla3UwSWpNQjFET0xiT0U0?=
 =?utf-8?B?ZlFnRUxKc2RRL2RHWnB5ZEFURUdydmZJbkgxNFBob3VsVkViVE5CeEVQeFVo?=
 =?utf-8?B?TzBCekhxS2cwUVRiSWVaUUs3N3U1RGlZUHVTOE5DVzFYVFJhTFpxNklxYkJQ?=
 =?utf-8?B?Slh4UUFGVDhDQWRpU2JqTmhsWWloLzFBeFAwMzBwZVhUVEVUZTQ3c0V2eGRk?=
 =?utf-8?B?bnc5Qzc0eHVYT05Sc2lyWmMvdUtnQnpGMTVWREx2OVRFNUNXRnZpclpmZERU?=
 =?utf-8?B?WUFsRzVEOFdVS2QvaThRR1N5K1FBUW1SRG1wVEYvSFRSb25Bdy9EWDQxOHJH?=
 =?utf-8?B?TVRNU2JxZXg0YVl3N24yaTFPRmpLenM0cDhmK3NTdXVVOThjRXdjMWFBR2p5?=
 =?utf-8?B?eWNNNDl2a01xUDVOam9BS25YTnVjTktZUitiT1k0UmdXcVp3eDRjaGt1dVZz?=
 =?utf-8?B?VDJwbmsxNVkwaVlmTjBsODRod1hhWS9CdGVtT1MvN29TYVVjVVkvZDlrOWxw?=
 =?utf-8?B?aUNVTlRvQWVlTlBwL2hKRHFSYndqYmxuWGNJWEt5bU9XTVFiRWxYa3JmWm96?=
 =?utf-8?B?amU2OTBaR0EwcWtYS2RMYTcrVUdtT3BIaDMxSFI3eVVrVGU1Y1VKVVZHQlZp?=
 =?utf-8?B?U2FLK0pSdmhNM1hoTUhtZTFzRGJxMkQ2OU8xc0QzZkIvTVhYZFdSNHlZYTNN?=
 =?utf-8?B?K1UrOFBLN1ZKZkNWRERTZFZlUnQ4NTZPcll5UFlYZVgvMWhTQlZuelBQVUcv?=
 =?utf-8?B?MzhNVWYrZXd6OVQwL1huVDdVUTVVV2lWZGJoTFVFb1kxR0p6eDBwVlVwZG5a?=
 =?utf-8?B?N2gxZGFtczk1b3AvNHNSL0lta0tMSXFCZXU0eWtBR2VVZU13ODlLN0hMSk9x?=
 =?utf-8?B?dDh0Zk9YZWFNRSs5b2ZhS3RJakMraGlvVDdrUStEREN0Wk5sYndPczhLb2hR?=
 =?utf-8?Q?5d35zvePzCTLtWxrM89MGCIFOOpnfhjK9B30zOJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 797d8607-519f-4ac1-c9a7-08d96c4e7cb8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 07:11:00.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njMbqXbnhrwmOGoMd3+jNN8nXoPL+0WIqiFUvDlP1w0LR4mnp8k4kZfQh842f/++D7GxhrkF2RASUw0sfTK1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 01 Sep 2021 17:12:34 +0200
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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

--------------mCk2tcYcZn2cIWfsAS98mZia
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/usb-audio-lowlatency
head:   0dbf51c865c64e95c711e4adf89a89140077269e
commit: 0dbf51c865c64e95c711e4adf89a89140077269e [198/198] ALSA: usb-audio: Improved lowlatency playback support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-s032-20210831 (attached as .config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce:
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # apt-get install sparse
         # sparse version: v0.6.3-348-gf0e6938b-dirty
         # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=0dbf51c865c64e95c711e4adf89a89140077269e
         git remote add sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
         git fetch --no-tags sound test/usb-audio-lowlatency
         git checkout 0dbf51c865c64e95c711e4adf89a89140077269e
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash sound/usb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
 >> sound/usb/pcm.c:1322:12: sparse: sparse: context imbalance in 'prepare_playback_urb' - different lock contexts for basic block

vim +/prepare_playback_urb +1322 sound/usb/pcm.c

e0570446773623 Ricard Wanderlof     2015-10-19  1321
0dbf51c865c64e Takashi Iwai         2021-08-30 @1322  static int prepare_playback_urb(struct snd_usb_substream *subs,
edcd3633e72a15 Daniel Mack          2012-04-12  1323  				struct urb *urb)
edcd3633e72a15 Daniel Mack          2012-04-12  1324  {
edcd3633e72a15 Daniel Mack          2012-04-12  1325  	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
245baf983cc395 Daniel Mack          2012-08-30  1326  	struct snd_usb_endpoint *ep = subs->data_endpoint;
edcd3633e72a15 Daniel Mack          2012-04-12  1327  	struct snd_urb_ctx *ctx = urb->context;
0dbf51c865c64e Takashi Iwai         2021-08-30  1328  	unsigned int counts, frames, bytes, transfer_done;
edcd3633e72a15 Daniel Mack          2012-04-12  1329  	int i, stride, period_elapsed = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1330  	unsigned long flags;
edcd3633e72a15 Daniel Mack          2012-04-12  1331
d303c5d38b37ee Takashi Iwai         2021-06-01  1332  	stride = ep->stride;
edcd3633e72a15 Daniel Mack          2012-04-12  1333
edcd3633e72a15 Daniel Mack          2012-04-12  1334  	frames = 0;
e8a8f09cb0b3b8 Takashi Iwai         2021-06-01  1335  	ctx->queued = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1336  	urb->number_of_packets = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1337  	spin_lock_irqsave(&subs->lock, flags);
976b6c064a9574 Alan Stern           2013-09-24  1338  	subs->frame_limit += ep->max_urb_frames;
0dbf51c865c64e Takashi Iwai         2021-08-30  1339  	transfer_done = subs->transfer_done;
edcd3633e72a15 Daniel Mack          2012-04-12  1340  	for (i = 0; i < ctx->packets; i++) {
3d58760f4d0015 Takashi Iwai         2020-11-23  1341  		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
edcd3633e72a15 Daniel Mack          2012-04-12  1342  		/* set up descriptor */
d303c5d38b37ee Takashi Iwai         2021-06-01  1343  		urb->iso_frame_desc[i].offset = frames * stride;
d303c5d38b37ee Takashi Iwai         2021-06-01  1344  		urb->iso_frame_desc[i].length = counts * stride;
edcd3633e72a15 Daniel Mack          2012-04-12  1345  		frames += counts;
edcd3633e72a15 Daniel Mack          2012-04-12  1346  		urb->number_of_packets++;
0dbf51c865c64e Takashi Iwai         2021-08-30  1347  		transfer_done += counts;
0dbf51c865c64e Takashi Iwai         2021-08-30  1348  		if (transfer_done >= runtime->period_size) {
0dbf51c865c64e Takashi Iwai         2021-08-30  1349  			transfer_done -= runtime->period_size;
976b6c064a9574 Alan Stern           2013-09-24  1350  			subs->frame_limit = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1351  			period_elapsed = 1;
edcd3633e72a15 Daniel Mack          2012-04-12  1352  			if (subs->fmt_type == UAC_FORMAT_TYPE_II) {
0dbf51c865c64e Takashi Iwai         2021-08-30  1353  				if (transfer_done > 0) {
edcd3633e72a15 Daniel Mack          2012-04-12  1354  					/* FIXME: fill-max mode is not
edcd3633e72a15 Daniel Mack          2012-04-12  1355  					 * supported yet */
0dbf51c865c64e Takashi Iwai         2021-08-30  1356  					frames -= transfer_done;
0dbf51c865c64e Takashi Iwai         2021-08-30  1357  					counts -= transfer_done;
edcd3633e72a15 Daniel Mack          2012-04-12  1358  					urb->iso_frame_desc[i].length =
d303c5d38b37ee Takashi Iwai         2021-06-01  1359  						counts * stride;
0dbf51c865c64e Takashi Iwai         2021-08-30  1360  					transfer_done = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1361  				}
edcd3633e72a15 Daniel Mack          2012-04-12  1362  				i++;
edcd3633e72a15 Daniel Mack          2012-04-12  1363  				if (i < ctx->packets) {
edcd3633e72a15 Daniel Mack          2012-04-12  1364  					/* add a transfer delimiter */
edcd3633e72a15 Daniel Mack          2012-04-12  1365  					urb->iso_frame_desc[i].offset =
d303c5d38b37ee Takashi Iwai         2021-06-01  1366  						frames * stride;
edcd3633e72a15 Daniel Mack          2012-04-12  1367  					urb->iso_frame_desc[i].length = 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1368  					urb->number_of_packets++;
edcd3633e72a15 Daniel Mack          2012-04-12  1369  				}
edcd3633e72a15 Daniel Mack          2012-04-12  1370  				break;
edcd3633e72a15 Daniel Mack          2012-04-12  1371  			}
edcd3633e72a15 Daniel Mack          2012-04-12  1372  		}
976b6c064a9574 Alan Stern           2013-09-24  1373  		/* finish at the period boundary or after enough frames */
0dbf51c865c64e Takashi Iwai         2021-08-30  1374  		if ((period_elapsed || transfer_done >= subs->frame_limit) &&
976b6c064a9574 Alan Stern           2013-09-24  1375  		    !snd_usb_endpoint_implicit_feedback_sink(ep))
edcd3633e72a15 Daniel Mack          2012-04-12  1376  			break;
edcd3633e72a15 Daniel Mack          2012-04-12  1377  	}
d24f5061ee7b9b Daniel Mack          2013-04-17  1378
0dbf51c865c64e Takashi Iwai         2021-08-30  1379  	/* check the appl_ptr in low latency mode */
0dbf51c865c64e Takashi Iwai         2021-08-30  1380  	if (!subs->early_playback_start &&
0dbf51c865c64e Takashi Iwai         2021-08-30  1381  	    frames > snd_pcm_playback_hw_avail(runtime))
0dbf51c865c64e Takashi Iwai         2021-08-30 @1382  		return -EAGAIN;
0dbf51c865c64e Takashi Iwai         2021-08-30  1383
0dbf51c865c64e Takashi Iwai         2021-08-30  1384  	bytes = frames * stride;
0dbf51c865c64e Takashi Iwai         2021-08-30  1385  	subs->transfer_done = transfer_done;
6aa719d15a1903 Takashi Iwai         2020-11-23  1386  	if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
d24f5061ee7b9b Daniel Mack          2013-04-17  1387  		     subs->cur_audiofmt->dsd_dop)) {
d24f5061ee7b9b Daniel Mack          2013-04-17  1388  		fill_playback_urb_dsd_dop(subs, urb, bytes);
6aa719d15a1903 Takashi Iwai         2020-11-23  1389  	} else if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U8 &&
44dcbbb1cd6156 Daniel Mack          2013-04-17  1390  			   subs->cur_audiofmt->dsd_bitrev)) {
4f083917994fdd Takashi Iwai         2021-06-01  1391  		fill_playback_urb_dsd_bitrev(subs, urb, bytes);
d24f5061ee7b9b Daniel Mack          2013-04-17  1392  	} else {
d24f5061ee7b9b Daniel Mack          2013-04-17  1393  		/* usual PCM */
e0570446773623 Ricard Wanderlof     2015-10-19  1394  		if (!subs->tx_length_quirk)
b97a936910c8d6 Ricard Wanderlof     2015-10-19  1395  			copy_to_urb(subs, urb, 0, stride, bytes);
e0570446773623 Ricard Wanderlof     2015-10-19  1396  		else
e0570446773623 Ricard Wanderlof     2015-10-19  1397  			bytes = copy_to_urb_quirk(subs, urb, stride, bytes);
e0570446773623 Ricard Wanderlof     2015-10-19  1398  			/* bytes is now amount of outgoing data */
d24f5061ee7b9b Daniel Mack          2013-04-17  1399  	}
d24f5061ee7b9b Daniel Mack          2013-04-17  1400
fbcfbf5f673847 Daniel Mack          2012-08-30  1401  	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
fbcfbf5f673847 Daniel Mack          2012-08-30  1402
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1403  	if (subs->trigger_tstamp_pending_update) {
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1404  		/* this is the first actual URB submitted,
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1405  		 * update trigger timestamp to reflect actual start time
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1406  		 */
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1407  		snd_pcm_gettime(runtime, &runtime->trigger_tstamp);
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1408  		subs->trigger_tstamp_pending_update = false;
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1409  	}
ea33d359c4421f Pierre-Louis Bossart 2015-02-06  1410
4267c5a8f3133d Takashi Iwai         2021-08-27  1411  	if (period_elapsed && !subs->running && !subs->early_playback_start) {
307cc9baac5c07 Takashi Iwai         2021-07-07  1412  		subs->period_elapsed_pending = 1;
307cc9baac5c07 Takashi Iwai         2021-07-07  1413  		period_elapsed = 0;
307cc9baac5c07 Takashi Iwai         2021-07-07  1414  	}
edcd3633e72a15 Daniel Mack          2012-04-12  1415  	spin_unlock_irqrestore(&subs->lock, flags);
edcd3633e72a15 Daniel Mack          2012-04-12  1416  	urb->transfer_buffer_length = bytes;
edcd3633e72a15 Daniel Mack          2012-04-12  1417  	if (period_elapsed)
edcd3633e72a15 Daniel Mack          2012-04-12  1418  		snd_pcm_period_elapsed(subs->pcm_substream);
0dbf51c865c64e Takashi Iwai         2021-08-30  1419  	return 0;
edcd3633e72a15 Daniel Mack          2012-04-12  1420  }
edcd3633e72a15 Daniel Mack          2012-04-12  1421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------mCk2tcYcZn2cIWfsAS98mZia
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
sM1w3bK9Vw5TkKih8hPrbHD8D1WmDuHQrAEA

--------------mCk2tcYcZn2cIWfsAS98mZia--
