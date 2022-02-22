Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E04BF1F2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 07:14:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C471711;
	Tue, 22 Feb 2022 07:13:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C471711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645510457;
	bh=2Pg+zFZ4k69EX72gttMRMr4tPc+SWzj9bIVcnx/ZzgI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQFjV1Allyf33vP8GkuVCeQ65bMbRNus3RRxewE6+5N7lQ6JFLT8HVCJFEc2/Mpp2
	 l9yLjOhe+SWrDwgJAJMZeY/L+m6a8ajWWYYE0EXnYK04e8Tp7tEj2jBLXECvj66wDl
	 7cRt4Lx0RT1C9zp7TLaqdoMjgWCdA4irInGbVoxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E4CBF801F5;
	Tue, 22 Feb 2022 07:13:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94CD6F801EC; Tue, 22 Feb 2022 07:13:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C276BF800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 07:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C276BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ZWFmF77+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kslT609eR6xec0vCLfpo5TAc+p1PMusvk4Fqn5a/gc7AeJ8n8ZKC7QTSCxvYiMvJFSC27yTkyh3/FG3xwvv9N+cvgRGwRFMvJqY+IekxQDfMFiq7bXKXtMFt0GProhG5XzJ4rAm4Vvl8+nt26K2zDnkLHU446whuuXcFAR30iY8F3WQtaQYHwHkPzZio8CkUFcDiIKcqKjqora6ZbRdBPHLFVtzTiSbCXAC4UCdczpf7Z3IyxYFicdsVVQOyBbzYxfDL3l7OfcMgd6hxSe56Wy3JcKlvRqcRA78VpJ97aXgcWNelaLCtXPg/LfwNqRf5FQWdcd+p2u/4F27juaMKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJeDpoHKHVa8TbZA9qXLuKKx+JVRjK/6jfG9jDwFUo0=;
 b=LmQ5li4iPvQHSFu+VT26czQEc2bFM2VnvpjB0WZEtvOBMjx3sDaK+4V/8hAMhDCennO3TRhxgP+jLHoX0cOJRJcSyIT/AmYFmJOvD9s5f7NYdGSS0DrmEhxfZKyDMQSBGqGzT6lCLidI1Grz6SPradKK700ZNqmeSlnPOLnsEqvOYXqyOEB3H35XtetViCaZPMm/4Y8/KSEx1Ms4jRq5BUFvll6dSE5qqMzVjvbnIP7wwE95bJteD8S+uurIauiOKzlySY4hc9wgcq/GzqQlKBY7c5RvslbDNZSrmjk5+3DX2G6DCHpExKlx4p6/x568vKDo10A+SvOPeWsSwZPx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJeDpoHKHVa8TbZA9qXLuKKx+JVRjK/6jfG9jDwFUo0=;
 b=ZWFmF77+/lq29l4JHVwnaYnoPqEzQvLt1CL9afuhKLo3NWtuIW0ORLAPEMW/YnJttdjbwPMa9oHD02wJDRFvM74dBBj54B+fxGWxb05ZHOqLxGLe0Ae1W28jOXKDP2HvaiejN/5G2y/4Lfb5LqlrRxlJYTbZBAPsnJLBykBKYU4=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 06:12:52 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::74) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Tue, 22 Feb 2022 06:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 06:12:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:12:51 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 00:12:49 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/3] ASoC: amd: acp: Add new machines and minor tweaks
Date: Tue, 22 Feb 2022 11:41:25 +0530
Message-ID: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1e12a5-3188-4042-a2e2-08d9f5ca5bc0
X-MS-TrafficTypeDiagnostic: MW5PR12MB5600:EE_
X-Microsoft-Antispam-PRVS: <MW5PR12MB5600540C33EFADCA08707ABA823B9@MW5PR12MB5600.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJ3yluqWy/ptxfH47SXi6PLL1w9NRShtAlCL+6FqXzQTa73/xUmXQ6AIky8Y5i/u9VS1HDoRMWmov2AJhSBqBIt/0umU7WvIp+6v7Fjekfshj3jqrxzknw9Ycnm7TXiF05o95Pcvlzebstj+GNcorqXljm9we8+Zp6oqeYI+Q6ccytyKTVrnKTtKAcdI7k7Bof7oExTjdlKlhXiozNeXWjQAqrQ12UNHPPkRBbNg18zDcLu2Hklm8Ij9aVU/6D2ILJOLiMkZnJrRyHl/jVhTpAT8gUC0vYWxVsQHn5rVjIeoomTrGRvUym795+insBloKm3Y5lgaNLex1ulj7rJqRNzykE7IFdGmqCqb3Tki7ncRiEkaS4o5nF05nTUP3EeKK4a9+fkL01Y0AInKnc+o5XBTr3fbkP9+Gr8BtcBidjQkTJnFvB3dJEayX30X8K3jmWg7DcPlaGntkpkO00uJ3vhmCHilZPx522lvNwvvcxra/wcqbLJgJ6uo+8nREDDoUGT4XOxjxr3P2HtPDk0lRLLU57c2KsDIQoEDqz9+fNp5q+sGVunSeakC2FZWep3R3moXJgu+ngryxASjysbhjvFxjPuexg/ISHTSE4kz84hz9N3EOD+wvJMBG1M2y9CbTRH/gl9j/KoYia2dew1tCrA2UNqBAREmmlxZQi7h0Jm9RKpFVu1gkbYSvvpU3m7mq9SloWl1v+Q66bCW/hHjfQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(81166007)(2906002)(70206006)(8676002)(4326008)(356005)(8936002)(82310400004)(6666004)(7696005)(508600001)(4744005)(5660300002)(86362001)(336012)(316002)(426003)(1076003)(36860700001)(2616005)(36756003)(186003)(26005)(40460700003)(83380400001)(110136005)(47076005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 06:12:52.0404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1e12a5-3188-4042-a2e2-08d9f5ca5bc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Vijendar.Mukunda@amd.com
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

This patch series will add sound card support for newer machines and
done some minor tweaks related to legacy machine driver. 

Ajit Kumar Pandey (3):
  ASoC: amd: acp: Change card name for Guybrush Machine
  ASoC: amd: acp-legacy: Add legacy card support for new machines
  ASoC: amd: acp: Add DMIC machine driver ops

 sound/soc/amd/acp/acp-legacy-mach.c | 34 +++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach-common.c | 27 +++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c      | 19 +++++++++++++++-
 3 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.25.1

