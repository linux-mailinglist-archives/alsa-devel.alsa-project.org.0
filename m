Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C16C2164
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:30:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 181A11EF;
	Mon, 20 Mar 2023 20:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 181A11EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340608;
	bh=sspxCQiQe4VP/fyLd9q+CS+MeNqYsv8H5++mcAOTruo=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OmvFILKPYESNGO5E19cO74XAJXLOv+0h0yqUrPtU/iBGt9FL2nvT18ewGS+9S4onb
	 xQuo7yeCxiRlznWAP7Pvd/uySJfp7kc9PqrW4So/IA8XInk7rF9PLUgAGGomxE+H6f
	 vtvozPaxF46RL1orJ1wvi+NI1U6mjXECG3ZOwYQw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FE6F804B1;
	Mon, 20 Mar 2023 20:28:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85D94F8032D; Fri, 17 Mar 2023 18:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_HOTMAIL_RCVD2,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10acsn20807.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::807])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 856CAF800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 18:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856CAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=WlSM97fV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRNzVIN7KzVnKl9cCGWd+iPfcg234ErutZKu/+IQBy+Yp+WCyjfy7OsYopyX1uO5SQb0bzXdItiRpBay7USMGQ6zTleOK122xCWQJVad93NYF2iHBmq6MmjmrMkYPDuTj2yFYU56sZ7FVdp3n3XCSM0Y3iD05MNv8mrVCHJdkT87kbYI8qZQ1I7PaKWEZa9iEbpWXqKVyiWl0+E5F7C8+5QsiTsuQvi50q7KFqUgXrPpyMRumK1v7BKy6/EOYwQw+6yliuxNi8d6MswA/WIlWVsn3MzoQRymL3jAWOI2YlA+K1/69F5UUJgPkow59I0mGlsuFyx9BxnDZnoPk1Wg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qQcU6TAcvKx8f92hbMo0+7liEAiQZwdn5P18y+twqE=;
 b=mxLoYOTCHN98rh2sA2ZztbQaiAJ2YoEh6jd2yNBfU1QVfqIg7u3CYV8PY5YJJne6Sv5UKHM1qGGwMum/V8t++erV5+MMAgdm0bPNxXNtsyESq+kuo4VYBJEke/9lTE0GyB7MuZNbRIe3uoQrWUgAo/QaAkBu5Y41QZ6rmnMR6LZmr4fYcBhh5nFfBbTdhCp3osVjh/PQKTzGUcrzMFhGstidj/LhrbqxuE+UYTsToYhp2XBwJudvTNQO5oDXQuv+qId1J8JgyFDY5Ix6xfrsw/7OMrPV5hp9lO7t8lho8T3QWxK/fQrjPejydPT0xpvdjBzuxMupfI2Wb52N2zDM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qQcU6TAcvKx8f92hbMo0+7liEAiQZwdn5P18y+twqE=;
 b=WlSM97fVlPwj7eAe2nQxZ7yDhFA/IBQr6eSRORXYW5fWTETWfSvL6QNmmbE2AqtQQhESEgwOEYP+I4yxS7LqhHTdTR+e9vOxbswM+zUIUFqX0NCtLD+NRrMLMa67bo8p7gUUkgalvABYhNp5ZVJJH1CtqlneDhv2Vz5yNkzUBZ5P1cLc/xtOk31/MxLtJd+hGwkIDLyXxcGfXHXy7RcdpxVPhhoGSAiFtohstPAw6ZFtHXHd0soPIpuqdVugNedHNuLz2TUjNlAAsJ86EtQZK7HnIf9mpDUOvtHC3hK3UxIf+Jgwbn287g3++xYt1mGdEYv+677uMkjAOwzMzCI/bA==
Received: from DS0PR19MB7248.namprd19.prod.outlook.com (2603:10b6:8:13b::20)
 by PH7PR19MB5966.namprd19.prod.outlook.com (2603:10b6:510:1da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Mar
 2023 17:12:12 +0000
Received: from DS0PR19MB7248.namprd19.prod.outlook.com
 ([fe80::ca11:40b4:49a9:f371]) by DS0PR19MB7248.namprd19.prod.outlook.com
 ([fe80::ca11:40b4:49a9:f371%4]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 17:12:12 +0000
From: mike jenkins <nwb500@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550
 RX macro
Thread-Topic: [PATCH v2 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add
 SM8550 RX macro
Thread-Index: AQHZWO60KgNlJHHLO0G8RJOpUqUOQq7/NVUX
Date: Fri, 17 Mar 2023 17:12:12 +0000
Message-ID: 
 <DS0PR19MB7248265B5F9B6F76BE0FBA4581BD9@DS0PR19MB7248.namprd19.prod.outlook.com>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075445.17160-2-krzysztof.kozlowski@linaro.org>
 <16790710224tqmsqnyuj6eb3.2438451.4014850401965311641.robh@kernel.org>
In-Reply-To: 
 <16790710224tqmsqnyuj6eb3.2438451.4014850401965311641.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [mTzqlnUlO9viY3wgx+5KUtUFri1inM3e]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB7248:EE_|PH7PR19MB5966:EE_
x-ms-office365-filtering-correlation-id: e2f7aca5-1229-45c0-7b33-08db270abfa9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hc4zj9HglRnBhL+wOXJVno2UvGxcAkcWYENlCcSCYnht2EkiNlajZ8hvy0B8bhHAoJ+oRZZfGuDWG1R0/BGx13wGP3IjKq6QvJM6jGQTX67wNLWy61md4i3hSDIW1PIeHcSAiZugdpsIyuELi6kGAwpALDYQexdcP8XPzjti5flEV2tDBMNm/xwD0XUceq3Y/DD/6YqKyzWQpgJcU2BlUPZ8oqMc+cL9whzmm0pHJFmsGRze10llQyONsogU6GCjeqqONe/6Mny6UPvAryGnRNWoitUlPMZdsV3O/uzEnjq72RrjR3UudqYAcd/tmNLoQIRKyWrLq4u8d112OhfOF+lhnLy4c+RimiAkD1Neafqv1w/en+/P0Kwt15XntGPWj4bU4wt4LePCe2SFmq4G3r1MwJTw6z4i/sZ22xm2HZn5We+t7X4U8/qP32mbrJN/2pZrLFXbOTApJ7AYLLCZRFal+lTZryyj263jx68vVieDOiW4jA8WqzKWZJt323L4YFlbnUkGqYxvqHmCu+ydPR3TWablMFmFhsFgOk3ByAs1gdrOQtfY8DMNx8Ou8yt0jcJ3MZAnEVVePnYdCL1kv2ahQi0wNG43dD8c3DQcKFMzzylWlKJuMSGIRUL/wC2mD84YOeSQOjO1HCRMBvHtwWNzu4wznwZYgMaFrOrxYRM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KbQOXML3ThCu38BRms/kqJktaTw8SJeTVDXfGxauzvgxf3CLwNZMKvyIucrp?=
 =?us-ascii?Q?tTrnxnd++TzvKBgBU+e3jp0ueGPewLmLat4tnhM4/fQiK6+9ciTApDVaxuXH?=
 =?us-ascii?Q?FR6fcKrTHP46WdDTdaTEa7IddggA6CFEwdk7QaDl2gam+B8fePn7O07qL0Fc?=
 =?us-ascii?Q?zSMTVQBKYKHGrXl3bwnsbq2kQpGGxrS7EvBjZ3/q2bMnd5wBg7GE/Za+Nea/?=
 =?us-ascii?Q?SKiKcZ58mR2EhYD23FPzQi+28o9bAlDVHXVzzisk1zYsbAN1D8SDuxKvo0sn?=
 =?us-ascii?Q?t1TWWTddk52glklNvPHJeDjMQvx5r76aPlBVAfz9ZB+2EbIR6cf2uqCXht68?=
 =?us-ascii?Q?F3W/1hiu2kuNSDlCBSpRmW/RUgghX56aFFHJRc/TUWGJxbcA98yIXX6yM+Tk?=
 =?us-ascii?Q?AIvJqnpGnNVq6qdenU5QYOkByw93/b2/EurwsxTkggL597QXBecv7GqjrJTM?=
 =?us-ascii?Q?+KRPIE6vFjPo4p2IqomE/1884ALxdYfBySITsM8gQoyMwKLhSdA1tN0R+kSG?=
 =?us-ascii?Q?ep1K5PT9WTPE+lvOans8Fj8oC2fBVwEIQfku6v4R0vGjd/uQwSsWqZIQ0XKw?=
 =?us-ascii?Q?j7Kcc0Uok5dXn1TPgUalCrCBKA6LAZqf9Q0Xf+e6zaXqOplSFDhtWX77YPI4?=
 =?us-ascii?Q?DCC6ZWg16v/koMC+vK6YkysX8nLyVQVVVBX9SikPcuoL3F+Kh3VKgelwJEPE?=
 =?us-ascii?Q?4T5ujsGwqFEJct1aKcS2uPh79jPLHzxLYYpRvmHb4bbWr8Sz6+pmHlCXLl5Y?=
 =?us-ascii?Q?eGsDScDcOEyBCi6U5naQz34EnmPvcvYJoOFd0Oy4xoZaYflFPggNRS2ZzJP6?=
 =?us-ascii?Q?iGdN1FsgD2QsbrPMWrZXaC/jRdEtwoK3N4DhPlp3MGhddw/yCLeOHSfZQdRb?=
 =?us-ascii?Q?IR3b2HTVSADwYp3+AT4IS8gAk10DE0Okbmb89ImBOlZSx0KuWFgQ8v1t4P2Q?=
 =?us-ascii?Q?JXf5Bzpin2qNkrz/rgkbBir3MX3wLf3jNhXLJSWOpkqMT+OcUnbIUaG1/mbh?=
 =?us-ascii?Q?XX5TiXSktnRQUJr4WGh3bnX2KiQ9134adSL2WJZJnhdEDmZu6yvbrxeqFSSX?=
 =?us-ascii?Q?eSnCDbmUh3exWrfVPCtacMGcaH89XveI35N1M7XdfkF3H57thom5hqGBMgti?=
 =?us-ascii?Q?gfFqT+5VHWeLLyY2/fN9b7/FD8W8qULZnNgJ5rN2NSqggJCw/gibnhYalC+F?=
 =?us-ascii?Q?nL6YJ9efXHEuwwlN9jMeMgfXvx6WV15bJYy9jhj9xv/+VPXGScNk+K7cYNo8?=
 =?us-ascii?Q?bF7LJY8QSUo43GxCx6Ei99+LypYaCbasNlfJgaWNLg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB7248.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2f7aca5-1229-45c0-7b33-08db270abfa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 17:12:12.1143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5966
X-MailFrom: nwb500@hotmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WRRV6K2Y6H5AYH5576EDQBK4MGXT2M7K
X-Message-ID-Hash: WRRV6K2Y6H5AYH5576EDQBK4MGXT2M7K
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:28:21 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4NXACAGUZUDLOI62WTF32Y3E5EYPREE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello

Sent from my T-Mobile 4G LTE Device
Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Rob Herring <robh@kernel.org>
Sent: Friday, March 17, 2023 9:37:03 AM
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org <devicetree@vger.kernel.org>; Takashi Iwai <tiwai@suse.com>; Konrad Dybcio <konrad.dybcio@linaro.org>; Banajit Goswami <bgoswami@quicinc.com>; linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; Andy Gross <agross@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>; Srinivas Kandagatla <srinivas.kandagatla@linaro.org>; Mark Brown <broonie@kernel.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; Bjorn Andersson <andersson@kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Jaroslav Kysela <perex@perex.cz>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro


On Mon, 13 Mar 2023 08:54:38 +0100, Krzysztof Kozlowski wrote:
> Add the RX macro codec on Qualcomm SM8550, which comes without NPL clock
> exposed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>

Reviewed-by: Rob Herring <robh@kernel.org>
