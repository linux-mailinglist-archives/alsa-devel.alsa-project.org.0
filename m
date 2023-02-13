Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB0693C18
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 03:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B3B84C;
	Mon, 13 Feb 2023 03:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B3B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676254496;
	bh=oi6AJCKd8MM1PPVEixIajKbHNoxr5g9zqZlacYhfnn0=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QDvl+UyAJRB3THmGW1nSc8gtxPdmY55HOl7Dm1H8cAIoO707N933UG9RWSYAJT6qW
	 gdNhYugwypKkpjPLOqAevI2qsv35ADPXW6MlzvJcgFmP57EcUSMXkCa6RTBeW8jla+
	 q+vqbbNPyULUcvS9zeKkR1zEEui05FENH6kqEldM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EF1F80534;
	Mon, 13 Feb 2023 03:13:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D40EAF8053B; Mon, 13 Feb 2023 03:13:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C75BDF804D6
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 03:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C75BDF804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=orTVM3WZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIBPdH8M4jH2kibfFuEbtCZQ1owJv1aejMidzz+y3Nyvb3NFzDxFwrNpvn3orsiPWQG1P7NJXdnI/ZppgXEm7Paek5G6H2wnDbXeQHvuEy22QrWqKV42M5feKPcUDyTR2tBwQHCzRqjcClqFlYhIf01Y1JGwZTviuDfz3j4fK3WdnY57FS0cmQpzgBZF4x2aRMsbBFFFNu+H6fr1XdeZ1FmSQhqcTZiPnNSbGsto0oKvhhc06kd8oXOQv4/745AHUbBIbOqLayHF2nDgAK76E4ji9xjypCd1zukFx5EFgTokrSU/FqMC8GnHfILQbDgPmR8Y+0phLS5Ilfvmum6zOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=121kweGVeoViFsDnaK5oEog+dDzJPe62pjx2ja7IkX4=;
 b=ZCTDWvQaHCg0NV41KlAC2tl5DN2nbkz7ER85AVYmQs5ijpn3kQoGn7lkxel4A791BTAlUA3NewMbKEcBG3NJdIE0r+Gq7F9tfsQvn5J73RSNiG7phjcOfduKzn0dXPr7dpzgsRINSRlxl8O42Ouo4LxXGFCPzTF2JgmgYyk5476Mobr752TMNRNKjTTy/z6t3OFnPBQ/SZlwjQXkD/tRKVc7YREzQTQsws7APwigcsdQp086AxkOnk+XXveAbFCNiU7YxKlCWT2uR4einS4PGjURBadGOvi+Vh1wxjcgLxqE4eqAKh0PnN56DU9P67obVwVBJnoxL1x7GHRIX51G6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=121kweGVeoViFsDnaK5oEog+dDzJPe62pjx2ja7IkX4=;
 b=orTVM3WZFUuDT/4isW9dKBFt9/PYweBgz9DrLX+mzU1upVrujCAkD4RVT/Blf7tf7xyKgmvYE/Fykc1a3J8apn/0uBwc1E+Q1BZHSiy5vbsahshdC3JHj/uySzcm9hmFa4kcRcJDpzCmz9w1C5l4JmOLc2M/HLr7nLVYJ2klcFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5370.jpnprd01.prod.outlook.com (2603:1096:404:8038::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 02:13:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 02:13:19 +0000
Message-ID: <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Feb 2023 02:13:18 +0000
X-ClientProxiedBy: TYAPR01CA0240.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: c57a2fe0-d879-4cd4-6bc0-08db0d67dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	awWW2EjFRIHjeHWo7lSk2Drw9H2N+JthL+s3Q6Hd5DYF1eg+S/iwWuZ+RS1jMmoQ0Y68//czLqyk4kSji1bQyCh526osGJwa/kJ84UxRI3b1VkgFn5p3NS7vaftGm7z/HKgz9HLmOsJecA4tBogn3BCKUc3PlBnflCibyesSbkFNDcjJBwMPBQy0sLJZfSdhjsqPsDL5hp0ntIlAGp+8eu5W2Js7IRnjhXqoxqqd/fKbIsIV7BgIh6hZJ/gSpDrsJLxo9GMiTS/rPTNWCVjz064J5Lg3XLOPmlF/nkWUzrWOSIEERSpEUJhagZ8TtyI1IDQwNA2XOOomMuINeGehO42frNYumbaLQtMX1hiTkqN4tHlkV63x/ZH5Na51sQuTkDI1iNxFbckjtETpWzFxxDSkqbR4XIDGyDw+XbDSCm1TUVK66dDkvvTw1Ka+qsjYUYznSsMvW+zri2AE37aBVsN9Gt7EGtiUbHFwXIlKU0mx/+nuiSk08gyq6sYIHchMGe1gpcAkHhbjmCxutCgdcUKa7fIj6CSBU68yfg3iAVehwvgB41P6QmsqYx+ZTIGjl5UjsgCBlt/54CQ+DrrIJHgHIZVWaRSNCMEOxkk9q1OILxjQWsEgl6pY14OeFCLcDTSdsMMfpJkzAlbQ3nDyqXiEk62xR6fm/vniq9Uji6oxtqOsxSYm8j/ElablGOVFdW8ID2oEmEdspNFID2j+FKTVnaizbVCDJgQkox58qBEuOzjkVyINpAwoiRzSymRBlnMEiESfHNig1gHxfZW9GA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(2906002)(36756003)(6506007)(52116002)(966005)(83380400001)(6486002)(26005)(186003)(6512007)(2616005)(478600001)(38350700002)(66556008)(66946007)(4326008)(8676002)(66476007)(86362001)(316002)(41300700001)(5660300002)(8936002)(38100700002)(54906003)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t7cJ91gZ0+lZO249Iyd/SegWDlaTegniONKRtr6jbONU4JCTL3TVhk3pfGFz?=
 =?us-ascii?Q?eqpqBOfjebV8ioXpdl6bqES8Q9n+XjqAEvO1mhgcL490/1PClLVDSzh3iTOI?=
 =?us-ascii?Q?3i1G+9Ap0ndGQMJrLTBPsNPPnpUcs2izF+BoW8eiCwwMgGZEKl4Gap2/8aMU?=
 =?us-ascii?Q?fVDz2Gj9WPnmpdQXy2F7gRcJ6XpN1xNLEpsBArHKug9GGDfQYkx/z5XV+WeI?=
 =?us-ascii?Q?565Bb8pFfw13zAXLF4hqNgUh4JpCnzQ4wBU3HNxdl+7BOTP8JMGJGPldQgsw?=
 =?us-ascii?Q?1WBmx0tTpCe4jvoxRR6FWn9TwBLnHzSIQ+I5NxwoxYbEG8I4bUp8ZDT4WcB5?=
 =?us-ascii?Q?j3CGyB9bFcDgQ6Dlvvj7NwPgs9aYcvEwttXkIrVA1lSqGQrn2oEAnp7BGFc5?=
 =?us-ascii?Q?h8+9ajmlHyDlzFur6atd0pHJ4HjCVLBs2bFtLjtiUN9033XJl70kwEHfyVTp?=
 =?us-ascii?Q?VHTS90NoZmlVZbAn7viGOXz5kCvoN6kWTHMFPUj37Pyi+LYZcb3rFxcuzQjs?=
 =?us-ascii?Q?Vwzw6EcYLbXYHAPJ4ygEYbSBb87YQGEx4bcteI2crhW+Qbr5Q/1hrgXBvnN3?=
 =?us-ascii?Q?1Qj1hp/4ynialZUF20qEqLmVPVVKuW5G4Csg0gwmD86zTlkT2nl4FtQJIyUQ?=
 =?us-ascii?Q?MGbcyWLKty4c1kDvS/5HMYUXipzjet7AT8G6lOb3oC9GcrNoPT74dcmQvyJw?=
 =?us-ascii?Q?80C/i6bJLvbXn7NXjcUVbMs7YNvrlUuaSD/aXmKpVQVZMD1LakOMJaLeiV7u?=
 =?us-ascii?Q?abQP//bnRCQQernphUl+iiaTsAO+7vvmudcIrmZTd1Z4axPRDz7I3WA+o9pR?=
 =?us-ascii?Q?DPuHlJIzjRBg3mf71V3MsHDFgUHZeQ6HEMAPKi3aeH7ODRY7nlfyZ2Hi6SLu?=
 =?us-ascii?Q?0W1Lu36TGRTJWfTcy5UnWCYn5MD0fpBW3c53PVz9fJhF19dt3uTvtww/UTgD?=
 =?us-ascii?Q?AuIiMgLWgCOUdtEYLHja4Qq8Lq0uObzFjFBLBqkKi5wkBDTSZB+BBoiifGfF?=
 =?us-ascii?Q?/8cRIxj0zjTyvBX57Vbp14g+Q0MAUU3rui3uANorIIG/Zar7vtFjbUKh3gvI?=
 =?us-ascii?Q?YThnah3qBnTtVQNk1d6kKqMWsOa4rqOZcrF2IzzVAhRfEN4dRfw0eUsNx30V?=
 =?us-ascii?Q?FDQ8NzI37P1l54+14yesD4aNsKylp1PGoH8CYXL4n3hIW0QwwZqZW8Fswt2W?=
 =?us-ascii?Q?3k2mofQc2gKNtRkBu/5UFBwosBPxu1lUrLgitBCrRbJRlzGHHIqRSSDWlz9e?=
 =?us-ascii?Q?ydpjs4WaMB1n/uAjL3P2PDlXB47Oa+3RfTF/cTpLAc6jGl2rPnSDxdRCfMjq?=
 =?us-ascii?Q?62qm4an/i/WMOOLTEh3sXaahjrC1XSLd234E48xW2T5DwePDIDoU7rQ2MHx2?=
 =?us-ascii?Q?0QEXS/9Sj06Ay3rH9EHr+r1+mJz5DwtqsVdnLbdImalqUtMIm0RW+w7VG47A?=
 =?us-ascii?Q?WVC2iUMCU5YXKmTeoLN9cb39Pxe9xGgMo3d330Z3K4hER9PJHPISM5rdUSRm?=
 =?us-ascii?Q?28H/mZvvYvmC+8XGUJwFh2FywJo61XRj/3uHQ0bBMBkedNtLVHvQxQT3I0z7?=
 =?us-ascii?Q?byKSO+g0Woj7/NsokexOX3Gx94Vcoe8kR7qFYqGdFlpZxkRfpmHDH+3IDljs?=
 =?us-ascii?Q?L+iq88hB7TCOhRyb1auI36Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c57a2fe0-d879-4cd4-6bc0-08db0d67dfb2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 02:13:18.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9A9pO7Y4UysC1AEv8FrmALDh5C9ELELr5SIbGRj4JKW4R/c+zGgkKDNV3LxxY69g/TfA77tKp2xyeWRl8BMI0Jc3KJz1Kom6aN+T07qQA+/ALGPYLEl1slz2B8Fw+PJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5370
Message-ID-Hash: VQMV2JUIS3JTBSYABOUKM4JOXLH6UBFU
X-Message-ID-Hash: VQMV2JUIS3JTBSYABOUKM4JOXLH6UBFU
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQMV2JUIS3JTBSYABOUKM4JOXLH6UBFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
are not mandatory property. Drop these from rcar_sound,ssi's required:.
This is prepare for Gen4 support. See more details on Link

Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index c3bea5b0ec40..12ccf29338d9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -256,8 +256,6 @@ properties:
             $ref: /schemas/types.yaml#/definitions/flag
         required:
           - interrupts
-          - dmas
-          - dma-names
     additionalProperties: false
 
   # For DAI base
-- 
2.25.1

