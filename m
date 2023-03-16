Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A406BCDB8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:14:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCAF11133;
	Thu, 16 Mar 2023 12:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCAF11133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965242;
	bh=jVz029EkzuT8P4bOIzDcxYL8+ysxoAHFmLrr6qA+C7k=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=QHYyd77FrBBwkDNOxFZF0SWDgcHGLGmE3gqBvRmCtX8feAU90ReeU/MOi2V7puqVB
	 VfztiW2zvs/iZy1mikfGWTv4jiLJeQG//X2WPnZjypoqIDeVYb/MPSYW/p22Y+tUWW
	 PCj3fJABI0R5Plq6sbTTsodMaVWNC5Rfs2VlnXTY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAA4F8053B;
	Thu, 16 Mar 2023 12:12:12 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <perex@perex.cz>, <tiwai@suse.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 004/173] ALSA: atmel: ac97: Convert to platform remove
 callback returning void
Date: Thu, 16 Mar 2023 11:11:56 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-5-u.kleine-koenig@pengutronix.de>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7XHVE4U35ZVC45V476ZPYI67QBIHDO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167896513229.26.590476938772223410@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C016BF80542; Thu, 16 Mar 2023 12:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1FAEF80534
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FAEF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=P7W12bBY;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=hKvQFGCp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965127; x=1710501127;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oXT4MotRxL6tRt+7/EJ0gVFHZd9PtiK9a7kllQ4wCug=;
  b=P7W12bBYwhyXxvjMAd0TZdF/7cf/vUk9NgOOJo3NdnEmscw64gSWKjm4
   TnmcEJ2Ie/69WOr+SR4+6yKZXycjQTE9MSd0MoaIT329QwlF3TbGbZfol
   P5h9qkBIJFe9k5AQXlJXtLGqvcsMHxwR7ajtSudNyOP28D4PL4DeOhvlP
   V8vhl1pO91o++aH9z7Nb5N0xJqvDLjBeedbm3Y3xre056jZZlTzJnYlzU
   bRDMcgepvK8wlhusGrSvn5aMp2y1xAVy9TASJQ41mvOFvJGz+jA40P7C0
   J+EYUv0T49V5ocSJzgC1BhVv3Bt4WXAhPlhwdNSPiUPkt3CHMTm+5BAfK
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="205722053"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:12:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:11:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYZACjgWo4QsJPlrSI6G2AKZDdAVllOwK25weS36OLIn4uFYfl65h3yFTL8fm7kgBBxPdFIDi7aRGKy3kMnRIt/BoBCI+pUiBTPd0kS6dhhTpgC0NzGmPPpJvRDbtUJatNHTbH7C6jGx2/qjJh+kE9IxMi1vi7jFghheSOCaU4ebHK2LcSxU9Vz5KAUBBGLlriheezMRcOZWfVDLTbVs2mnQyxHPAQd75y23nYxhWF3VGIFdbdx/a/Eykz/ww8CAzdKlUvcPE7vp8JPkUxOswA5QxBnE7iXNzq9r8e2U2jk47sglFq8ADroZPmCXQK6bYOfR0RIE7YfCEGPmhyLEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXT4MotRxL6tRt+7/EJ0gVFHZd9PtiK9a7kllQ4wCug=;
 b=Y7rfjQ5Mfw/OISYf/+HX/ZKLvgcSTXDlnNHBeb+1ejJbtJxTyFlfmSgvsGBWXXYrFnDBNCWAYtirRjAOlWOBgLHN0Ab3iHMn+aTsmvgg4OecLlnq6yHBx2cg+JpbuEgaw/J1x/cKaiTGefal6pkZmiPPbVctFbiudoFaMfc3Pn4+xmuF6+IGJIGp3RzixeEG0JcJsBmXJ1KLRcTjsOn21kRLbHqS6Jzw/TxYT1WlwVzY4q1+Vd3RtyDVjIzt1ANJ/z3bn148aw+Ybn9SQERhgaFN90gHAoOVpwtOxRWkpBRrC+VSGrJaS3R7Z+VLRGh3whFQbj+wr1FA7vcn+2PYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXT4MotRxL6tRt+7/EJ0gVFHZd9PtiK9a7kllQ4wCug=;
 b=hKvQFGCp1L+E6ym6DLSBuhzfmvITCcCej7N2I3bnp1D0UQ98YToLfcAxCjVnzL9bTTeleXsDxCXai33mr68fqBlXPqRjgun26/M/IiSMAP/BCDDrhrllfqJU5ab59GyPCRtYcU5Hdwo4MdPSzk7jNHvFJ/us0jLl5VqJHrQ4BIM=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 11:11:57 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:11:56 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <perex@perex.cz>, <tiwai@suse.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 004/173] ALSA: atmel: ac97: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 004/173] ALSA: atmel: ac97: Convert to platform remove
 callback returning void
Thread-Index: AQHZV/geSE72sWbkE0auH4qhcWvIaA==
Date: Thu, 16 Mar 2023 11:11:56 +0000
Message-ID: <6c15a90f-ddb3-cf03-5239-0675b469a4a1@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-5-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: 9ddceeac-688d-4f14-2b68-08db260f4170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z6Ys2eK/+p/+JslP/wrXQF2Uhw5G3rxufBXVBTwWyJMGG5ngkE1mKU5pdvshaGif0+txeOJ+RXG7HInzowtTWex1Q6BHaj+3YkOY/E0kU+cdnDhb3jeEf7n//jaBITP0vAzzGi+sZH2jMoFOQy8rwvBJ5+8mdnZvF4XCRfmiW79ESrGSYvuln6/1DcpBgjhgTObOlH2KMrqHFZOKIojVjBl5ZAXfcX0gHin7pEMNeIghRZXqC5cfLj1cdz/wRBOUSFzHzLDZ6d0TzUSePMtOCrci3mL0eJUzpYT6Zg0PN2XQQ3DTlYGl6YQpiZ6Xo5ZJGM2wdZCSijz8R4T+8sSZli9UEuEUE5k6whmDjkIeUqxGaHvcUm84SF4aWi0pOo61QE7mBOMcPiXccZOl68RLXuqeMAGpYuaQfkGymYLxAQ4jOaR1LG3oPtrW0YUpKhlpf6yor7UR3Y7YR9bOKuCgv3SPDvBR/9LNuOg/pLlhHUVGUqr3gytBvuSPFVutHaP5XC8U4IZkNYoEEn2BSFCA0GZlL5P6lzQ1CisBWL+4BLzUaocjI3iESBr4Ku80pMn8ILszpqmDfYRoegYP+H/MXirhfPCDh7p68MtSA07MfzEkGWBLAlH5DNwpnhPBNUHLgVJZiJmbLjGBykIO3+czUFjHLS78iRTf9xAm9ymQJf1nuqgmzLlpxE+PWeSYs5gaGdyuOQm7FiWjg+zBNdylRNDPOlk+92xy8x+RjXhpYUvn/7pXb+g1NozESRUuRlB2Zow0Y+CzivuOKsnt+CG4vw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199018)(31686004)(86362001)(31696002)(38100700002)(83380400001)(122000001)(38070700005)(66574015)(2616005)(53546011)(6512007)(6506007)(186003)(71200400001)(6486002)(110136005)(478600001)(26005)(66556008)(66946007)(66476007)(4326008)(5660300002)(76116006)(41300700001)(91956017)(316002)(66446008)(64756008)(8676002)(2906002)(36756003)(8936002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OSt2cjdOM2lsTkpsNkhhVVhSaVZPc21GbHhXNVVOUVVuYmhDV01uU2p6azJh?=
 =?utf-8?B?ckJibXM0UThHT25EY0ZGd1d1V0tSYzlubXExbElPNmlDQ0VQSkJIRkdJeXRo?=
 =?utf-8?B?M0xPQm51MWFPYjhuSkxKZGxhMitFb0k0Z3d2azVtd1NkaTBjK0tCUDF5T2pB?=
 =?utf-8?B?bEhVbVBqaHVSSFhIUGpKbStCRkpVSzB0T29tYU9aNlBWVmZUR0M4N1VXb3lz?=
 =?utf-8?B?bGxmNUdJQXBSejF0NE5ZUFV5RG5NRkFwVXFjSmF4KzJ0TmtBMCtCL2J0UXA0?=
 =?utf-8?B?dXh1bnhQTFE5clZWenVndS9BQjVPYnRvZVZXNEs0ZEFTeWcyYUxpTEcyRUlK?=
 =?utf-8?B?TlB1SWNmR2YzN3NLUXZVNWRJSE9hT0Z0aWk4RGxVVkdVZ3ZheXNjUWVnRHZj?=
 =?utf-8?B?SmxtZFlVMUo1ODdPVkhoRFdKZWZBSjhMT3gzaWVZUEUxRDNwRENZcUp1YStK?=
 =?utf-8?B?Tk1iT1I4NWo0OUlVQ2RUVXVYU0piUjJ1WnhnM1dkMXZVeEMwZ2UxcVlCN2c1?=
 =?utf-8?B?R2kzKysrOThaZTI3ZkNOQk1ldUd2TmJBRU55a0QxM2tVbDcrcnA1ZGZPY2R4?=
 =?utf-8?B?WWFzSUtDUEdZREM1ejFQYzNnNjA2dXBTYnVjWUQvallNYVdCajQ1RW5uMFFh?=
 =?utf-8?B?R2pwOWVITEo0NTNWRDM0S2x4ajY0VXZJSlNtK2hSdUd2SWhad0E2eEVTUGhD?=
 =?utf-8?B?TVBlUWI2TFE5RXlCcGQ2akFLbnU0Ukt0SnA2YWQvV2lEdWV6cXBVcXRGZ1FO?=
 =?utf-8?B?dmVPeFYrV1hpakhyRmpvMUc2RzZxZDBkc3pneUFzQ3ZiVlVlQTlsZjgwU1RX?=
 =?utf-8?B?MHJMeEtEbkJneCtxQmNwaGdRQjJ4ZnFXajFvLy9rRXJBZis4Uk94cGZVRVYr?=
 =?utf-8?B?VGUvQ3k5T1dianErWGZ0WW1oWHZXMzR2L2cxWU1DSm1PQy94c2VVVG9KaFNi?=
 =?utf-8?B?ZkkvN3VwWkZIRWt6bGtjQkZWekNGdEFpVEVrUVozL1JSOENFU2lHK0RHS0hs?=
 =?utf-8?B?VkJYNHJtSHBkR3pPRGdZcnJPZGRqMlROeDJzTUl0TnVnNXdORjZJTG1lQ0FU?=
 =?utf-8?B?VDZIRWNjdnRsNTRsSHhBZXNSVnkvaDJnTFVDVkdmVU5LVFNDSFBEOHhRd3NN?=
 =?utf-8?B?d2hWWFowVHl3Y3lWQW9kMEdtK293YzFuQmpZQ0hldTRVT2dPYWg3ZGFWcWRk?=
 =?utf-8?B?STVEQUE1c3lCNTM4MmpEQjBTSVFjdUZOTUVaV29kVkNKNzZ1TDNndkcwU2Ix?=
 =?utf-8?B?VzR6d0o2UHFFKy9hSWpRdEF4MHNPMUdDOHEwZEVMVCtYSkdqM3hSbUp6QlZ2?=
 =?utf-8?B?aU9xQ2t4Zk5KNEcydFh6b0xCcjVzS1RiQ2Nqck8wVmIwK21TaGM0NlNibnY3?=
 =?utf-8?B?bnMvcU53eUQ3WE12Z0YrT3psUkNCSExibmJtWnQxd2grdWg4OHdGdUNkb1hp?=
 =?utf-8?B?WGtML0JvdUFsWTNOZ3JCRUNjbHVqcjNFcnBRQXZBQUl4Tys3Y0t5WmVFYnZp?=
 =?utf-8?B?US9ZaWNvRlhmcXZtZEM1TTN2VW9vME16L1lZVUZTSW9sb2liUjJpVzA3NzNX?=
 =?utf-8?B?b3h3Q09LZmJCVHdJK0UySVdna3NwRGJzUVR4cFFaU3kraDF6b0EyaElXd2ti?=
 =?utf-8?B?U25yQTc2ajlhTU9LOVpvMG52NzBOcnpSSnJaSXFZOU5JdTRWdU9XQk9Sa2NG?=
 =?utf-8?B?RWx1Nk03bCtvUS9ZVy9tZklpSThZeXNzWGtXWncrUzI3OGFHa3o2dzlnT1cv?=
 =?utf-8?B?NXVnUW5kTUcrZzNmcFYydHZUUW1qbkxEMkUxQWt5dWFtcEpoZysvSklRVnRu?=
 =?utf-8?B?eGQrVTZ0TE5HRFAwRk5nYWhDaXFacHlqL1ZWVVk2NUpPUmxNZGNScUdXVmRW?=
 =?utf-8?B?enY5UlNBdWU0aHp2SkFPcEdPcGxqVGFzZEFURjYzTGlueTZnN0RMbkk4d0V3?=
 =?utf-8?B?dFJwNGlkNHRTeVk1TEU5VHplNmxQUjNsRzY2YTlyUUZUSHpSbGNOWFY4LzRk?=
 =?utf-8?B?U3lQaUNtWkYrOXluNGo0SEo5VU9hNHRRUkRUVnlSUmx5cmhKdzlrSllxNFQ3?=
 =?utf-8?B?MUF1aHZQcGRMWTBDTUpQbnlDKzdObE01QVJyQTZyb1VFdWhKN25jeVM5S09U?=
 =?utf-8?B?Qk4veU4rOGxaVit2N0t4QTJHcWFVQXlXNzZRK2lKUnhtcCtmL0ZOTTRZWnYr?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE779E969D964940B8CAEA92100DB0CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ddceeac-688d-4f14-2b68-08db260f4170
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:11:56.7136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zBUKwVlWM/rPXyvzQ67zITyfgRszcr7B+6B2W6NmgcylbRLUK+OHDZPffD05jaEt6MvhaXcR0ovLrNeydK7XI4wgRARPfV5/gxuDb0SU4Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
Message-ID-Hash: Q7XHVE4U35ZVC45V476ZPYI67QBIHDO5
X-Message-ID-Hash: Q7XHVE4U35ZVC45V476ZPYI67QBIHDO5
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7XHVE4U35ZVC45V476ZPYI67QBIHDO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMTUuMDMuMjAyMyAxNzowNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvYXRtZWwvYWM5N2MuYyB8IDYgKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3NvdW5kL2F0bWVsL2FjOTdjLmMgYi9zb3VuZC9hdG1lbC9hYzk3Yy5jDQo+IGlu
ZGV4IDY2ZWNiZDRkMDM0ZS4uYzg5MTJiOGExZGM1IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9hdG1l
bC9hYzk3Yy5jDQo+ICsrKyBiL3NvdW5kL2F0bWVsL2FjOTdjLmMNCj4gQEAgLTg0Myw3ICs4NDMs
NyBAQCBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoYXRtZWxfYWM5N2NfcG0sIGF0bWVsX2FjOTdj
X3N1c3BlbmQsIGF0bWVsX2FjOTdjX3Jlc3VtZQ0KPiAgI2RlZmluZSBBVE1FTF9BQzk3Q19QTV9P
UFMgICAgIE5VTEwNCj4gICNlbmRpZg0KPiANCj4gLXN0YXRpYyBpbnQgYXRtZWxfYWM5N2NfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBhdG1lbF9h
Yzk3Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAg
ICBzdHJ1Y3Qgc25kX2NhcmQgKmNhcmQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4g
ICAgICAgICBzdHJ1Y3QgYXRtZWxfYWM5N2MgKmNoaXAgPSBnZXRfY2hpcChjYXJkKTsNCj4gQEAg
LTg1OCwxMyArODU4LDExIEBAIHN0YXRpYyBpbnQgYXRtZWxfYWM5N2NfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgZnJlZV9pcnEoY2hpcC0+aXJxLCBjaGlw
KTsNCj4gDQo+ICAgICAgICAgc25kX2NhcmRfZnJlZShjYXJkKTsNCj4gLQ0KPiAtICAgICAgIHJl
dHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0bWVs
X2FjOTdjX2RyaXZlciA9IHsNCj4gICAgICAgICAucHJvYmUgICAgICAgICAgPSBhdG1lbF9hYzk3
Y19wcm9iZSwNCj4gLSAgICAgICAucmVtb3ZlICAgICAgICAgPSBhdG1lbF9hYzk3Y19yZW1vdmUs
DQo+ICsgICAgICAgLnJlbW92ZV9uZXcgICAgID0gYXRtZWxfYWM5N2NfcmVtb3ZlLA0KPiAgICAg
ICAgIC5kcml2ZXIgICAgICAgICA9IHsNCj4gICAgICAgICAgICAgICAgIC5uYW1lICAgPSAiYXRt
ZWxfYWM5N2MiLA0KPiAgICAgICAgICAgICAgICAgLnBtICAgICA9IEFUTUVMX0FDOTdDX1BNX09Q
UywNCj4gLS0NCj4gMi4zOS4yDQo+IA0KDQo=
