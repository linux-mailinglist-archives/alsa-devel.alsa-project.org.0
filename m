Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946B537B57
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BEC1908;
	Mon, 30 May 2022 15:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BEC1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917008;
	bh=q83MKsHgvZkOoOK4bPLH9nG2HpyABWA1ewhtLTN8AQY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FEGxbVgRn7h1vibOBoLv4b4M3PNF0ylb2rNd7w4bUUmBaGS88M/7oHhcCnfd82nLQ
	 gKJT7aoMdIE9xt4RUUkbw83vm3RwYqf0H/4hfVuq9IZcVz3wLP1hHzJrBsad1z6Yf/
	 g9BWQhIKYkoD43FKMUKEXxzzldYO9uQabntts9sU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12224F8012F;
	Mon, 30 May 2022 15:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B91AF801F5; Mon, 30 May 2022 15:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33D67F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33D67F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="u0zT6DPu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJJUecNoC4eFnhArfYKwlLjuIkJue5vxgPE0USA+A9GU8Ob2ufKnHtZRB1hSuFXWdMkWyZkOON8+dUZOCs/kdhMvCkR9S4ETx48EuU2ceFzOqT9N26WoWvHAuJ1BaJnLPBQeMkvGqKEFiUa6eQUoj/Kdwy6TKhn04FS2MLmYuvfoCJgt9zqh5fkD2g0G1Ju57srUpx03OfHm72i8yW0vhOMZfBLjlvGGDyVjDzRJf9hycydioF/G6j3/TuSFXNRxlIWWzx+mu8UES68zdjGOFXgwP2LS796T68Hhc28MKb8JcVCfwgSE0wNtJVm/dFB3BFkHI3/MYbSExTjavecfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvvhPtiYvj/ucVaHUjGOzhyc0VeQkgTPJQYLa33diwM=;
 b=UG4yM5wuwCtyAAErs5XXUCmadINnuRWaHZ2DQGGLb7Fwi+UhWsHYdCcBUg6idOYzvqOVJeeVyCf6p0r7a9wjTC0pJbWJYBkKQ0j+D3wAAOBG3U78ved+DDByzswbEqF0LbCb0lZ31wNzpvv67Q/Y76FO24SXb52pXfVe8cOVigxwyVDNSatxNha9FiE66w0LKztigrmyqvhwVMXM5ddcsoB1DCf/+CI0yQ4hYpoi+NwGJf4tAPiBzvSFeVfKaPh6OmRP90d2mrN0dnKkD/s74B/7b3rYC/vUp6lBPMaK9OsJ5TBP3g14oijt+N1IAhs1b2xOJLPXpJfuvcDDRsjbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=dm.renesas.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvvhPtiYvj/ucVaHUjGOzhyc0VeQkgTPJQYLa33diwM=;
 b=u0zT6DPuQg3zv4x+MJ9e8hO1lhEYsSe16wXU+A3qJHM0R4JQa0F/+VjIYgD7kj0HrrlriVEl4q1eSkkAqpCvk6jIZ3mHYrghGiKuDrsqv+fZVlrfPeaeIAsZzxU6DzKqe84XXFOJP9Ifby4L6uevx5Dew2/pndKOyh9HOQ6NEVE=
Received: from AM6P195CA0048.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::25)
 by AM5PR1001MB1058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:12::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 13:22:23 +0000
Received: from VE1EUR02FT103.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c0) by AM6P195CA0048.outlook.office365.com
 (2603:10a6:209:87::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 13:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=dm.renesas.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT103.mail.protection.outlook.com (10.152.13.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 13:22:22 +0000
Received: from nbsrvex-01v.diasemi.com (10.1.17.243) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 30 May 2022 15:22:21 +0200
Received: from slsrvapps-01.diasemi.com (10.24.28.40) by
 nbsrvex-01v.diasemi.com (10.1.17.243) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 30 May 2022 15:22:21 +0200
Received: by slsrvapps-01.diasemi.com (Postfix, from userid 22379)
 id C96E580007F; Mon, 30 May 2022 13:22:21 +0000 (UTC)
Message-ID: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
From: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
Date: Mon, 30 May 2022 13:22:21 +0000
Subject: [PATCH 0/2] ASoC: da7219: Small fixes for jack detection and removal
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa607533-3a99-47c0-f620-08da423f6e29
X-MS-TrafficTypeDiagnostic: AM5PR1001MB1058:EE_
X-Microsoft-Antispam-PRVS: <AM5PR1001MB10582389719EDF07616F4E97A7DD9@AM5PR1001MB1058.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQybtY5JClESGCTbN45+6hi+HwSAdI3WifNeNFOcf/iCimJxyzln2XTTeW7mWKlw/0JWLuP+VJ2dPfu69R/haM9TUgyGH4JXqy3KnzeC0oS+03BxNPiHMdUvQRUEZ6KPpv5IyvNOhLGo8HTa8mFh0uAnnGb91Dl6NkpQp9SBMw8Xz87KdMOHGrHNSAQxGCZPj/8E+LkJWY8fPWPG7enhTkAmfuufwGy7qQaju6Eo+pOJ8/PEHXlIZzjMsnvNGTipkY05S7l135WB1hCTe26ZTrMsvpr11esTWCqA+uAIrJHr7KE/bkQJ2IimMW3jv3PP5s8jeiWW8TPsSH2g2nl1FJfaZZPEEags6RaPj64ElMGtxHWiy32d5D4I28SLKns27vBhD2GmZILOqGh5H7CIe8tPuph5cFl1LAvQPS9ztuGigIU89BZu5DEybDethaeq9OnvGFfsIT9U1nDjXvRpXE+oPvhalgz6a3nXoDBhypRSaZfRl8RhSGlLqL4sJF5pXnnVG2P1rowW7xDaWy4xKFjOIfLMktK/lZujNvjvwHrjPiRkwYyrpKu7ny5ad8BOHvoRXOiWlGGKjMyof2K0FlIbGTi18Ce0pOQFjDnnaU/YYzoD20WO8qXbgWeFKeiLv3M5R8+FV+sWyDdv0MIWuXcai3CltJ3OWrcm5B8ftX6CmpUTEquq4RsQrEpbe8oxtiyj3lKtkhIxK9D/2efguyWqZYAOLPdHRk9yeUJBCJBaoo7u+BGLyOT/I7t0e1wl
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230001)(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(4744005)(82740400003)(5660300002)(36860700001)(83380400001)(54906003)(42882007)(110136005)(42186006)(316002)(336012)(70206006)(4326008)(70586007)(40480700001)(2906002)(41300700001)(6266002)(82310400005)(2616005)(83170400001)(356005)(81166007)(8936002)(26005)(508600001)(8676002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 13:22:22.4338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa607533-3a99-47c0-f620-08da423f6e29
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT103.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1058
Cc: alsa-devel@alsa-project.org,
 Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
 linux-kernel@vger.kernel.org
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

This series contains 2 small fixes around the AAD part of DA7219, particularly
in relation to jack pole detection on certain active headsets, and tidy up
when a jack is removed.

Adam Thomson (2):
  ASoC: da7219: Fix pole orientation detection on certain headsets
  ASoC: da7219: cancel AAD related work earlier for jack removal

 sound/soc/codecs/da7219-aad.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.17.1

