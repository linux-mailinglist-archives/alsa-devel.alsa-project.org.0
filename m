Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285F20714A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 12:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122E61847;
	Wed, 24 Jun 2020 12:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122E61847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592994912;
	bh=04HhJ9ei1pl+p1okyseDswnq0CsIW8+C6vZnF4sfEig=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UDGmSAsAEwzlpVy+tyPyIzAFck3qxCX5sP3fU51aWUPk0PleiesBXCpXz7SQ252yp
	 rlPh+NoJ5+J1Ylyh6xaIoUeuV8GeJxxUzMlXz+sKgQuLd8XqobA2uPz9OpA1+bB83x
	 B7RuXXht3Iim0CAob0EOY3OfJTjF8ExVXVrKkmoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE45F801DB;
	Wed, 24 Jun 2020 12:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A11B5F801DB; Wed, 24 Jun 2020 12:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E074F80084
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 12:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E074F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Lrmi4cFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AItJK/QIImiQIEmEebSjvqvFNZrVLq6ygidos+QPZS2E7tVZl/kKIZaR4WX6m57/HvUzRwpbRK0PyH1wAJvhhH2+zrehH2JTtxVsegy8zBukGNQc6XaVNgBfFKHCsCCV2wp6G0MRgfvHioBH6DYZN1TBoIAXOH2PEK4hJHje4ji9HYZuy+nPo+NQwNy2rlwvWVrsC+/BxWOeFg+lLpNwcznzKG9IfDO6j6YVnyE+ewCtX/pUq0p25CHg9vHOzHoZbq6V1jB4RK/L+TL37ZPcwbn+71QRvuglJPSFIcNDwdIgp1eDKw++ZJVB+9J0j2oFJ7Z7blglYw4UgQiqv3bdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsZNQeeSGRqslaYBepsd0cplnO0TsApo56aASIlqJ8c=;
 b=iszz8kxL0b0v7okgujbjmfHkAYjwGiFeR2Fv9pGwl/AOgSx+HHYzD3SW5IXYVP3ownNY0F67vUhvae4UlYvgG0sGM2NCBGNnJeRec80YzSyEjtKVWSZGFeR6jFSfA+Safnt5Rb11i7DWyRMRZA5OMwaH1mTCXmFXLbZGOzah4bt0+iboo+t1yYJEd5oQlRA5JSGPoGtk2hEhqbrkU81Wjh+aSbQz+XwVe+fcX3QQW7o0BHpBwlU4cD9Xa6ty3Be6unt9Wjxek8DfxLkvUSIC+nqdDxS+Y1eTA9BdPXPHiNdMKiV19JTEopAqC0a7zEmsGlKGkGLvnBugrsRAtPgCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsZNQeeSGRqslaYBepsd0cplnO0TsApo56aASIlqJ8c=;
 b=Lrmi4cFW7/GQQ8DM06DEIxFTLHV0wcZSMKiNgOLOEdV5Pij3/TAtF0cve6xSX/ljcVOuThF3VwiMrEuDu1JQlqMwsATkRUIgqGxYBxXUQeMiscEouF3XlrxzfI78hs8fOeki58Sula2PwiAk8fwa+ZJzORGN0zCmrRTeCzIkelA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2445.eurprd04.prod.outlook.com
 (2603:10a6:800:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 10:33:16 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 10:33:16 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: khilman@kernel.org, ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net
Subject: [PATCH v3 0/2] Introduce multi PM domains helpers
Date: Wed, 24 Jun 2020 13:32:45 +0300
Message-Id: <20200624103247.7115-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::41) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR01CA0100.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 24 Jun 2020 10:33:15 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 10905119-2311-42eb-4723-08d8182a011b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2445B423B9D7ABF7AD19B66AB8950@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ZIHkiDLxCQA/Qxqe8UBeX38gE5FhHG55SQr0PUlPQYlhyeTH88f3oUXn/ZVkP6Bx/s8Ks1P8g7I3PXI0qjOAK/IWvG/w4xLZkE2jyzfQ3lunpCId9XuysXhcXfLTSaNgoK1vuGEMi6dBABCKXn7RputBru6jBDazgGQ5N4KRHMlOUfC6AEC6c2CD3AX4eDifgXFPwDDFayhri5ZQQPho8Jq1Xsj/xRh6ErOMiq81spgmM0ND8r2+JapXxsK1/evvenhxcUM9Pm+Osqu4VOkaHu5dDv3tquK0/p6CKP/aObde7KvBby+2f2RevhhVmyI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(86362001)(8676002)(186003)(16526019)(1076003)(8936002)(6512007)(66946007)(2616005)(83380400001)(66556008)(5660300002)(66476007)(316002)(956004)(26005)(6486002)(44832011)(4326008)(6506007)(2906002)(52116002)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5Okqs5mep7iRnApeBT98GH0CtWsmpu63SC4stu1AYlZd1L1PSh2UWekYFQe3quF5aPyBlZ+sUj6dt10j7hcZvk15av2Q7rNIaaVOeSIby9Oiaid0KKjm7siTWTzzM3kgpf/omzO4MYWOlgLaQdYMT8Y2Nuk+agDHSHczss4ZSlNeXBgCyZ1Pw4QUzpmJpLQs7FBnBjXhrD9sIb1j15paUoL26QLd1Ny2RuxsTaPEEZ5GnCZjSvgToE2JYshWsd76lK8wkxFzY07dVTAHu2wtKDBsjJKQwr/kXwMfzsoWMsx5gcOpcCyccJxZB6BlGegVLwc3ORtc4KBqdY9ziwpOd2ZDXaeqYYd4BIw09kP0d9KLXXmuo7kFYEs+GgLMc1ChQXBVbsd1cIDKSrG5rDekJlkR8mW0X8tf9Sr+ymCh9PXhmvUPGV/Pb0dRjYBWOq08SI/YIF8WIgfW78fxWuTHexeBqcE7lOMRThzdVkVhUjg=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10905119-2311-42eb-4723-08d8182a011b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 10:33:16.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqBbVskbPPdkdD0X/2SwltmF4yrp/fVzWdReUCS22LSnPpTwqcqNT2ltYAw40dxeaqppFcK9ggR3Ss4WeADihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

i.MX8QXP/i.MX8QM has IPs that need multiple power domains to be up
in order to work. In order to help drivers, we introduce multi PM
domains helpers that are able to activate/deactivate multi PM domains.

First patch introduces the helpers and second patch demonstrates how
a driver can use them instead of hardcoding the PM domains handling.

Changes since v2:
»       - fix kernel test robot reported issues (missing static inline
	for newly introduced functions in headers and arguments
	swapped for devm_kzalloc).

Changes since v1: (addressed Ranjani's comments)
»       - enhanced description for dev_multi_pm_attach return value
»       - renamed exit_unroll_pm label to exit_detach_pm

Ideally would be to have patch 1/2 merged via power tree and then I
will submit again patch 2/2 on sound tree.

Daniel Baluta (2):
  PM / domains: Introduce multi PM domains helpers
  ASoC: SOF: Use multi PM domains helpers

 drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   | 19 ++++++++
 sound/soc/sof/imx/imx8.c    | 60 ++++--------------------
 3 files changed, 121 insertions(+), 51 deletions(-)

-- 
2.17.1

