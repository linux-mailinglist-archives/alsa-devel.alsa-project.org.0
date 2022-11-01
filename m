Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 332436143E3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 05:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778AD16A2;
	Tue,  1 Nov 2022 05:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778AD16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667276595;
	bh=86CK0ZptYOAV1DFEA0T+J2tw/HkBNs0lI8Srxey+bL0=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDw0XUhMNgYMc1v78mBgSxKWFjMjPW0XT8Z4kntljPNt/sfv67iae4KEyb3Kdk0Mr
	 30KxWCXCxEeqnhTiAJ+eQk/0ngAI55qr/HywWkXYjNJlJCRF6wLJygO5fRAPubp2FX
	 BcwAlG/dh6kjlWQ7KR5nqd2x1GPZnzyd/CxTmtwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C80F8028D;
	Tue,  1 Nov 2022 05:22:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CEE3F80558; Tue,  1 Nov 2022 05:22:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9A77F804AB
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 05:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A77F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="gTheLDUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJp9lM8b2jX98izSVCsOJ9itVhsWtSn5aEhJ+ih65p8pjqqKIxrEmEcirOyVcoJhu2RDgCRtosoBkX1hsacA7z8WHLydOu+5Sebelax2goLKwqRk4xoEuQRh6KzQAUVfVuPnI26uWosgj/ilqr+2Ll37Dpdf+UlWpM3QONqRL1P7mjEkoztt+YRddaO5ORQA0+VwVFcBYfw9hl14J4s26plRqxgaocTlaek9DGh9CsKr3xnz+Oo2tMp+kmMJHMosGAEJ1dkskSc1V5lsZBy5i0+tpiT1111M3nMc/MxuG8KgTfl5WOmBSQqjC5O/GaDpctQBJC6xADYr87D2dfIe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLWSvf+pKUEIcuGbVS8DiV6/pWQOubTj9Qaos/YfWEI=;
 b=MECgw+xd31yZpaYmht8yhQ26pfm9KfuIiu/qSOugLYafDf58MsKmnVuyjW/eHZo4xJuaJF4devPBefnAPS8+ItF0e7BFpEwmhHeiPah2AmCxbx7c602AlawJL4kkZvJJQunhJh3wfwTpkE6Bog2DfeeLcdSh+GnrRpTPjiZpLBxahehK2j/wcZ+2lL8n8U3syIwNx4jbFj8WxIS308/TmcIDWwMXbYUjBasqMEHlcPdItU/CkKasExaJ/khq8huKtOhHLXta1PPcMTGfg++lujpMMdRs+FRBzfdnOcf89gHEbBgsxYtuEMbIRbL848/X7gWwgDG9i67vhMDH31ACoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLWSvf+pKUEIcuGbVS8DiV6/pWQOubTj9Qaos/YfWEI=;
 b=gTheLDUTByoY4/iPsgQAidbHCmvWlNC4WzBqAwYb48ssQvacgJL6zYMEZn0o9Syh+Jwf0Ns7Myb5yZ2Fl2BT7d4xG7SzuW3nAv89He4jQzuoWCZdOb6ypRX64FSmBJxOFAVsQRdyetpZyQc86Kf2CBypezUw4kPVA4nEmV09110=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9813.jpnprd01.prod.outlook.com (2603:1096:400:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 04:22:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1%6]) with mapi id 15.20.5769.018; Tue, 1 Nov 2022
 04:22:09 +0000
Message-ID: <8735b38fta.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: audio-graph-card2-custom-sample.dtsi: add
 convert-rate for DPCM (MIXer)
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
References: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Nov 2022 04:22:09 +0000
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdfc995-07bb-4939-2404-08dabbc0a4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cff6vbAwEd7sBLq9pIOirPX5izDcXMjHxekYRiDzHM9A4zbYx1MQJSbnBb0WceRYHdkJYTT6ljyHRDw0zXgcB+kmzff3Jh8MvXERtQ4YVdP0Ewa8NpSn/JrzJs9+F62KHrZAhO/ZsaZ6qfYi6aNadcrtdl86qxmHe7ynT5MAu6CDBedrgQBbw6ejtE6sDQ4DlQfd6YzV7Q0PRp27jVD2djVcCpUBj9dsRdhuW1nHzcOk+lhScqiG9y7Wi7ZcjPhkrHbLInsx5EgnRcZGjMb/KV5v1fM1ds7qO6Y4gSVbLw16uR4GxnJ6DbA+rJ1EyMNV08vVQA3YrPDPEX0JHg0YWjkEhziv2xe66JlSZDS6EUuXNmYcE4LHulZgpPTD8ubil0uPSVIh19PtlO40mQzJjszSOt7ywDUi9qea0L91xOc3cFqTJQkmcFPiyce5sqH3h0Hg5dcp/DYcb/S0didnzKlyKlyZNS4EobC7vBL6s96JoDKKpOuOMMLi7GM2XJv/kXWD6kbPQ6tgmE3J2jcaKcAmPEETuJqUQ+6PNM+OqxTxsAm9Fdf90kf+cYIgzDPuWKLt8p/QYXNqmEkGok85Ms4VKFJI0FEv3teQ2/nAEqpeJz4ZH4Nh+epUh79GkMLzRIOWvwzO2kZ4bS28utqbPPa7mjhvBfHr+AV0zCnkvp7T3rgexV/JcJFXdBzpoFS26+QJug60z6+oRVp5M2bIP4RVS0xkelFyoXeZTqEoxNXNMXIGMFJw0y2oVO1QmCs6MDDRxF7471Q9LiGKmrfeOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(38350700002)(38100700002)(2906002)(41300700001)(6506007)(26005)(316002)(66476007)(8676002)(4326008)(66946007)(66556008)(6512007)(52116002)(2616005)(186003)(6916009)(8936002)(86362001)(36756003)(5660300002)(478600001)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdpSCPhR2HkdT0u55v0WnWCS9Ze7pk/SW4Wq23pNUZznT7xDYscgPZrYzW04?=
 =?us-ascii?Q?4nCYmAq1ha/AtXdNmrpRO4wkQZiWqMulaQXaUYzuP42jD1zpz/wSHyoy91e5?=
 =?us-ascii?Q?Ilzv6XqmIZw598cQ8QPD9QF4OhBcH337Yz0KTgQpWn154+XVI+hQLFQRgRu0?=
 =?us-ascii?Q?giHvoHp/Nr3p5VyrfmQ5VwKlkk236adNV2yoGExALTZj0gtdVCisTDTksSTR?=
 =?us-ascii?Q?mQQzYHMauCxmPheq39e5IBURSjJ2HsKEPZ8PyCvWE04W1gzfEDsCBoS6eU9q?=
 =?us-ascii?Q?Z4McNukJg6jksgP4lUPMg0IK8DOuZG/W69xFYzpwMV2sQ654KpfIOe5BgQv3?=
 =?us-ascii?Q?50+YLGfUtbzx0peAl5XrEBDNbOP0uksFnvKfYSwJVPd1QtIkiGjN9ndCsewn?=
 =?us-ascii?Q?X0s+Tz/S0+k6rRN2axijTUw2gckbfGg+Ctmldq4peDb5uH80Kvy+WF6Dd/IW?=
 =?us-ascii?Q?WvkKxH1gWXVXaiENcQzwvDZz/yzxYp7FZIdXvg1ngrCw3YasZOcE7ZesF5ck?=
 =?us-ascii?Q?QwolJuJX05w9Xab6Eud5yINTlUxcV/aJ2COMJqenI5+FhsAyoXsQWqXb+rgk?=
 =?us-ascii?Q?WMZoMKS7XXYvPkPaoLvzp6rdpjcGBP/nj0R+/TsuxGblkgDvIm6UJVlSvo1/?=
 =?us-ascii?Q?mmqhkaH4uaFt8JIMMXsYb2piFs4LIfEV9qZ05B017YU0uDaOpuu7pon/Ri2A?=
 =?us-ascii?Q?Vjfz6eiVRvv9fHa/ReHgdOYlKMOzZWMNHXgBexXsjtnZjhTurnLQI45ErKi0?=
 =?us-ascii?Q?3i/Km+EX/xA1DcxruP6gnKJesR8rQjk2LTrOzXLr0FD7DvY9pSNFdQu9nW8i?=
 =?us-ascii?Q?kCxF+hEWBvas61HBW3IZ47nadt280FfCRvSmM6BW2oKzhrJ2EIXeT+4Bhc/r?=
 =?us-ascii?Q?XpFA1x+BJ7uhoj7TgdRcUlmSax9TLtNDZrqrNGetSD3b/wsOSQSUk3n2MKX9?=
 =?us-ascii?Q?+t9eO1BNCampVVQhqdpDRwsW6VbIqxhzMVLLeso2cdYezFzJ8HH1sCqGgkjq?=
 =?us-ascii?Q?3iPS8zuCorEXU+RlwEOSIDNNOzVbQ+PEnDT1tZaC4Ax46lABQkLIKW7IYJgy?=
 =?us-ascii?Q?qUpYFvaLKqXjFz2oL6icuiOG4pgHgVJj+B4M3AIiKDGsLt9yqDGuDxz55NzX?=
 =?us-ascii?Q?YJVgE/ACwfbJRgk6z5Ch6inNi6FL0w5rHeCJQrO/IiCazBQZGq/Yv9QdTvvr?=
 =?us-ascii?Q?CR8D8VorH7ofgscRzYKO537rMcD7pKh/WBVNjpX4cVZO8sqLWjPuhN98DSDD?=
 =?us-ascii?Q?ur7MBhH066fJQDZA6/mCxex7V5YSmtTN5Yy67pE/qc//PS3TY22ljn4WGGfY?=
 =?us-ascii?Q?+yGJrgzxeQcu33CvsmmjbPmvFwKnL+ARuKtg52MNRqvNSFIsmjfJejT3oOC7?=
 =?us-ascii?Q?rwu5F8B5wWh2Rv3qbFfLrsc+P39/ExDtOJpMuDpCxfAC7zAjbNIKjjeq5Mfq?=
 =?us-ascii?Q?MZA4mf1NsRYOtz1MmNy70NPRk2hYFM90MMyP5vmzpIZSTcwm3Kuxfz2wVfAp?=
 =?us-ascii?Q?Ex31SMdO4Q6N1EIVqwCQIrWUjjOLBrW0lKWuE0SS52xjoQZs6zfJkBQnfDtE?=
 =?us-ascii?Q?4cZvvvh4OEdHOaRypM/z7vQdycJBN9kS0/MYYq/j37kPFFs9WihyDIDJMmp3?=
 =?us-ascii?Q?cnJgljXGSQM9mSQ0BoWO4N0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdfc995-07bb-4939-2404-08dabbc0a4b1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 04:22:09.8471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t45cpYVR2B0nCNkoLjfRiBYERz5aFJErUEg9+HdIR09FFFTHeGFoSAZBH3HQlAw+6xLLOArlSiHZ74D/rHRply0f8gh2E1CboWdY0aacAdTH3K37K75II2DbD5CcVOcG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9813
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

audio-graph-card2-custom-sample.dtsi is assuming that
DPCM sample is MIXer connection.

	FE		BE
	        ****
	CPU3 -- *  * -- Codec3
	CPU4 -- *  *
	        ****

CPU3/CPU4 need to convert rate in this case.
This patch adds missing "convert-rate" setting sample for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2-custom-sample.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index fe547c18771f..994db61a26b3 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -49,10 +49,13 @@ / {
 	 *		+-+		+-+
 	 *
 	 * [DPCM]
+	 *
+	 *	CPU3/CPU4 are converting rate to 44100
+	 *
 	 *	FE		BE
 	 *		  ****
 	 *	cpu3 <-@--*  *--@-> codec3
-	 *	cpu4 <-@--*  *
+	 *	cpu4 <-@--*  *  (44.1kHz)
 	 *		  ****
 	 *
 	 * [DPCM-Multi]
@@ -286,7 +289,10 @@ ports {
 			port@2  { codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
 
 			/* [DPCM]::BE */
-			port@3  { codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; }; };
+			port@3  {
+				convert-rate = <44100>;
+				codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; };
+			};
 
 			/* [DPCM-Multi]::BE */
 			port@4  { codec4_ep:  endpoint { remote-endpoint = <&mbe1_ep>; }; };
-- 
2.25.1

