Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A208C784D78
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27927F1;
	Wed, 23 Aug 2023 01:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27927F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748284;
	bh=2p0kPaVMNaKVvGyR22JPoQRNZBOrYeF+2z3u3ZMwHWU=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LCikve87WnaYYtMMFyfDnBX5fNYtKnoQ60/OB0kAC2n+bymi/GJ6+tww92QY4+D6N
	 W940mIW8LYHUCm7c5wpZ5P2CoJvONJ3NOYUsq0vCmcDiSYEM8VS7hHDnYtgio6hpGV
	 /Uw7A6xhGL0RCW1OzorCY4qYR4krW9gLej7oRLnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F477F80536; Wed, 23 Aug 2023 01:50:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BE5F800F5;
	Wed, 23 Aug 2023 01:50:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F318F80158; Wed, 23 Aug 2023 01:50:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78167F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78167F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m6nqky0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ2rRdPB//sszjOzgZk+fv9wk6VA94UnQP0HJM7gsdPXLpJ7Wko13BmRY4lnQO6Xq568y7pnKJlJCDr8cSVyDLyzTZ5x3/toRqni+6XzEHWVrte9eKH/Hdhtz/R1p0Ts5j+/aO+a3Xog/gvQC+AZ2VX9bk3gr8XnmgHND2SRjNt4un/ZWWZVVCLeDY4alkwXpicHEWAoHnO6BFNk0xhc9JbAdR0koDSQTvKlfMu9hy1CGEq5gC9pQI2Rkm53+/eIkPtaVwnUrpss2HI8iqj/atUKk86tDUj5W9OFVSzM83EOow+4md4vYnf0K5GE4g+Bvkc+O29oU3cL4+/DoUzZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlmEZPUuQ5HlJNFzaizAIiL7RVN/+k/TgTgq1tmawrI=;
 b=gNHj6YGLk3nJrBEQ0BktTimgbTTGp5cEs9yIM6eSt+ALvvO4JB8Zbz6UUf/U2MQJnUouvlDLak87UHI3+6gS3CbMiK6gs1850LNgF3eieQUmfYUjSsryLByVvPFgoX/QabJDrRWBwy3uxHMLIsAJxNVRm24+3OF6jD+PhuA+mSUIY4yZHb6dnNRMVwuDlg5vHrbo9DmkxU2clF8eNYSfeEpKs2yks55DhSnljcADXYorxWnfbcdWwaqcyb6B4zprWTlsJ1cfAkBPR8IXdBX0lUAoBJ69At1VIrM0JgUJvQ8B1QrOOmKCg9jHDBBjWeaCXWa5zx9YE0XOl9L4iDqDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlmEZPUuQ5HlJNFzaizAIiL7RVN/+k/TgTgq1tmawrI=;
 b=m6nqky0eeVychfKjsvqW0TroqV45fZ57nxmFK/6v++MSttk5ZNtmT1JuJ2z/iL/+bBzzZMEsegO4PZYuNqmv5X3AczjmwvJMDjWgTXoV1abpS4dbkDPAvZnjkEc+N42XWoMRsEe1dYoq7BG4D6rhKOM5Y/FN6XPdWvxJhZ/PqjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:50:10 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:50:10 +0000
Message-ID: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: rsnd: tidyup ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:50:10 +0000
X-ClientProxiedBy: TY1PR01CA0186.jpnprd01.prod.outlook.com (2603:1096:403::16)
 To TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 8576abe2-dc8b-4e56-5d20-08dba36a859f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ytQ8LtoyILMz1LRZ1R/SrKqUfCXp8DlQQktTOy7Qk6XDLkc7/Q5WB8dZtgetcDP5niy8aJ+Zk9gllk7BKmvSCBnbRv6ccjh7HXk0dksWnZ24L0E+aBSKiElCZ8ScZdoI4YAbLhohOE/619hJBd1I2Ee3xJAggtzOs0X8CJUqYlMdJKqlvxPkPYYY2lzMMqJrCRdE1OJ+/YZUVQsX71tQffUMyn1VM8bc3W87y8H47CKBRvGtPIMg5F507zgZ7qr2JLdzgsL1e6+pz/6GIC6OC9uHnnCca1vZG28FJsOW6iyY2RH/pXJ6Kk9dH49YccEhLFZUATF4TPFbXaeBToWZSQfJjfAMX7eww+zt7IkmHvnf3FrRTksdjPc3bD9M9vdGh3mPyV/wgF8MfWZtH8MHn6Hh1H2HzRpt2ZMKWrOUWz4H7S5XKQ3QejBANZBVheak9mUe9cHCb5v3Wse/VDSEwY3r2HqkA/9XyrFR0xW5ChQHZvMJ50RdF2x6Hdte4aSx1OWoplL8+woa7LAxejsQKT/NRAfzwtEGxiXjrk/dPLMVEGcRQ4PGg2k78InxzgV9y99mT6XoKVhJFoI0vo9hDLTh3Y8GuHGJe1gVkEcwSYqh5gNx/5xxPnZIRBp691+C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(4744005)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A6lVU5rEzzWBhpKpxRe23pPZB7m3qDdhat0aKDCEIcby7hMAK/la7g6bQVrv?=
 =?us-ascii?Q?AYlFvE/t+D439supjr7f4BvSmwS2zbCX3SbwrNYCBzH9WALG2nDLnAusKy9h?=
 =?us-ascii?Q?/9tPy/gSXCaS3zNPnqf4qug9aHtp55k2t9H66ITFpdjWRpbNP+I2NgfKqNdt?=
 =?us-ascii?Q?yQIEUE0Bs6a380f6b7AevXq5YOdi7Odrszku3TKXZUd01IgKs/MB1qYEqH9G?=
 =?us-ascii?Q?npPCEfG/HRxI0lbU6avzlDxDpYPZf5ddQQstfkuqqLUiLJqT1MosaNPp5phr?=
 =?us-ascii?Q?g1jchyrO+8cVAlZvwxIVVM6iPGRhTFDKn9r7d32FJt8DMrXKLW4MtOdHcS8F?=
 =?us-ascii?Q?Vj0hC8Eg9UnI7uCXRu1Ut7v4ZxaKgHVkIPd5BBjf0NcFH4efEGuoOXqnJyK5?=
 =?us-ascii?Q?lAJM5F1zfBgjANDJPwXm3KGWo8Rhlhr3N1vJ4HNH7r2ff64JfRdr/FyV3csv?=
 =?us-ascii?Q?q5QIQ7Jw6I4nJlbn4RBYgoJDzwdCLo0YPoDF1YUxz4YDNYsGJPYDpUTWHBmw?=
 =?us-ascii?Q?kEUi3xujh8P8QOMKVgmTVLq/kr9RoN8qXva4y8S4Y8aEn0VN/X3k8kRB80Ie?=
 =?us-ascii?Q?8b+h1x3tvbEmD3bdSeq5y2k1Ykk5ni5dE6mGn8Ekkk6rjKopbhNdCkWnwja+?=
 =?us-ascii?Q?kElm4g9ClC1izoyC69zauPVZquYVXVVDlesq7dahv954htQg0MOLroUl4pBD?=
 =?us-ascii?Q?FaAEOfVY4JuU1+h1aywVv3BW1vPjN+TdQkEBG7W0DB/SJdO4LOGcy//YaFb8?=
 =?us-ascii?Q?QVI90mXUOvMNWrR6A1UUZNzvAp2LKMbHSHyZ/mJ9zvkj+xM/q8T+zwdYKR+X?=
 =?us-ascii?Q?O8kE3SU94TyyHjusut4GulA2S5kZ4ayjLQJEykmrE3LsTp+1biVZoCm79IhR?=
 =?us-ascii?Q?2If+D+lN6Y9g5AlliGVK0eusK1tqV8WtoRJogs+pEculrvnv4Pz49viYqUoF?=
 =?us-ascii?Q?3Uszy5GNaKK3kpfuUoB59i4OAxc9au/ioatKM+LWX5fEzoKs243Ecj7dySKv?=
 =?us-ascii?Q?W4bNRbSFdZ30iq+kv5DGZcVS92gcYDy3R8AszjKGqm8WA603yPJYVN1G3MxC?=
 =?us-ascii?Q?egv/63OjXGqWdI7tHNj27bKZ/gDctsg6+hBXMNfEBFFusbKpDxmeK2c+hj98?=
 =?us-ascii?Q?v6ZF4sPyXFcGlOw0QhggZNuieYhxYwSP7+eV1/Dk8YaY9Qol+jmi06l/98nr?=
 =?us-ascii?Q?O9bp2FPp0O5OV0W3AFGICJLeSaXhI5CWdFgQOBW4dfb4ei8ul6FbVOAFlZTF?=
 =?us-ascii?Q?H7hILi0j1NrJNoVx8WZcya/2Z7H+zRpo4oQk5ydmMRqfYgfU8GBsMAS7f+lI?=
 =?us-ascii?Q?3YGlZw5wbUVcEdvWZTmQAXYh2wAZSbSztvMZTBXbKpR7I4HuLf6LT5pABQsI?=
 =?us-ascii?Q?f6uz3pPVxmioxh8M2G4tanVjqzERwz+gbrpOiFgzk8++JHHAQwodTvyrE4uI?=
 =?us-ascii?Q?F/29RDmYtS8Qblc//Bvpj74X7oFKON0xNicK9b0W7OZBxFpW0Yi2asaHB23q?=
 =?us-ascii?Q?mDB7AeaYkffWuz4I3D2bC6q400/YKWpO12OwgdV5jVuVrKSqjykrQBcL0yIW?=
 =?us-ascii?Q?7ANKKgLfjV3tVveL2xIIcWuYatGbho/7rd0Ja9oPVlQ/bdm6m+tBRg6yTNs+?=
 =?us-ascii?Q?fbZKVxYtCTho7NQzxrHX9UA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8576abe2-dc8b-4e56-5d20-08dba36a859f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:50:10.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mSaXyBm7u3WILIYilVDG43UxbrOhKoX81I91Zt6uDE+qHdup7QYgQY2DcOYIFwJqbLnhhnLJgwNNPR9ed76cdzD9SBUrIgbVsxXQeIoVafzSUgXyfyyopFqoJClI7Cku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: 7H3P3XEQNQHDOBS4WXNOSZBX2SYBGWN3
X-Message-ID-Hash: 7H3P3XEQNQHDOBS4WXNOSZBX2SYBGWN3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7H3P3XEQNQHDOBS4WXNOSZBX2SYBGWN3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

------ for git-log  ------ 8< ------ 8< ------ 8< ------

Renesas Sound has ADG for clock control. Basically it needs
accurately divisible external input clock. But sometimes
sometimes it doesn't have to be accurate for some reason.

We can use ADG clk_i for such case. It came from CPG as
very high rate clock, but is not accurately divisible for
48kHz/44.1kHz rate, but enough for approximate rate.

This patch set support such use case.

------ extra info ------ 8< ------ 8< ------ 8< ------ 8< ------

Kuninori Morimoto (5):
  ASoC: rsnd: enable clk_i approximate rate usage
  ASoC: rsnd: setup clock-out only when all conditions are right
  ASoC: rsnd: tidyup brga/brgb default value
  ASoC: rsnd: remove default division of clock out
  ASoC: rsnd: setup BRGCKR/BRRA/BRRB on rsnd_adg_clk_control()

 sound/soc/sh/rcar/adg.c | 68 +++++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 13 deletions(-)

-- 
2.25.1

