Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9C7C624B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F50E8D;
	Thu, 12 Oct 2023 03:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F50E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697074429;
	bh=3JEF2BQlIHYf6495H6nkM/THEIDLwX1T5p0ClWa49u8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C6q1WgCy1dAjkd/SGZQN3c4EZGzSmXF9rzKBdZEaCYZK4gZddUluzyOGpL2VRC1gn
	 SuICwHt72uT2J8IHPOhWBpifedUimL2mMzMLWY6AsNBxD/2h6x5zaTmeGfB3pibZsc
	 xKNzAhJbFZpFHKBm2yBZvg03BAtNPkQYYlOulKCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA279F80579; Thu, 12 Oct 2023 03:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8651FF80579;
	Thu, 12 Oct 2023 03:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A768BF8055C; Thu, 12 Oct 2023 03:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAF05F8055A
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF05F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ad0Klc4g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaNZtl3avBOaXOaE7dSBG+7Y8LgW0oJpqP4VGWhT0VlRCp0D9Ms7GQVYliLIG8qSl/K+YbI+puRwpKVPvo7N9aPAwfcb3Fckxtix72oeoFMygVUxNqiN8emMet0ZQIr4YQpUFnEuR9dtbpaGeRwAL3CgtrFs8QNtncJAnKy6WAWueXFzIsLtBYpirUUyNzU07CVqbGEcHt8LdiWNpvkFOksbk6GQZj5GRAD7PIoESepljss8YdW4SrU+Yd/UD3iK+BBdvw7Cl6eBvDmJOwsvepZUr/y2MiiKkM479aH0Lf+Tx5WUeoxMh6vFJTCTsC1azb7FqwtveyqvAPclWg/CIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV40rYPgD+X79RHIP1LMFV+4ANzbM28sKQBKFTpL4f8=;
 b=dLNCbgyHAlRjiFML0/0enW/DqK1WPHMlDGitVgkFeVeLAuCcrsw/WRm/cJuQZGXL52e3qZc2F0kQhe2snrZTiMLG4fiJf6CN/ASiIQKezy9gduS/iC162UhkCdZ8rSRz+0LEpWpLYTIX70qsJSmcbOf2llebYAKLbeZjcRmLflC4EPytGxLxbPX89ejobh3m23jzZR06dyU9JbLdnX3bjI3dQsSltapR8phYgZ/+vMHLT9q1LE/KSO729FxAflMAF7BCFs33KANupUfDpkbscKXF/avCSiX09i688e0C8bjFj7mHHkXAFam2g53CR2wJyk/LA9CeJJLUxkwMraXISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV40rYPgD+X79RHIP1LMFV+4ANzbM28sKQBKFTpL4f8=;
 b=ad0Klc4gss2/36mm66ZCHVtvjWxVpr1yPiqD3bNY1oBeORi9e4Hj0QG5zemSdyvp2rl50ItQcmsYpBvMTA1f5VPI0r8LnGWEGiz3y9GulEqh8IRUC8nSe4prUU3IzlIjUd0+fa36yz36AcKhDO622A+BDUogf34EsbcRENwFWus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:32:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:32:04 +0000
Message-ID: <874jiwy6b1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/4] ASoC: audio-graph-card2: add CPU:Codec = N:M support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Oct 2023 01:32:03 +0000
X-ClientProxiedBy: TYCPR01CA0140.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ae42c4-fa05-4828-a87b-08dbcac309a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zzCamAOmjlNkN2KMJshINMuAm0Am3hq+tqpFevYghtoM5duv6N+kZ3U4A9Ygmrt///++drMxlyaPQArWbBB1G1gc9VSIai+QGzjBf/WkwPhTE4vtiqZQLjqsgRcA72yth5HsT82YSvriIpWKpHvimNA1a//My80x+y9XFP5qpom7PcUJoRgRlHWUjjeSzYcp1+u1TpOM9fv3YohnEP+Z/k5RT34EvcYQiOB0wTajIE5ifeUiVa/ff/07AUcacrtFWxsPwZu58J8uzQSET64LCIYkzKTLeaSfsDVIvL5bchBR9d7Xh5trLDC/WFW5GhaLAsBEfdvQRenvLj/WU0UGXJaA/pWrOvUvLS4x4IOlBfUHFwL/b1xSjzwO715vCcbkk2YBcs0jrTDWV5c9od5YDvLEY0mqftCfvvk41FoBjJyVYo1AmkEAB1eJLDOAlnyifvgXBWmrRkOT/Hh101m1kJC/UIciW2lQAV/g05qDLitsKZSpufNP0Db3SkTkfxKswHlprD09QwkJJ2l/eAuTzBDkY3RlaGAa4wdeWExFX46Xx2xwYwC3dQal/GneXc34yXFERLfQbzOAWsDD98aXz72E4CtP80l+42MppVorB+o2PjeozuPf2l0/imGZ+hLiIIanr2mpFobzfNHy3vDPTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(8676002)(4326008)(6486002)(6506007)(6512007)(38100700002)(26005)(8936002)(110136005)(478600001)(66476007)(66946007)(66556008)(316002)(41300700001)(2616005)(5660300002)(2906002)(38350700002)(2013699003)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i0+Uf3QvZqwSTuxmZ4DmCppdcR1hC7vbsgxML6Uy0vLS1VDU/c1usFkJ3J6W?=
 =?us-ascii?Q?joo5xovhdQED+1HZ3mjvqmBQeHQLg2tLcPkPk3BR9orzuWy3K4OFhoh6gPZA?=
 =?us-ascii?Q?gCo/IBST7GNkgGCW7145JX2fV//GMtLbAQFUV8qBg5BRCjLPiIofwKyqcsvz?=
 =?us-ascii?Q?9hQPsLbBYtO4csGzYNOXdMFtcnhdg1majiN6uW439tMIyXi38VRzTHzSL/Ip?=
 =?us-ascii?Q?Hg+ylWHCrel2z1oM7rdgpoyFRKQNxBHrcFd9ICW0g6409ewxcrm4/EBAX3Ea?=
 =?us-ascii?Q?jBbE/7VSZNH+sRCBUAwNYnEwXE52ktxmcx+T2XsO9zxgGb93z2XJI1o7L2aF?=
 =?us-ascii?Q?RHVkFk86dPlK9tyMAt9X8dIRrFDayG34rXaWfcDvYvr0whHvQb9GpEY4mBoY?=
 =?us-ascii?Q?7+YnLkkULrlVxrdWCwss0QmG1+/Yh3HVOGWBQGKS5seiig0P/l3N9poAJEw+?=
 =?us-ascii?Q?OqhfH04i1h2UGgLXLAJ6Ud6fkQYSCk6arPahMGXEWDmHK1L6pBQ2grNJqSNB?=
 =?us-ascii?Q?mtjfhONJlGE+SUwPxzfq+NkBwKXVIzMS7ziXTuzp6flFOjShVdQPuc4clVjW?=
 =?us-ascii?Q?zA+/h3lWOiyiZU99I0l5T/dOFj3PAHbfpS0d35fO60FIXytIo67rI+fIR+xR?=
 =?us-ascii?Q?bNPnX98C949pVM7E6nuQ5MKgd51rHreW9C8KutD+cpB5uXXeIdEOl+/4otwU?=
 =?us-ascii?Q?/Fto0NDDpPWJ6h/hwSqD8WfJifrUtvr2C/WH1H6UYQVNsjF89gPwRcPib/QD?=
 =?us-ascii?Q?5TES4SDRxeBLcFtBCIzQkEEKYgsMLCYgcjwQmRMRTb6hxPR2NXN0Ov96TE3a?=
 =?us-ascii?Q?cC87mEte47+muvQ5ovjZBaSXYKepCy2FXp8g3puPLmtX3RsNH/Lz41yqb343?=
 =?us-ascii?Q?MP6sdmiGs4jWmnS8dFc8JCQ6jzbRXYsgHbI+CHj+hDY3G6smtk+nP/96JEDX?=
 =?us-ascii?Q?m3x77z83NS5PvJcPZ6r3gWMfZ967vDi+nw7hHixioJP0ZDa5GtDlLa2/GRFo?=
 =?us-ascii?Q?cRJzjlD0pAOpOZQ+U4M84a86Njzn1NPWEElfBTU4rwTze7sny/RovsB1CUA1?=
 =?us-ascii?Q?m0UY/xjxf1GgxZs2F4wq2QTSiH+sqb0oQM9N1y1tvGPVAcGYrBL4u9j2h6On?=
 =?us-ascii?Q?rJvrArmuS/rcKjM5O6IMukOlt6xwMvyx5GDNr+hHpSiOH/oga7WRmX3dNcPR?=
 =?us-ascii?Q?R4P9OV22i155tQ0n/9ZFFrII+ZkYax0FJgSEJQnRTcJNK8RVEqqpNd53Kp2E?=
 =?us-ascii?Q?LLdxDBdX94g1OZq6QSkHSJq5twhzQdWkpzAebh/hXYZPK8IHW2wFrcT1hzvk?=
 =?us-ascii?Q?RztX/nWFk4vhbfoY9kJr3bJy3J6QHEvBckNkiKIjf8EFKgsz05+2l+FaMZIV?=
 =?us-ascii?Q?D/kLZkYPcstPytfeadIqet/3njRO9TJVcyzDmJiFkkIZzPXhdzBbIpuZ0lOk?=
 =?us-ascii?Q?keLI/9z+XV1BajWLoKD2nsGYrr4BBwRJBF3EWpV875WG4ZIigPTbqHUetTby?=
 =?us-ascii?Q?zkz7iUsAEj+9u4eY1tlRREsa/GWOQ0RQTQveRUI/1rOnq2fyKfhsyM8vn7b5?=
 =?us-ascii?Q?FTCk9VUynlVFJQMKQJNKnYTtl812/ue0AclTFmVTH7P1KT6une/6cieJZwfN?=
 =?us-ascii?Q?fh7QVSOnfNPFKoIZZMojbXE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62ae42c4-fa05-4828-a87b-08dbcac309a5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:32:04.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B67h5SBsPGGNnTstVrCW0egX92+3S0pBsdsFglmCJjfuGIIrviuo6HtWAOW97dtKghVw8Vqk2zWwkifOg/RNjtN+YuvvkorFV3eIccB7OXDdBghIwJQgCKAuNhvGvfAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
Message-ID-Hash: CDTN63QCUHLN7NMTEDNBESHQFL67TXAL
X-Message-ID-Hash: CDTN63QCUHLN7NMTEDNBESHQFL67TXAL
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDTN63QCUHLN7NMTEDNBESHQFL67TXAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU:Codec = N:M support.
This patch enables it on Audio Graph Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5d856942bcae..bd65e7a19350 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -515,7 +515,10 @@ static int graph_parse_node(struct simple_util_priv *priv,
 	int ret = 0;
 
 	if (graph_lnk_is_multi(port)) {
+		struct device_node *ports = of_get_parent(port);
 		int idx;
+		int num;
+		char *props = "ch-maps";
 
 		of_node_get(port);
 
@@ -530,6 +533,32 @@ static int graph_parse_node(struct simple_util_priv *priv,
 			if (ret < 0)
 				break;
 		}
+
+		/* read "ch-maps" property if exist */
+		num = of_property_count_elems_of_size(ports, props, sizeof(u32));
+		if (num > 0) {
+			struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+			struct device *dev = simple_priv_to_dev(priv);
+			struct snd_soc_dai_link_ch_map *ch_maps = devm_kcalloc(dev, num, sizeof(*ch_maps), GFP_KERNEL);
+			int *temp = devm_kcalloc(dev, num, sizeof(int), GFP_KERNEL);
+			int i;
+
+			if (!ch_maps || !temp) {
+				ret = -ENOMEM;
+				goto multi_end;
+			}
+
+			ret = of_property_read_u32_array(ports, props, temp, num);
+			if (ret < 0)
+				goto multi_end;
+
+			dai_link->ch_maps = ch_maps;
+			for (i = 0; i < num; i++)
+				dai_link->ch_maps[i].connected_node = temp[i];
+multi_end:
+			devm_kfree(dev, temp);
+		}
+		of_node_put(ports);
 	} else {
 		/* Single CPU / Codec */
 		ep = port_to_endpoint(port);
-- 
2.25.1

