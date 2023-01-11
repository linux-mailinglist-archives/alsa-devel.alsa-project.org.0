Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A970F667A36
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6936192CE;
	Thu, 12 Jan 2023 17:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6936192CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539303;
	bh=xQaLEWki6ikceB80ERbnQiBf1gwyP147deV9iEQ6ed4=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IG/HrY7dgnYqZRsbR6JIAYuazMZxmyV47l0R0Q6uBRnFY4ayS8TjLjHNNX7kBiqNb
	 ndem5wVcM2oIrsc+oe6u3w/R3KIwqz5oKLuqg8U7xgzz9cCGEnTD/s2zeJZOjQ8IKl
	 3Pcm1yVVj5F2QLnhDUo807OBBONbOzyFu5hEKqN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9730DF80543;
	Thu, 12 Jan 2023 16:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE3B2F803DC; Wed, 11 Jan 2023 10:13:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 T_REMOTE_IMAGE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01on2085.outbound.protection.outlook.com [40.107.222.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD29F8030F
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD29F8030F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Usfk6oLwaUZsqVhKuVcnomKx/iJo9EsET58E3vMNcnBVZvIquW8C5LlZAg66PMiVoEbL6xWej3xL1QyDNhSRuZdfqZFgglRSofQuLQf13ImM3AXxPgEH5UQRf2YrDTJjh7gohWetRrXFsfQ7U864fAvDhftJdW8qWTVq4qL9fe9EEuUh/EOo7N3BVkPTKqoubDfkKfgtqWzKoI+aHgBbKmMyllG4b7gvBDrDm3lhjemaT7ym3vIe2ctbANWAQcZhhtICDt1NtOLaJnIdv8n1cwjN4Q97W/RpKQg8Y/mVLu3bzrBUI1mDojJ6nUBKx+/+wErRngYUPpdfgXYh1mPPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2NijywuXeeQBGLIteFfAB4AJwh2qGzOGh2wFRCBrcc=;
 b=c4vEB09Bc22jxUEdv0lxWou5WCksF67snMhNvO6yC1t5z3iWJNOfszEtb59kjopC43L+iyt+aNJGPwqQ3dEgP2EeLQcPJEo72It+23HnRXCquQUfd7qzhUeZ5HrXZ0uKlfoBKxPg4BpdUKdg4TGDmfP/kz6MECJflR5fadZiWzWxqva3DiZYoV5vFr4QmnCDZq+DIUddHU5owlTNzccYYgzyWfN90I10v/2/ATW2L03oX94R9tor1JUyXw3rROABzNKHOxQHsIZdTCPiXuWFkL6Ql849Yjty7+kdagCrnqQsBc6ikVZnwDqdbwqp+KaL9gS1CSl5p5t5lMs3MVe4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:31::9)
 by PN0PR01MB5914.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Wed, 11 Jan
 2023 09:13:22 +0000
Received: from MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e762:50f5:c91e:7e61]) by MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e762:50f5:c91e:7e61%4]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 09:13:22 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
Thread-Topic: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
Thread-Index: AQHZJYqW0X9zj+hpQkK22Ny+RkFTBa6Y7JCAgAACEuY=
Date: Wed, 11 Jan 2023 09:13:22 +0000
Message-ID: <MA0PR01MB71451A4A70DBD85680E90AE0FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
References: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
In-Reply-To: <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB7145:EE_|PN0PR01MB5914:EE_
x-ms-office365-filtering-correlation-id: 6726e550-57e6-4e30-82c2-08daf3b4168e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDKcGr4A7eSuRne3iU4exBzCu9cjEv47q19glrkaNH0Mz+ydYIzdHFagzHaENTGsuKg5GCz0NepwaaZhw8O3BO9e0CeRG/Z+VdD9zjZv0c4NpL+L9/yS9Y//1gTEF5DJGB80UP5JLNPqGn2m3xIPN1nLNxPCbnHnnSijCJQP+a3wUL+tk1SjBqzz/G0mocPo4Y1En1WcEVzEJVuNdnXsEgAkAlyMmNVEvybmho3HkbVvGT1lvX956YBcw3eY2yel0VN+V1cHYVR0Fu/YnR5ddo9H+vmfq9LLHU0EeybJHxibrH2l+KtOTxm/48zIRFEm15NUgT6xyS/WPtybxSAybG9b2hhvqAjOGA+M8hPId/QoLjW+W6qbH87VMIaCuVkxicnIcQISLhvCQH2RmlX90VYHsQRLHn4JOEcXA+1pjfsQdCx5TVro04+YDb5tYQ44OINOw5JPTEylJrzBapXdyff9yQGyEaWlsVqOdu9L0PmTOG+LGS00Qo2w9SddP2e5EtaHzW0uI+I79INcK1hQTNEv1+kTgwBrRTP3MX9f5Yrc56YsXYH6A7RsR2Cisv5rW+FQfoC4KnvKSkqDYtSEMYOcScX71a6uUlTR73CqcXfXZSz7M7Oj25s+6aOinMeJu/BNgBzI92JuZyqVT1b/jQ43+0hoX+UrXvpA682qSYXnyvRWmzlO6RTl0aVWjKsoj+/quxEpVhL+f4Fp2jOPSNSY55ejFdOSdh8X1R4YYaZZ8c11p/8IP2lvdTnP13ykDd1p7gUWBdWO19Pjr3FLsWF59xt+cAoy4W6oups0ssk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39830400003)(376002)(346002)(136003)(451199015)(1690799008)(186003)(19627405001)(86362001)(33656002)(316002)(478600001)(54906003)(38070700005)(55016003)(26005)(6506007)(122000001)(38100700002)(166002)(53546011)(55236004)(7696005)(5660300002)(7406005)(8936002)(2906002)(66446008)(71200400001)(64756008)(9686003)(44832011)(7416002)(91956017)(66476007)(41300700001)(6916009)(8676002)(52536014)(66556008)(4326008)(66946007)(76116006)(32563001)(15398625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fuqbExA/XRbCtUsHLu8qdBEXDrPY9dTVcYgTxpA3OWRWz5ax9M8GapO+b1Fn?=
 =?us-ascii?Q?s0AbjmNltsQA5mL4+5uq32X1SU1YeCTVnKNHC9o7CHM41oEWG+G1ei8BhEZK?=
 =?us-ascii?Q?UNGuS3DhFWmX7Pbs1OPmb08QUTAU65msjxvNcCtdKsmo7EVNHAiOoXSy+YVh?=
 =?us-ascii?Q?PvfHzl+wSw3+F/2gx/i0HGm8gDiPvZpF0xIbQRIB8RBD0YWpad7HHgLfHjxu?=
 =?us-ascii?Q?xsWxUwMXB1Ff3djDggpH9NRnT9jU/6logVpOhPzj7vXLzowLJnj907Xt/z2A?=
 =?us-ascii?Q?rmg2Wr+AGSgtblYFzuBH4evEaCBVRuN+AwvEBTDtcQKFNrTDagiY5kFVsyZb?=
 =?us-ascii?Q?ZZ/cwikb3JxO/YThRsNMv8BAnN9Ct4d6aq7wVN1NAy2gKCuCTgCN4QXKaT5U?=
 =?us-ascii?Q?+G+xrln3ZApDI/OT1XUktExK7RuIV/OtQ1azJ7LkQ32WSmkv6kljxY1g5+2k?=
 =?us-ascii?Q?e+GynISaEEWoyC2J+CcPOi9Q9wJqXKIQE4PEojKhy9f/8rNiR7sNzxA96chW?=
 =?us-ascii?Q?D5Yw4bNHMYfN+QC/DW+poWDsAaVr0T+MS/gHumUpLf5xdYi/za0Rulvntjqq?=
 =?us-ascii?Q?ryOhdBvw+kHOkrR7RQc7aC3CpJcjfk7uZwHiHRI4kQLaxnSQhYDwLh48axT5?=
 =?us-ascii?Q?213WZCjrCZuGa1RvVZltKuWmELFcd3xNLzpzukavCOhalfmrXZLk8lRWxRbq?=
 =?us-ascii?Q?kUBML64/P9x9DJlABFw+AFDwIZMxaQsH5u9MNcgafUaF11XNWCKujmI0DFXV?=
 =?us-ascii?Q?AQBcokuO4ZGuCFQPGYyPbLsdWHtS/5NuQlNQozXFssliD7f4zSM18ooILZnR?=
 =?us-ascii?Q?mjEGGSHE5QNEn71jqPJldlh42meEIGBGZyNfXZGhn6IcoEbqy3krLPPiM0x0?=
 =?us-ascii?Q?fqEcPnQ6xULK/IxaBiKqGraCVKTk1208uEQg4I6radB8z5DimsaFRwZ0ZHJF?=
 =?us-ascii?Q?EtZiyOBF2W6D9DBW5dWgWh5XM/zPWRDKtOVXg9UVba8X9x2UVNRwZzh/7So4?=
 =?us-ascii?Q?3HNcGdfCTDca4i0bdAQ09bAceULHlnJztSnJCITor3QLVNQa3IV08JRoe8PI?=
 =?us-ascii?Q?1KvLwDknVRUKbQT1cWII/k5vE7MBffYEoeSwoisjZYKFgskPyeIpkaPgu9g7?=
 =?us-ascii?Q?eVNNqSn7JisLYQigM4651tQfxIhhIvypcRNuzbX4aNZLzdqLoPt6p1sdI7w0?=
 =?us-ascii?Q?99ieFCB+IPopm/owhYSVn38h+rJsYT6T/edoJom74Hskdz8zx+3FHWA/0nxz?=
 =?us-ascii?Q?sQUKt0H2l/mvmNaDWK+VzBmUkgSibmUurZWiHI86J35vgbm2A4POHGlXuGJL?=
 =?us-ascii?Q?hbfFxblCkSRLkCqJgBtbE9U5JMUtOkrKrjOpUFH0MWCaEg1M+YPGmc/SQOto?=
 =?us-ascii?Q?XPEU7nFFsDgZy7dVztM34vQ2VcJU+qEzPDxzB9IsR8DDpUwctGw036yr8k0C?=
 =?us-ascii?Q?NPvlC+OezcptiWHJ+7ymjUNk1vXy9adoM/eQ6U1cMG/shiSqNjkcbz96REdD?=
 =?us-ascii?Q?b5PkldOEB8v4v+Yeg0TdvgjxvRI8tXDl9EPhouRNBT9q4A3V1llX+hnymv1/?=
 =?us-ascii?Q?im1AMmYlLLWo6qAPLhxuUDWOtKeRad3ax4wC3woiN3yFzH3ENI0e5DRkNdg+?=
 =?us-ascii?Q?WO0bm8IDnyVDK67RncnMTwY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6726e550-57e6-4e30-82c2-08daf3b4168e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 09:13:22.3822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqHwEq3RIND2sYkwnDUkrBhxD5uUavpJ3KdrKiwPUwYV2XYWirP4fp8+OK9eGLQES9EaV+9HOyw59qo2nCNIxtMQHKKNUg0Nk3U3UXfTbQe4LbqN+ZYryWgTspLpozFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5914
X-Mailman-Approved-At: Thu, 12 Jan 2023 16:59:43 +0100
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "Markus.Niebel@ew.tq-group.com" <Markus.Niebel@ew.tq-group.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tommaso.merciai@amarulasolutions.com" <tommaso.merciai@amarulasolutions.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "ryan.lee.analog@gmail.com" <ryan.lee.analog@gmail.com>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Daniel,

I have added support for the external codec MAX98091 with I.MX8MM-EVK.\


[photograph]

Hardevsinh Palaniya

Embedded Engineering | Product Engineering  | Digital Engineering

[linkedin icon]<https://www.linkedin.com/company/silicon-signals-pvt-ltd>

M +91 88666 21333
E hardevsinh.palaniya@siliconsignals.io
Silicon Signals
616, Anushri Accolade 2, Science City Rd, Sola,
Ahmedabad - 380060
www.sisignals.com<http://www.sisignals.com/>
________________________________
From: Daniel Baluta <daniel.baluta@gmail.com>
Sent: Wednesday, January 11, 2023 2:35 PM
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: robh+dt@kernel.org <robh+dt@kernel.org>; krzysztof.kozlowski+dt@linaro.=
org <krzysztof.kozlowski+dt@linaro.org>; shawnguo@kernel.org <shawnguo@kern=
el.org>; s.hauer@pengutronix.de <s.hauer@pengutronix.de>; kernel@pengutroni=
x.de <kernel@pengutronix.de>; festevam@gmail.com <festevam@gmail.com>; linu=
x-imx@nxp.com <linux-imx@nxp.com>; lgirdwood@gmail.com <lgirdwood@gmail.com=
>; broonie@kernel.org <broonie@kernel.org>; perex@perex.cz <perex@perex.cz>=
; tiwai@suse.com <tiwai@suse.com>; peng.fan@nxp.com <peng.fan@nxp.com>; m.f=
elsch@pengutronix.de <m.felsch@pengutronix.de>; shengjiu.wang@nxp.com <shen=
gjiu.wang@nxp.com>; Markus.Niebel@ew.tq-group.com <Markus.Niebel@ew.tq-grou=
p.com>; hongxing.zhu@nxp.com <hongxing.zhu@nxp.com>; tommaso.merciai@amarul=
asolutions.com <tommaso.merciai@amarulasolutions.com>; jun.li@nxp.com <jun.=
li@nxp.com>; ckeepax@opensource.cirrus.com <ckeepax@opensource.cirrus.com>;=
 rf@opensource.cirrus.com <rf@opensource.cirrus.com>; povik+lin@cutebit.org=
 <povik+lin@cutebit.org>; pierre-louis.bossart@linux.intel.com <pierre-loui=
s.bossart@linux.intel.com>; james.schulman@cirrus.com <james.schulman@cirru=
s.com>; flatmax@flatmax.com <flatmax@flatmax.com>; srinivas.kandagatla@lina=
ro.org <srinivas.kandagatla@linaro.org>; ryan.lee.analog@gmail.com <ryan.le=
e.analog@gmail.com>; devicetree@vger.kernel.org <devicetree@vger.kernel.org=
>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.o=
rg>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; alsa-deve=
l@alsa-project.org <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk

Hi Hardevsinh,

Does your imx8mm-evk have a max98090 codec? That's very strange
because I thought that EVK has wm8524?


On Wed, Jan 11, 2023 at 9:31 AM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Date: Sat, 7 Jan 2023 17:08:28 +0530
> Subject: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
>
> - Adding node for MAX98090/91 in dts imx8mm-evk.dtsi
> - Adding tristate option in <sound/soc/codecs/Kconfig>

This should come as a separate patch.
