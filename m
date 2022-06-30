Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC8565363
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13394174E;
	Mon,  4 Jul 2022 13:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13394174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934112;
	bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlFh8H2/2EvnTilMbDnpwuQVK5RUApf8BioLQJU1GgCLtyNGOeqZGbRFxOevymA+B
	 SuR1LBinLkmhbsliJw5QTQuNcxxzHb+HCgVoMHVl3ajebSP+2/r0Rc3l3dMempVXly
	 cUuN2rSFpkyUov7buPOnKjqERJBIOyAPiGCDPMG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72316F805B6;
	Mon,  4 Jul 2022 13:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6163F8014E; Fri,  1 Jul 2022 01:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 330FEF8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 01:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 330FEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="mbO3/3pd"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="SQvm1qAC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656630785; x=1688166785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
 b=mbO3/3pdW1gqKOlPGkabfFad5b/PFMb2FUvDIJF/+Jn6r/2LUBW6notG
 1HkVUHbn0c97HFBwN426TrJn/amx+xajGhMp7l2Jq5thYJ9Vy3QUi+1KE
 Mp2eEkSqxBCavWcL6ZFr3QgJDuFKnZrhP7rN6GwvyeMYJjICELvVXFUDP
 5GwuhArmmwbOzs6Xp435f1vwuP1Eh5K287OpPe2QrsbDgdN6pk0NYWtq5
 WJ9qJ/8OyU8PvI345Cu6BQ/D0eTUI1at9qwGx+7W8ivnFsv6uxSH63+hG
 hhbgkH0twSwOVr9a5nGUZ1EQRc9dS1X79MqKYHhvkv+1yZCAelEdAOG+c A==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="170603292"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 16:12:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 16:12:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 16:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4PNscrJ1kBcLcO459+mr2c9PEBuJ9tjeyAy43B9xENn3smNnQT3zcwUCCoXVMuM1WlLmPAOJKmrQVPGqqpXjZZ50NfjIkIhm8eqpnF1Modh4O/4RY7LaleYOvaS/OP2I9K1ul6NxSPN0Ratc5VNQNHoRzqEk5QW+KKG88LmSSjibo8qnwRpvOOGG7sfnaLVhvosMJEC0VyFjIktt0ZBye6ApYyT4BJT502ud2FYYz8zm+dBBgX0cDfzk+Mak+mcaCE3wqUWG+/82xOidQccc6FBUb2huSRS+OVbppHQM+94d1ipdJ7LkdNkOxYGdacdZ35z/eZ+p4kaWoqqBDAeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
 b=NiYO/5eEO05UsXHofS5GUf9iecz7X5tCOUC4MdBxgD07g7WcyjLReJJA68B3kQJ/XdQmRjG3Csx1YmW6dxRc+vWbzm4HZ/FpDBlNWEq7+lpoRCoDcx8JF0FHv3N6M0/ogysaB4VidlIQptCSdY2G11h07Nm3lJpriWEyAKrpnn5n9ysKfySlb83vRBuseq2sPLVyGZHyDqddQGYkicXaS+Ac+DsaNF/XMWcFYyRIAuyP6bnl9nFYLxUg6uAZFpa6r/uNgRRrFaW/H2Bnbo9VOjWlxTk8qpzvby5TJneDyrGsEZ2qKdl0OuGI6pZD+0JAjvRdvTr2wF215pJApUW6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GheaHPNZSiD9lZ/VwxmLWqqq6RkC64WmSURgQ2qgFno=;
 b=SQvm1qAC/80+ahrrjlAPAibTLyH5nwMUUrRdPf+Gd2YugdLYXKS9FAanQhwMP/h7yyUReF8fCzHDCk8ChkGucV+cxOdyrm3uOboIIJlIgGPFIlyiP0qctE0ISOH21Sutkbm8e2xNX5+q+7MNAALeiuAVQto52xG773LzMxSY5Cg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 23:12:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 23:12:54 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the number
 of interrupts
Thread-Topic: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Thread-Index: AQHYi+h3OU8MpvXbs0e9Pief7bAu5a1ogHUAgAAVk4A=
Date: Thu, 30 Jun 2022 23:12:53 +0000
Message-ID: <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
 <20220630215540.cifnzovya57bgbsw@mobilestation>
In-Reply-To: <20220630215540.cifnzovya57bgbsw@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a77bd506-d1b2-41ac-950a-08da5aee0fcb
x-ms-traffictypediagnostic: CY5PR11MB6164:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /rAiy++3e8odaq9I1HByAYf5F2qPBXFTNehJOlUEHF2fUJ0AvsXshTCmJSQo/KzqbGenTP4jbsxO6x3aTsYKSm94i/7TjqzK8yV6LYF3fFLEXPxx7YpapxUWILf4ceiMxiSd7UCGI1v6GZwb/87f79/crMM31JjYNpKrO2L1vmiZlx4uU66zfY3E+0hpQQO7WwmMIyM8Z1zNlsdKj1QH3Y+/iOpQMtysnhscA3Fgulhsf91cFQoxbLURredM9eAY+ApcHySQD/QMOkTyIzJ33oczc81zr/AGpDQ2vUfUCHKEhgmguzgf1b1pXKgy5m1C6zSKQqcFsuQESSbtK0eKPxRcGAn0WPb9fSKP+blTaME8ImdRyRfiXyNExg2FsIS6oKS+ZzoaKjjFkuLWZDoEjUYUMgoRmKKSU2i0SXVMni8aD6sfOAiE520Jon4GZnFdeEWlq+iQY/IlPV/j8qemiSywReavqeyNTiI7YLOsgw7KCfmcfN5ktvj4nQoAq18u6kSALVP1T2lPloxKzqsTc3eEHNAFAT6cHckQLunlfiEMCwPah0JqoPqxZZs7d0TRrItXuJn8MbIX/y5SebLtuLrhC4JHQ2OSOwD43Q903HJmH/ENLvMPe/Xo4Et57XaU5eeHNN5vBJoG+ume3aJBYsyDGn0glA7SUrSQ+e1YHzIyHCIa+rljUGJBr91WRnH3lO83g7ea2L+pGy/o+xvf/uF5QWgiL9WCSD3Mw3F6GOTeRN44bBmL1IJ2M1UC5tWy2f8AXMsaka9YufKMjKXKlJw9lmZLDW97TUtLkmAg9c0JdmgukZJg2gaReextXPX76ctbc2KVVT/GWVYZS/9P+O1jouPWBlnLeZ/gSAyg2iMKNBsjAu4dKiE1eEWbp14Yxjo60g4iL7SJtCbPnLo8HlSHHxriK2RMpc0H4gmiiTy0Onl8hDoGqxhm+IeSRQ7i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(2906002)(6486002)(966005)(478600001)(6512007)(110136005)(8676002)(4326008)(71200400001)(316002)(26005)(2616005)(31686004)(53546011)(86362001)(36756003)(8936002)(31696002)(76116006)(66476007)(7406005)(66446008)(66556008)(66946007)(7416002)(91956017)(38100700002)(83380400001)(5660300002)(64756008)(54906003)(122000001)(6506007)(38070700005)(186003)(41300700001)(15398625002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1lROWpoanZSejBxUElIOUJVMnhMVjBlL2lGVjk3c2o1RnNmd3BtR0Z0aHpQ?=
 =?utf-8?B?aG5CY3QrU3hXckp0V0EzV2NvRy94M2JqOWRVNUM5ZS83aUF5bzNGQ2p0S21L?=
 =?utf-8?B?cmJna2x1bTE2RVk2UDBCK2dqamMrSmhrbDVhNmg3ZGdoUUtNa0JTT2taZkFi?=
 =?utf-8?B?bFZIWGxJeGttSTZDZlZBQmljQkF3UWtTQklDM2FuVTByaHVjQVBCZ0FZTVlG?=
 =?utf-8?B?dzRKMURZSWczUUFMRlJ0MlVCKzN6REczT2haOHdRYytCKzhXNUdkWWNYaFJ3?=
 =?utf-8?B?dFo2RmszRlV0VUpGQnI2MGJHME0zUW1NeVNlTmoycEdWYzF2NDN0am1kQjFX?=
 =?utf-8?B?VElYdUtCYTExbkVBdzA2MlZrTklrSHFjOUZpcmVoTmwvZnREODQ0QjZ5WEJQ?=
 =?utf-8?B?R1pyUDRPM0dueGJranB1bnpiM1BpTXRrSyt2cVV4VmkybWNVRmZDZ0I2Um92?=
 =?utf-8?B?YS80NjE0NVJoanJoS2l2VUJqcnhYRWRBZldybHlZQXp3M1VRTjRSNWZaYng3?=
 =?utf-8?B?ZEF2azVSV0c5VU5QZFNMVnlKOXJHV1NEcE5SSzM2S1FOdzRWRkEzWkFXVHpD?=
 =?utf-8?B?UForNXE0SVBWZllNRDd0aUQ2UmhmYWRyV1hyUnVSdjB2aUtKdzJpcTBQamNy?=
 =?utf-8?B?UThRcFdRYjE5NENvMG5IVVFEQm1Hb3dBalRiTC9VK09TTlRWT3ZxQ2svRVAx?=
 =?utf-8?B?Q3RLTG1KZnQ1SGIrTzJ1OHBPbGtRSFZOMGRWdHFCQ0tqSnVvb1dMeFpYOWhP?=
 =?utf-8?B?ZG9BZXorY1ZBRmdHNnBtVVVkSHFrelp5S0VOWmVOeWVQb2NnMFRnU1FkZE9W?=
 =?utf-8?B?QXUyaXFjVUdKbEVNNEUxTE8vT0pMUHhhSjFSOW1kZWFGTDc4NHdMZHJYeGI3?=
 =?utf-8?B?Z3VhNTBOMnlxdDNWb3htU3dPckFJZjZ5K21uSnhuNTk2MXBIQmxrZjY5TWdp?=
 =?utf-8?B?QzVPUEx5aXRGZy9hK0k1SDgwRjJCRGZjQUsxS1l5R0lCenhlUWZlcVJDMWdG?=
 =?utf-8?B?UHFwY3RNazdEWktQRHYwUlVvOFFTZXdyTXlQakFBclRTUFBsLzhUaFpkV2Vh?=
 =?utf-8?B?a3kvTkpRMUZseTljMWVGeUVpVjBka1dqZHZLeW1EWk1aeWdtQkNOcEpSd0pk?=
 =?utf-8?B?Ykk5Nk1ERGxsUVlFUVJKWENQb3RwUkZzK01yb0FWbkY1Zm1Ja1RqRmFnWXl4?=
 =?utf-8?B?d0xsVG1ab2JZVERWeGY0NTAwY1ZOUHVPSHVNTHJDN010bzNKbVYyYmo2TFRt?=
 =?utf-8?B?NEE3c29NMVE0dGVCYTVQRmMzekhFZW10ejVSUm1id3g4NDRoTnpWOVZFS0Y0?=
 =?utf-8?B?RXl4KytvTnpPQU8xUExYQjIxSjNseHZJb2ZkVm00SUt1dWl6elFjOEIyRmZH?=
 =?utf-8?B?RCtGL3o5WS80VVlnZnVaak10b1ZSMUJiR1B3UXBwdmdkTEdOTGJKSkRHY1RG?=
 =?utf-8?B?VSs4YlNFTVdrMmh6L1RHTXVUNnNxNlh3S0FwSGdkVjNZYW9aVWR4clUxNGJW?=
 =?utf-8?B?ZUZTclViTnptNVkvS21GZkZ0SEhSaVFWcjJDa2pBMUtVWW0rQXpyM3N5OVBk?=
 =?utf-8?B?M2xsc0tFUmdOYzNVUU9UQzFhL0tFM2pKNWZVS1lzV2lHdjNocE1waWNmRVBH?=
 =?utf-8?B?eGV5VlIyVWJZMkc4TlhZTG50VXUrcnVmWkhBeTg0VEp0dko4cElHR3ZMWm0y?=
 =?utf-8?B?WTU1ZUFXYjJEWVhmNWl3MU1kaXI0U2RBTGpNSW95cnNJMjNROElDQTVpOTR6?=
 =?utf-8?B?M1E4d2dUb0VZTkxCRGxoWCtOR28vOGczcEpVUDZiZjNtcU40YWprb2lqc3c0?=
 =?utf-8?B?Tk5uczJhQllLZEliZkxJbm4xZW5sb3BwejBZYlpmZmZEbzBWVEVBWmJ0UGJH?=
 =?utf-8?B?VW13eHNWcFhUY0xoSWU5OXVVSlA5R2FvZ1REeTdvcDdzY0Q0UytWdTN0WStQ?=
 =?utf-8?B?NFFGblQ0UFY4eUQrc0ZaejZLcWFrdWlmZUU0Qzc4QWVZUmJXZjJtcXZiTEJ2?=
 =?utf-8?B?WTJEZGY3bXhwYzdTaXdHdmc0eVN0UUJJSlRrdDJKbTgrYzE1TEhmNCtoRm1x?=
 =?utf-8?B?amViUWRHYnA4SUtIbEJ1WnZiY1RZbktSQXprTk5OdU5wK2FvUlhmc0dEQ1FG?=
 =?utf-8?B?SS9BODYrQXozRzkyMW9xS2c2enl5cVlMdDRpR0ZpYUN3ZlV1R0NoQ0hWSjlV?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAED936A9527EA448A01955AF45E8C93@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77bd506-d1b2-41ac-950a-08da5aee0fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 23:12:53.9750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6ilMbXizmR5OnlPzgSBjCGvTdS4zIGh+DK3AH6OJBTyQf0tA1Vo0rstbCOoENSk1OLfQs0u/UnPfcpPYyDxD6jflbTV9S5E7bOgtLDKPsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, linux-spi@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

T24gMzAvMDYvMjAyMiAyMjo1NSwgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDc6NDM6
MzRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBUaGUgQ2FuYWFuIGsyMTAgYXBwYXJl
bnRseSBoYXMgYSBTeXNub3BzeXMgRGVzaWdud2FyZSBBWEkgRE1BDQo+PiBjb250cm9sbGVyLCBi
dXQgYWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uICYgZGV2aWNldHJlZSBpdCBoYXMgNg0K
Pj4gaW50ZXJydXB0cyByYXRoZXIgdGhhbiB0aGUgc3RhbmRhcmQgb25lLiBTdXBwb3J0IHRoZSA2
IGludGVycnVwdA0KPj4gY29uZmlndXJhdGlvbiBieSB1bmNvbmRpdGlvbmFsbHkgZXh0ZW5kaW5n
IHRoZSBiaW5kaW5nIHRvIGEgbWF4aW11bSBvZg0KPj4gOCBwZXItY2hhbm5lbCBpbnRlcnJ1cHRz
IHRoZXJlYnkgbWF0Y2hpbmcgdGhlIG51bWJlciBvZiBwb3NzaWJsZQ0KPj4gY2hhbm5lbHMuDQo+
Pg0KPj4gTGluazogaHR0cHM6Ly9jYW5hYW4tY3JlYXRpdmUuY29tL3dwLWNvbnRlbnQvdXBsb2Fk
cy8yMDIwLzAzL2tlbmRyeXRlX3N0YW5kYWxvbmVfcHJvZ3JhbW1pbmdfZ3VpZGVfMjAxOTAzMTEx
NDQxNThfZW4ucGRmICNQYWdlIDUxDQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2RtYS9zbnBzLGR3LWF4aS1kbWFjLnlhbWwgfCA0ICsrKy0NCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1h
eGktZG1hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9zbnBz
LGR3LWF4aS1kbWFjLnlhbWwNCj4+IGluZGV4IDQzMjRhOTRiMjZiMi4uZTMzZWYyMmFlYzljIDEw
MDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9zbnBz
LGR3LWF4aS1kbWFjLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kbWEvc25wcyxkdy1heGktZG1hYy55YW1sDQo+PiBAQCAtMzQsNyArMzQsOSBAQCBwcm9w
ZXJ0aWVzOg0KPj4gICAgICAgIC0gY29uc3Q6IGF4aWRtYV9hcGJfcmVncw0KPj4NCj4+ICAgIGlu
dGVycnVwdHM6DQo+IA0KPj4gLSAgICBtYXhJdGVtczogMQ0KPj4gKyAgICBkZXNjcmlwdGlvbjog
cGVyIGNoYW5uZWwgaW50ZXJydXB0cw0KPiANCj4gRGVzY3JpcHRpb24gaXMgaW5hY2N1cmF0ZS4g
SXQncyBlaXRoZXIgY29tYmluZWQgb3IgcGVyLWNoYW5uZWwgSVJRcy4NCg0KSSB3aWxsIGNoYW5n
ZSBpdCB0bzoNCiAgaW50ZXJydXB0czoNCiAgICBkZXNjcmlwdGlvbjogfA0KICAgICAgSWYgdGhl
IElQLWNvcmUgc3ludGhlc2lzIHBhcmFtZXRlciBETUFYX0lOVFJfSU9fVFlQRSBpcyBzZXQgdG8g
MSwgdGhpcw0KICAgICAgd2lsbCBiZSBwZXItY2hhbm5lbCBpbnRlcnJ1cHRzLiBPdGhlcndpc2Us
IHRoaXMgaXMgYSBzaW5nbGUgY29tYmluZWQgSVJRDQogICAgICBmb3IgYWxsIGNoYW5uZWxzLg0K
ICAgIG1pbkl0ZW1zOiAxDQogICAgbWF4SXRlbXM6IDgNCg0KSG93J3MgdGhhdCBzb3VuZD8NCg0K
DQo+IA0KPiBPdGhlciB0aGFuIHRoYXQ6DQo+IFJldmlld2VkLWJ5OiBTZXJnZSBTZW1pbiA8ZmFu
Y2VyLmxhbmNlckBnbWFpbC5jb20+DQo+IA0KPiAtU2VyZ2V5DQo+IA0KPj4gKyAgICBtaW5JdGVt
czogMQ0KPj4gKyAgICBtYXhJdGVtczogOA0KPj4NCj4+ICAgIGNsb2NrczoNCj4+ICAgICAgaXRl
bXM6DQo+PiAtLQ0KPj4gMi4zNi4xDQo+Pg0KDQo=
