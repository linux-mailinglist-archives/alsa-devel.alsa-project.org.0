Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3564C1C6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B1418B6;
	Wed, 14 Dec 2022 02:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B1418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981021;
	bh=WOtveORd2ALh6rNlnwIo3qpzKVrJJIKEmUnqu95Ff0U=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kuo9483cBvaU7Sv2Aix58v9QWqcU0nkC7ZtlT4kD6mV7wXtMaO8rJwVGss/0cqz2/
	 KvKGYmKidRa1iYvJuoe8nH48wjUWs46laLbjOSqZX34qqfbgFwEHNjEaLxdzp5+8K7
	 cVorO5o94/82fNrN7TUvRrPZJcniW22yM3G5X718=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C827F80141;
	Wed, 14 Dec 2022 02:22:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76FEF804D6; Wed, 14 Dec 2022 02:22:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8171DF804E2
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8171DF804E2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bIA6J2Xa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4rbabSG7vgfy7752IGIKtoj5PvCPqc/6k2ikn9ZGOnYtkL8XbkJWb9xduH/B0nbSg1c8FS+3mGZ2UdvhjBQO+nWs+f/adO0VUXxqYokZjr40KKFjuP1pgUf+GsjIVVl/kwXUWHL3wENjhcOhSVFzDgBH8okYfW2Ee2YCwJisX4/o3z9Lp5aYzEoUnFZaVA8y2cFEVpXYWbbEeE6U5ClyRFD5HZX4kFPATiUUjUu03lzM6tnpMyYyphDwQ+CdkI7oae4YrPK5bEU5D0WQ2V+qUlYqVkGSIeKpaptKSXal5Zpii9r36/McnsEB+p3jG01ezAhnrTEvNOQpoqci81Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h1fGW4DiDRF5CdbUpLiy7IS8Ee9V4YpRixFwxUJnao=;
 b=WCCpJtMLxt4BFZT9Zgq0zbOq12v6l7kJybOJXJyXR2q0f8xzqxDsMu4n23+ca/pm7qcBz2n7bV4+oY+uPwWU+hoWCe1teDog5jUQkfM+theO4cthOxu1DBlSC1W0Bhup3RSRA3gWoFL478m+cNVorAceq0+D//M0Ce1hdx8KODa+h10ghq/Yzfw9FYT3MB5L9c3b2qiXUFjKn/H9csfKRvxJuJUOJBIUUPRUwQtg9P0JJgM5G6GxrfvIA86ffUDRV95S7TV6Vn66E5TBL29NiKuQvkX7c8KnOEz0X5naDWN6M80NGNUt+6+TF27sR2V7OwQcluOSonJRz9XjCEiwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h1fGW4DiDRF5CdbUpLiy7IS8Ee9V4YpRixFwxUJnao=;
 b=bIA6J2Xa8bEVA5QevHqOtgLNGIDDF3x1bcNqFyvAznDbTcb+iHUmTcuHl/61xFqlXfCqCIcQ6FUHcehxJQYC9eNvtHZP9cANAtG39s+d0R++t0OShw+Zzj0sKDkvUwOvz0L1q0s+PUp5+H72o9mi2mtmQhPgZop3cNrTzPnpGNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9898.jpnprd01.prod.outlook.com (2603:1096:604:1ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:22:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:22:36 +0000
Message-ID: <87r0x2pyn7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/11] ASoC: dt-bindings: audio-graph-port: add missing mclk-fs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:22:36 +0000
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 84aabded-ed99-4fda-eff8-08dadd71af3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLH82eGUVsd1vlmEGgARcDUD5QM8k77iXP9JF5DJK3iYw9I5gaq/CkoktPZfG5vrgqcNyc8BvVLdEmb4bO7V1Ku+82nXfrpNaXtkgc6J0l6yBkxp6XgNBY3ZrhgVeIpBq6WF8kc9HAv4AzcFhSnmXY+D5RqVYwmSGySeV6d2qHFf0AxTEu1qcilnmHHmAeD/ziyFKmv0iMlfkdNLtNImXnrSgoaCRchylLC6D6dT/jy50kjtv0OZTvMKNbXmnzW8MT5qQ9f+H0xcqE8jLMec6Axw4YMhegX7a0k+aFMwIN1w5a8WtmC6alq69mdCRpVBUcts4BfUQXt39Xy08Y9BQJOu3y81pZNEiRKzVXJDcErfTj98W+dB6OIxnut3E5sJHQErG+E2Pzlz2T9jJiYKZ8REITYkgIJo0FXDMR0yc1PXVRAUKsWqdrxosOYYRiFeIVKWqGd3YkReBQDsA8TQJFGnnmV1sNr7PcMWXadXHp0q3WkZEIDvXvUAlxzoTNHVy/iaDXRI5nWZQ4LAWm55P7Hjf5XeXssnqnf3fypXxQg8ItHuLvycrzZQDOr7JZFPkQdcLJZ4vM48FPF8cU1uEb7MzQSBoSsWB9a/B2Qy9nunnNxs/y5nF2P9e7t4kKP6xWyIZ3sP83ACwXzJx78yoTNVd9vOGExQUZ7ecqD9+1MfvmzhuyQyw5RtMjS0rkVWgojQROH/r9eoAUQfstei7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(110136005)(316002)(66476007)(54906003)(5660300002)(8936002)(7416002)(41300700001)(8676002)(26005)(66946007)(66556008)(52116002)(6506007)(4326008)(6512007)(86362001)(36756003)(186003)(2616005)(83380400001)(6486002)(478600001)(2906002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8WlU3ZJQRFLXvVjssX+JFiS1Zbj0/CHqstrdTBjQq59G7ODwoVL46kzWzOH?=
 =?us-ascii?Q?xowvhmuWZXo8TVgmdB0otADXQT1ms8j1xnnW1SR8GU0FzORinjKN5Um8QpaL?=
 =?us-ascii?Q?T0FpN7gpvnjD1kDjKdDnz+EfwQlAOK+R1GHmgsy8R3ccnP/854PvcIVnKq2S?=
 =?us-ascii?Q?nqzu12oSJnnhP66GO2sHiv7NwSozdfdaJ1s2aNy7lh4n36DVYWrEixrC992X?=
 =?us-ascii?Q?8rjeK0e1Lh9cD5WS4+GUZHYelL31o0kX8ZEfP3IeDhHOHDalEhh5ksDN8xer?=
 =?us-ascii?Q?4ggMFGZ1NVoy8+P7A7aASkLTlLfe0hSsVfaxEHiZslIoTdEH+o7JfHpX1ezd?=
 =?us-ascii?Q?jn/0k5nawl2F3SBcffOJT9DOeXGdXPc+uHz8Qt2xBCLwpxg5Y4O/t795HZvE?=
 =?us-ascii?Q?Iodsc4UAno7xpKu5jXYlFA2Ea0yfMtHyiook9STR+a8hXK7HChSNPHr6kfiV?=
 =?us-ascii?Q?PU0k462lOL/wSalIzOo+EdzAjYF438AqSSLiq/g+hZuBA2KBC07YBGE/unuw?=
 =?us-ascii?Q?qERHAu1/QZAVHM6E1SDCIBGZCuSIadEpU3RKYxXY+/DMvGJTW5aMhRtcw7Hb?=
 =?us-ascii?Q?q5uKf1TFny3hVY/4rHe1WaBUxyI/1n/cFThjhTGxlgnqQ1PJ2fQZYuvsXucM?=
 =?us-ascii?Q?PlFBhFJ6Ur7QubhSPzb+ct/VOb2LZugb1pRQlgU8hufwfTiqYrYdAcpXndH4?=
 =?us-ascii?Q?ItzpiZ509NJyEgxEvvY+1zxBlTZj/T7LXTEt1E3UBO5tIA3Vimll5pdJwvuk?=
 =?us-ascii?Q?jX4GnS+ZvQxEikmK5DRqLIGX+j1BJgV5tn3fZjxPuVfNbl5TXdL15JqP2bl/?=
 =?us-ascii?Q?k+SWBAy+L3isvyS3neJeKSv6yx4peEGVQxk6zHx6fZRKNfuUGfk4nYBnem8u?=
 =?us-ascii?Q?sKR3RgI/hQ47baxgBd4VBqi8O1/xPXyUEbB01Oer5C3zC9eUyXl+djDD3bbZ?=
 =?us-ascii?Q?eN7rPS3QneV1NRb0Mi3MiLj/jXCeQRaqOWtnc21o+XDzmvCQuQJx3RjMRrZa?=
 =?us-ascii?Q?ccoQMdqYMdMkWhEI0P9QhtC0SwiPpgNw4OryjJZH4KIQy9YrC7EcYC/8r8tj?=
 =?us-ascii?Q?OayvT+8IAeFoPrHKaswZMg/BEoGm+/CWhMZTRKlm9EoltTdcnzq1tS2SGjAk?=
 =?us-ascii?Q?XA09lyEq+Q0NHvGXnee68CHzXJuwRUsNXFDUnXOsnvZDvu/CZgHcni/Z0xx+?=
 =?us-ascii?Q?KlRaeqYiOcMnHlS4uiyVYw1Y9XFZKwixnXpGpWhiJASrGJZQcNoAB+B8Apso?=
 =?us-ascii?Q?1Sz25zjZp84vnbVdaqirYkFpUiCk4jvYlC3B7arxBDH7ct3QMkqCL6Tp4NOk?=
 =?us-ascii?Q?sETmaFLUj0EJfAmwYifFfNAxritMXIiP7rb9liAuDmN6ORl0eDG/7O+NRsdL?=
 =?us-ascii?Q?3evujAxMoO4rWA7DuHQsofNoeHnHbn/HJUuVyU41PKt6SoG24Fxsm1IZ6N14?=
 =?us-ascii?Q?Z+pSlc+puoB6HSZthYGq+dusHOlKcNL6zTng9bBTLvL0yzisQ/oEHboUaqOc?=
 =?us-ascii?Q?uYAO/kHANU9sKoGfrjN8RykkPW5fKC+t2LlJ1E+T0pk/S5XckpxW2TJXCcKG?=
 =?us-ascii?Q?RI3s2+7hqAsRFYiUe4gdAsm5X6jHjChRscZL6b4PT3VZpIwqm8SnO/fJPmzw?=
 =?us-ascii?Q?qJJOwpW7pfcB42aj/jVD7MU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aabded-ed99-4fda-eff8-08dadd71af3b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:22:36.8581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zS+oepb5Jlzbg+54+5ICBx8tTdhLq4PmnggDjRjTbWP9LyPlPebmo58LlB5LOPI9x9BlioZLrCYHTJz5zAZO/ZJnpV+8vCETG3ZVmd6QshX0jnYOgXktlWzrr0j25rfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

audio-graph-port is missing "mclk-fs" on ports/port,
it is used not only endpoint. It is already defined on simple-card.
This patch fixup it.
Without this patch, we will get below warning.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml       | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 273da5a76b8a..25f7204c7c4a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -24,16 +24,14 @@ definitions:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
       convert-sample-format:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+      mclk-fs:
+        $ref: "simple-card.yaml#/definitions/mclk-fs"
 
   endpoint-base:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
     properties:
       mclk-fs:
-        description: |
-          Multiplication factor between stream rate and codec mclk.
-          When defined, mclk-fs property defined in dai-link sub nodes are
-          ignored.
-        $ref: /schemas/types.yaml#/definitions/uint32
+        $ref: "simple-card.yaml#/definitions/mclk-fs"
       frame-inversion:
         description: dai-link uses frame clock inversion
         $ref: /schemas/types.yaml#/definitions/flag
-- 
2.25.1

