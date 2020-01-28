Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C767C14B24C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65984167C;
	Tue, 28 Jan 2020 11:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65984167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580206183;
	bh=dFpT0U4Fu197PrkB8covKcMe9PMudeweZJoLvfKfoig=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1EzPMoWnQChGvrer8CoHtJFlXIxPlIlm7JLaHots9RZrnl5y79cvJY03CMhhESOx
	 wrt2e8lRoM/wblhPptlnS4PyuvqyO9HJ0DQ+Qjk2vXHZ2kb/CPry585VLaKwL5Ea0s
	 vJZWgSQNg9W2vNDGdJPliHtxLBhHwJ4hadA8vdow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F6DF8027D;
	Tue, 28 Jan 2020 11:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE77F80277; Tue, 28 Jan 2020 09:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D468F80274
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D468F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="DsrIQovh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T53xjCvrlearSylszW3klkK3LNVtZzhsOYjrOVa7sAQa3CGk/vbVQsQ26VJEldFNWJsgLtdrxUcvKuIP6nWk2JtFsxBhYDLflJtO8FZc64VifY4rmEGUt+k+Tm7jSA0wzEkBNpttXpAFVBR2HP0HAiDnU5pJcRxyrKGI/uwizZjvTH/zMtop/wF5fEOClcY6A5fJcL+2nyCJo2Tr3JIeL8ULz84yT3S5p7BrwLkDZhlw6wcpiiGYEP/kUrWh0P0fFX90fGwSXZBUjaclNOcyBYS3SPuuIi5OxdmYLxMQsrCI2I2+b5SNWFCTsXSNUwA+0QQY8kvuagc4Nj5w9FTxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+ayqR7eEeOWqJWJmechoCQbclaqevN8isOa+1dk1k4=;
 b=PUI7Oi33EdrvFdmYAq0KMjpJi+HW43U8p/umZb+65I/JvS5++GydQnEDTsY5SyxKhkPFy/xgKEGxw8yK5lE5Nh/pDO0yqtrUtqJ+OPWnWOzlGFrJpS7qUauY7kIZce712jZN2f2rGJUt552fTePihNE+VQTck44yBqB4SeWn3JP6ei1VjH1m5FwTxHap89dyI1wEdi/LL5pEm68AoqVzV2nhXhxvzcQHIVfl2QzZtTKwycLmbwUv9M9FoVmwZf/KFX7pVL5PafCV2AaBQ4VVFZq2l8PM0ggNDKch02hvJcgRGBpsw5OV1q3avAyi6vFqMtZWhAVfqXeq9KRz9neHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+ayqR7eEeOWqJWJmechoCQbclaqevN8isOa+1dk1k4=;
 b=DsrIQovhCNR0rYQduuZQTLJzbzWbllfeyfOlze0VQLAgLIagyTclAFTjXFSk1j5Fb2tGVB9zxf4GPO4R0QKDuLg5eO5gtzGB1VHVKHKrEaz4QAn8EBMbLd8vZq9ll4yRkztVxnYWLHk6dyabsNZ0PfUFdZKM5s/F7/PtaFyk+Yw=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3423.eurprd04.prod.outlook.com (52.134.4.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 08:06:35 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 08:06:35 +0000
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:200:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.13 via Frontend
 Transport; Tue, 28 Jan 2020 08:06:34 +0000
From: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 4/4] dt-bindings: dsp: fsl: Add fsl,imx8qm-dsp entry
Thread-Index: AQHV1bHbRYpJOmPyzUi4I6QOWXsbBQ==
Date: Tue, 28 Jan 2020 08:06:35 +0000
Message-ID: <20200128080518.29970-5-daniel.baluta@oss.nxp.com>
References: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:200:42::25) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 429a807d-cb7a-4c2f-8d8b-08d7a3c8fe27
x-ms-traffictypediagnostic: VI1PR0402MB3423:|VI1PR0402MB3423:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3423E176AB1C668928B16A0FB80A0@VI1PR0402MB3423.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(199004)(189003)(5660300002)(6486002)(66556008)(66476007)(66446008)(64756008)(52116002)(66946007)(110136005)(316002)(54906003)(16526019)(8676002)(8936002)(81166006)(81156014)(186003)(956004)(2616005)(71200400001)(1076003)(4744005)(26005)(2906002)(478600001)(6506007)(6512007)(86362001)(4326008)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3423;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wGf8VgVUVsQxN3aohm3u3LSMWEZ5QpSQ4yn/owY7a5HEmO9t9nU7G434G80rtiGG71m4LxZzyi/3v/pFOPCTgvX+ZxA29x9XJJ8tvgQxkHKjM82mY62MiEdzNhK78WF8SAky3RO0MheEXFgctCZ2uUi0FyNPh3txHNaS0gQgd98/cZX7ylc1vBbLoio/6huk7O/Fy0248Zh7EGxhcbPB3jOHajdQZgJWv0DjyS6mS1wgyxdYAB44NkjE+j2cu1QmAMzIZUShjZsfbkZrVwIGrhe3z1VSuT/RCEx1GnHwHPXf+jO0BWTjzkATzZUACdGr070iolqdgxJvFFhVKourUhOp4xzw7/xGDWAYSJ+8b4p9h98itUsHy+g+vyL/8QEkxp56PS9JteH48z/UCGNWbAgxNR03Mj3idlMf7IsLweyoyqTpGRhD+10M+VrspTFpCPFobN0Yqjk4ItKeO2ejnsZJqM9EpL6/kOj5Ym5EKEEoCnloe+xqSI3yxyjjkMpr
x-ms-exchange-antispam-messagedata: 120o2ZIgoBTb8m7gzPsTCRqCKeghd+mUw3qrl8sZOPgaJJ4ISeQ5X5QquPKKRyRUiw/lfdmaupN4KTu5ZHs5LIMgdi6GVBhr8tRw6j7xMfZu30oX6IpcTaQ/pcy2bWfuNDdEHZ1V79LwuWH6k7XLbw==
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429a807d-cb7a-4c2f-8d8b-08d7a3c8fe27
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 08:06:35.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lnZ5RoPFqVG9KF0Qv4yufFT9L7mod1Zq/LxFl2W3u+PE9rm0mBtcd4+sJLjM5isJPrwj/3DB8vA9sqxRJSQCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3423
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:05:35 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Paul Olaru <paul.olaru@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] [PATCH 4/4] dt-bindings: dsp: fsl: Add fsl,
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
