Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A4947244
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0A94957;
	Mon,  5 Aug 2024 02:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0A94957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818440;
	bh=qNJCRsLqfzjpUHxq2E54CJB2RRc/uc5QQ4fxmJJByCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dbuxIhvNFaWKmdtOI1tnXh+pAf2icq2bab+bggH8jqeZJ5+MGbcqi2wibwOTRuHQm
	 LtzWGJvAaggM7D6Tt6ME+o7CE6dHPtGygePsiz/ICW9uK7EPN0JNFPmuKdoNfEwWGV
	 EFyQit34efLmfMj0xh8hC6DY1xqhUR5vPi89PC7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1FE9F8067F; Mon,  5 Aug 2024 02:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 335A7F8061F;
	Mon,  5 Aug 2024 02:38:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A234F802DB; Mon,  5 Aug 2024 02:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CD00F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CD00F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ELljCNhv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI/X9pJZfnYMmjmE5nGvQ3sNDJ+k4lAMerTbwY4sfb8AKMUWGiKwGc9zfd1iOsr71kiNoKlEWU7xbiLD3xd9pIx9aBOhLlp9NgvmbXoObm10DLDEeSy5SpSknLufFsRKObFCBLyEuhxxuwjayhixqBji52AMtxg20cNzkxDKhXnEMT0w4pd/ZDOsnM/4eb4XvDvvSbKhscUlHnSiK62SERg9NvTnhjLa8KZI7CaWq/DCo/KXZVgrpMuYBkBomlPN35zrCvOk49hZozF4Q5LuIjHVJcJpsPIuYOEK9XUZSap4eVw7ww0bvqbhSZeojbiAModr1hjyOSVsSA96Ia0TPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn+aFG8W7K/ky9R9XxqYenET+qsj6NVDkrVCrdtoqVk=;
 b=hIBEO1n0Yb3Izt/L+8U579wncwzvE5Rh27A+YCVOl+IPwAN1hEmmMfk2RRf3vEMXwKprN4YKtm5wVhrvjjcXZh6druNwZxhf2JP68ri+UyiQ7weqvI//XbVg/QmpY1k+5DmzJdUL94uXPfMmTe6hpkX5ska2zyl9/UJKLYkI1Og/Ckc9Ci1NiGORgLlN6Yad5td2UclViz/268AzUQpoJTvZgOMfQgiPYc9U0ay037R/xATlkNmb1eDz1op7NJbUkLVGjBk3GhDK3CXG3r4VEj41vwADsvU+fUsW2NbjlpgQtc0NmGkhL2oAtjuqsuExixP7YbgfDpUEIhA5MSzUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn+aFG8W7K/ky9R9XxqYenET+qsj6NVDkrVCrdtoqVk=;
 b=ELljCNhvpUbyiR2Oktaj9JTB7ih442gLXbMNHwL4nkRVzc09AMTo8fMJL5nhebX7wINyNLhVrcd1eFns/c6JH0OdS54vyd5h6rjhHO2tg7osf4dYgM8JIDQlR18t79W/QrgmMNpGxH4c/vMj7EtgdDGOsNkHMWFy1BHxROPuLaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:35 +0000
Message-ID: <87wmkv24f9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 005/113] soundwire: qcom: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:34 +0000
X-ClientProxiedBy: TY2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:404:42::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: c18e3242-7169-4290-e87e-08dcb4e66165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JKpcdzJtpMRjhofGXfpL4cOtu4+EY7Ti0PPQxUUyHL7C+DIXb5V02Ngq4UzK?=
 =?us-ascii?Q?4+os48uZ9Di1xE4oQgQKZ4CbM153qfZKCtXsK66GrFCk67s4vSEBgd2WLJan?=
 =?us-ascii?Q?FjGJ7a5g8GINsLHthN4zpe5/EV8wl8f68qUdSQXjSTHoMaklsoao49g9ueZJ?=
 =?us-ascii?Q?zsdjsdo1AK/HRbPKxJq4uGHrhtKxZL8tU30B0ESFoQMiYDZtufUzNGKpT6kV?=
 =?us-ascii?Q?JV/t4K36XVywnTP/QGjeciIDzZ60UJ2/IhPF3iokeosHomJoBwbwhW1ONh5Z?=
 =?us-ascii?Q?0O8Yhw0Kn+dFT7NX9sxKh+yaDLK3rDUihQ5swwIrkjShthUDyGzK0fherO1b?=
 =?us-ascii?Q?uLWaOwXLj7zYwTJWy4nHeQ4edK09MWSj4W98B62CXjqH7k62gRKCutT1NHmr?=
 =?us-ascii?Q?nYWqYkTO8+j7FtUES688dMlCW1rGhal2KgFlBXvt51wcG1PYeux6lpUmnkfY?=
 =?us-ascii?Q?+ef90/zdBeh2ld/rkbz+fogCLRsRXwx6f44jc3goIzFk493XBou98YD7FU2G?=
 =?us-ascii?Q?CwJkF12Ov9pP0gmYTrvYX8kHl9Cuuz/Xd/52GdwOCAES7bjvGK131IruqkMH?=
 =?us-ascii?Q?hb23ulCjP6QmRn32o/Kb59A28rzfgXo/wqimexXKwZgDdqr0q68LqWhsR+n7?=
 =?us-ascii?Q?blHLClZ1BvSLEk0DJQ84dsoZ47nI9tsHVxzybmBL67DgFlamronc7sZSgZSd?=
 =?us-ascii?Q?BpZxuP790mxwfyIFlUYZGc+LADK6TIeWPwQeEkj2SFYVEUgfhRzbgJEAvVHD?=
 =?us-ascii?Q?OGFVTwS3jAw4q4usKuh/fc0nOsvZdT9TNDyM/1DImJEN9H7s357DacePKJ0+?=
 =?us-ascii?Q?hd+49lK3yJYbO8GnncunLfYo6nQi7KxPPlrN43H4gpzZ8cDBw/+cLOgN84bU?=
 =?us-ascii?Q?4vSWORNrh/GdadwTQjw7CcpBry6dIO0xu8xiFmU9ZBZq3ZufkELxHzKUiFXJ?=
 =?us-ascii?Q?6hEh2oPIsQ83EqwpfAsvy8IpsofJsZxwW/xWszMNEyiFas01JUOD+tR4hOM6?=
 =?us-ascii?Q?eJZ/pY25ZWhDrqr3/8qWhmwzO6TX8O821D9dTJgXpDBWWQ4yID9zu+6hcs1S?=
 =?us-ascii?Q?gX9xXNFyYdxE7O8/OMYb4BFN4E1Qy4QU5Y8JbI8MicbCXlEOHivfqezHVASk?=
 =?us-ascii?Q?4PGA3lsAQrd4SBXcgydAC3j0mU3Ux+o3+099in3cqzBxzvlN/TCeQ1GWywHQ?=
 =?us-ascii?Q?qtJkBXYT/G6Ocb564JFz/5PZv3/I24UA4VBNe4yEMs0GkZsfz+3Bj4fgrfFe?=
 =?us-ascii?Q?OR1/SIG0UrwOCRfw5KZwiXq4opD7R0bQNHU5WRY6zM7IuPTWYTLtJr+0+FWU?=
 =?us-ascii?Q?xB2Uij4UMTTBjfqnOnByEujchiYfMNbkHxTVDBuyqBSJG51i2W8okQhYKzeD?=
 =?us-ascii?Q?ieKBrgCEMk9Xdv7Xt4crjRSS1SPkpWaAjZlwUjnho/4Sx8Vj7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YMDlsI/58iY1v7XtCQq7QhqTlL/2uI/7lTO0uoqQh0uKYTs/BUamJL3HBiF7?=
 =?us-ascii?Q?eHw6tgfESf0wYTDETVhUc2iZisgMFwNnomX9lu0Czb/qtcG3PoyGk605MKGF?=
 =?us-ascii?Q?sPyaGwkfHvvpyt5R8kQdHK9yUM/LYxW+O8l8FSaHX3thnmBh9EnTBGrKnrsx?=
 =?us-ascii?Q?1PFk9n3KoReMYWXdWBHZ0G2HvFYtnDK7biRkNY0JYbaMKsgBl3XKtA8WFv5r?=
 =?us-ascii?Q?u94dQxIACUglsxFwzAx1Ie2B9L47rTqYZarSndj3L/LTPvSP+MwrwS8GB8kT?=
 =?us-ascii?Q?gcH44ajLJHX4mrpg3s/oWd/ju/Y2BZT/DccUeF7JQWNU+KKwgYAWs11a4Ggz?=
 =?us-ascii?Q?Eh3NkHq1ez9T8Zbe1GE5uW8Q4V9+hGhZDYpgBY1gRkaWa/cIKEksGrLqsIk9?=
 =?us-ascii?Q?4C80j4kHWuaVs4oTdQYHK5y1K7t+5V645LGF2eC6fz/sLIeY5CAKhMCTCU3P?=
 =?us-ascii?Q?FmXAr/ZLnvxSchUCaNHYIp4cx8M8927NJngthDcDi9VLSNVw6wtDkKkv0QKH?=
 =?us-ascii?Q?GsBx3I14TNEEa53Svf5cZVaE+bslbguAMbPEImTNoBlM5u+KXUda66yxMGfg?=
 =?us-ascii?Q?ymbt5Nv40AX6dT8CYEAru8coziGYMAXRlQeY2e4H/qpOJThRlS1IE5mochXz?=
 =?us-ascii?Q?ESRg2P1eldPbJzShb+lqun0Rx+BcrT0pqipIE6UEpC84K4YZ/YU5keYDOs0z?=
 =?us-ascii?Q?qpnGpUvWSn6DfcG0dIN0lT/WTygP1kLhsD1MbfWF8EGd5dud4kZDHvlTc3CL?=
 =?us-ascii?Q?dvOanXHsXO9PmMfcrc0hLMTlPtxvUmrfGW5j6GCBYRXgPy5vJ1gZyvJvZTTd?=
 =?us-ascii?Q?Iozcg1amAq4EcfmtAmrEq3rp/mORZ05c8HXtfjeozGPxtIzyKoXyS0CO8umL?=
 =?us-ascii?Q?cwq+UQrOrmzdrS9Ln+S2NCMb2qimc7q+LeTzCstGn/fcJwNx4G3thFzVRh0F?=
 =?us-ascii?Q?Sgp57B6+UwtF+M+ugY0XHc6uS4D+HRVAhFWXAHWBlK/DQse3NaIJkCZFqbdr?=
 =?us-ascii?Q?2em9VDXA8lAXRXqlH2Wiu+J5Jn5n/TAPBUWHKK5U4xosUl9Rz3ZTs575aOmd?=
 =?us-ascii?Q?ZyfRH/tgEKUHMtRPo0c/caiwh3LlzobV0nDW0Wv6t0mubbXMgMe1W5OTNWZK?=
 =?us-ascii?Q?pYJ481Y0gXOqjWSYxhI2OILHhF+PPqrTFpPiTY64vG8IiXW/aZ6W4cqIpV0f?=
 =?us-ascii?Q?E8mWYV30uw55o1o0gCWVG/WiGHg0L7Ny2FKicpxfEBaBTN2z9Ouw5aRxJr/0?=
 =?us-ascii?Q?Ijvi3sFw4lBJIsE4DsdZRDGSrVSJvESZP/4sC51YDS9lPGES/ptGyN4hsqgn?=
 =?us-ascii?Q?BzWPbDQiemyfM2JBHnJTkRZemToeU46YnZ/fxUVsm03x5rYyEjpiZyTXT97l?=
 =?us-ascii?Q?MHtzXu61usE1lClFJ49Z8sOmy6zGvYmCc0vXLPnDaJY5GnTqsIyNh45wmAZe?=
 =?us-ascii?Q?8j1Oy5I+VvQrXoTLjvsiSrHFxelr9Hv6ZTUh5kqfMe68OEcqnCzk101KGGnq?=
 =?us-ascii?Q?SXPkVtAFyUtLIv5SeVCb2ebUq+EMZKB7SrMiKjDDOt5NSUlWu9gSqtGArXLs?=
 =?us-ascii?Q?pOHrrH2G9pRrwI0p6/A1tOc9AmbnQuWk1M+8wTRyWfpC79ueaEXjIRixJR6/?=
 =?us-ascii?Q?LwyE4YLljpkIcRS+bEXSbvA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c18e3242-7169-4290-e87e-08dcb4e66165
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:35.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rzomtmDD0IWFJxNKThCMgBCewSLGr2C7BscYayyrWO9vG7iouIsn909Lx+TBdyAqIBnc2KFDj66I4K5ziAkNuqa7c7E+Qid2AOBMIqcX6h7nIGKu0RuxEYfVoDIFaC0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: DGNHYMH3QYXSY4ENESOS47QCCXJP7W2X
X-Message-ID-Hash: DGNHYMH3QYXSY4ENESOS47QCCXJP7W2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGNHYMH3QYXSY4ENESOS47QCCXJP7W2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aed57002fd0e6..0b86ee6a4d77c 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1168,7 +1168,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(direction))
 		sconfig.direction = SDW_DATA_DIR_TX;
 	else
 		sconfig.direction = SDW_DATA_DIR_RX;
-- 
2.43.0

