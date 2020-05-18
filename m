Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9C1D7AFF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 16:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD09B1706;
	Mon, 18 May 2020 16:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD09B1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589811694;
	bh=bAT/o3wh1Q11NCH7shjvPoqrCJGFpPFKWyyriBusprU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hp09CrpRgFyiw8HmzjROmsfFgq+dx5+D8RD4E7siEXxXhwtCmBtPX2PnI4HXEaOwj
	 TU6kGsdCj/h+dgskKDLn6SAxQtua1EyG6nNLaacV9hGjUwuY+afrM0UEAGFNsUSSj8
	 rayq8JZ+gnsgbF8FsprJTkWHm+Dbsm/YaeRNz9OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA058F80299;
	Mon, 18 May 2020 16:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1920FF801F8; Mon, 18 May 2020 02:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2097.outbound.protection.outlook.com [40.107.236.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD13F8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 02:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD13F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="GsmJaSzV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmTOEYtMHscxsSjIDsF3ZOzlUyoBMbHc35ZAnKdS00YPjDMVDdM8HblXzuY58dBp/0sLQMDGCJRNyeQDc70gYa4J461blQomQsr0qnUNlXQ0BCe0n+tCrH5p+tRP1D5PozytMX/RmPuetyJh8yrtbgoGEG49TSX2PxfM1rrqKqwuWISsrupf6PZYLeMzxX80lU/bV+/6PpbIZoAl/6cPyBmMZS2tdsiKguhmMOwk3T5bC3QJQT68Ky8OyoPARAk/sq7xiTRvdJWNEtZk9/cQcWauiNM14KLLYo0vj6rYPQAEKBcK+wA01TswMsGEMXHFS0PR4gcVJzVHIkl7goDM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7hX/J76tBtL7VRebaHJrw9xmZRzEx8WmpLsqjkC1B4=;
 b=jDtEw7gaOxBQaU4Fcyh8ppBTyiKNxpPkUVqxRzQiDdn0TIhlz73iSA18rMtEgxkzd1qMQWlrpEwhMzkR2f3xnGPfE15MzDsCB6BnjUrrnwMXxL78si4Sl/exyteaMWIVPazjvOnOFbSJFLJZo7jE6uVZDqLIjZpkJOHhfrEbUDP+/z9G+n+NKh58/wnIl0LCEALHfKJg1qWouuANL+KSQwjUmg1ex1DmjP/i/OqySud/6d2xjFBAslWCtsPvPXNSCAecBy0f0Rll7OBBU+f7Bs0kY1sNopik5pcoQfnb/kDBG16zj1HTafD7GrDJVI9PFsLFXK59KPZNtGR4ZDNhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7hX/J76tBtL7VRebaHJrw9xmZRzEx8WmpLsqjkC1B4=;
 b=GsmJaSzV1LzoLbs76nyiiWbMTl1iZvYhU4QQdNIv4gVdY9pMhefuLnzGXTHLlF0/lFqz1gb+YDeVJn42cbckFwJvMxz+/0n4X5QSgMfHAqYUFLpasywXHMzq4g5A6DcO6nYY5ci1Nu3A1kl3YPS2IINGUD/48fTMWKAcxXYEGqk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1518.namprd11.prod.outlook.com (2603:10b6:301:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 00:49:59 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 00:49:59 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND][V5 PATCH 1/2] dt-bindings: Added device tree binding for
 max98390
Date: Mon, 18 May 2020 09:49:30 +0900
Message-Id: <20200518004930.20973-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::34) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e88d:1f5a:d5fe:3ea6:5791:c8e8)
 by SL2P216CA0024.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Mon, 18 May 2020 00:49:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e88d:1f5a:d5fe:3ea6:5791:c8e8]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b911071-ebf0-43ce-eafd-08d7fac5643b
X-MS-TrafficTypeDiagnostic: MWHPR11MB1518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB151862D19404858831403F9B92B80@MWHPR11MB1518.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cgsxysXqCuPh7UdADl+RImBRtFFgfLga52gHtcwdLwps8lzmSaxmVQ2e5zltIo4+20Bq96WtxdGHDq+TFY6QQko95FFNDXTJ8bXAXQOroVCDY+aS98TYlccD7p6ltmZGyvrwMTnjmDDCajzt58dBNWUy4lxNUSi6wsh0j4wXGRq9VBLFI4Ew3b/jWAOP968Y98V+reXecoaD47Ke0DdKHLaRcWwRuvWEbahX8U7T5x5JmkuucOqe9tcIS6ioxUM2Zcnyx09Aq8RfEi5c1JMpHR1kfK05JBTdAxNgwmKLtCZ6XwE4vtRKJ/eBdy/V9AKeskJuIU7pcT5Bu6S6Jewwc3sDysLp3Ke1xhjeOwut+BGAigI9T4yw+nkfdF26LcMy4qViU2vNjEMm9frE8oFzU4GTuMTxoGHx9IjS6MoWYYYv2+Q9+uQ4C4c+wDBfg3Qzm+JdN6PK54uDs7Z0ktNT8yDV9pdCAUXuP0bj6lhqKAQ/NMOT3u8fIgteF16Gl/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(16526019)(8676002)(66476007)(66946007)(66556008)(6486002)(2906002)(6512007)(478600001)(6666004)(52116002)(1076003)(36756003)(86362001)(107886003)(316002)(2616005)(6506007)(186003)(69590400007)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Wh8kQakzQ8afaRAtT0y+00FSzb7vrj4N1oxnH+Cb6pA53Y3vlds/4t0PM+3QGsn2AU6aRfcLF+REmfL5M2cYCEPBXa0KYsWh4OQvVv0hDQMtFsMPbPveC9m5D5tFJz+fImi7oB6svySS0z46LNzEGnZwlRDi/q4pKCTROnW5rl1yRGC6wzPbM5tFtDZFeiYEZx9hBiHT8IhyW79QVM/xWyhNjyg3olTG8AuZH6BkXt2JQgq8Dz78c1zknkXotzzsyNlhKXJq/mw3O22r7Gj81+D+YgQYlFcLTjkexNxBuEPkfuZp3FH+EA6bddePdqA6Z9958Ch9MbA1r5nDXzo6G/YxNwg5/q0a8eWjc3GoRZ6t3L/37KEbjHfTUfTPTzRHgxmPgOEosWWk/+2E3zTV1cj9JRYcNbzMirtrgG7SAhPmm94XDPppFpigALTKnnEnt0WxQrnQW1zbBW0f80j38nUgFGuD798R9ocnVn1SaAF4T8ZyLAaUe2OVVca5f4x9UQ6/7NZerP+kOAv0SLu7RjdBTB3CbBWGzmJAveoCVzs=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b911071-ebf0-43ce-eafd-08d7fac5643b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 00:49:59.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wm7AfAkiW/r2j6xxyeu4B7/BpxmSUK5po/qb/Tv+hp0n8jobCr0ICTFzPeYvW3MWRpNVizDM2sejtEHzVijVlW/fHdA4azv8lt5zxh2unUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1518
X-Mailman-Approved-At: Mon, 18 May 2020 16:18:11 +0200
Cc: ryan.lee.maxim@gmail.com, Steve Lee <steves.lee@maximintegrated.com>,
 ryans.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Add documentation for DT binding of max98390 amplifier driver.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---


Changed since V4:
	* No changes.
Changed since V3:
	* No changes.
Changed since V2:
	* No changes.
Changed since V1:
	* Modified sample text in example

 .../devicetree/bindings/sound/max98390.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98390.txt

diff --git a/Documentation/devicetree/bindings/sound/max98390.txt b/Documentation/devicetree/bindings/sound/max98390.txt
new file mode 100644
index 000000000000..0ddd4c6ae55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98390.txt
@@ -0,0 +1,26 @@
+Maxim Integrated MAX98390 Speaker Amplifier
+
+This device supports I2C.
+
+Required properties:
+
+ - compatible : "maxim,max98390"
+
+ - reg : the I2C address of the device.
+
+Optional properties:
+
+- maxim,temperature_calib
+  u32. The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
+
+- maxim,r0_calib
+  u32. This is r0 calibration data which was measured in factory mode.
+
+Example:
+
+codec: max98390@38 {
+	compatible = "maxim,max98390";
+	reg = <0x38>;
+	maxim,temperature_calib = <1024>;
+	maxim,r0_calib = <100232>;
+};
-- 
2.17.1

