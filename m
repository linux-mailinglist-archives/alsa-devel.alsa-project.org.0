Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C398C714173
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD60823;
	Mon, 29 May 2023 03:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD60823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322269;
	bh=X3jrfTcX9sZ0mJfA334R2cRnau6nF+rMqe41lrrJZG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iRdGhY5ztpm8M4yb1BRmQA60vEBGk4pK7dYPGw+AdZbFE/q1eZWHwjJuq0mkW50AL
	 RlNomCFlqircL4N9fX8z8Y2IXYKL7nImoCsUfMXZhaWNYLBbc8C/q46aKKYqxrj627
	 Xp4nz809WGG+8REiaAdmpVerhvzAha0QzsrhjaH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F46F8055C; Mon, 29 May 2023 03:03:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52356F80558;
	Mon, 29 May 2023 03:03:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DC0AF8055B; Mon, 29 May 2023 03:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5292FF80557
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5292FF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SiHK8QQZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC8zu8d9KxkKMslcL0D7vgc/xJqznHabZu1vMC7QbRfhEA2gFCKmEtwpbdNElgEDSq22twNUbZYZe3EQrGF9xQLB/FlGbzxvDKW2wTk/9tc++6TbAto2sQMllMwZLuqjTZ0yyuO8Hh2i60MTyVc5wnOf5ZaUicqyNDBc6fup8bI3yxHcz2FcY6HpacLuJP7ni5I47dvWNMyVcwhZeC3adk7YyatQgb0SWCkRCnc+NCQdGK2qHfIdn7UV+Y9NgAJpI9cyq7bYboqFEaVddScdWvSucPiLg5q5PhcLiJzCaoNDYmsTb923hiCaau6zTfbvgRtTwUxlnod/a9Gg7ODiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=k0tlHjDtTyxds1q6p1l+m0P1Uvbdhuu+AfMID40pU10U3OkU3RU8eKZ1y8K23SAzHnC1l1LcbwtT64KCzO3sHVKjW4UxYG6h01ttxFRTKmjgLCiGl71ikPCrM6Y56jUSOMiXAjoU4yjEsIhYO0mfFPdKa0vUx/JHwzg7hASVVpVRoNlN70baKtqdKVDj52NQznvhvPLTS9VMcQlHQb6jh3anC75x80fYja96Tn1iYyo6tihPOSt2ze7oaL4rGi8qx5XgzUk2JZsrBqs7AR11XMNXkZKDprpfvx3Eb0Zr6GN61kB6X9kd75YVRC11RynAWuiRxXk2OZAFOh84L/D6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=SiHK8QQZuXX+kyOQ0rnzdatK0jLh1zsG+nNJJ71qnhy0JU3A1ACXJ5LfDuiLiwb/4WuN/6jvTU7VScNm1fywkxoR3XoriJZe10ucQ+KEmhsQD2avQ6L2iksRDDscvhc7jMFIqVNZN5a1Dk9HBWSmwFLLYVV2ON+mDlo3dWJpYC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:02:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:02:51 +0000
Message-ID: <87mt1olzk4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/21] ASoC: soc-pcm.c: indicate error if stream has no
 playback no capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:02:51 +0000
X-ClientProxiedBy: TYBP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dd987a-46a9-4cc7-b3f5-08db5fe06d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2iOFRiLqeJdJEcBtAU876gd09x8wbqwEVuQDAkjwHz/SDTdz5xbhGiUxjHOUIWwZCLY1Tbow8TZcta3u9STBcUXhn1elKIC6P6azrHwtke7FwE6cdknB9IAbIQ2bwJ+9NN6f8ZoUbE/cBtnXUQtmhuQC90p0NSk1jCurugCgE3rmO+HevteCkbl1GIVR+y9AD/6t6s6lO8smltHCVW9L56PWFBhtaPS3TUDA0ER5VhhfXyLvD7H9rAmV7IR9DaSjOXx7WHRdYBa+tM6IAv/TrO2AD9EL3MLVk71XtX1AfnCmh/qJZmQiGwmeuKa554p3f/hXsy0zu9TKGAd0iurJySnOWwjEZVegxcA8TnPSI6gYsgJKuuzcvpHHymvUTkRmeD68HFWLLpsKnespHrZe4C/U45mSOGlJCu4nwdSJnZn0ird8gbkP15vRVKPZwLC7LStwXZuFxNQ8nWT8aQfxCa9AzRypSdPBRsU9AaYDaVUdbBQ1WqIqju9D7uyzHT229JVU8AM1KHqgKA4Blb3VmaU0msr7TaMZw4HinzVRWQGx4HzFlijRRemWWlXno7hNLVdhq75yO0JAu4B0pp1Kd3Ab8hDodPcVX0s3lATF423KZwic7jAxbcj7E4zjVCtc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(66574015)(2616005)(38100700002)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?Pc1wtIcFeD8OtQ1WKIOoPmY02DGi/IbmE2WRoZFDL1h3jkPpz3yNcJLnPw?=
 =?iso-8859-2?Q?Oh+2+MChwf11K/oiaQcqri2DSHR8a9A2OtZE2t4n8BHn2jx0S54dhkmYif?=
 =?iso-8859-2?Q?wvz2RAx5Jbko4z39AP8A8J3T/wRBvxlpBNsoZuRI1Umv9uiYS4ow7QyZ+k?=
 =?iso-8859-2?Q?W6FRCbFMFhQ924J0rMgwLkTMiTQo9vz/KKyKdqpxqCSdC3f6uMFxgDbhUr?=
 =?iso-8859-2?Q?aaYYvVZq4Tj3AJSNaP6S73dab01hq/A0yOjK805qoKnlJEyJ7tTHXdhf/l?=
 =?iso-8859-2?Q?na+8b3+kszsmLzs0QnA7tdTGoquvMEXzw9UJ+nJDkF/T55Hl6Q7NIKP8SW?=
 =?iso-8859-2?Q?f+AcjE88aF0cX/pNzA/Yn++JeUQS9znrbfCk8+CvXn9vKRxlrp9IULu2xJ?=
 =?iso-8859-2?Q?8yB4+a0SEykCDkOp7urTviSPigq2XJYDkfp1lSdA+9w46R3ptB4i2Idf3D?=
 =?iso-8859-2?Q?9JTv7RECCpliv7tyE5L8Pc7swSbY0ml+JiITz4zRmWVvOL/3Up3br4LamV?=
 =?iso-8859-2?Q?52bL6rHuismc7J4g5G78SnX7j3ahlpMpqF2HkVuAOGs8NGWoJ6gVUoGWop?=
 =?iso-8859-2?Q?li4jjxkeUThn3KcAdgmO85etY/FhbqRDK7Z1NaRY8gwN38IQWJKI9E4lCF?=
 =?iso-8859-2?Q?wzfvoPzDXyorDgsxggEXVzEmvyyV4MltuSsfPtzub7Gmbt8zzfbxnAlxCq?=
 =?iso-8859-2?Q?VVp+2Zi0x81SsymhWv2EV8Cj6/wTxvaPjhrA/dfBS8oBoxNwHG5P9h/knV?=
 =?iso-8859-2?Q?utWPptnyy4RMxUnnZzEYMOUwzVB47HzLc/faTH8mQkIhTDtfccy1zXCYhw?=
 =?iso-8859-2?Q?bUxHSZcpZkEMd3WVG363UYtbYREVvyl/AKxQ5tP/ZakslSct6WQFQOkuTF?=
 =?iso-8859-2?Q?VeBtdQIOoxMCM711nPmV0se5m0rBJAKzg/QydDFKbnDZxAXQdk2TZGeaxG?=
 =?iso-8859-2?Q?1S6YjgtcvDGk9qnJNL9xkhKhuHxaGrv6GgJA3O9TWFSISrY6ZquHAjS6eF?=
 =?iso-8859-2?Q?rUbTOMH3VM9syo9uue3U2iV4sw4iPYGqA7NwRG13f4+1wXSEI1NfN2kaob?=
 =?iso-8859-2?Q?1wiMkrXopu7UBbsLQGx67NYwvfeaTDl6iz/tB8+AuRA8+G9QKqZWrR1al7?=
 =?iso-8859-2?Q?kgKKAok5jp+ZnZGCNFuF4tryqiWwLcp4E0JqbxTILQqMSNahqe0fgeLdUD?=
 =?iso-8859-2?Q?sXt59IG4LQjwG6hKqCF4RfFmsipNDEQ3LjGhpGaDVZxx2RXiL457WMr0wK?=
 =?iso-8859-2?Q?T/t22YmktZ3OKbhJp43CqtcFM/VTP8h8q//CZLIz4n7u+UgJW6XqJnd1UV?=
 =?iso-8859-2?Q?SKIL0S6izpltTjsnswQUIi7Q5OD5FhlADSZ+re7smaUx+pfa5tKHiCjxXY?=
 =?iso-8859-2?Q?XK3wu5BnJhKROHUHB3mg/f8K9RXBjiHM+RkcKNqA+H8soXDpXuQ13kdp/o?=
 =?iso-8859-2?Q?OuqB0OuIAHAB6Kk76Smb8h/Gi1P7PUpjVfFdbUuWuBgWhh2egW7/P71LWE?=
 =?iso-8859-2?Q?+gcjUCtPdu9Y15KGbpW7jQV/FJ6eMAYv3eeG4M+n3g5brD5t/L+yz5l/cK?=
 =?iso-8859-2?Q?zMwnwug+IePSaabM52tj2aB6hdLZJG7+MGpdX2d8Cd2LXqn3rtNsfEnNLd?=
 =?iso-8859-2?Q?SSdyp6hB73NRknKazgE0kURta2lYIAK8gb+r+YytAzn2Zd3UHNzPwpotQi?=
 =?iso-8859-2?Q?TnsG5opK5K0Z/axd6L4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18dd987a-46a9-4cc7-b3f5-08db5fe06d7a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:02:51.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F3uQEh1syS9puSZXSzGTpu+vpSw6Si5AL0lF5IivmS2qbflLmB1nSZCcxfwmN/qwq73nw8XKvFCJftTXckZf2fZFT2EWoJ1dCGjfxfBw1jLw/QHkc9Suj009KEQZIs49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: COYXSAS7EF64KUTL7EWMAJL7GOHTC45D
X-Message-ID-Hash: COYXSAS7EF64KUTL7EWMAJL7GOHTC45D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COYXSAS7EF64KUTL7EWMAJL7GOHTC45D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).
ASoC will probe the Sound Card and mapps CPU<->Codec pair.

(A)	static int soc_get_playback_capture(...,
(B)				    int *playback, int *capture)
	{
		...
		if (rtd->dai_link->playback_only) {
			*playback =3D 1;
			*capture =3D 0;
		}

		if (rtd->dai_link->capture_only) {
			*playback =3D 0;
			*capture =3D 1;
		}
(C)
		return 0;
	}

But it might be no playback no capture if it returns playback=3D0, capture=
=3D0.
It is very difficult to notice about it. This patch indicates error at (C)
then.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7247f44faa1c..fe65994485f8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2815,6 +2815,13 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		*capture =3D 1;
 	}
=20
+	if (!*playback && !*capture) {
+		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
+			rtd->dai_link->stream_name);
+
+		return -EINVAL;
+	}
+
 	return 0;
 }
=20
--=20
2.25.1

