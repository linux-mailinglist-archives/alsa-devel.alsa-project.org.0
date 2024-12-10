Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC239EAB7F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 10:11:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB99E86F;
	Tue, 10 Dec 2024 10:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB99E86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733821877;
	bh=tSD/racOr4Ptiew00UVe7o0KFX0pRtuy2BV8JmTuPBo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E4AZOcGvw/YvPdmqZuQUorxPaq1GmtjfoVYS9BsApfIfLR3peLd8Et0DtWbQQgJZt
	 gbKz3HemyoQOICz2EsUI6NNi9H6fuoM6a1AAo5STK/bUIgpgnPv/kMbFY7TZ83SY7I
	 dAJz8U1Xz+RPzQF4+a7+1PjjB03YMedyNG3sWZ4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2FA8F805C8; Tue, 10 Dec 2024 10:10:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0B8F805AA;
	Tue, 10 Dec 2024 10:10:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F06AAF80482; Tue, 10 Dec 2024 10:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D45D0F8032D
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 10:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45D0F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vejiAXMT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUzUB/TsRBRJszi3BLB5xKmRb1whBofiP0Xl7c+/o3raxFahQ6BU/GuG9WDmkg1iEsDUYd6jTAWwtggNaB5TMe7sTjVa5DzSW7bb+rdXMh/dQ5f4KfLb59phUvXyMkUPIMIlFKAVLKwfh6/TsPVQfTLRaLCdQxQ8FF2Q9Xioc96n5lEmNmN8v7QuAZWgqmFGWXgfVUnzGzQhX2peR8UoDSXmYCu9z0+EK6sdt7M2d54tcLbv0TYauV02vpqS6R92SeJGVGHOUk6ssHNqBZcdv3LZj9LAJaGPlI8SfOT3+F2QIr7zeZjcPMWTlAH13CpKuduzuEBuTTBenN7WkSSx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dtrbk0o8U/On/f50cCUZV62/zHnxt1mGIaP+8TgXlZo=;
 b=vbA7oXAsXYoebm/JpdePHrnky1E4wECaBoZ9DZdcEUNmZNoWMda3VEnHfz7aYtKhr9FoNC6XUFC+PNbZrxCEJcT5ofA4F89StUvQqJMwx4dFEit7ksyISoTvmLfXSWethHd/KkrQ9eKWcriTUth2Ak4wVfSqjyWhEVi6WXzN5a8pumAWqfNvHH8oSUzMyvrY/3Xo4sgqRPXtQSnYVEf9+sZYOinJXPcL4cmxqTaYburcgct7KSnPRHZRosue7cyqWMLxvNFlrE17EW4j/4NXQSTQKldlM7EPNGON7g4/zKvfViEtaQybtrLVwUqrqDMkNp25Dhwoo4kTMhaOFI17gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dtrbk0o8U/On/f50cCUZV62/zHnxt1mGIaP+8TgXlZo=;
 b=vejiAXMT1iSCXY4rFUzhcjQWcnh5ujBrg2QW9UKxCZYQu3aSE5k9i7XWVdJp/az06vj8uuskacLIqfwYn+QHhVi4oozaGIO1xsPI+pnuzMrGpOJU3WDyA7gePEsKbqplkjknWzXRjErw8ornGKQxIbgioA4TJGfRMEsLJR3l3eA=
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Tue, 10 Dec
 2024 09:10:32 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::d0) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Tue,
 10 Dec 2024 09:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 09:10:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:10:30 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 03:10:26 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, end.to.start
	<end.to.start@mail.ru>, Jiawei Wang <me@jwang.link>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC: amd: yc: Fix the wrong return value
Date: Tue, 10 Dec 2024 14:40:25 +0530
Message-ID: <20241210091026.996860-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: bfae834c-6f8e-433c-0b78-08dd18fa7f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5j9iraV02Cinz6Ghg04uWBF5Fm63/31Z4hDQvOED6mWYCazISgTW1RnvboSw?=
 =?us-ascii?Q?YSiGF0AtgnP3EPnPk0E+PJ+ABkwSUWeKeA5l8XBuZ4cgpSEwHjm//L2TUmg+?=
 =?us-ascii?Q?72SjSdFIRUPrwAgZ+q/t/3ictFc+azIBybsnlkngGD+srxLfxB72nfzdydvt?=
 =?us-ascii?Q?jnBgrLKBxP6oeCRVqYFfypMJY1RHhGWvPPGbHkt6SQb0Ku8ub9rIphcaHgyB?=
 =?us-ascii?Q?8Y5i+f72akD2lAul8YEiu1eiALsBhUx4UxZF8Qj/pCZ4JIsPuS/Jl3MIs6h6?=
 =?us-ascii?Q?f+oigE7HxYlFGfq7dapL+1aeBxyzt5Ar7ElqV5awiUaQM0qm6f1rgRUS/8bQ?=
 =?us-ascii?Q?kNa3fcdK+l+VSaEyB16MCnTlpBKpLHYWEI46GNmfkMvSDBahTi1ejHnvSmGy?=
 =?us-ascii?Q?v+xd2bLf3kU6Xxl626KvmkOcPFassdyNeY6BziYAzNmXb1bdOQGT2ruwJlos?=
 =?us-ascii?Q?IzVnk/Z20Gw1l7fCi7XTkGkQveANo1MhGyiwbanbE+lVp6RHlIr5JQx0gFUr?=
 =?us-ascii?Q?poTiMpTCWKAWTzGxo0/upxPkHj3KlWWEJrx5CSDj1ithaAp2CcNZnbB2Efjm?=
 =?us-ascii?Q?ffXdo2kENXoYwGtoya6WVOa6LeIkKzt3do1Wib8KyiqWZS5TVPgoV8U4rxR9?=
 =?us-ascii?Q?d9f16RNyRPqw4MYvcSlnmPfEidU2JDw/NvxMNYE0S1o3UR+DEF7V3hHEge3Q?=
 =?us-ascii?Q?uFspnXn5OIof+Pq6At0B0PXIUN98pWGSC+Fc+yBeEr2gOedWLzZa0AeJfFyX?=
 =?us-ascii?Q?D2hWE8qdiGjB4nKVVFgPrMDE5PMPjIJh4wqeVSBbLfGldwaTj4cq/ShR4nLU?=
 =?us-ascii?Q?JpU9PIFiYJsntLpxVWKdg49JXnKm580vNlcZl4350tnHGaz55wYgQKf6KKUq?=
 =?us-ascii?Q?zjzTq2pj33UM7ImO509cfTOuOqUyGd4CtCgpdXJd/s91TU9kXeC0VuwfyDg1?=
 =?us-ascii?Q?pngpAvEvtG8nDZAZkiGdM0gKL9+BYyaOYRoWW+ga2pFjhI3NwZr1RxNsMWTH?=
 =?us-ascii?Q?EgMyEL1/o0Aa90KdiSgPV0u9YIbS+g3Wxf9tzsd5J026p8io78UOoTCCHRVH?=
 =?us-ascii?Q?9qTzIOyEwTrcazciHqfjJlljJ4KzUJtrbfGLKiHpw8qHXeoIUnldK7AKIcDJ?=
 =?us-ascii?Q?ouKdYYMmx3JaMu4KxI1EPERq4talHu2VPQXAY9AFgy8IrglRr+kj3T2GPaZp?=
 =?us-ascii?Q?AkIQ58w8pb8sY19D0Ucqwk9/Ax/a9/iT4f4N3bJT0knQdBwMYVUJBRtVPrRB?=
 =?us-ascii?Q?pZlDIiLchIuaAzlbUEI1oyFpWIhUrz8AwFzZxYo1RccQ5ZmRjqqzCKsTB3cA?=
 =?us-ascii?Q?rXKwcyS13giS7trBzkc2wNGNO19h4J9R3U+ZhwCQZOidmWJtlFHQQLZlN3r+?=
 =?us-ascii?Q?TDr9Z6Nn0eKZaLN+0ZeON3JXGvfj17pAEbpG9CWRAAUYXB820g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:10:31.6583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfae834c-6f8e-433c-0b78-08dd18fa7f9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177
Message-ID-Hash: OLJ77CTYSLHYTZJ4GHHIXY6C355Z4TUL
X-Message-ID-Hash: OLJ77CTYSLHYTZJ4GHHIXY6C355Z4TUL
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLJ77CTYSLHYTZJ4GHHIXY6C355Z4TUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the current implementation, when ACP driver fails to read
ACPI _WOV entry then the DMI overrides code won't invoke,
may cause regressions for some BIOS versions.

Add a condition check to jump to check the DMI entries incase of
ACP driver fail to read ACPI _WOV method.

Fixes: 4095cf872084 (ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry)

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---

Changes since v1:
	- removed redundant "&& wov_en" check

 sound/soc/amd/yc/acp6x-mach.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e38c5885dadf..ecf57a6cb7c3 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -578,14 +578,19 @@ static int acp6x_probe(struct platform_device *pdev)
 
 	handle = ACPI_HANDLE(pdev->dev.parent);
 	ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
-	if (!ACPI_FAILURE(ret))
+	if (!ACPI_FAILURE(ret)) {
 		wov_en = dmic_status;
+		if (!wov_en)
+			return -ENODEV;
+	} else {
+		/* Incase of ACPI method read failure then jump to check_dmi_entry */
+		goto check_dmi_entry;
+	}
 
-	if (is_dmic_enable && wov_en)
+	if (is_dmic_enable)
 		platform_set_drvdata(pdev, &acp6x_card);
-	else
-		return 0;
 
+check_dmi_entry:
 	/* check for any DMI overrides */
 	dmi_id = dmi_first_match(yc_acp_quirk_table);
 	if (dmi_id)
-- 
2.25.1

