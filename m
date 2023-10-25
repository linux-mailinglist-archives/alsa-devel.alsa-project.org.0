Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D47D5FE8
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 04:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3040686E;
	Wed, 25 Oct 2023 04:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3040686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698200611;
	bh=JIftVMUTHyucbnO76pE0xCJuHGyFH8buKqCmRIpjtdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CkzYePi8tMI9M/E60JNGAzRVgSI5+hNyc9ACfNjv/LqF/z4TYAVHSqkbi2vYg5ol/
	 qnofuRufyiy6Wvj8lLsrjS9uX8v8hWuYnHelLyUnFYiVjTHYWSvJIMWaXzqGK7+G+H
	 C5Rx1JiEHDyOOvB7TlKThgQKxdbphrKdI4fFAJgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07330F8055C; Wed, 25 Oct 2023 04:21:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 042BEF8019B;
	Wed, 25 Oct 2023 04:21:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67907F8055C; Wed, 25 Oct 2023 04:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05E7EF8055A
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 04:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E7EF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lxh1A0jn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JimeMEdX1HmzWNS1Y6qMPSJ1dLsj98pgsdSZtCEK7tPdjg3h7CgPqeB3gka4LJmEYAAm6+3nBEM48AFoqBp5gJhiomSQYE1WIV6opH8CAVs4qRHsgJpxEpJR3vCzxPNK1NTJW44n+pUPWOcbG5s/BlUpQbSS0idjqSCOjV9NoNF+AvYPDuEDwTI1bb/5hdmb+E82XJqlzFiymsWkKSBIfWttHZzSZtDJ/6gHc3o92sGAkOXJ3CabnuPB9hARSiGx83HzVwAmzO0YZsdPdXoI2nHpLUE9WR4BpvI8xiieNvZSvHkP6tKXW5AnhkzlJu/mudvY/kDLn5ICSybmQuRGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM7EnB83jtlSKLAmJEJGQftdO29zDX7nmWMdLsNRMT8=;
 b=T9wqID10B2N798RHRtiTxCeaGsvqixnGjQHxFAbeTrl5R7hbJNNJ8f5uw8Z0C/yGTuKMDB0v5UeqMpwH44OabIuCHso1KprDkxlVOvjf8Xrcs6+D05zN8EO5cfgUVompQ7xbCPQQSoGxTKG48P6cbiu1RhnWHaOwT2njCAnxdtCepJUK+DQtkYwdGD9g/yHQbucPu0766qDfUQpPno1hNLrSzcFFSnN8YFoCYHVlYM/zmGS89OKaTOVIcriKI+m+ogxTXYmwecMtpoxUbXoSDIc9IuXRJVojEPQ6SGr02fjfH/ldvvXWE4wECMNCpkX16aP6SUkjMyCS6chrnWkygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM7EnB83jtlSKLAmJEJGQftdO29zDX7nmWMdLsNRMT8=;
 b=lxh1A0jnvt2FdTUwLoJFvaLtHQXSEzWvATCVNaZq6nUqwifnZg45BZkqUpelNfahFyGwWZJHpfT2JuVC0gCJZFOUt7dhtG6SnenEho9NLdai48ypWTuQ19TegD+N3e/h69uOOJvwFPXn7t/RGOuzt4jtGhMNpaRS3a83tnzbUaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10372.jpnprd01.prod.outlook.com (2603:1096:604:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 02:18:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 02:18:50 +0000
Message-ID: <87bkcnbg1h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 3/5] ASoC: audio-graph-card2-custom-sample: tidyup comment
 / numbering
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Oct 2023 02:18:50 +0000
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1a4d9b-7ec7-478e-1e01-08dbd500ba42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CuggJCVDCdF2DCbo2TMDd316QQvGKOvsiufbHw6TabRg/xoZ/oFfUTuTWf7xX4bElR92MKEp3vRDvcAu5hlNoFKrAbsGphBtXMDzNB6e+EYaXtLHWV0M1pojT7z4BjE+Ddy0knBDxMMUm+7Z5WhcQx2Y4AvwCD7GvlIy3ZjM3U9WDSDnRWPFn7DQA93HmkWnaKYzWth9/SfIsL+h69U1Ct1yrQON+06NcuNPYmTh2Tz9dZffjAJTXS+66Q/O9tpmHcrS0uvZ6s2cm34SzMQ6aLBMOqvkCFaUTY/mhy7lyEFv6CDLZZBUX9t+fLusd6C2uxWYSqBEGySWexHFjKmunfVbAYfa9g44MK1EiaoXluOx3xkbvSci6oFZQj5sQvsz+4SIE3Vo+pzDCusgyif0JGCDB48k9vRQhDn6Xhsx5w1QRVcF6E6WttyFc673cuabXFQ/J6k5OXVHRrzjClONgUYgOo18mAVY7kCRHR+B3nusF8IIDHhgHujJ51eeMga5K5wP96fxqYc/FWSdWngAqLjYccdlyiRN4aLaSd4ctSJguD1nDE3OsIhYalfofxTW7zyheP++nJFGeG8KXlefi4vme99m0MNz27n/Kd7i3PwQxDnMwvNEvRhs17vB+vdzPkknOMojpTlN0WZKaI/o/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(2616005)(41300700001)(6506007)(52116002)(83380400001)(6512007)(7416002)(66556008)(26005)(4326008)(8936002)(8676002)(6486002)(2906002)(5660300002)(66946007)(478600001)(66476007)(110136005)(2013699003)(316002)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I/7wXwHcOp1fNZV8SazgVbSSW1oESY4Ng+dx2mJsPXNrFF7BAC4yDvxo0BDn?=
 =?us-ascii?Q?LRzKqSQvEHuok/D0Vwy/AvNp9tGh+A3d/1cp+W+3a2FirLVuOyBCkgNh683I?=
 =?us-ascii?Q?D6iDnRbg0Yr5FLZHqU0N2cmrgXKMy7s8k3Ot8zQVkA+uNjZITdhW8hf/HdpH?=
 =?us-ascii?Q?rxbgUkWnvV9WcpT4SEqYvgMBHs0BT4Tmu6RNFhj878guhqLEUb0lYxlZEU3B?=
 =?us-ascii?Q?9lDIr7YQgcEOsX6dkokzqeF/rzXW696UJOXqCGklovDusy3Bgcp3wFvJiQKo?=
 =?us-ascii?Q?fskZ7WF9UirvqwFriH6ZkK1gFhSy0qHHXybsNFDyl/u1G+yhIJN2bJ1dsv8Z?=
 =?us-ascii?Q?RVWoQ/GGHJTUzLnFphFce/MdEbJsmgIE5cFuQ2Kea3P7cvnoWWeM2IWC+UDR?=
 =?us-ascii?Q?HsWB9Kbi1L1DTl2Gqp5GSDZrvzNsAdLuq2M67bomGPH+GxjjH1Se/vP4oBze?=
 =?us-ascii?Q?+qhrVvioIY8qwf+KraJ4xzfA57DiIpuonzw1YN3BI/dpVRAdJZlGhadhmbGm?=
 =?us-ascii?Q?ElDTM6411WnWVQ+b9N6gdp2BwJTllegTY/rZQWd5kuhjqicobnnLSCsyZtbH?=
 =?us-ascii?Q?TrkvjwKyHRUtya+3ebFDkqKhjpraRMnijFTaIkd3yZwEqBn4TwkkZX/rANqt?=
 =?us-ascii?Q?NaVMtHdJ5lURId7cgPdDmFunqe5YWWOvmpPM3nHZTc9+wp+D72wElTtrAaDv?=
 =?us-ascii?Q?UpeRTJ8jXQ8yh49HsqbaAbMERnC44Isd5uZPXKLIKvPsZQOW+d3pLEjWo9T8?=
 =?us-ascii?Q?bMV9n/PXbk1dutNxCzRLkl3ucKWIOA2qekZlJs0eWA0ouhe+6H5dok/SUdPH?=
 =?us-ascii?Q?oQjoYlDQ7ihXa5wfjzknKw/UTrV3cI+4ogQa5w2t3KuZXAJjSVfmK0ha1RQO?=
 =?us-ascii?Q?WQqLySNyDkI8K3sSTfA5vvrhmBh63UypibZnJmeww53Be6k0Im+NArQhTb60?=
 =?us-ascii?Q?3RHB+6+dJCVTwcpJz7RwyxwRnqxqmLxTG/5MhU5CKzuIW9EPcE77gF6nXLp+?=
 =?us-ascii?Q?5D7DloKxr1uxBk1GeuPGP2Drarno2GwpAutHGvxwSb064SUNrpTn5tC+PNPq?=
 =?us-ascii?Q?3FZR1kgtrY5JPCkn+KTOpTKIUFWSM8lSnhMrGfvEhT0rxoGT1DqhYbM6OWpJ?=
 =?us-ascii?Q?7snneqG8K5U+RFRJoTIKkp8MVuqil9DJb4g9xvnfC2rNvFunI7ySBEm4uDU3?=
 =?us-ascii?Q?FnUHbLKIZxIB+8+4l9dRpM0v/mduIC9N0Pk8rhUhoZOR00/8DosrfdrAZeR8?=
 =?us-ascii?Q?fVI8WD+7Qi+lWC3eJChCmaG9lFS+9Odvw5GyKefTio5/A+3CiLI1PruCalAZ?=
 =?us-ascii?Q?wRaSfCXYGIhcHbhPGfXuWDAN868p182F4Q2cEl8RXx9/QpCi+hdx+fMH31Db?=
 =?us-ascii?Q?yNMjvaX1EEUvyFCqD92T33TjXYW37YirAhekxFZ1tr3qt4vRiGdQUKb68yPJ?=
 =?us-ascii?Q?JUS3AZKTZOhzZt56LRI356WNJ8ZPo+71oto+pU8UbjQeJ+NbIe5ilzgXkIsq?=
 =?us-ascii?Q?WMfhcTU+/owEnI2jwJApVQPVp/EAMldpkQiBLyAyfE6g79NDmhpG9+1QvKZK?=
 =?us-ascii?Q?QRfI1FVp/7nXUxApZr8xSLANjGQUa9lqk4mN3aZXid7gxcVxDFFskatJ3fL6?=
 =?us-ascii?Q?EGuo8dMMQXhyIQ9OTxY7inQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b1a4d9b-7ec7-478e-1e01-08dbd500ba42
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 02:18:50.6638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DdTO0qCaskmVy0Mox1/r0nkVT1He5R4ymL+EYER2BM24OkR0pnVKV35p/tSkhqJxUmARkl57c8uhnU2MChNGulXVo+7JtWvLOfTuJY0eMPfsO0oTTRlQnZPHRqvIXPNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10372
Message-ID-Hash: E36K6YADICSUYQXT7FHKDWQGGP52YZGS
X-Message-ID-Hash: E36K6YADICSUYQXT7FHKDWQGGP52YZGS
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E36K6YADICSUYQXT7FHKDWQGGP52YZGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some comment doesn't match other styles, this patch tidyup it.
To prepare Multi CPU/Codec, this patch fixup some CPU/Codec numbering.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..736eca553d7c 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -58,7 +58,7 @@ / {
 	 *			| |-> codec13
 	 *			+-+
 	 *
-	 * [Multi-CPU/Codec]
+	 * [Multi-CPU/Codec-0]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
 	 *	cpu2 <--| |		| |-> codec2
@@ -144,11 +144,14 @@ audio-graph-card2-custom-sample {
 			 */
 			 &cpu0
 
-			/* [Semi-Multi] */
+			/*
+			 * [Semi-Multi]
+			 * cpu7/codec12/codec13
+			 */
 			&sm0
 
 			/*
-			 * [Multi-CPU/Codec]: cpu side only
+			 * [Multi-CPU/Codec-0]: cpu side only
 			 * cpu1/cpu2/codec1/codec2
 			 */
 			 &mcpu0
@@ -182,24 +185,24 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/* [Multi-CPU-0] */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; }; };
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;     }; };
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;     }; };
 			};
 
-			/* [Multi-Codec] */
+			/* [Multi-Codec-0] */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>;  }; };
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>;  }; };
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>;  }; };
 			};
 
 			/* [DPCM-Multi]::BE */
@@ -323,9 +326,9 @@ ports {
 			/* [Normal] */
 			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
 
-			/* [Multi-CPU] */
-			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
-			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+			/* [Multi-CPU-0] */
+			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu01_ep>; }; };
+			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu02_ep>; }; };
 
 			/* [DPCM]::FE */
 			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
@@ -363,9 +366,9 @@ ports {
 			/* [Normal] */
 			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
 
-			/* [Multi-Codec] */
-			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
-			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+			/* [Multi-Codec-0] */
+			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec01_ep>; }; };
+			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec02_ep>; }; };
 
 			/* [DPCM]::BE */
 			port@3  {
-- 
2.25.1

