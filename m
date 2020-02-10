Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B38157248
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:00:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7061676;
	Mon, 10 Feb 2020 10:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7061676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581328824;
	bh=9PHgYRPsnHABNoPNJJ5hC5mB2SwhUf2PomyvpMcyi8w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JrfWo7HErxapravX5jE4EAPW7svOCJSTZbnDKK4vApED9pAn66sd43254hdR46/Rq
	 hzOUOnREQBWY3vqtcCoQowmZdUszEkKefZkgpnY9GhGEZ8IYQPa92uV+djcutNsaSF
	 FxM0sfR9Rc+GD3vdjIZWRC6y1fJCfY7jE9TNVjVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF8EF80240;
	Mon, 10 Feb 2020 10:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F8D1F80158; Mon, 10 Feb 2020 10:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E484FF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 10:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E484FF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="XPgPkPgZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfwYWm2ZBV7ok506aZFm/h93ezxurEYt/kF61edYZwDkYmglHkdBFwXHc2IcdxUPqvP5N4bmd1M2LaAyHR66FtdWg+Oodsan/hGcm7tXeHqfXbmlBeifswDyDQ66Mg8/4c8p/OGjCr/W9llvxob0sW2f/G6c2jE91fPedYhTBX8y8eslA33QCP79mD9OzLc0BGDqiDoQpLu2YEWaixG7OeVqeEqGAIbTZ7ywvCb09WqxezPWkL2FJjMvVkN/eCHyyA/CuFxZrll+Zo/ur2tKLTn/d3OVpLzkwzfH+r7v2+5rcLptpsXW1e3U4xKsFbvDC46+uVTPX6s4Ckcx8XVkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9newka8DUzdEUfBPt6VyZKt/vTiY2CUFOj4luSiW6O4=;
 b=DAwLiV1nn8mHYmMIpIrY026TRT4km8762U8UxtCcGlndmmJOObJDeXujpUsOKTy1MIorgmKo3L7cVXtqeDeDsTzT9d75Eo1SoD+zwk3t0y2PAiy1Zk7EPAmHWi9CnnSsnbpbI7V2Y30pg724Spdqj8lwKzSH1hkRAgkflvoGO2T7j9OWkfFaTn+3qe+UbtTUN3kK0fgU1FoHXM7X50oDjwbdqHNAfXpzbnWy7T323+HAbVUinWhAqOdHS5zGtBVatDyl32lIwXJA3ToRBp9fgaA2YiUYtIXlk37UrFRevY5sxTOTJYvf+kT2sHfZxBJAmwbhK9pwCY02wWL65PzVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9newka8DUzdEUfBPt6VyZKt/vTiY2CUFOj4luSiW6O4=;
 b=XPgPkPgZAZrl3Z3HBuKeBSaLCGlTft8cxa3gh4PcyzpqpOEVM8Vwd3qpZIyyf9x6lQWYNOZ652o9LBeZySUX52RtuZR1/gT3SkZ0E3a95N/Ql+a/B5jMV5KVKNUEzizgz4JQ1HLCLrT8KHdDSf/6pTQ4AVMyxMBKkKN8FWDqVZs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3423.eurprd04.prod.outlook.com (52.134.4.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 09:58:33 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 09:58:33 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	robh+dt@kernel.org
Date: Mon, 10 Feb 2020 11:58:13 +0200
Message-Id: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM3PR07CA0076.eurprd07.prod.outlook.com
 (2603:10a6:207:4::34) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM3PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:207:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.9 via Frontend Transport; Mon, 10 Feb 2020 09:58:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5fda7b2f-882f-468e-f6e9-08d7ae0fc992
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3423:|VI1PR0402MB3423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB342359E33DF46047D7BD4CC3B8190@VI1PR0402MB3423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(189003)(199004)(66556008)(66946007)(66476007)(1076003)(5660300002)(6666004)(44832011)(2616005)(956004)(8936002)(6512007)(6486002)(81166006)(81156014)(6506007)(316002)(16526019)(186003)(8676002)(4326008)(26005)(2906002)(478600001)(86362001)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3423;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KiNYC3U5OneanyGs5XaTA6qKUltIyXnl3AMwlgbT3YZFZFN4kGWG3RvSe/CN2A/duNf4IY6k3mqsIlmqqf2O23y6mnvo6SawsLkOC14buBIbsD7rihaIE2PE+nh8/GWHPZhARjbJLv3xIgOl+aDE/BQQDF89E114BaPYsFd6+9najhlNy9UYbQqoRbxSVWfNV81MattsruHtc/00RdfqQG4R6KX44pRfNXJJ7W2luXNlA8wXbg5yfEEe+bBmiLi/+aCZzLo7qOYIs1wgBB8KPk+pmDDtvERuYdOWOkROrcnHl7KvvlXhRsfOk//ul0oLqE4qy0X2yTuw9zowRL7sCGQEnUCEk4sD5hTMxc8EGomwDMw4LngKdR5ErWnQiOjKRlQXSLqhIFdLvuRXvo4thDNSW2QqtLsXJoZd8FkOAXarRkgeps6KTvp6+2/2g2AL
X-MS-Exchange-AntiSpam-MessageData: wtZLns3m0HgJKnJGCG3VmJrG45dNZ+3KC5pCt2g4ZxK00RloUhZsMB4Or53xVeitmKgwWiv7PlUPEgCSDBNUoeGIL5IXm5vmcRdS2D8vOKddHfNb3gvNf2NhM+BP0LXPCS9K88HHMz2iKjsYKQcvuw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fda7b2f-882f-468e-f6e9-08d7ae0fc992
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 09:58:33.0406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1wNStzIsaUBQRDVWxf3EeLNNBPqZ1df5wZXo9mCUjNZNzhYR+d0izAUXiBxmQwyQ1/kMxjqlV8rx8M6tuyT2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3423
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: [alsa-devel] [RESEND 0/4] Add a better separation between i.MX8
	families
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RnJvbTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgoKU28gZmFyIHRoZSBp
bXBsZW1lbnRhdGlvbiB3YXMgZGVzaWduZWQgdG8gc3VwcG9ydCAgYSBnZW5lcmljIHBsYXRmb3Jt
Cm5hbWVkIGkuTVg4LiBBbnlob3csIG5vdyB3b3JraW5nIHdpdGggc3BlY2lmaWMgaS5NWDggaW5z
dGFuY2VzIHdlIG5lZWQKdG8gYWNjb3VudCBmb3IgdGhlIGRpZmZlcmVuY2VzLgoKaS5NWDggbmFt
aW5nIGNhbiBiZSBjb25mdXNpbmcgYXQgdGhlIGZpcnN0IGdsYW5jZSwgc28gd2UgbmVlZCB0byBo
YXZlCmEgY2xlYW4gc2VwYXJhdGlvbiBiZXR3ZWVuIGRpZmZlcmVudCBwbGF0Zm9ybXMuCgpIZXJl
IGlzIHRoZSBzcGxpdCBvZiBpLk1YOCBwZXIgcGxhdGZvcm1zLiBOb3RpY2UgdGhhdCBpLk1YOCBu
YW1lcwp0aGUgZW50aXJlIGZhbWlseSwgYnV0IGFsc28gYSBzdWItZmFtaWx5LgoKaW14OArilJzi
lIDilIAgaW14OArilILCoMKgIOKUlOKUgOKUgCBpbXg4cW0gKCopCuKUnOKUgOKUgCBpbXg4bQri
lILCoMKgIOKUnOKUgOKUgCBpbXg4bW0K4pSCwqDCoCDilJzilIDilIAgaW14OG1uCuKUgsKgwqAg
4pSc4pSA4pSAIGlteDhtcCAoKikK4pSCwqDCoCDilJTilIDilIAgaW14OG1xCuKUlOKUgOKUgCBp
bXg4eAogICAg4pSU4pSA4pSAIGlteDhxeHAgKCopCgpQbGF0Zm9ybXMgbWFya2VkIHdpdGggKCop
IGNvbnRhaW4gYSBEU1AuIEluIHRoZSBmdXR1cmUgdGhlcmUgbWlnaHQgYmUKbW9yZSBwbGF0Zm9y
bXMuCgpUaGlzIHBhdGNoc2VyaWVzIGRvZXMgdGhlIGZvbGxvd2luZzoKCSogcmVuYW1lcyBpbXg4
IHRvIGlteDh4IChiZWNhdXNlIHRoZSBvbmx5IHN1cHBvcnRlZCBwbGF0Zm9ybSBub3cKICAgICAg
ICBpcyBpbXg4cXhwKS4KICAgICAgICAqIGFkZHMgc3VwcG9ydCBmb3IgaW14OCAod2hpY2ggaXMg
aW14OHFtKQoKUGF1bCBPbGFydSAoNCk6CiAgQVNvQzogU09GOiBSZW5hbWUgaS5NWDggcGxhdGZv
cm0gdG8gaS5NWDhYCiAgQVNvQzogU09GOiBpbXg4OiBBZGQgb3BzIGZvciBpLk1YOFFNCiAgQVNv
QzogU09GOiBBZGQgaS5NWDhRTSBkZXZpY2UgZGVzY3JpcHRvcgogIGR0LWJpbmRpbmdzOiBkc3A6
IGZzbDogQWRkIGZzbCxpbXg4cW0tZHNwIGVudHJ5CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZHNwL2ZzbCxkc3AueWFtbCAgICAgIHwgIDEgKwogc291bmQvc29jL3NvZi9pbXgvaW14OC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrLQogc291bmQvc29jL3Nv
Zi9zb2Ytb2YtZGV2LmMgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCA2NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
