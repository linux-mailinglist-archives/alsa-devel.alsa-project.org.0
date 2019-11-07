Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A655F2872
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 08:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDC7A1670;
	Thu,  7 Nov 2019 08:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDC7A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573113192;
	bh=GA9cJ8+W3Etn9Z0GNIxLASguvrjMBWDywpR2in9N/aQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vD9v+DkV+ZEdoJX1pLNRmdgsyckng5xdbIy3KI1qpHRwhQ9huuNAQTzB4jKt3oDry
	 aAn1yrSKffk5UMBiQNd8SLPjqLJu1aa1zHe09H0VxeAunpRjHbeSebqwGHFPYa29v7
	 gqb5t8D7NOpbqVBohu5woytDhQMguIdDJDcP7FIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28949F80446;
	Thu,  7 Nov 2019 08:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF7BF8049B; Thu,  7 Nov 2019 08:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 288C1F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 08:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288C1F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="rcCKqK5Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot6KtDEIaBB26gGvxMlr6fjoZPvwaL1QHMLgBcuI4NQD+ecxeEcPQ7XNDAsDAxtdmYy7C4lWg3rR2doe/Qt6zTlleKxNmQTnyid6LHmbsh+PJSgGUdMknbSUuBrec2t66ssp9lqbZFLjxdJaqHEWX8cMtrzeFjUx0b8+EegMgrFB5OWu+5T/pMnREDVdDFbgxr0w/b0Hxd9nOzbRVbrpCMxRjnqdw8l9ywUHMS5uYrbRTwvJaW/SnfiyhZT0CT43MbIhLh1SN09cqFzul7Ekv4CMfYO6Lq9Ds1hNt841mDaMNTS5HyU4Byp4dvxyV3J0f6nxfkWKsWuVNzFvVTnw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msFlGiKfaJwHoMxesxTXiLzxrZHaTCBWlBSEl36KY+I=;
 b=OPVFUTvCJPIcRp2A8qtP1dSzjvxx8x6oHkZOGL7s3fW7qaziYcfN6y9NlApr7aCqFZYwoQ833Lv5KbCTtq/RvFE1SgnQmsjl7SADPhBsE2Sl3CXjL5WgFhCj9gat7coUZcyaVr9daEjtV8EtAqVyUZcEKW98xxAZL52ohcg6uWwefl/HhhFuWHhTM++kk1mk13R7p+fCaj04jlDaxswcXAL4N4nNfuvav5n4DHBnXjjE/OcVpSPzgU83CEWRWHXb4S056uYqZyJsfwgRWlQ3/UyF1bDLSrrBSaDqlOY3fCvaYocrS9pAVBtKBHd+4/8gdAHU0EnzQV8rtZHq21PIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msFlGiKfaJwHoMxesxTXiLzxrZHaTCBWlBSEl36KY+I=;
 b=rcCKqK5ZPZw1uhN+L9ax24M+NemLTGhFVFo9FnNvKPZEmWOYbf5SgrcL7CRL07Z6WxfY1qGSR+hjWxu1uVxWL8UDkgSxIkVvLPd+Ik8AvCEDQXzaulS8XknrTR4W2UcMI9CePX9gQO0ZKQNusB5T6zBsI3OIL0RqAWFleprbVSg=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.254.214) by
 AM0PR04MB5490.eurprd04.prod.outlook.com (20.178.115.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 07:51:19 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7%7]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 07:51:19 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add compatible
 string for imx8qm
Thread-Index: AdWVP8IifFfTCEP2RpqREdYX4F5jzg==
Date: Thu, 7 Nov 2019 07:51:19 +0000
Message-ID: <AM0PR04MB64687210E053B6ECE90C860DE3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a974b462-1ec3-49b0-a903-08d76357468a
x-ms-traffictypediagnostic: AM0PR04MB5490:
x-microsoft-antispam-prvs: <AM0PR04MB549041657A3E54828C428181E3780@AM0PR04MB5490.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(66476007)(256004)(64756008)(33656002)(66446008)(8936002)(66556008)(7416002)(76116006)(4326008)(316002)(102836004)(6246003)(2906002)(3846002)(26005)(66946007)(5660300002)(6116002)(8676002)(6436002)(7696005)(52536014)(14454004)(55016002)(9686003)(229853002)(54906003)(186003)(71190400001)(14444005)(86362001)(6916009)(476003)(6506007)(486006)(66066001)(74316002)(478600001)(25786009)(81156014)(305945005)(7736002)(99286004)(81166006)(71200400001)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5490;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYF7YZkKjc6AkWWhtQphLbiKkEqRiBxbRerpzWvNHaIVW9jDsmZYFDl1XMMQZVEKrGR4weR6MKQe/ZBCse4y/ImgP+r30EgVDiIa09Yf/vj3q8WwKDKJEdraEly38k4paqr6LacaqkjWI5hZCA3DBOTbDu1cewbqYSNvNo8hSVxGuCH/+JStE8kYgngYfF7hrL5s15rV2d0PFi6vc3kSaDPZUA34kFKMYZnWocTuFtyZlY2KxRMISqyMPMPwcvlNhb4pQ9dC1BoDfCuKXje3XgosAsAyi5woLHaFHTcvh5pXlczSWtNkNj6Gv7xCjGAvmfkCiHTOLbxuCTt4LQMBAh4ZsyzYoffrkN5V1aHxDOYbCK/I60w3hGhSO2ni1kh6I1qGb7/ATYegjEKPU7vBlaksrR/MGPbOk/szQnK8fNI4b0NUkpVDJBd+U+OoxhbH
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a974b462-1ec3-49b0-a903-08d76357468a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 07:51:19.2341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwmEDG5SOPXnPhbGYXHnC/lRZmZOMeql6MrBDMXKQbjhc5MahvS2XNxO9j5RFME1VlSGjSB3n9zluQWGQDeWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5490
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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

Hi Rob
> 
> On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> > In order to support the two asrc modules in imx8qm, we need to add
> > compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"
> 
> Are the blocks different in some way?
> 
> If not, why do you need to distinguish them?
> 
The internal clock mapping is different for each module.

Or we can use one compatible string, but need add another
property "fsl,asrc-clk-map" to distinguish the different clock map.

The change is in below.

Which one do you think is better? 

Required properties:

-  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
+  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
+                         "fsl,imx8qm-asrc".

   - reg                        : Offset and length of the register set for the device.

@@ -35,6 +36,11 @@ Required properties:

    - fsl,asrc-width    : Defines a mutual sample width used by DPCM Back Ends.

+   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
+                         by imx8qm
+                         <0> - select the map for asrc0
+                         <1> - select the map for asrc1
+
 Optional properties:


Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
