Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2369A34A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F431EB3;
	Fri, 17 Feb 2023 02:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F431EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676596231;
	bh=Kq/7gP1r97DbgCvsnPErOi1msrYXqJ7s8EfdxF2WcWM=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JlNqsdNDvSVxRcvsie1HMVYirSphIkVpklIFN6LHwB5gCa71vwfr4BjJM3qZ8W3A+
	 vzJq/QAOKRIpDfNvom8+pd9Avz8sBaDP/WKoEJ9FtLbejM5fmIWqFRmy14LRN+RrxK
	 EtNxtFrIcW/hCDY5stVXfA9V8J3yW1fUSsVkqHYE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C672F800E4;
	Fri, 17 Feb 2023 02:09:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E570AF80171; Fri, 17 Feb 2023 02:09:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77EFDF800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77EFDF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EIpnAQHC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSGQATObSeMLeGFInhomtmyHzsMoOi2POxWt7YkxPECbHL34hjqrIKHiXYHtBSrygZPjRopX/6w0fckXiAvUpOIql3+6O+arQXJ54Pv8PbcKPOZ2J/umsyyci3OEx2iKk53NkHN6LOdb8dVO5Lr2gYD7CmHubz8cczmX05QOhtEuly8YpW9J8OvCkoVEspVdrP3H7jsE0bLcs2tT1X1hZtH7SAhfsCYLDaTb/mU+YcypsMH0B7HuUW9JVyHbiUyvbTp28i5Eb9iUXvMEpHmwyPRuKcMou+8xDsW08njWf9fJor12PImCOMBcZEaPnv5S8fuhS1hM8F3Aoj4YT57ZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWLZCXgjHr2kjM3iZ+SJ9/KKkRDIagd/atnlOoMQ6Zg=;
 b=bKNlSVtn5EXpSKchdwYmWaIiwDFkTV/JOz797ISIprUibS0TswFX9c6l0tkOYBwvdyknWDhuqGsciCDwu1z9GRS3cG5qXrA7oCD9ZGZjOCFOioY3tZBUmbAWLb12NavPHXOBOQqMqiXrmWak9pd/goaBrYQEdFCF6hUkzXI4GluCx8klKzkM21ykGQ7ZaUUpe/hmyhS8mOghdKTnWywCP9v/HhzVyvgOgYbM8qpcwE6se9zmfWRyQgNNY3fyGNM5uWTff5fOjz6eBlwltxlMCYoMesPAtPIBqlBfY3DTCmLYgtG70wJ9pQhoDiSC5BMGNtRIC1aU0GgVjhhQ1ZnEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWLZCXgjHr2kjM3iZ+SJ9/KKkRDIagd/atnlOoMQ6Zg=;
 b=EIpnAQHChP1xj7HFM7VO/uhcamo39DVC0P2uUkPchnNRCFFfjfBKp9+AUIoXU57y0+PfVTTnq2WmWxg991U6o0Du7QvYUrmKgUWLuNISnGs+W46JvOk2oLxtgOC05t3GhEdYe6hKyX3bnUf+lMUuMss3ndyvW0vIpr+GyEB6MuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10837.jpnprd01.prod.outlook.com (2603:1096:400:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 01:09:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 01:09:19 +0000
Message-ID: <877cwhf680.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
In-Reply-To: <a9d5d375-697d-93c8-0bed-4d2475e6643e@linaro.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
	<87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
	<9aa09940-91cf-32ba-34f4-a57c9e9965bc@linaro.org>
	<Y+vKcGic3sC7+3I/@sirena.org.uk>
	<7b194041-4386-3b82-c65d-f0e3ad5cf015@linaro.org>
	<873576ju10.wl-kuninori.morimoto.gx@renesas.com>
	<a9d5d375-697d-93c8-0bed-4d2475e6643e@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 17 Feb 2023 01:09:19 +0000
X-ClientProxiedBy: TYAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:15::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10837:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c29dfd-3a71-4050-a463-08db108398f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S64emeafVLYU0OJvewYVSr0m9vPLueLL2ygRgapJXdkkvo/+BZb1lbgZOBaEUH3h2mlCpjgFRWAj2NARjOzP3nIJmKXMSLiLcdTqJ5KjtgYs1aBXKOHUGU01kwKNpxjZjteOkcIdRCyMDjOZuoe8tYmSAXXPF9yn789HHFaNujnYE76N6U01olA4qfhl0U+pXDSy6e+odNQxBMnH6YcR4aIc2jvNWaxNY2QC/BGwFJmXBAbilVsVqoVkFWTXUaFWovvOfpfdi2pquCh7W1OdEnGyBBaDbzudJgzrMsMVQ5V/YN4rZcPqQSI0SaVcgrspEBi4jxzCICzGhX6k8M+eP/BODG4sLUKukVCsUPXhbaJxvkN6vaBHHDzS+wfbBbIGpga4DBfsxn2QmJ+6AkaMbbYBArjMF/9oMHpoaFLv5j2P22hFEXozGRpmu2EOEfDa225knBkjSPWzNkER8pvudhkJZ9xR7EZJrvvo9AtYsBXE+cLVeFNZ/uPXbEl99O+c/P0W4lxs6RD4PvlrBWyAToxaolTgu4cRsk0KuAaXksw/Bw8xrJyy+wW/Alu/7GRbx8gjVUSnh0mUlFV5qveeXkGvYxlAOYhEkNJZ2twz1a/fphl3EaObtuOm8L4ETyl0CS3kGqF5y4U/Ri4gMy+vuVOjA5L8TdsQPrHPZnrVUKPkrLK8QVTp8ZoCmJxt+r8ss0E7Z0pNq8/kwlGHH497tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199018)(2906002)(36756003)(6486002)(6512007)(38350700002)(38100700002)(186003)(26005)(2616005)(83380400001)(316002)(6916009)(8676002)(4326008)(66946007)(66556008)(66476007)(8936002)(41300700001)(5660300002)(54906003)(6506007)(478600001)(52116002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K5zKVqC3dQ7Maayq0mPqgOFQxvZUJZ2HnBo1Ys1+pew4z0VqX+A5Af8/fqmb?=
 =?us-ascii?Q?BSbngFtMqq9F0kbkOTGo+QQC3GFD2k+lENKDbGj0Q9s7z7lnkrAV/9lOHeOt?=
 =?us-ascii?Q?4Y+6V8TYDVRIbpRb7wM6c7zq/VsyewqmsBtuAkPO0OpAUA9XeGC78V1njd2H?=
 =?us-ascii?Q?zd0aeI54iNtRmKq/BI7f7WAL0scyjny8l6c1EOas6g9oQIzKzreKD3kXisKS?=
 =?us-ascii?Q?ZV7YWc9NGfPOJedVErNckaFQ0rPbGAuXaDoot9nJn1xjnu3do+SLX9LUt4h9?=
 =?us-ascii?Q?WtHro5WuFmuwMseaoCkKcmE/t6vL1q0Sk7o9ggQeXW1HnPGRDYnh83iRlWNr?=
 =?us-ascii?Q?amn20fKP9iDlqnF7lJS9iuD3yA/egLC398wdOb1HRna0Dhp82RDU4Q04OcfJ?=
 =?us-ascii?Q?qU9g3xRcPCa36Bxk3Rwhww8VDbOjeQ1kX85N7m6uTO3NuX6VRDsr5ZLtyLdL?=
 =?us-ascii?Q?6q8nuPGEr9EMihbSC0GB3EWPsR+d12FiLWSvGZCSZ0Ap2UVdreMSSOpnoeWC?=
 =?us-ascii?Q?yN+kLbYqtWjtty5p5itVzD7LdZxv8YXj4wGghfbCT8bLpeSqujd+hi0kV+BF?=
 =?us-ascii?Q?qX8UOTZgnevP8hJ6kNFq1MuynwYfRcz78nrGOu7C9WUS8oMGRZh+2SiaiYqh?=
 =?us-ascii?Q?Z/rjaKZKFrY+OTFIeSK3fSs+VBFNou9zgwJ96uzQSP8jM8NhIlmmmEzi/1iz?=
 =?us-ascii?Q?n5xcXQIIzjdefyW+iuEP17I2xbdNGbV+8P4A5NPCfxO9kR0K9CzfNWZybtEn?=
 =?us-ascii?Q?wyQCsDYwCO04BVowqosg6te+MwQ0JL7q+oEXUxTDcl7TLqRZkgBEf+EX20xL?=
 =?us-ascii?Q?zIEa1kn59utKSbwNEQMtLidaDpRXAJuiW/flN4lZuvHcqsuru8OJSxd+GzTu?=
 =?us-ascii?Q?y1nIU8ji3hosoXWmSmJUrtXdMc416AD2FwUOoI5pC4ZH6nT5034/Y0B+tO/j?=
 =?us-ascii?Q?2tLIsoKMye3kJVfpYGfZUljjaNX79EhgHhYrzLJg2SmF/eBl1cZMm0UxlUP2?=
 =?us-ascii?Q?kl0H7JYeTVtrcTrrqZ2SP8RT/dU9MzUjJFc4cEe0dKcAeaFzcqZ1TOFJWNud?=
 =?us-ascii?Q?TigYx1uIgl/sP7hrbnIeK3BJ2xpx4U+Sq1nEE2fFI1avi8ntL15T2/Qluc/+?=
 =?us-ascii?Q?aWjNKkr9dOY3ajk0kCZ5Ro+OOv9WSkUHKsdy73nF+HbHy5ldr/t9KnxPzQns?=
 =?us-ascii?Q?h0oKhgM1l8C20Dw9O4dcZao8owAV7uTbkiUDAJezyb0VUPeerkuqRYW6cDyK?=
 =?us-ascii?Q?z1RtiyxcEjdrWkT8o7/xDbfMEHx/DP3TLpyulZlCS9OZvaC23Cb5jlN8Howl?=
 =?us-ascii?Q?pBWPHBNsWMU+U7Yj+hTys3TG44GIwYRMYaQ9P/A9TLJN3NDAAmNBFAp+Qj/+?=
 =?us-ascii?Q?CkxMDdAgyyi+GuflVgQ9hhcSWFk7eH6N1WCBzijgcuqgUyKv2Q/iOiWapXiT?=
 =?us-ascii?Q?pUtaS1uda9R/Y2aIaDnr3AcoGvBTp+QhBgHpPkBz8mRkmHqX33e1D3Wtk6xC?=
 =?us-ascii?Q?9/cJqkMH37tSJwIOrvUBMlvX7Tu78lgxgQ/gGnMd5BqX+Yooc0d2MW/0+sqO?=
 =?us-ascii?Q?Vn/mcz/uVQ1OLJCqEZXQ3dINgEY2EQRAiojzC604eW7lkKQXTE0sikYLTF4q?=
 =?us-ascii?Q?H3jx8zrycp8pLYjXb9O4Ob4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72c29dfd-3a71-4050-a463-08db108398f7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 01:09:19.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TuF/36+Bkzm7nEf4TmtTFRtGyQ/i0gk3Ax4Uzm0VdgluVBJjThwYzf81AcbAqWwOt2JIyzGO2AdtKDA1BWBLAiawoKFY7IhrkDdmMM/HQtrKjAcU1rq8GMyhqDQ/0Np5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10837
Message-ID-Hash: P5IJMLAHW57NP6H75LAWDZJOYWRMCDOA
X-Message-ID-Hash: P5IJMLAHW57NP6H75LAWDZJOYWRMCDOA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5IJMLAHW57NP6H75LAWDZJOYWRMCDOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

> However you have there
> multiple ifs, thus finding the one related to clocks is not obvious now
> and won't be anyhow easier later. What's more, clocks have constraints
> in top-level, thus seeing clock-names without the constraints also
> raises reviewers question. Someone might bring a new compatible with
> another set of clocks (quite likely), thus else won't be valid anymore
> and you will have to define constraints per *each* variant (each
> if:then:).

Do you mean you want to tell was keeping minItems/maxItems on top ??

I think I could understand what you want to tell if your indicated
link was pointing to "clock-name" line, and/or if you indicated like
"please keep minItems/maxItems on top for constraints" or something.
But pointed link was to "allOf:" line with very unclear comment,
and no response to my question mail.
And your words of "constraints". I have been thoughting that you are
indicating was "if-then-else" need to catch all "compatible"
(but don't use "else if").

It is using "if-then-else", and "else" has minItems/maxItems,
I think it is there is no difference.
But if my above assumption was correct and Krzysztof agreed to it,
I will post v4 patch which keeps min/maxItems on top.
Otherwise I will do nothing to avoid endless pointless
ping-pong, becuase it already got Reviewed-by.

To avoid pointless ping-pong, I think v4 will be like this

----------
  clock-names:
    description: List of necessary clock names.
    minItems: 1
    maxItems: 31

  ...

  - if:
     properties:
       compatible:
         contains:
           const: renesas,rcar_sound-gen4
    then:
      properties:
        clock-names:
          maxItems: 3
         ...
    else
      properties:
        clock-names:
         ...
-------------

Thank you for your help !!

Best regards
---
Kuninori Morimoto
