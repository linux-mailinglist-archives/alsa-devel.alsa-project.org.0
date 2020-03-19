Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9B18C0E5
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3ADF17C5;
	Thu, 19 Mar 2020 20:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3ADF17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584647829;
	bh=Oz3S+NHMy+MiHRV1HJwt/tBGCCuIoc0uGKVnZAp0hwE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ef0wVW2Q+EpEaVEKi/GWgupO1ul1ij7uUamvn8cXRMmpIpvT63v2NsbYHisCoXzc2
	 VohChPNAof6Jruv9T3CO3Q3Ek372gQp7znY2O+cClvkYap2AeWniLgF3UC8GoWqnkq
	 39awfoXcGWUUqIENPIykpgn+7Y1pNcGNxrEk6RhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD82F802F7;
	Thu, 19 Mar 2020 20:52:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8486F8023E; Thu, 19 Mar 2020 20:52:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BC2F80217;
 Thu, 19 Mar 2020 20:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BC2F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iDxp4Oox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHJlQCqeIskHJSirDvJ7vB8Xi0O4AD1BBBBCj0rSxF21/SfCU86oVB7VwZcrII9UDGoGTGunS8SIWw506G0ohg4hHZ0gYxG49pnHGytYzJEcZMwOpVdMQ3Y2jToyFEYPeIqKSFQjkRoeuTyoGjfAFi0tZpiw3zoVwBjcoxBJ73I/x3w7qBrAqSEyhpIhRlJN9qQE1RT17DxbXr8nxpP0EdpWiyDYc9gyXHPxetyTzJtwHZpNzM1ub06P68M4gmZS4sZiXR2xrk55SDoRz9FmMq3aRPdb1a6vy2g2Y7NbP6wGQaoxWRghjXxMGd8ki0vCbpRrVaskWUgOhGLEtMPxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIJvm2uYZN1kvrqVYFKaOn8ftsCDFypCbj2Nd45Sk+w=;
 b=cOAudeVPH3XgYxUYt39EjGo9HQCGMwyfH0eoWuETHxQgwAylFqKZAq4bk4jZRD48IGwBWe+gZgRr+bw7PXpMCWgRKvIEF8CQ3kPRqA3QzhizifKznFlVN+FTiHl9mGa1zRG2nsY5lOa9tagd5v2dmQ6U8id5KqwTR8iMqEBQuDoVhEIqm0O8I+Ogm8dBBnOHgSsQSa/CQ8vcSm/VkU76/ZUotSfrVlgiOxhG/r12A9kmbV8skBX3faLpLr/MIRjy4HHL7LxqEmwiAx0kCGL4uDSTfwI3JXOxjPHlMRxrSDfaotXQ95oWaqM/z9aX4oFvx6sGHQrFkk2ppvUhdOLNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIJvm2uYZN1kvrqVYFKaOn8ftsCDFypCbj2Nd45Sk+w=;
 b=iDxp4OoxnvBoeeqgPRab42NJ8jWnbX88Xkn7S5ZxfI1+JMrpH6gh/ejCtiAm/sar0hS8rKIS7LFxifQdDrqmg4ApwgGJ+rYaESn2gtEPV4kfWVD8iYDPyEofumloUXIfKdybBAI93RuOnztJnRcAA4H6LsV7R/tAhDCsKdiZQAc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3486.eurprd04.prod.outlook.com (52.134.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 19 Mar 2020 19:51:53 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 19:51:53 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/5] dt-bindings: dsp: fsl: Add fsl,imx8mp-dsp entry
Date: Thu, 19 Mar 2020 21:49:57 +0200
Message-Id: <20200319194957.9569-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.12 via Frontend Transport; Thu, 19 Mar 2020 19:51:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26b9327e-5f61-480a-6567-08d7cc3ef8de
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3486:|VI1PR0402MB3486:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB348694A48BB9350AA0CFF7E3B8F40@VI1PR0402MB3486.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(199004)(81156014)(4744005)(8676002)(8936002)(1076003)(81166006)(186003)(26005)(956004)(4326008)(16526019)(2616005)(478600001)(6506007)(316002)(2906002)(44832011)(86362001)(66946007)(7416002)(66476007)(6486002)(52116002)(66556008)(6512007)(5660300002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3486;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdidgtAEs9fHPdsa7BMJZLpizZLS/dxSd2ChpB/WsyChUEmuKzd6X5rJeOVg7DXPWO92MDXVwce5TLTfXVmLlBajhzfYMMBmQgPhX+10rSIAZaToGDPD7+5SDDG2uymZbSymAMbh3BobGLGa3a4zbJoaQvFJbV+UxnIPtSXb6xAmSHmmrCcDyzfo625Ga4tvpiDcQDdkxd0vfEclsG/ztguXqtOpnH8kunMCJAPc2kGf/QRUUhdJ7RsUFxJsuHGyk4A4VuYaKw07Y4JuBM6ziujUH7zbF17kh8kvXHAPmvlpNJt3KSSiPzS4PMw4ryox7a/LLF6UTALWfuR6Dv2ppSts+pvDppTEJ0R3lzNF0uKcmWIYug+pDnUmUQpWAcJOy9B5ViO8MW2kOyVTnQHMQEzMMvHeXbQ+TC//ehLWBZiZEaMcL+Sg+tn0U11wprHBnhtmY1M9mIlw+a2b1KjqX9vUmX+IzSqxhs4EHW7MBUStGHKI9TldtY8BLu0IQTiC
X-MS-Exchange-AntiSpam-MessageData: CpUNsa8i+T5aomKEeLXuqD1Hk93R9fVAPxBLjPSSrBa2HMZDIvs4eaY+U17pMLXTrJrrCikivFBY8sUsikEBBeGFVaqYQqEy6/f22WItSDNmjsLizqperPzYj3TmxiD9NTKvetPM91mkABbarR1kZA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b9327e-5f61-480a-6567-08d7cc3ef8de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 19:51:53.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnqN+ybr78DOTjlsXEgDSVWFUxyrV+3MZb88jJO8xJLINcGxvr/AiD1DNSPOiUFdOH8ZZahGuYHNj5YPydJ02Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3486
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 daniel.baluta@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 kai.vehmanen@linux.intel.com, festevam@gmail.com, s.hauer@pengutronix.de,
 yuehaibing@huawei.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 ranjani.sridharan@linux.intel.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

Minimal implementation needs the same DT properties as
existing compatible strings. So, we just add the new
compatible string in the list.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index f04870d84542..65d4d07e1952 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - fsl,imx8qxp-dsp
+      - fsl,imx8qm-dsp
+      - fsl,imx8mp-dsp
 
   reg:
     description: Should contain register location and length
-- 
2.17.1

