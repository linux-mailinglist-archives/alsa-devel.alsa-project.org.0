Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E85B676B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 07:38:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1101719;
	Tue, 13 Sep 2022 07:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1101719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663047485;
	bh=ly42LUAX34OkHe4baUFHtHv4AErxLfMk+ciNR96F4p8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iv+/zZlYFOwI7U9Nfq0sy+cfs0cJyJ1GiUvB/lcCfo6uIQ9Or32A65ymMgD8FsR0i
	 S3Nt3Ei1o24B8OwhEw/aJxlS6EHlOXOy30w77DsrBmnkH8DLUfp+bL/6UmwIu6Dzy/
	 4d5MMYw1uBAF+hl64snHzsQ7jCJExy4OeNhGSLEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434CAF800FE;
	Tue, 13 Sep 2022 07:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAD3F80224; Tue, 13 Sep 2022 07:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4ECDF80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4ECDF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="SRAQTX1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFkrqAM+8CVMoEp/9N7T/o0J9lySR2swGhuh8p3xW+lI5i+rRDe57YLLw6yhFGkRfyd6s39iyUqcTOZ1JbKsefKXHPlOwWqhjvtUx0KPUGN8dXJcGLnL8hPFtFSj7yjTJCGMGEE3G/kzj4Fm+T/3pOnhxYjYBtOQGi+nsuDeKhOBS6qWdiSmp/S9J4GIEQU4okFxfeyklK9H2491IkYUgbG0mpiidGk0gOzkuKfSZ06whLl9o49pvxeSyL9OPpO72Wgrcoj3p445p1I0JThWZawI+ZXxB+bC3lfXDXaOuK5O4Njh6mENQ3rebl5VoBCen7DZjdG8iXmu5RJTYHtAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wPMQiL0VI4RqX9OM083O0bTGh+OfpcHnf3AuXuFFBY=;
 b=dqD1eemhILfjN/CrDJWe8Y2ZdHVWB6hXtKq6G11iPyUJ/zbVO5RGPUwB7iDXf5msGbyxPJwS3g7u8gxekKtk4ziwn8vY7q2vcwvRZVuMEYV3/LhRApiBGZ+5pfmmXO4FyeL4/S1XT7AvR3Dgo9bnuqiy2fTwVOYLKtm8YPSgOTGMJ3is1vNfFeiACRMxYUZY8N6bcPs9RRzmQReHhqOiOyv6Og+Dz35ONAEkr85VrQKadeu+lawaAWtFrSEreDkulboe6am1fnTs3/wVTMIZ/kassEKLKGR1WfpbknNSMP6fFvLRG6cHuHdrCFuXUrua1tHMrHgXh4x0RrmR5T0xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wPMQiL0VI4RqX9OM083O0bTGh+OfpcHnf3AuXuFFBY=;
 b=SRAQTX1FtoDjMv+CHFhOXOZDv6RfRkqM6U5i+mV4AxamE+kZlB2Qgym+QjIEfEeJA7QeSFzk3TLskGtTxNJr8GVAh7BunOuDhd5v0DaQV3kyNYGpDUCWbqQ6GYOYy1CLyrSUA6L+35tKbfi108vLSR9PiunA8vX59lQuEqPsDR9KbGVLAhQfgWZKjtw7TN1LxJRUotBFExiAOVhBXTQYJx49gR26ghh28DA5ugr1yQFnsDPkAdf+nZV3wIvESSL2EbWxR8m4ERHumh8ThLnYEvq0Ie/+TcmF1I6UX5nyDJXjWKAWph+WT1Rx58UqZ4zCeDHOCWUllhnubTPZlVimzw==
Received: from MW2PR2101CA0015.namprd21.prod.outlook.com (2603:10b6:302:1::28)
 by MN0PR12MB6344.namprd12.prod.outlook.com (2603:10b6:208:3d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Tue, 13 Sep
 2022 05:36:47 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::85) by MW2PR2101CA0015.outlook.office365.com
 (2603:10b6:302:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.4 via Frontend
 Transport; Tue, 13 Sep 2022 05:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 05:36:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38;
 Tue, 13 Sep 2022 05:36:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 22:36:45 -0700
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Mon, 12 Sep 2022 22:36:43 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <thierry.reding@gmail.com>
Subject: [PATCH] ALSA: hda/tegra: set depop delay for tegra
Date: Tue, 13 Sep 2022 11:06:41 +0530
Message-ID: <20220913053641.23299-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|MN0PR12MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 20753624-a6c4-45dc-0890-08da9549f31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWh5sA4cquPCKEmcJptFzNfOfmFrxW/t4lMwc5Eb/3kd6V3NmrkJ/4ob6wIt+j2t4JAiCBLOto9mW8Hx39GelMdzgSFIKKuU91WvlBsnacN8lWEeBBJMt752iew3Ni6SkGhIUdTlkV681X2Sgcn7idQ9sZQUZfP1OB87KRjIAyC0qegl8Nf3LtenmlJ7HwQ5hY+++kPbnAxJPfbY/QVEE7KqCCV7Xs5OHQH0lgBib5Q39J0S+mfBgtf6Mt0KJ9JxCa+X16HkkNZaTUT36iT1Ks4WAkatIjueKEwjks7cd/ZfeNHNbRNhCunBp6VXG+TqW7EJzrwhR3DyVPLk0Vn9Xg+/BUUNcZXvJdfHvEzalcIrNTswFCBzC6myGKLzsnLmrSOqk2s+nL7RBM6MBis6mnyKBcL7egKGI9qIfxJSh5l4Ye5BUxWr1y5bKxaJT2QMEihKsQjtCc1p8DJ9v+1vrTqsVU9VdvBOUW75R73UfaVzocXXobkUC9e354o46ZbMH9baQ+hx8eEUKMCfWOGbZg5qCMP66kIpc2my06Jn0/nYQ+Me/i7yLwtCxsVff2tLgxgIrQ5wNbSwEFtqj1K5wUeAAsaPrfs2C/f6QMzV5WaiDM+UcWx2xinbfmGtTk9nqfS6J+4i8upj12clZZMGrG9V8XPcvHsUdc4kszgRo9lebAi4/Jq4snLeC5MjU65QvLY7XFAxt3F2pMKiBJLKm3yK45pBcnzAey5iB4y0j/hWLr3LjTyQHFbOaLrg+1flFShrTLBjsPvsq3mG8IgbKlcmCXs9yNkBZHhKV9Y/ngBlF8/KZZIDg5id2q1rN03A
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(40460700003)(426003)(4326008)(26005)(83380400001)(107886003)(356005)(8936002)(36860700001)(40480700001)(81166007)(47076005)(186003)(1076003)(336012)(2616005)(316002)(8676002)(110136005)(478600001)(70206006)(36756003)(70586007)(82310400005)(86362001)(5660300002)(54906003)(82740400003)(4744005)(2906002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 05:36:46.8973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20753624-a6c4-45dc-0890-08da9549f31a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6344
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>,
 jonathanh@nvidia.com
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

Reduce the suspend time by setting depop delay to 10ms for
tegra.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 6c209cd26c0c..acaf6b790ee1 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3984,6 +3984,7 @@ static int tegra_hdmi_init(struct hda_codec *codec)
 
 	generic_hdmi_init_per_pins(codec);
 
+	codec->depop_delay = 10;
 	codec->patch_ops.build_pcms = tegra_hdmi_build_pcms;
 	spec->chmap.ops.chmap_cea_alloc_validate_get_type =
 		nvhdmi_chmap_cea_alloc_validate_get_type;
-- 
2.17.1

