Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE47157262
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:02:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9BD169B;
	Mon, 10 Feb 2020 11:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9BD169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581328974;
	bh=8PxW6aC4uyATRfe0OrDYvQKEqAGjp6Zk4pXN17qYNOk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJ5VEAyXZDpu3VFaMhpP1tq0GdPRPE/i1geND/wYRn16oW7SW3OSUsCafjkn7v9Zk
	 mpMGh3ZwNDPMUbh3DDGy/dJtPazP5w+Wk44CmSsg+weD+s7ZrfMzzZJHaYWnCebMgH
	 NClz458U2/VB3HSAW2dZW2gvmJsSjdK0zu3A7lyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B281DF80291;
	Mon, 10 Feb 2020 10:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60BCFF800FD; Mon, 10 Feb 2020 10:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00083.outbound.protection.outlook.com [40.107.0.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08EEEF800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 10:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08EEEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="DQNgSiiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESMkRwGppluJDuD6ytF+EpC+n/goV/aQqVpBVHmLm5YyeuB8iaGK99oTNJZlHaFUz59YMgeGGMyfOmWqpaHa+THQYqB3Tx7M27erBg/hIJqHq1tzGbrCLadIw2d9vOA89ojoHMFvZ75GiKunASTl3ZzwZr8vKj/K0qIpgjV54cvJtsZJ9nYXJlEuQujwyDXpM0kluxg+0O4jQ0KkWuucbmE/vma1GOD1vUf61K0ioZebJUTkyibmslColqwcZASWYZ297zbcaWe8Sv9g80R3wiyRLHk6Yi7CbTrsYUyPQZyHgEVHeK6hFZXp39Sv7PIYHJu7AxJfTqGxhjSEcVsDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QA1YSM6T6NusxwnbWRJCIoo6V643ml0FFpPb+ARMU=;
 b=g6ZWC9mxj5trXGARQYVZTzGT6ybE4slRFeLMRCbrpA/f8QLuTMqgVAgq5Mb81WTLXVp4hr4tesvQXOuaoKnSBJdeFO+6lK/pztpqHXuZKBb4FWkuCLrcKlV6KwEVPsrZ0ey8mhSVn7EkcmUkd0y6sFgngbbQKgcDRrWicYTbWWM6JGtz8p5GI4Qi9aNJT2tU1p1IY+8lmFrpEUShn+jlMo+14UyFmwrHvyKeLnNz5lJeoCj5QVbQr1w94aGb4ZlNH+rvh87EN9C7Priesq8fvcGRNBuaCt+nqnMWBhmoXQSUqQsvQio8nzTWGpRQ2Uv0mQiBGtnm6Oy9PjGup1vRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+QA1YSM6T6NusxwnbWRJCIoo6V643ml0FFpPb+ARMU=;
 b=DQNgSiiPBOKdOKXQYVu1hF8qvZjumfV6uJl8XKPS/lqK3YY23scGDwxR6oPQ0nxdH3pJ3p5jgirQN7va5EeesPcrSAiP2c2x0gxxI7Ej7Z3Y+Fd1zW+gZfB0cOSu9RKzukAAghCAzcnhLj2ifV5DOHSdbVbtFIT59JHQQGgJklM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3599.eurprd04.prod.outlook.com (52.134.1.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Mon, 10 Feb 2020 09:58:38 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 09:58:38 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	robh+dt@kernel.org
Date: Mon, 10 Feb 2020 11:58:17 +0200
Message-Id: <20200210095817.13226-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
References: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0076.eurprd07.prod.outlook.com
 (2603:10a6:207:4::34) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM3PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:207:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.9 via Frontend Transport; Mon, 10 Feb 2020 09:58:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c78cdf9a-243a-4e31-3326-08d7ae0fccc6
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3599:|VI1PR0402MB3599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3599D434531AC7A3E73B7868B8190@VI1PR0402MB3599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(199004)(189003)(956004)(2616005)(54906003)(16526019)(44832011)(6506007)(186003)(26005)(6486002)(66556008)(66946007)(66476007)(86362001)(4326008)(2906002)(478600001)(6512007)(81156014)(81166006)(8676002)(8936002)(316002)(4744005)(1076003)(5660300002)(6666004)(52116002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3599;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bRFm1tUey/GL6h2qjN3Ry4Vb+lyMNQyWXQjzNJCuL4Q+Of+10htYZhrAdjN7rq1ekKMc6Dirhgt6H/b8E7pQ9ssCheza5LxHpEq+aX9ED2yWe6a1HuPCgHxBowNn8VLLQCTyninV6r5Pj8pIIarrpYJBgWUdONzHX6AGNZzAmHfNjZh9bcTedq9ZnjMZPkKjk1rArNM2AP1n7VqwxpJ5/pVK/M3VWNCeR8CkW1AGZJijlty4vuvs2EBU3rdTz0BiNEj5ck+GnL0wOiZZmvGw8r48eskA/f1KT9IEODQvim6EL8/4SAIvHbIHsSKAqDxcDPEK+G3QGOlS+3yZMB0k/a7idFUwAc2Y2y14Nox5J/B9ZtYL9zeiB8BRlFUu2/QJg9gZQKerm4O58CDZVsfQnXwqf1Xa97qT0fbw6xZihPF9kDn10TfJ7XMb7hkL5UjLkMlHnMIQB7fl0JJTBwqNptVuL7u3tAcaT1bxQmmoCy9UGjujEIBR1W2EFAIRGou
X-MS-Exchange-AntiSpam-MessageData: Kv0UYy8Z9hG7n0dOrLgjkac4XVfelzURe1w2XfxRxuYe+5arRwdQP6w6Wv6ni0mVOUhRCNqxTrNekhx/CV3pD2/aIEkXai7ScyvzFgKkPOZWbK20HlKue3DPwIWmZJIf8KbPNumJLSR1jgPEF2V51A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78cdf9a-243a-4e31-3326-08d7ae0fccc6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 09:58:38.1517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6I9FuetUnJevu+dbuxEJMRIuI/c9+S1vB1p541xQWGnSmEfmu6+aR/uVP2FMusv0ywKj9S2gXzFosA+oMknSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3599
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 Paul Olaru <paul.olaru@nxp.com>, linux-imx@nxp.com, festevam@gmail.com
Subject: [alsa-devel] [RESEND 4/4] dt-bindings: dsp: fsl: Add fsl,
	imx8qm-dsp entry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Paul Olaru <paul.olaru@nxp.com>

This is the same DSP from the hardware point of view, but it gets a
different compatible string due to usage in a separate platform.

Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index f04870d84542..30bc0db7f539 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - fsl,imx8qxp-dsp
+      - fsl,imx8qm-dsp
 
   reg:
     description: Should contain register location and length
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
