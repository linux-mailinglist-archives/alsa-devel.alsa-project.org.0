Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87066682D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 01:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2376C7B04;
	Thu, 12 Jan 2023 01:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2376C7B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673485180;
	bh=YjAkS8Pnntp3SEqVIpvKX98WAkLlOf3qHAcUtYP3wy8=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ePepGyyGZaDK89LMuya5/+HfRqkRq2E7qsIRuSDIXn3FhA++PdWaWdU/JpSRZGidw
	 3k02SnIkbZjLfQNjIgL23y6gDzePjACys//k9w8HUzK7LGb4ee2KqqsnW5bdGpckHi
	 +TvCnJN/oGQTSfO4GwbZaE9EldCZzLa8rulb0xDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDFCF8016E;
	Thu, 12 Jan 2023 01:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43262F80424; Thu, 12 Jan 2023 01:58:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FDDBF8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 01:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FDDBF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KeIZHI6K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwDHb/piO6qkSv8IJx7amFuAimYe9HgK+GEI7reB6/SqmTgBJSv8CqPQSwShD0m3WCnQiSSOqpG3JSGIyc0aRid+B1v3baE4WRNfcu0mwml1zneWEJij4mIffI71KBti5Ck3ojAvDXfi97zTzNLmNL6RdjWnTBJbwUV17TbfMD0poTsapDbx3f7SwD4iDAhAoGAQ+ZM1ZjTWy6I5xqJe55xiaP+/GHjzu8Bpm3+i02eI71RxLDSekxsIM18QZ+Q/i/46rxBZe7TLkDylcos3dRmq9epXKrVe5sYQdtGqk9N0LW4e+ea87gFqWxOHLImIwlhYfpVDv5KpPBWNurmE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTykC8dbo2uSI919W4zI5Ri5KbnRi0s4YijKtg86VHE=;
 b=Ckvp6++R3ytCCUMUmLbNSv1a/I+U7O4jGhXhJOktKUKT10TyBrrJ3zoS1rbhdXV+t4AheIP4GjrbqLYz0RMX8FT7NauONg/cKKA3WZqGoivOlHSvLpGVOZz0Rco5GO6N/gV8YsJJipRMML5vvxeEVoiDAV95aqahnbYwDwaApWLB7sJe6+M5cp/zIhxZ3cxkO0A5Cpkb8JtLtu8iOj51qpx9/09XQyxK4B2m9Ttzd9V2n2OAr6VNTdADJbr1O4/Q/u9JfUJS8K5EPY7cAfJFG0+COct+JJBxstg9vtbGzK2zUc/PyQY34GhUqUlrbrOtcM39458Ete6cW3nhyVBr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTykC8dbo2uSI919W4zI5Ri5KbnRi0s4YijKtg86VHE=;
 b=KeIZHI6KCfUlR7L23qPbpal4dwHJeKhtGjXm4DiG6dLcl5Ee4NgEJLpRPu06Kv6RgmszupYBgLHc/zJ6yhkqp7MT8AsFvaYVr3BFQUxnjN6ZIo8kj/iLf7HRq+hv9GYqARVkYaN5738t4M6bTLwn9lbDHAqvzO9rq8RcrXlLWNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8844.jpnprd01.prod.outlook.com (2603:1096:604:17e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 00:58:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 00:58:34 +0000
Message-ID: <87a62o4lhi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 08/10] ASoC: dt-bindings: renesas,
 rsnd: add missing playback/capture
In-Reply-To: <167344317928.394453.14105689826645262807.robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87r0w1ho26.wl-kuninori.morimoto.gx@renesas.com>
 <167344317928.394453.14105689826645262807.robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jan 2023 00:58:34 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 568a117f-de4c-4c30-f6a9-08daf43821b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OzuBTEPUr1g1G4iRsHPX/4FSdGFK/vDgkAftOjnbEmLQxzmV3Q4gb+kubxrwxqellNUy60qwlK3bHn4/Xpy1W2EYy4UlDZZCr88h0eQHrm0IZszFd8MR/duaFLdJSSk5/nWqk0aNPKabkAHQQ06XOTR+KYLO9hUK861qWsc3qIVP1dBpjmk0FISgsOvnAWLqSTDQQv5BDNMY0xZxc+RJNQ3MfPcPrmUnQh5HRRtm3Z8PzqnNnpHhN8BftfgR/JsMZmKjZv1VCfZMG7tBJbA2aLd/PFkVwTJmJydxv1pCWet0KehF3b/omG1N0FZp74giaO0pA5y62NDiJ7g9xmj19U/vhwGxJDA0aixFC/06TvB28IG+eUqZEsQPE15G93HWgAxZgmOYO7GW5Owigr6vDyerkrz9j95XNOs8mHfXw4szdnEAl7906OKU9ZTJD7BkUDnzb8cIyGPhPYrlTdSmWcDk5aXtf+DAun4udLVBkf4cq5CmpTd2/XqohaeDizMqsT4G3cIF0HiglKnY3Jbo+25ZRQrJz+zPBZ/9Gfvc8anpgEWzqnnDW3JFMTtkNbUcmfgioj+Bp2vcdnNJ+dOKR1UsbFDz4l3foNSYsCBXWxopnRensJcMSITBTzwr6M2QZGfi8TLygIex9bYTD/iFnPhuho6k/uE+qTzQRb00mQ3KVkWD5ZUAgxBuP8PlLGp/03pNOdDnysOA7zzjYeWHoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(52116002)(2906002)(41300700001)(54906003)(186003)(26005)(2616005)(316002)(6512007)(6506007)(6916009)(66556008)(66946007)(8936002)(8676002)(4326008)(86362001)(66476007)(83380400001)(6486002)(5660300002)(478600001)(38350700002)(36756003)(38100700002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OUV/VahqiqQ0zWb7G3PI2VWh/r+39Abm/AkjML41miB2N8fyBdLA5j8OWrpm?=
 =?us-ascii?Q?Xan1BDihMeFtBEKM/pSfXUDHbiJOpUn8aByG7o0z8gZn3zrLHu26BIVd4to6?=
 =?us-ascii?Q?1tIG7pMd47SezcCmNCvXrTOkUxhBQChV9L8KQbae4Hfdkq5xTmoBqVNdZB5h?=
 =?us-ascii?Q?VZv4UazRYfJthJFR+K8Ii9gutmYZkKUxZ/U3aDP04s9y5eV6FEUl4qcRqobD?=
 =?us-ascii?Q?2MZoxjm9oyzPHKSNVTcBPu0CwkoCPcDQJ0stiGivMwkS56DYFPzWVjAeZsug?=
 =?us-ascii?Q?xy6VMTaBBXQI8FzRGIg2gFGBUzCjaK+ZvLsCbUAKu+3aqnZP72dVGuD1VkNt?=
 =?us-ascii?Q?x4oNQWNI6S2KTIILqWH8JL3GmKBbPRK83PNX5hCee9c0yM/mT8Nd1gWTDB2J?=
 =?us-ascii?Q?dQG/Ksgea3P/pnx0uA2wxyd/jZY0wlVKjJo74VacVbdzdVYdb+Rj8V+2J+5n?=
 =?us-ascii?Q?TmV06C81GTgXwIiy0l5aequSm5jt/ACOW3PfJb3V7B+nmzOeJbuE+URCwE/g?=
 =?us-ascii?Q?16p6xzY/3ZzWl3VfXrfS1YkDs8/vSmqakfe1EY7ODVa6+Jt+Ke5KhkQ+QcMR?=
 =?us-ascii?Q?ESnYXbYVa+yg0t7E49FIT5djEnVqxpGFJL5YeP9h1YKX24geM25SYVHVNI6P?=
 =?us-ascii?Q?PGewuJBnX3zx1wF1K5pdOc3EGZ9NSwbrfhoVat9QzdDGHSRoYSJRPpa4yQeY?=
 =?us-ascii?Q?XdIadXqRM9/saRH1gqgDZv/sontdo+k6JEEx+/gj3qhOmhyKX16IxWMhNxVQ?=
 =?us-ascii?Q?ehrhbb+7L1dFHGUvmnauLERU/fmNrGjiMJvRA7Rm7MnuyEkIm0PJxjWUrcm+?=
 =?us-ascii?Q?+Cc0K2HlMCo048G6000qzTDewnDx4F7+u854+sB/r6dR7PNkcm3L9MLeX7oS?=
 =?us-ascii?Q?kA8to2+6R/NbmAMKM6sWdX88vOC3HJCmu8i7kBg4b7UOTV37Cj0ahn2MAtMI?=
 =?us-ascii?Q?htE3AEjNMrm27wvGlYSGXM4nWspvK8JhNx8Ko3D5LZ78PRFWPIVv2rk8Og9T?=
 =?us-ascii?Q?FNPUTL5N9G30itsxpn/XAv3zQueObwku7vAIZXVqh9M9ZG76PVl3tLx3lBWC?=
 =?us-ascii?Q?L5DckocEQ67rAmMfa9RLlZHGVwI8OWOVoLrWb92Y3WFXtZH2clGEXbVBRqZE?=
 =?us-ascii?Q?t676T5oh0fps2oGyoGImoP/RZPIJ84Hz+UVB6zcPqKr8YHCNHLyXzl8mw5MQ?=
 =?us-ascii?Q?PUmT4TYuLPBnzAtfeEv8Aa6vjhY+Ee5/5RHK6SbZvjQ43qo/1Sz29aqeD4w3?=
 =?us-ascii?Q?OVOPgRNdEHwFz4e0O8yRudIzNpLVVLxqiEZN0Fod+dZqQg1DrQ7BI6PJwDjg?=
 =?us-ascii?Q?BT7ngPi2HfkoIR2nwbgYBzUTXwlO+nahgwg5kJ9plnrrgq/MODnqPyyyb2s+?=
 =?us-ascii?Q?MU7q4MOYRNOnUGuIO5mOH6OMmA6XhvX2zLOGDygYEyinRruH9NGWTyH1+PZF?=
 =?us-ascii?Q?dCEZgsK9nfcwiygu6K8w57mrrNuV8+43TfDTG/OrAsNKd4R6WGYU6DXTzDCO?=
 =?us-ascii?Q?CMlgAyuomK31JU1XKN2OCa64TSsgNV10mPpVZMNd2k6P75Gm/OtAK1r7X8nB?=
 =?us-ascii?Q?cL3wnW3ZkKxEoQJDEzBY0mtUVPcosUppCqiC7p4jzjm3Q8YTWlXDDPvHj2OE?=
 =?us-ascii?Q?wRb1cbBSVz9slXSsXMpjcVE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568a117f-de4c-4c30-f6a9-08daf43821b1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 00:58:34.8409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzjEC9Pgij81V2e13Y4c0K6A+9zYKIzIwvXDXGvuSnWXiE8ysRhytepuUMEW/loW0yRTd1WMYwBsnYIQSvjJsuknV3mKiFW/2dIJUb46IAA5hQOBHdy7/iL2t8BFp8YY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8844
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Rob
Cc Mark

Thank you for your report

> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: sound@ec500000: Unevaluated properties are not allowed ('rcar_sound,src' was unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

This error is not generated by this patch, but already exist and not yet solved.
We need +1 patch to solve it.
I will post the patch and connect to this patch-set.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
