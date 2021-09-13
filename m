Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7574099CA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE9117AC;
	Mon, 13 Sep 2021 18:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE9117AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551530;
	bh=JzDhJtBHC7OOX9hnmsZiixAyRQCTluEdOkMvuizdl5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3cDI+7epjbT6BvwI7LJiOyD+jm6ezKfBfR/IhDMcEMw1OQC7oNio1vTlOTUQ5gWw
	 GvMRW+wGnlVqcO3UtRGdO/9Ec7VJiYvGGWdNd95ptu8aaDMameWPo3FPeWuDlOt66n
	 Q1ef1JNhyAF9AD3LAaEhwL0Io0kBwTa9eMGONzaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F75F804FA;
	Mon, 13 Sep 2021 18:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B61AF804EC; Mon, 13 Sep 2021 18:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEB5AF804E2
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB5AF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ogDdAVkW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZJ9PIwrUiTDyvJtarHTVapWJ1nNJ/GYMSE5MfUAaSWVIwQ6oUWhy8spIh13AKG0q35CrPBtWGxx9tYrPgl2d99AhynqLz5+q66blWGPR7vTcJZ5DLxScLXgNYhFrqMjgVQDCbtRMXuTe8QD/qk2iNOJi1XKhv+mrqSyNWe1yk3DilysOYQooIy8DCD2YYLXb9PUfYBoGyvIObrrWa4mNBO4jUXH/nM4bFFbfgS4Ix982rk/bXkeo4r743RyFDjfMZBp7dvI9yOO2psph7CX+qYVjn1/LZu5WLVi5NQ1pRIkcOYWgzwlO/EMcDhFFZNcUQCkQda9KCwWRNnXZxySvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0cJe5Zeo6pcj8Wrq63BMwb21KHimTrNddDCZ2OMHicQ=;
 b=CQ1+Lo6zcwgy9x4D2smRUKoTVgTIgRwEcqqdXa/CMZDyodGcmyFQjMqFaqS2vcxYPPZiJ6ZGU94VkmLl1GSGlI6Sa+P5v08fhTZfER4/VinH4gG+P15OX3RAsoFuElevb+xq0YeXbER/P+d8YtofqYBwIB2sV8VBd4AJ2SXiwfBvcHJXwdK22jGhb4Ox4d8lOfC5eprdIlJ3VMR4kXf2k+FhZEX200Nca25U8MDm3ACVY+pL1BFUPXTWd2oi6BV68WMcjjAOg6vwf8FzhMQGTcdaQUCith456XB+5hQK44kOo2vwGPxKlt4j9sYFEzxX2ukM9NLmr7+B4Biwg3+qqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 216.228.112.34)
 smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=nvidia.com; dmarc=temperror action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cJe5Zeo6pcj8Wrq63BMwb21KHimTrNddDCZ2OMHicQ=;
 b=ogDdAVkWajJXDNYX+KhCJRf+KtSa7xInPDDiqMUOqBydQfnVox3SMFHF+xNdMlJOfVgWFyCAy9PiN7v/hrsH0XkSVw4fnulwmmpU0UtVJC9jM98dYolsNYB4QtvDD1lLdO9h1TAEccpl+UBAy2Z5BnrNPJEb8lP8xSpEG1ej4XudFuAeVfd5pTa+RiglUGhTWXSv5VGrp5d+tSU3FsNtD8z+SoWGhlgXH2oGStmYVpNHjmDb0QBwwgWPsoved/VUUpKcHq0cubVycXYHiwuoh0oMdvXSvCFQOd8Wg/aX1SYDrrWNsTIqbkL6CWFIppELCrqNqsgcw/NITxLWT848pw==
Received: from BN6PR19CA0050.namprd19.prod.outlook.com (2603:10b6:404:e3::12)
 by DM4PR12MB5118.namprd12.prod.outlook.com (2603:10b6:5:391::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:42:57 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:e3:cafe::c6) by BN6PR19CA0050.outlook.office365.com
 (2603:10b6:404:e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 216.228.112.34) smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none
 (message not signed) header.d=none;alsa-project.org; dmarc=temperror
 action=none header.from=nvidia.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nvidia.com: DNS Timeout)
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:42:56 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:42:55 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:51 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/13] ASoC: audio-graph: Fixup CPU endpoint hw_params in a
 BE<->BE link
Date: Mon, 13 Sep 2021 22:12:11 +0530
Message-ID: <1631551342-25469-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34742146-34c5-4b69-7a35-08d976d58a1e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5118:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5118D34A8DA862D8A78753E9A7D99@DM4PR12MB5118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBjOp0jZDln1mRjRZhrkq8rDhxvIJ78gf9UxoH+KUTV3NkeC9hCM0cFaufXoPIjtUL8bqEmB54sNbVyLlY6WheGA5N9irddo1SmWAQjLR2QyrpOO6uyeZAEx4NSefLw7D1tiztFZtkfcj+2aFT3VwmetJBcprYM6TLj3Ta0tA4zeEGUpbRsfvsd0or4V+GDnVXXKucGQ1eB+WCIzGtBiXqYsKaZxcCjPjWcRy1jbUOkN3dh6YA5CqB64ovf5UT2PVUDSPslvhvLq1SFfwA9JojkH7ACe+ABL0v65EQTTwbh7rXTOv1I7Se7BfvMSUW5Jlf7hYQOXWgWgUaKHI2sYo9S8iNMww4aPxZmFrujSkVnhnAnkMy6v+SRdtto67qYaAfuhxYKY/+gzfK0SB/1d7UX6tKHC+VzK6akatot+gQQBVDshfTiCAOOIMVhmnq+fp85KqjkZSsU525QLRrxtu5Slo9jFUBod+raArtXQ63QnMfN5+RNafAdIDmr9pnOXVLYmqMew99K8uZQD5z6t5uq17aseN2rxEqpMmt2TrLzY71s0oprOGHDGKxlGAINcusVPT2DqTzAkb7da8don5NqAWoyuDSBYMN+MNW+zoRxA/aacIys0Newt6EpQ5dVgjYQjgA5jSgiaqcqP8TZ0uSlgvLgqgt4jwaFm1SjxlkzoaE8hMv/6Iy959nMdPBpANAg0HcWmmsG4jA+TNQyZnBsFMr+ULR1HbnFlAh795z8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(107886003)(26005)(8936002)(7696005)(47076005)(8676002)(4326008)(82310400003)(336012)(7416002)(426003)(36860700001)(63370400001)(5660300002)(6666004)(70206006)(70586007)(2616005)(63350400001)(86362001)(36906005)(2906002)(508600001)(316002)(110136005)(54906003)(7636003)(83380400001)(921005)(36756003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:42:56.5301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34742146-34c5-4b69-7a35-08d976d58a1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5118
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When multiple components are connected back to back in an audio path,
hw_param fixup may be required for CPU or Codec endpoint of BE<->BE
DAI links. Currently fixup support is available for Codec and this
commit adds similar feature for CPU endpoint of a BE<->BE link.

For example a resampler component can be plugged into an audio path.
  [ FE -> BE1 -> ... -> resampler -> ... BEn ]

The resampler DAI links can be:
  BEx (CPU)              -> resampler input (Codec)
  resampler output (CPU) -> BEy (Codec)

Thus input and output sample rate parameters for resampler can be
fixed up as per the resample requirement.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 546f6fd..7eb0272 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -310,8 +310,10 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		 * For example: FE <-> BE1 <-> BE2 <-> ... <-> BEn where
 		 * there are 'n' BE components in the path.
 		 */
-		if (card->component_chaining && !soc_component_is_pcm(cpus))
+		if (card->component_chaining && !soc_component_is_pcm(cpus)) {
 			dai_link->no_pcm = 1;
+			dai_link->be_hw_params_fixup = asoc_simple_be_hw_params_fixup;
+		}
 
 		asoc_simple_canonicalize_cpu(cpus, is_single_links);
 		asoc_simple_canonicalize_platform(platforms, cpus);
-- 
2.7.4

