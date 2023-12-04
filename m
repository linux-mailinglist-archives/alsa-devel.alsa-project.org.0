Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4B8029EA
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A673CDEF;
	Mon,  4 Dec 2023 02:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A673CDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653698;
	bh=rfVKHBQm+NtAm+6jwbUjqMj4uWupzXeiv73rWdaj9tc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbupikjTvsbw9v2nFa3uh91gi8RLT3UfUTgHsW6t1+RESabhuxN1QFgiGTQlpQdMx
	 Wedr+8gq24Wgg9lUwGDQWbtcB1mRAXpMQ6NSjlck7GmBI7Q0h6w1w90M+NEVJxbmS1
	 MPg+ABwmRLIKZirksSlo/Ls5qOr4qgvAXKs6SGB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98845F805BA; Mon,  4 Dec 2023 02:34:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 497A1F805AC;
	Mon,  4 Dec 2023 02:34:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5EB4F8024E; Mon,  4 Dec 2023 02:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5D29F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5D29F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=U2Spk+dS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jacFNiPO8pRmtzhcxYuA74aPlLRUgYBlbSh880RwcuEQr1pX9XoYPw6Ypa6YmKlTiJwWxtXA6vY5TqYf/cBBRCLaKSjtgNirMouoo71DgEt4s/K6X97tBWk4T10y62wQ/aOAh7C7xY154LjtydKujzz618TIQ5hZwIkTj2npYCMasRlwBy0MxewEVkfcG7h2ObJJ5/XKU/YsWicDsI1ENxH00e+p6kcHMjcW1dICb3R3PqEWPMmtbWWn27uu0DYbO8uYmBZGoetEpNyqRRFBV6MXOGcwr0GGV4aCWd03wlfZX/EVaf+5jdMF6hQq4Z/wbLvTlV33RWD4ASvRuH9Yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox+x5ZO7KFS8nh3Ga+svuF7cigmX7JbnmkjgSHDqRB0=;
 b=ZRm7BayiQ4iT1NVVKBzavVvsJ/CKGiWKRCvyF5R4ryLVdcgqS/okgx1Q3oKdbPOTcrTsppekvyKS+VNGYDi/4fTfnZXuFFKzlhQ+OqjhpMu5/PX3iXdCuwPnR17KCgggsXSy8f+kuvbbxlad2dAHK5LDRhkH0RJAZYOIK34ZpjAn3mt6g+SnusAZjDQAJ6Hl1TMZbZZQs5GCrxnzX08KymGbj9b9TYLKY4pUFEMClnWT3TCkhTGnqarj2zDXYZXA1w2Db4wU/DoHbKne1QL/sjd19YsZxB2f0CZdYZjKo39NHvevUb4oVpqt41m4L/YJIivfwZmawP/TUG8eBlluQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ox+x5ZO7KFS8nh3Ga+svuF7cigmX7JbnmkjgSHDqRB0=;
 b=U2Spk+dSlREs7VoJYqMHRDar6MXW6yYDHVsFHG5vPdV0tGZx1GwCw7HfMPNlCmmbSOBrWJJ5kHX+8zlYUtGszYELAuptHi9kzVbqloZG+CTbf4WxiWHcuS7Q50BVursS6rKxrDpcl67l7mrn3paxOaRf/pnckNhXmAPYU6oMrWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9747.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:35 +0000
Message-ID: <87fs0ibvns.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: samsung: odroid: don't need DUMMY Platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:35 +0000
X-ClientProxiedBy: TY2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:404:f6::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: e5116c4e-93e2-4224-1c75-08dbf468c0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C0Xhg+ja78WocyfWasnr9mN6w1AIr+L962ZSUvHQmAlluNuqaulLdaf5xXcpI8Ft/Dh9/VSjru/fR1zXgwgY2YPGnxvWNTlIaYeSWZ6XP2xOk5BxztdcxkJ2SEUnWD5oiGRCRXtVD/3XGghWQouA5SHiiPc5STJIiVRBDfIniIzH9D6j2Gc6rRm6vP6IzGuTvWXLXSX3UvfjTBEeQX3rRChmSKlOo6QLdZY8vWt9uVCI5GfFbVC0i6Ke1Ddwd+h5ftVX6sCSIlun/nvgqRIQN10whklN+Nbjob6mEAtz1j7Wegs+h/44SGh/QXg+rHAeSLwqQZhtIUBGz/N/eXcRDb6nY4a5IS6ZSQhRpBH29rOtxgbMnfKnzZknKIhHMJzEJoz9HyJ7hpJhjyc+9STqQSUrVi38gTH1ONkGsMyAO4oKzEso5MDZhhM3BRyIKEtwQmhNS2Z8LFAkUlqAD5SlAwEC+lFcUItX2Ndy5a6sN+26I733G7Qsu++mWoWM+ngQKEWsgeltqY0dZeNsHk0XWZvlH8X/w9oSTPcmgYN8/jVLhXL4V4rHKZ+l3tUqpoHtWbcavz3B8GXHfuL1KCyxDcq24tWT2pEU2V3UJe39yuMp/osbMLXVAFY4tS5rfLz2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(52116002)(6506007)(6512007)(478600001)(26005)(83380400001)(2616005)(6486002)(66556008)(66946007)(316002)(66476007)(110136005)(41300700001)(86362001)(5660300002)(36756003)(8676002)(8936002)(4326008)(38100700002)(4744005)(38350700005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?amiCjp73/UUzkw4udXt6xEHH+QDUPBN7fF89cYRWh7f1c+AUJbtnlC9n8ydg?=
 =?us-ascii?Q?sSkYJRZycXVB+KZNIwF+xBaAKJHW7Ack4spMtjmiTybEcbMDD3YkCERxn38a?=
 =?us-ascii?Q?CEDXEAsswi/N0cQRuTHT1PMWnQWuEZXxTBSTKWh9RtypruF/2kdpNyEGR+Xi?=
 =?us-ascii?Q?IfjGDuDlonv+KTQyzkGoBR+C7oV/n9JRY0Nw7B75VwR4iwsYL2AeluPe/Fy2?=
 =?us-ascii?Q?LAYwc8oeyD+/MRCK075gox20aeATs+v9ZB/I7OESGRyKIpWhes34/SAwCAY1?=
 =?us-ascii?Q?zERpUU8mZ3eu1svOL/TOFFHFII61MqXO+iLc8nGqh3gf0ywbnlh+9ou0egfk?=
 =?us-ascii?Q?0vOWTEdMXvCYxmF8Rl8axpwbS+HFtkC/uBHnarn/HYUCVO90n7erpdPy4uHZ?=
 =?us-ascii?Q?eMqXTnLtAKxIzKTEl36VX6uP5HjGQgLDhky1FXJ7NK+xbsVKyMHUoNhXv2tj?=
 =?us-ascii?Q?NaGzTbwSasHy2yBRMeUxyfp4sXEwEcHihVBcYgPuLwjJJ2pJnRjuqUf4CNqG?=
 =?us-ascii?Q?L3IOFJ3Tl9TGJjJLylqNNzy9QrtM1UatOPKrWFBcqSfBulcO5CQ2X8T3WKRp?=
 =?us-ascii?Q?6txoUXNSeFM0kkSZHqOkpnp9a7MTHLhS6WUMil3rAA6AOdGYZ8xz/i+0n9LP?=
 =?us-ascii?Q?jaOzv1WiXlhxvj72oG8eER5W4AFLO6Wt1RzHHdfYu5IcU19lbMMyy6k7qflA?=
 =?us-ascii?Q?McyiPavTScRhflc7LVS15yModu03VaZyY9+EEqnHGCA0VnbsJx6TVaHByFAI?=
 =?us-ascii?Q?agBBHeeLuylI3Un2+NJKItcdQ+zktG7L/pcgxVuB9JjlMK+cQX5kO3m0hIqy?=
 =?us-ascii?Q?TcMEyNLCNdIrtXruxPWnb+KH5uHrztMDnMP98V8CGdBvzzhJf7i3k0g+AVEZ?=
 =?us-ascii?Q?bO15CaoMVgpfwldH1Lvae8gjr5w59WAk7FMpTm99PDG+7+RylGHXbFUEOImr?=
 =?us-ascii?Q?t4WknNYg+2vzSDlZKvXuH40XFGy9y8lQTLjDQ/ZiwSG50Ax/QY/y3kZAfzgu?=
 =?us-ascii?Q?Xqc7Ecv/xkiO6AyCra/M3pQW1apqVAmqW2HEJmQiYxjCN5s4uVLnJz/6Z/Wf?=
 =?us-ascii?Q?z2PvwYVqP8E4tDUYY3v3U0ChuyFu8AIbLFUIUFRTkNG/Am89EKi70YXdxnmS?=
 =?us-ascii?Q?jVPug7gxdU+K23OLwY0y262s9b7MimPGmul4YmnjZrypTzYUk0Zm5ZTkWhVk?=
 =?us-ascii?Q?wd1XzRkddAwA5BtlRKgTJbrEOmg+46fsbYQc+qBtIIp6HKSOOQilN8wXEpk5?=
 =?us-ascii?Q?gVTT60Q0JPoFdx9VD83eQ27oohgffiPhgHpaRSwmQVqczyeW8hsC/09C8U98?=
 =?us-ascii?Q?hozZL+PW0td1AWrIy74YoJlo8SWnGi7Yqwws6IF5NRs7wWYXJuTWfaX2XW6o?=
 =?us-ascii?Q?Dr/xx8E/P6WmALJDEOFxr+mtAL4W7frVacWLWDq43PnK3hsorKGMkWqVKxo4?=
 =?us-ascii?Q?TNfzRcviofg9JPhTvL6XTLT1wPPusW1HQoRymhkq0oS7HeMTO4Z7w+aJo4CB?=
 =?us-ascii?Q?feUCt7cw0N9a8JuoXmrhKKpZX2jjWM9eJlQJRpUaTuKynq/KN52vHEoTEM9B?=
 =?us-ascii?Q?p1g6RpFjEinpkjSRXIe0ccbA0+stgjy/F+YW5bVYFkz7Q1SM17kKgP1Rr7v5?=
 =?us-ascii?Q?Nk6GUKLc2pq4AmwGla/s65I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5116c4e-93e2-4224-1c75-08dbf468c0eb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:35.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Itp1tyILPmDkycnkA53boSSZ0jJ0fExUoSbLzN/N/N3wuNMAenQJT+qXbiXHcgDYooeNXewM6dFi8CRaHUeOKD9GX//F6OZ2UEtQXg6XdurlhlDVG9IT3tkY8Gcpoojb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9747
Message-ID-Hash: DAR2AUP7UE7OP3TP5U2Z2AGVOQWHWOXY
X-Message-ID-Hash: DAR2AUP7UE7OP3TP5U2Z2AGVOQWHWOXY
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAR2AUP7UE7OP3TP5U2Z2AGVOQWHWOXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use SND_SOC_DAILINK_REG() with 2 parameter.
DUMMY Platform is not needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e95f3d3f0401..110ae14dd7ea 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -157,8 +157,7 @@ SND_SOC_DAILINK_DEFS(primary,
 
 SND_SOC_DAILINK_DEFS(mixer,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(secondary,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-- 
2.25.1

