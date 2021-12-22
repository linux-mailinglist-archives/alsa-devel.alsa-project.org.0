Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2D47CC41
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 05:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F15A17DE;
	Wed, 22 Dec 2021 05:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F15A17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640147872;
	bh=ctAlVQVMZbdUCjY1Z7sNnK171dc6UO3P6Ld1n5pRb48=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaADYorqgppeQBhAkiknXV0jeVk0ORyMEQes5aQrlShkTQzrwiwARQYaqGNOIA7ZD
	 8UHnHZ+rN0Vbm9uRYviEydYGivGJnXutKReTqsjZBNdTAtMqoXXwUSotytDWO45KvC
	 FHkzTpZOdL7BtyXU8fG25TMLNulYky/U9g+q9h8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C783F804FE;
	Wed, 22 Dec 2021 05:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 196FBF804EB; Wed, 22 Dec 2021 05:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8EEBF804E4
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 05:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8EEBF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="l9k1lEVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEUqTIPsBLd3GWnOCZ5c1rXg7d3LUEiQ3OgOYW5Smr8XLn4fsCPPYda2uwztoxU3dY5bYD48PWXZtJikFkUMbRaS2JzTgTqRoiLzESXNOw4gdEJJP2Zz5fc/wrKBxjWRIalwkbV1nOVkbYSi8lBcoDeOJDNNlPrOlTrFaR7fOT2AqMfJdIzNbJ7yuv2Y+DhtZGvZSaWiQl4ayfiVm1UXOWlOVREcfHgU62YBDEjp1NhefmiS7mr3aBjhoelInBw0W+nasrDouxFW8zaHF5R37Ob1Yo8IbvvJ9slVJUtW64UfQgoh2U/aar1itM/adMh6tYoxY9wczFTDzPBBO7LWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx1z94/eQX7pUUCiHIMemZM8n7EoQkFkT+8DjLx6RXE=;
 b=c91eRrX150naldLFm730Z+6S3F3q0YvZiBgQmT1V1OyLB0WfWdCUe/tQGpsT4FckAbwaNFkrQLCs1lfPONVz16BqaKu+EhnZIDfhBGNmviaSoQYmTu38E9pKtZvqhyVo+iBcIWn2obSAyOzxT6yo3tr1NK79RFKupUiKIdRdGb4nftF/QWow7FythhE3tMkon4zsQDBh2LNynLLKl90g3N+SzZGjUJoFWqusU99olU9KpvPCqNtYuohjbErTK3nOTQqoV3AqJAH48xdpXWfPjHAVLwe/8LWEveocCkWwZp1v5lamxks6GK09d8GVpvneXFK/Fu+MiwruTCycFu9UNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx1z94/eQX7pUUCiHIMemZM8n7EoQkFkT+8DjLx6RXE=;
 b=l9k1lEVj9kB6s3e9ADzm36VaRl5iIku49LhQnsUVzwt0M0ZD8BU3P8zz3C6h+nIn8OeVWVpbPlXrCapFfrRKiIsyMnHru86a9giIplFOgoTDr73OYCKGPUVVcF+8NoxGnS2UJc3KzCqIMcRPk2rizwHHiumZLWeEauVhtOF5sl3vsEGJ+sPDpSKZEZWNv4bcTfOaKaShoqZaTSYpn8pb9Jjq2QW39Xf7MCqS/oCQqv6cvwAxxTiYc8jjn7o5UsCGRdjzzeFHb4kZNeyKdVHHMqe6P6M7NoV3BaAfUI1CXCvxcLCof8M3z0WAfC60Q5WoUBELyWt2e9Qu3tWkJ440cg==
Received: from DM3PR12CA0115.namprd12.prod.outlook.com (2603:10b6:0:51::11) by
 DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.16; Wed, 22 Dec 2021 04:36:08 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::9b) by DM3PR12CA0115.outlook.office365.com
 (2603:10b6:0:51::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.16 via Frontend
 Transport; Wed, 22 Dec 2021 04:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 04:36:08 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 22 Dec 2021 04:36:07 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 22 Dec
 2021 04:36:07 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 22 Dec 2021 04:36:03 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH v3 2/3] dt-bindings: sound: tegra: Update HDA resets
Date: Wed, 22 Dec 2021 10:05:50 +0530
Message-ID: <1640147751-4777-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640147751-4777-1-git-send-email-spujar@nvidia.com>
References: <1640147751-4777-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5086394a-4f8a-4b5a-764d-08d9c50492fa
X-MS-TrafficTypeDiagnostic: DM6PR12MB4337:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4337B6FE5F9C5708881DF37AA77D9@DM6PR12MB4337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvA0YH0qYSTdohIebFUBJBda4q9KxOaQPj9t+soEFJcf27Kzi51MQlMpg6RcWnBxBL0Hzn4WENAgxs2Z3twk91xpZtkJMSz+MfkUBb1+AhYwvVUrACwOR1kgD3MbNzhg8mAkZquLUA9hVwOt+eAIuJbJDvipaW+4K2VTPowgiZ5sfNns7CIODnWsqrh+/HAr1nV7drIdvi0F5zkMAtLCuZpZK8JXrFv/IIhmrSoNK6Y20ykXY+XCrSBHcbS/ZofLCl+swUl11qNHHtLfonP69kR4CETgxCD+BglnNvzSfoD6EI0WmYZhRWD/2iY31x45hUf+pHaVRjyQTKbpstspOi9FxfgVuYHgav401kCUN/jp0T6yAmS2OuPcNWePBq6YmYBHG9QQbQ6dyhkF0V5HIPQZ0zZguQVfug8KvS5PsZHO/ylLKoBaKppmpeyS1C6EFpM2BfHGoxbbW/QO5PafSPeFtHcg0BbDESY9WVC/O1M6iO49bkfkP6wU85cuegGIJQuawaD7zM2Y70vPkeR8CDkQcXZ7LrlnEqlz8gJ4SYLTDcgm5LCE6CWOm4bj9D+c7lP2sO0CwZTdM+vwKN61774HR5dVCL+LrEBMmoI+7a5MsRUKwPRQGLPQbr6queQpl/sXaLFuAyVNp/SaxkIw36cb1qQT05bhZWQ26IEXWC3Y/fxX7hi3QHrhkWCZ5bkANixppEpn1kTXl92Trvn+g5LUGsuCXkGr9g+3ilCnRYGKxs6As74+SW1go2URdt39Wo+uyj/pDdTOOsvjmWS/D2UbVo7N1l5HvYxxY6uBfxI2doM7k/1cShMR8TF1lh604UbiwHdt4sQEp9atjyOZjg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(36756003)(15650500001)(336012)(70206006)(426003)(4326008)(7416002)(4744005)(2616005)(107886003)(2906002)(316002)(36860700001)(5660300002)(83380400001)(6666004)(110136005)(86362001)(54906003)(186003)(26005)(508600001)(356005)(81166007)(7696005)(82310400004)(40460700001)(34020700004)(8676002)(70586007)(47076005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 04:36:08.4658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5086394a-4f8a-4b5a-764d-08d9c50492fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 mkumard@nvidia.com
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

Tegra194 HDA has only two resets unlike the previous generations of
Tegra SoCs. Hence update the reset list accordingly.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index b55775e..70dbdff5 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -50,13 +50,18 @@ properties:
       - const: hda2codec_2x
 
   resets:
+    minItems: 2
     maxItems: 3
 
   reset-names:
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    oneOf:
+      - items:
+          - const: hda
+          - const: hda2hdmi
+          - const: hda2codec_2x
+      - items:
+          - const: hda
+          - const: hda2hdmi
 
   power-domains:
     maxItems: 1
-- 
2.7.4

