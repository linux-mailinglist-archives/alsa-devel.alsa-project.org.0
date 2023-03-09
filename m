Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF46B1BE9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 08:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848D118A9;
	Thu,  9 Mar 2023 08:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848D118A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678345426;
	bh=rfMCZ59f5YzCKT4OWs7OvOnLkWlOUwI3ytgxU82OLeM=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=KSeWSUKVOg9pFBbcx8F+LqGeojq+jKyIyKQkbubqVUugatcQlIAMTSaXK1wZifbXC
	 63EtJvAsSVo1BkHDAFoL0maa6WgTJlRgW46uSM+ct3I+5yeTm9xQtt4Uv9dtKya9y4
	 jZqKawFnMDmhfxXtScaNKeQANdPCJlk30LsucSVA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB81F804FE;
	Thu,  9 Mar 2023 08:02:29 +0100 (CET)
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on supported
 streams
Date: Thu, 9 Mar 2023 06:54:41 +0000
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
In-Reply-To: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 09 Mar 2023 07:02:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G26V3E25NEARFGAEXAAU26O3ZQJCURWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167834534835.26.10951905157889262193@mailman-core.alsa-project.org>
From: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFF24F8042F; Thu,  9 Mar 2023 07:54:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68F5CF8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F5CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.a=rsa-sha256 header.s=selector1 header.b=QppgxKnF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0GjfH52lfqe3HTa+uYfBGdnIiObE2H+1/y+qwoG4fs4JMtdc+AeTHwF00gOZjVOjIItHwrEqdCT304c5Jsk3o+wxFE/jweEYSRNbgsrdhzOgd4DMIz1yj5yOqaoM1Ui0XCXC907S6deDC720GyxZ46R+uAgWO51Qp2UAL3dDepIAiTpv/Jncn3lrgn6FFhDe+ssBD2g98TyJrEKJZHcxh5IAQJYufrgSJIRcUJ9phFdPQ2O6rUY/TPszljXKywdcuy0XKYmbaJGldI4p3hSF5LtGVn7gD46YDVYRzUsrNxGeceOXR1OhrS6+2zasAhA5wrEeybgEDH6thnlFx9dRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQY5yVwADXNDie9dm9olMMrvbAVdrwIUcWteNwWthfE=;
 b=bZdE5eekQILrjxbBZ9WdQnimZyojvCKNsDP3HIW/G3T131Pejx5x9FQ44Z1HpBW9bUGiq3Kg532od1mPYAFjfcEQDXW99U6RtzRR6Jzm/dbL833af2u1bh1pGMWA8BDAa1N5+as6Wqa15kFki197jlKnIlniuvUagQI67YceIJy9O47gAauX7LrmSrVruv5+BjAzfpjjU1xcwLu4X61G3UOier+Ppey6wW0EAE874FEiE4ko2LHSLoinoPk2trL9JDUtcW2K8Wrv0k2/u2EjFc3D9CIRl8B2yeNQRSRpgILNZEAotHpMx7k5qOXunnralAHiazHY6iL8cu321qih/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQY5yVwADXNDie9dm9olMMrvbAVdrwIUcWteNwWthfE=;
 b=QppgxKnFf1sLkefoJGVYjoZ/OwuG0ELrfZ5gXGLXyAyLnJaHLFYmus605jvU/W8zMlFTWxI9epIXY7y5Xau3uPcctmOhVeRp3Ab1jopcph9gBAOJB9OrqcTXkXfmOKJtfuG5hW9YBLxiL2EGnqwezWz1tzjX0QPjLqEUJHyb790=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAVPR03MB9188.eurprd03.prod.outlook.com (2603:10a6:102:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 06:54:41 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 06:54:41 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on supported
 streams
Thread-Topic: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Thread-Index: AQHZUlQFM7hTaZvX2UuXEHQa49XywQ==
Date: Thu, 9 Mar 2023 06:54:41 +0000
Message-ID: <20230309065432.4150700-1-emas@bang-olufsen.dk>
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
In-Reply-To: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAVPR03MB9188:EE_
x-ms-office365-filtering-correlation-id: f494c29b-d734-4922-80df-08db206b2845
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1FBTmPeadNNHS4Q8FhAJ627Ol+If63D1GF0Nmue6Ur0o8jzb80E65WupQcED7knq0gjLkzJgqBYZ32CHrZqbgmE78Z74QAKa5HEwT1hRUx1pyclL+wtmGkWlCNzxGkD30M/fs4v2A/UObC2tgdQ3AA42RuEShwdMtHJSE4UH19DmW36Z5EME0NMHPfr10Y3BvyHF32UDDTopFxZqmWbx2pvZDGcJk2fr1FMsyRRVX6gK6Lji+yQWPITFmLHFudHIwKjwK+D0LhzUguK9U58Pj2lxlBjiOxLvN/KhM/rZgytS40i3BawuG1fdAgUGMFjFkF6kM4kt8CC/KaV7nNXQCsxuJJ0srKtUUakwDgoosxohtNdA0VR+Wkyr1dFw2gbxYnYnfOkg/jrUuUIDiDQEfOOMqCWEKNCRS9Yad+1Zzt9q7r4zbp3Kq6Blb10f8xm6AHs9kmmBzdGgP32mrhFCxeNe1Sb1hyM7KEs8nRt7CjSeyVaMkuilTo0t6NprMcRrLrCMWG19yizJv6cnfT2hUwP+wst1+wlJVtY5vyxXC4Kz21qcBJjlcKr4lEetz+2XL4hbbZZLJAjbgtVi26LTvk2rZnXFdE/AXgqUtfK6llj1B0pT+AZwblypms0l8esl2DsxdPVTulZBcOVKy7ShRfOp+qaEodOKR/NvMJfnuvvFJrzlF9G3T5b18UhCbV/LNe1HlPu/iIt92dyBaQCN2w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39850400004)(346002)(396003)(136003)(451199018)(36756003)(54906003)(478600001)(6486002)(316002)(71200400001)(5660300002)(2906002)(8976002)(76116006)(64756008)(8936002)(91956017)(8676002)(66556008)(66476007)(66446008)(66946007)(41300700001)(6916009)(4326008)(107886003)(122000001)(38070700005)(86362001)(38100700002)(186003)(2616005)(6512007)(6506007)(1076003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Ph3/ITnmkIM1zyNUEvztL8lmIOWrO+PewOFppBcDfjTM9lAmyziSf4a3?=
 =?Windows-1252?Q?cGjMV4Vfn75s9XE8nhtzx9M3CzboWGcFJmxap5sPyR7e0707Z6sa0pdA?=
 =?Windows-1252?Q?og0F1rqU6bDSGogEajO7Sov/b3X9SXO6cBfTQ+caVVPZyOUvDf/Cnw6k?=
 =?Windows-1252?Q?0Micw5A1ejjz0vOoT6MnLbKzGrTbUI3RQGv3cuT8peBmOVlrC/j1ZU4f?=
 =?Windows-1252?Q?GXTTs9L6IwDgIvLiuvQdmxHG1R4rWGvwKDnQ3fuT1n3TvTq6ux+9x4RG?=
 =?Windows-1252?Q?N0xshCsVk6CCTrqWTNNwfUcufH7TSX9tkBfGI4yxIAZHLBrKls5dlLop?=
 =?Windows-1252?Q?2MgKQt7CcHRBJb6WJ6REii//g4Li1yoCJW+dSxY25CoQ0sIJ62Uef1iy?=
 =?Windows-1252?Q?poqRTBDhxJ1N9MTdUS7MPB6Pw6ts9wtijqiMkZZQng62NVS5kWNizp/t?=
 =?Windows-1252?Q?8cRFTdX+ODKXWwnu2FuGu2MwpkMAG4M+ekOGLtJY0IxdajI7F7hG50k4?=
 =?Windows-1252?Q?Pctej2NDDFx90vsKs8dIpJ7pGEGH0QaJWLsHw7dRAzBlR8sc0nikoBhb?=
 =?Windows-1252?Q?OTf/bwIl0Lix3xYTLjRlSyDNNXnBHzoVpY73CkkrnKLM1x2whUJUTIU5?=
 =?Windows-1252?Q?zb1eLCoDJCCT1t+Jh1uS4Xk4rcxst0Ph0OKwhyeFowZKRu+65D0yfxxC?=
 =?Windows-1252?Q?CPTpAaaOeJUCG9PgRqxf2Tn3AjGIcUvi+vFenoz2NIhXYpuRqEjbI9Xi?=
 =?Windows-1252?Q?1mbuRH6s9sDIxPOQ+7JuvYIGg2gtiuvW/ogFv8Lx2NybU8c3qmcwc2Iv?=
 =?Windows-1252?Q?BWDwuJZIszpgJG8cmZU8d7XhpnYPXXfcfnJartTF3+WrDnW42W656QiC?=
 =?Windows-1252?Q?rF/U08LaXlNnhQcjBWeXdRZTtw8OrHBAV/BGTRd0KtjfWP7rc0HpoQye?=
 =?Windows-1252?Q?EjnI/7GPx1Pv2TfM1y21c3Ng06ae/pgX4MipcPdBT8jpacEVVr5rmSf2?=
 =?Windows-1252?Q?lyJ/ri3BLFkGIAaNwd4NrxTt4WUli3GD3xu68J01ThDhP1kpEqqbdzc2?=
 =?Windows-1252?Q?STF2zbFDFTUOgi97P0vJKTnNXjFmP6L0G50JLknIPsu40LfwrWF6BcqW?=
 =?Windows-1252?Q?b5CoaAUlMTnAyQSIx1l8t1wUp/ns24F4+FbdoZ1qzo3O2yfwQqNIjADA?=
 =?Windows-1252?Q?bWaRQeu1FYtgCfn10PWgV38DKECosrD6f1phS8a4XyD85zofyVSLsfP6?=
 =?Windows-1252?Q?x2RHGwsw+Fn/MPTe+Hj5X+emF6qal4veIEJZq68bYCq08Up1Q1qZcyAS?=
 =?Windows-1252?Q?MEy08L+bPhGkCHY0FYs5V0XYuyFS8DB6/+U33iVoPJCtdi/JjrslSga4?=
 =?Windows-1252?Q?BgyhNyb5sfpkTO0pNrWUxTLbpe+zmz+HPLTIjNy/wIkGfr5vLXOt6Sjf?=
 =?Windows-1252?Q?SqQJ5Yb/QYg3yUEVeokaDrtaM17FU9Xsh8tpZn9cC2X2xWBJNyMgTL7M?=
 =?Windows-1252?Q?VMemgO4Wt592D61eXiZbB2sem+kvavIZVUR5+14fAeydY33KJbU3hMhb?=
 =?Windows-1252?Q?dyjm0N+npUY8GA9I2B+dFNtFq9u6Eiow0M57YlSPbqQO1rI01x9zSsNL?=
 =?Windows-1252?Q?vzgAabngxPWG/Y5yF1J3oUd5kzbpi+f8Vt8WTZ792JY9gDhj9oIYr/aC?=
 =?Windows-1252?Q?9WKPBToWlBzQ8FT0PrWAh4dsgWJvm5b1Eu0hkAgBbPG82b+t/drrVQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f494c29b-d734-4922-80df-08db206b2845
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 06:54:41.1821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WBkJHcEd1kjQ8PO4tvBlqBa+YZqiBAOHjs78dccKZokcsgSP6gAYXaUNqs7alscH1N4cTSTFGW2UmXaHKh/5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9188
X-MailFrom: EMAS@bang-olufsen.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G26V3E25NEARFGAEXAAU26O3ZQJCURWB
X-Message-ID-Hash: G26V3E25NEARFGAEXAAU26O3ZQJCURWB
X-Mailman-Approved-At: Thu, 09 Mar 2023 07:02:23 +0000
CC: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G26V3E25NEARFGAEXAAU26O3ZQJCURWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have accidentally inverted "tx".

Truth table for when to ignore.
+--------------+----+--------+-----+ +--------+-----+
| has_playback | has_capture | TX  | | Before | Now |
+--------------+-------------+-----+ +--------+-----+
|      0       |      0      |  0  | |   1    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      0      |  1  | |   1    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      1      |  0  | |   1    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      0       |      1      |  1  | |   0    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      0      |  0  | |   0    |  1  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      0      |  1  | |   1    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      1      |  0  | |   0    |  0  |
+--------------+-------------+-----+ +--------+-----+
|      1       |      1      |  1  | |   0    |  0  |
+--------------+-------------+-----+ +--------+-----+

Sorry for the inconvenience.


Emil Svendsen (1):
  ASoC: hdmi-codec: only startup/shutdown on supported streams

 sound/soc/codecs/hdmi-codec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--=20
2.34.1
