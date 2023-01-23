Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6716774EB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04103E8C;
	Mon, 23 Jan 2023 06:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04103E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451723;
	bh=SqcDQo7Tq0vIeWcvo+bAbl13q5yn0p5nNQYceEW//og=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KHsifbhdnIL6tk6f6/9XVh8bIm74UbfM2up5tcmxwQje36Yp4iK+MuAkQJtheGNtF
	 7PTpDBxvfAnzc4JvJCv9v3mLV5CZHYG5p+w+0driSI0EIWL4GWO0zsp+DCpAHaSkt0
	 RUuclKx+KSBYRO/znP7ELJivW//moP36T9c7kZvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D856F804A9;
	Mon, 23 Jan 2023 06:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8989F80132; Mon, 23 Jan 2023 06:26:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B04EF804A9
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B04EF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jt8qm0Xn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0MZ+6mb9CELzToJzJR4fkoyrhCJYvEa5XiiiEldWDN/Wn7GGKigymeWy5oz4YVZMJkP4+80EU2PMauXnUm+N0b3nn985lvmwG5PLKA8TYFMF4Zocjmvc/gT6mpcecot/sW1vuz41IgrwV5M6ZEHHolBOPksfwzcsjJnrL5Yx+GXOk48VI/UnadhAsUta9akvz4ZSNNi92g1kTmH2ywm3FhSyWjQsSeehPNQujU8IVrsuLWM8mn8w8VOOeTcCdr/Wa6uazso68Awy5pwUZ76+vqhjg4LNG70hvSk7bm6wJQcaQrtYSGGDJEy0nENNDRxyU7pwXIWzE3JN/3NFe5COA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLQhyBMJVjoZNYy+WRJn5Be0D5z6EmYsEsNl7jV2sC0=;
 b=d81E7cTULyGL1sEfFCt/RyWy7TSxGGYDu76ibQsIBI6AuFRsh3wNPztnIT4YYWUBxTHWCv14eiUP4jCNddEFuRhrjbeIgGYnI4FL5LEThlXtmiAnqcU7HKIfVnwr8lZ9w1zrpeLnqXaL5N9NNCV/JstKYHPvSG5TivYlOJdPBWM+AVWvnf1TBQdjkVSZV0LVSg+8ispQZgG56P76TU6BqgUT7rl0Rhju/ZBZ41NgLcMg9he2Lc3AJnIit/pe0QuMEaqHxKk3N5MzNpfGX9fxBpDahmnAjTlNSkYPJRTsPEJrooO85XzgfDmthJSkVobJA79zocfnm5spPXbKXP+Evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLQhyBMJVjoZNYy+WRJn5Be0D5z6EmYsEsNl7jV2sC0=;
 b=jt8qm0XnhqgLIzHuJrBZDa/J8QamJgZX+72EK34rmEzhOHaCir/gs+s0SELIjN1doqVq5B6GOfutb9Ft4z9s0bEjavPbpejtc9vcMdN2q9Lib4JOSGABuhdyq35mOUx/IvYGl6kzbtd3ul9iOOa4ogyw/DCtuZHjSBZMjeR0dCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10497.jpnprd01.prod.outlook.com (2603:1096:400:2f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 05:26:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:26:07 +0000
Message-ID: <87edrl7rf4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/11] ASoC: dt-bindings: renesas,
 rsnd: #sound-dai-cells is not mandatory
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:26:07 +0000
X-ClientProxiedBy: TYAPR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: ac333eda-23a8-4c4b-0d75-08dafd025477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1X9bGpi3YVCjOy01RGCy4+wRhHf0Z2JBBuQYV880Q5YzQckJL7Vlk2J86TIscui+kxN2PYE9LekNR0gjtD3Gz/W8VXu6R2YsWVWl4qA6lxWUCpSi60BdPH5a8gMac5PBuL+/DIL2+vj9C9RTnUbn1Nxl7Zu7UdZo1tnIMWD9QXM33TRz5UucpQWXU4ZKjLIWMi/+uWZmurDpIiXmlO73ng81btcZUZ00FhdmcJaQN5VlFn5UoaK1a7laNr7V3vMxHzXGlZ6AQ/G6egzpLyDqICa/yloIoTNU23C36KfszO2h6vq0FUvl+PWUkSi7O1IPCaN7K5dNJ3hmvQZX048zUKRhxmrtW8pUvP9Iobk4xDKaUmvKIZObyf7A9UEfItW0ZNQljK7A10FBGnH10A9O75W5oOifbD9ZUPqz6rQYb2OQkrGKuBnW8p99uXoAwSMO4saDYuBoYm8bowkkSvwhSSfMVooh14wYyXcZDZXd9NFoihZDuNQGX9xJtGCEEqlsJfdvgd1o4jEr9UlsfgWZpsuTKE/+kaYYmI/SS4ig9IMynW6jvz9gmshhEV4YAQ+ffWQzu8JMZWfhbvDT6MLfYZxcSZqZ8xOBh7+PNfBLL4zAPmsERChAXlYKBuebAXArouE7NTAmrwLe/LlU3o+hcsKPn1xPb2jIvxfeP7FXk9HSbjhL8eohY4YkNQxVY09huCaNqrgEUAmzU4QrFhG6Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(86362001)(36756003)(316002)(54906003)(110136005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(26005)(6506007)(2616005)(6486002)(52116002)(38350700002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nCMV+KeGlqaRKjXtjtVYMgFiNqATK/ovjh8CKrhGkcfk4vn2e03sKZ+if0yM?=
 =?us-ascii?Q?Lgp5884DVa2vVqayrDFPEfSF8gLtO2zVDilBaLx7w+gnzb+EbZCWEsrFbRW/?=
 =?us-ascii?Q?U2MWFnIhNXNtiYEkJDghXwIEOGInWOXnkbqeNaCqor6oxvrlmx564OFlvW5l?=
 =?us-ascii?Q?bg3HhBT0xrqh7pGYp1TqkX0/ntGMFlWLQPC/Ty/4vYtVZmgdlDLL6GjPrUTH?=
 =?us-ascii?Q?Wgra7MHqH3NOXvmOPUycFKT1sHaJ+dsVw2IqNRRTPIV735pztQWXgufmtoEg?=
 =?us-ascii?Q?xFagOFPJTSdKM6pkgvMyy8Efslor1LXj8JLsygE0FUOfaqR6mf9jbA1YdYER?=
 =?us-ascii?Q?xKTpfhFEBcsE9+SRxeZOHOvlImWaYBgwH43muoCYygeA+xZyf8JAt22WDma6?=
 =?us-ascii?Q?mJJE/xyqTywZNp34XQJ7hlxbo1FmwPbTJBATPZg+kmvRBWlAhBncMzd52jC2?=
 =?us-ascii?Q?YLe2aMgXbwcQxcQJ/xK+0StIpnekr/hG+L2oEy+WkjB/Ha3wuyEt4iNCWcib?=
 =?us-ascii?Q?SdHJD9OtkL6ERW559cyyipOpgkCs2hWR6Sih6fVAz6gqPkXcADQf0t/OC5pF?=
 =?us-ascii?Q?Mh77i/u3icWgkmG9HUM/7z6XVQlY/fa3fD8OvsLXHBn044ita60G9jSkqorJ?=
 =?us-ascii?Q?n2M9+k7w5E80z44bjrS5UDO5ehB2y0sitqrF+7HlFRXetPA2zYaWOFKCnNUf?=
 =?us-ascii?Q?FcP0Udft/0BjHsw007ru9Vd3Oj70jFOKMOMQSBtyEQjvMny7bF9ylEIfwDhx?=
 =?us-ascii?Q?rUEQYZNr+qlQRTIjOgYWo6/D6p64c69um4tqTTJsEKSc7ORepjsrkzOC37ib?=
 =?us-ascii?Q?AEo8SvwwyO7KuD1gCehDHr6sCwJvg8G6V2eGi5l+NEkRDgmVePKixffJUkPE?=
 =?us-ascii?Q?KynAaFiGEk4a07aEKgWL70PLeO1FOSoFl55seWeDtWcoCm2SO9MT/vWs3EzR?=
 =?us-ascii?Q?Y8oolwuOXn3aRb0Ucq9H8lNavm1gV68J+CQINGTi2+2FZEK86eDqSGKhLzQI?=
 =?us-ascii?Q?xtDaBBQvGgiqCwf3trOVhPIaYMkQcoq352D4fFWaoCjHuE3V9sNJ7T5Oez7T?=
 =?us-ascii?Q?bBpTPkeH1pzD4s3uNUOmNQZZm+tRcTAvyeJ2wCTVcJ6G1uMfRxqPmUUFturP?=
 =?us-ascii?Q?IAUmKyn2+5jejhTlN+HUDJ90kiLP/50bDUhVnNK5F+qCSoviNDpC80zOH46u?=
 =?us-ascii?Q?0lia1KqEGCidtTxh43XPdopXLme/IbLaDlmefEbh8ZU6H3nLNKc7Q4vPj/9t?=
 =?us-ascii?Q?SM1kIKnuZTtsQedpADl4jvsXcbttuwlAOHlwijxYsnYPYSWXfFMK05dTkWEp?=
 =?us-ascii?Q?039t3aGIKxb0tH7EfICatmehnfsOiB+cbTM4Y0vmPPJhcXc3P1Gibz0/5y6w?=
 =?us-ascii?Q?QMQ61Ka2D59bitCPqn1mjQ3GZdnMjFa2bov8ltjdXhWOaiCkIyzgNrYpERQk?=
 =?us-ascii?Q?Mw8CmP3tDPQpEeigOLzTHGtst+GwCeNX42Ltx5hmc+s8CYURHE4iz+6/MxEm?=
 =?us-ascii?Q?kij4oaFPRI5NLm+fktMoGPa+gGXdwzCEn9YqA6pLPrycmdPa3jv+X84CGHh+?=
 =?us-ascii?Q?IjF+xZWxcxzUXilQYstm+gGpOzD49d5yp9KtMRV662mYrBS79pxsjdaG9tu4?=
 =?us-ascii?Q?+VOSlyPuAqnG1KKH1fjSQ00=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac333eda-23a8-4c4b-0d75-08dafd025477
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:26:07.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcqUjWUc7jpF/R3DZCoUhWM/1CYZZuDCF/7DvK2NUvUACpd5gqAhpBKqBAYQ2H86ANqnXGQWXxjKeCQIz6myZt/PQ6jXjWRhSSkafRgpXlpQdbWrMv1mZyEwJlltJYWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10497
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current renesas,rsnd is requesting #sound-dai-cells, but it is
needed in case of it is using "simple-card", but not needed in case of
"audio-graph". We will get below warning without this patch.
This patch fiup it.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: sound@ec500000: '#sound-dai-cells' is a required property
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 54cfdd4d5e7f..e01ec0179290 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -68,6 +68,7 @@ properties:
     description: |
       it must be 0 if your system is using single DAI
       it must be 1 if your system is using multi  DAIs
+      This is used on simple-audio-card
     enum: [0, 1]
 
   "#clock-cells":
@@ -286,7 +287,6 @@ required:
   - reg-names
   - clocks
   - clock-names
-  - "#sound-dai-cells"
 
 allOf:
   - $ref: dai-common.yaml#
-- 
2.25.1

