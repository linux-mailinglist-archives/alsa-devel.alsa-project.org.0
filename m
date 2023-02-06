Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0F68B433
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 03:42:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F7486F;
	Mon,  6 Feb 2023 03:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F7486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675651355;
	bh=mIUvlY14e34kXBpOKhQLg8fIh5ziYCacENC2ygWazp8=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nacR4SgLgIMEIf7sqdlRJUrECS9YSa3+SKGQHjN6Im97fPvKdn+VxgAwXtjnmT6zQ
	 cLpgeFX5z0sUk9ur28bwBBE2M28lpdBFAqNMd3CjbCyFLlDwcAcgt6vjTi6GbbhWEB
	 vHzGxxZz+zQY9BChXnHMnYNdGJKnr4ATBDnxcfVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB12F804E7;
	Mon,  6 Feb 2023 03:41:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E137DF800F5; Mon,  6 Feb 2023 03:41:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF023F800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 03:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF023F800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kbFfianJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9Tq4JnEcdSLuxZkF3K5cD/JPYjsc9kiKNNfuijeeSnyTzOtbDAtIisun4aq9R24p9xoUncjQQoLWheHio8xgN3LuztL7kAMAt9k1P04gmkLAxTDJ6b0NNAzDKWirO6Oh7/2VyytTLiJfVohZIufmgy4beHBYV9qmD+efZfyVTuRzdc55NRB1J5nxxQsvYtcJf56BXOfiwnK8ylYbGlkMtbz6g3O/yzM98f72dySk1T4buj4LyA2ELx9l9E6kMRy4lhsUTcsahqjBXqXOQ5BITOTfNoDgGKhuB8YR5k05gxq0OJechVYEmvB0LFgz/SMmqEfeUBhRALsuIl/8zHIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCi9ujuYiJiPNOrFu/CQu8daUlWfxSvLEnHfB3JPDtE=;
 b=gXDF49pXpJUfef84103bjFTpI40zAI03+m/NCFvAIhExGtkBw3iWxIMHEezjRmbc7rLmkw6teX1xtAPIms+YHDFjUSbp71A49yaa7Ys7t+qgpX9YSLIfGvUcrco5pSZ9dYNp/Zf1+uyJPJywhiAxyvTaaLo4MWpnzQAy+gskNffQqHLrUkkpWOLbgJZeG4EsMIrivipad4cUBbb/UIxJ0TpjIuMJWRkQ9y36WnUh2fYzqntcYHFSQtpD7UmCPfsT+BpVOZJWU1rpukK8PAEcFHDMQEt95g/mww6BRTICXb/q04eGSunRt99cC9GyFZEkbduz/5Ss8PtpfrfQPdRuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCi9ujuYiJiPNOrFu/CQu8daUlWfxSvLEnHfB3JPDtE=;
 b=kbFfianJ7CU5AewX3k40a/9BVmL8Y2YQK3j5gcQ8yx2HqOvI/dVGn+CzP0u/S3hR1Ru+1sme+YiWFn5f6IfyDXcWdfh1+BMyi4RPEUIRQ1OBii7ngd1Dhn7yM8xwcC6s9IkVIbhNom/EbJd9B4Z4csA3w0tpfAK2h848NkhFkac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11691.jpnprd01.prod.outlook.com (2603:1096:400:376::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 02:41:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 02:41:17 +0000
Message-ID: <87k00vqzw2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: adjust to R-Car Gen4
In-Reply-To: <46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org>
References: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
 <46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Feb 2023 02:41:17 +0000
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11691:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a667939-1907-4d55-4670-08db07eb9f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x32FaDeM//b2c3M/9tDb/rwP3HrVkSKz6HW3RZYwII5gZN5ZYuksy23kdFHxv8towkTk9/yOYZZO3GWToTAzP6KXNofytJWux2JuUYsxw7hS1iFlrRtvFiOXSa61Ai12ts1t5kqu4OcL6aJqhzQytxiNGToc7WEsHfQgnyeF61mKjcMbU1p4Qkmf/2Is6oNVWp7ZkCytd0EHT83RmVbqxuud24rcFT0MdqW63h64RSYw0ZhrI33kCUepIJlOkab3dSisXmZXzul0FBFVAykxHPfK+FtUNWvd36ThwKT9w1edJG+IAeoGKjtz5z9VMasYCaD3nrSUObfLp+diz7LR7igrfvze8kXTA2ODbiH0u19+t7fNP/RBFUIG0VSpDSyqxVW1L78VfWKaPe6T0dYurRYpplC6hGhPORi+MAELFzRuHFUU41FTEOQCl24I9cp/ksBf7PpqyGaKOOUESykL9OISYGrlKgUlZ9/2n5wGl2NHGUZ+HUQNh1YjQ3sURy3kmt6HWlb1hQLr2WOGrMlixbehdhEk3d5MFQOgoqAU5V4v0NAkJUP12iAtjnoUYCC6KfxwdSHNVZfa4gFDjxb6GiLQwZkS3PKvDBMCPHWT72UeVKHeergVHi+/6Q1g+UoiNdJHqL30xKJT0MTGrL66L3PWAJ/a7qdQn1WZe1XobKlO4ZAvQTjIWHsNGwHEnRHWhRDsRB3i5vS87yL1tITXBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199018)(4326008)(8676002)(6916009)(41300700001)(66556008)(66476007)(66946007)(316002)(8936002)(54906003)(36756003)(6512007)(2616005)(26005)(186003)(2906002)(5660300002)(6506007)(6486002)(52116002)(86362001)(478600001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1OfBc9nuTqwiaHPm5ymILkTOqUvgctGdvtCn7d7KswDHcmuUC7owfhSlhOQz?=
 =?us-ascii?Q?lQtTxBNE6ttjh3KMV2EqumxFgLDIkn9V9Ekyv00ibRx6gYfDHSF494yi6b+e?=
 =?us-ascii?Q?mhPSW6QKVEZqJm0ozRZ/EWEYQIcqzuEvrDnh69iyGeRE9EQ1O4DYEsKBklmt?=
 =?us-ascii?Q?IEXdcIdg7SreFBxUboKrusUIcPWF38/9BomUieRhgvBr/g3RUUh/ah+WRDS7?=
 =?us-ascii?Q?xhLetdf45jUz0qQyp8WLGmnShV7kaEAE1m9iYG2MzAooBklzDuhMJEjVSDf4?=
 =?us-ascii?Q?GQtX2ghl1cHWuo4kncvQLJgHbBEBHfeXUvQFODctjlAhZ1k3C8NzbL8WOIMB?=
 =?us-ascii?Q?U6us68ze0iQTmnwGOZdlk+k9nvAsgjimhig9+0ZYswPy4pxQPwbfRJS3vPaw?=
 =?us-ascii?Q?N9Q9hE6YHsJ/s7fM1/RUt0iLF7IxAX79Ei4r+fIdHcXaXMBjQYQGIMH0Ogho?=
 =?us-ascii?Q?BdCZsbb1sfpicX20F7tolSGkH47skJ8dfJY4VvbCqWT2ayTSdcT+AqljUrB5?=
 =?us-ascii?Q?eyW1h+yIilh7r/PI9S9AZfMmKruNCmhhVCtpiHnYF+paKqcTseFNKZxmlSf+?=
 =?us-ascii?Q?SNSjxauGGqN4I5iwykdGhPf/dd2CCyxb+6Y9iOxJoi41DJ8axxFOdyj4Slrl?=
 =?us-ascii?Q?vVt9KxfYWh7bv0S9YxTAqvQ20GJ0Y5TgmIInKgxDy+DqMKy4J7ki4dqcbi0U?=
 =?us-ascii?Q?PlZ+zk0RfumOsEloI6QedsfHqri2RUIhgbeq+91DHiSucpB6jlARLF7f2iJO?=
 =?us-ascii?Q?dw+/v2uCZK1D+a9xyIh3aBWgVi/xi7yG0NjZMko130gdg8eHIvcQMBIWISgm?=
 =?us-ascii?Q?GouPonKsbbS7v2r2KypReBpHpmomWW6lcfXz2ALiEzeqpVuWiS+gK6oG+E1I?=
 =?us-ascii?Q?0r0O4PXYMiiI5DmiLVRS+UQDC2EA6UA3LHLkoM6TgyiOaUIY0et2pbwe4Cxm?=
 =?us-ascii?Q?Xr/9eVZXlT+5HSC1ZkFm22bn/+PFy9ncLcyIWHLlyFoFiXXqdTPWuA6ilINe?=
 =?us-ascii?Q?9nH7Fk8lxzvoPlqMac5i8RjLdtqEcBGgg6R3VO+WDqa+Rci+Hxg0d/bFo9hi?=
 =?us-ascii?Q?VITqdYxkgYn8mz6C3i4FqEYRpvFNEGSfvFXmdw/8Zv+DAV4m+Wux5Bf+cv94?=
 =?us-ascii?Q?4DswiMu2p+KN28ExE2GxWljDb5NZreP8bt8pCW1TPsE6LdqSmyY/aKg0daY1?=
 =?us-ascii?Q?rhJqWqsFpRTT5qNYkBn6p/ruNH3QTrSaJZTHgP37RoOwjHzPZo1cWJjIL4/X?=
 =?us-ascii?Q?m7QmWRkoiLIZAUvWHfeomQ4Gr2tH58iGWwYOHlY86X2Osr8IgP8r/J7zCnfR?=
 =?us-ascii?Q?dgUl6BbPRmP45+FSZfHQcUEGF1hE4oz58VLYkslCEiwZRH56IKdT0Ml48wAW?=
 =?us-ascii?Q?FrWE3M26dUgUAju3yDLo3PtH19jT4T9Trv1d43RjspP/OMrFXGC4wfbbGWo2?=
 =?us-ascii?Q?kitE003g2AXk4QLV4T4Y9G4Z9xqZ4aKVworA2I9oH+nFXf8eQGCCSAi6TpTg?=
 =?us-ascii?Q?f9JTTxVHPGIZ5k0Crjbz06VX15og3PHqi35Yr2fykahQ5w8Y5fQTwZHEaOON?=
 =?us-ascii?Q?kxuD8+ol0JEXAA05i5jNY599IlbuwV+FjqNrZlEXeoLEr7otPPezorS2rprI?=
 =?us-ascii?Q?QaAOmP+7N23FhxmHom7vR38=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a667939-1907-4d55-4670-08db07eb9f6d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 02:41:17.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9ovgxa5fu3YRoKQl9mmJr9Lwt3IYoFm2UlHyzDs7l6FemFAWEn/tG7tAq8r921JeYeF6fwxMK+rozMOvCtY7WdLciSZ4bKxUNzt2sxJFJV8sP+7D5IbxdfEPavyLx2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11691
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Krzysztof

Thank you for your review

> This does not make sense - you just require it always.
(snip)
> Please do not embed if within another if, unless strictly necessary. It
> gets unmanageable.
(snip)
> minItems
(snip)
> Drop

OK, thanks. Will fix in v2

> > The "required" with if - then - else on "rcar_sound,ssi" is
> > always match to "then" even though it is checking "renesas,rcar_sound-gen4" or not.
> > Why ?? Is it my fault ??

I'm not sure why but some "if - then - else" doesn't work correctly for me.
One concern is that it is under "patternProperties".
Non "patternProperties" case is works well.

This is just sample case.
In below case, only gen4 case requires "foo/bar" if my understanding was correct.
But I get error "foo/bar are required" on *all* compatible.

It is my fault ?

--- sample -----------
  rcar_sound,ssi:
    ...
    patternProperties:
      "^ssi-[0-9]$":
        ...
        allOf:
          - if:
              properties:
                compatible:
                  contains:
=>                  const: renesas,rcar_sound-gen4
            then:
              required:
=>              - foo
=>              - bar
-----------------------

Thank you for your help !!

Best regards
---
Kuninori Morimoto
