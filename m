Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8316B1BE7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 08:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9DC185D;
	Thu,  9 Mar 2023 08:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9DC185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678345398;
	bh=Wnfny6O6OBgg3cIdKKZcjJ6vBF5yS1J6OYi4qjye6i8=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=h9ZUADnseqO8QJfaYW3y4Po3kabviT5gzfWcvkigYnTLV0TY/FICX3VOz7NFAzhcQ
	 W9Exil8IQ0iJslM5dm8K6M0MJ+KPe7+eNLRiDAfmTU5nO34uCQA9inOIxe6H0pJVMo
	 t6XPjHKjyVBkKNzyDGQe/BtCyONw4KJcieoNP/Zc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C40F8042F;
	Thu,  9 Mar 2023 08:02:26 +0100 (CET)
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: [PATCH v2 1/1] ASoC: hdmi-codec: only startup/shutdown on supported
 streams
Date: Thu, 9 Mar 2023 06:54:41 +0000
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
 <20230309065432.4150700-1-emas@bang-olufsen.dk>
In-Reply-To: <20230309065432.4150700-1-emas@bang-olufsen.dk>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 09 Mar 2023 07:02:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIADRXQL223BCRK3ZLABDU4H22AIXFON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167834534477.26.5781313638373059985@mailman-core.alsa-project.org>
From: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70DC5F80431; Thu,  9 Mar 2023 07:54:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D3EEF800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D3EEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.a=rsa-sha256 header.s=selector1 header.b=sxpurKkG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIWW8rPb7Lak7i+5gkC5M8QiNKt2sCsQsSR64BjNUHzG5pE8CNG/tv5kbU9fd+ZuKzKiaZNuYcpTEaxpZp7Qrp1LTZSlrIC02pbKPE/HvUCRPIfOYfyMfUmFlU0Md72rR39r36SdxaTq1LpHs4w20dd0kPMCsK8wp3OuDK3DV89vZMZ6nF3LmhJ1ORNElCAPomsQL6485K2DHR5+vAJL90KhCw9V69p0MZDLUthX49TnXWCYIBACvi7Bpw3AXceFfMCpyrSHz/H2zAsSACDZinKVD2Val1Pvunw1CUWIyrQZJClSOloEOY3rV4nnvsRagCykElspeotn13iQXb/gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuVBWV4uUAaMlClqWmQHi1WTqnQST0QqcFmQ4jDngx4=;
 b=JdDaDXcP6Y/sg0FVgxKWQd0FgQuI3BdO7eVTQBTsNpf5OYQ+d+XHInDtOmEhBfw6Bvs/mJ2hMfVZTTVqi2WrcwK7h4szfJagYN8mfW1vPBVVGun1eGKEVxIr/+ZK5RlKt164t69uF/sTgmetdydAFNMkWnFFmuX1SWcsRWYNecAf54nRFZieQ3z3U4BmhqE7TzLTrQ+gBjntH7j6fU3YYEPM8qYS/c0bw8+IvkJq2oMHUC3hRRd7E+qdlm6pdDInW0NnyTvthKhx+xj4brIP1Npn/w0k91/EkgfCZvzdOjruaP0V/LlX95+hBNlfDibVqmwzqX2ERuiEMiswOI80pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuVBWV4uUAaMlClqWmQHi1WTqnQST0QqcFmQ4jDngx4=;
 b=sxpurKkGVxWjIay7T8IwibTR33ahyNSs3MgMt3GQ9Yh8bmJIK2K0XUrQBkWFViGo5KPY7fehcPZCpAXUjdQbbcLC51Wu0juE4AXjHFq89HDLMbBO0F9a2McknxxQrFT2yqKocTMprQNPy1sUNN8zgMJSInNQpfI6g6x79cN66No=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAVPR03MB9188.eurprd03.prod.outlook.com (2603:10a6:102:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 06:54:41 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 06:54:41 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: [PATCH v2 1/1] ASoC: hdmi-codec: only startup/shutdown on supported
 streams
Thread-Topic: [PATCH v2 1/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Thread-Index: AQHZUlQF0/xIpUmhIE6da7i7v6nR1A==
Date: Thu, 9 Mar 2023 06:54:41 +0000
Message-ID: <20230309065432.4150700-2-emas@bang-olufsen.dk>
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
 <20230309065432.4150700-1-emas@bang-olufsen.dk>
In-Reply-To: <20230309065432.4150700-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAVPR03MB9188:EE_
x-ms-office365-filtering-correlation-id: 7d83d058-eb2e-4ac3-68ac-08db206b288f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +7UrxVpuz033kzp11RLsz3qeJXY1vttYMCYuPePROgO2cFVuKvwt2rWbSvkRgV1u9bWJnL46PFetKXw04t4QtKMrJzvtsdzI4b0eO5RcQuVzEZtkBfibLNDQzPEXpGhhrHeMwi+3HhTPMaK6CBjFl17oeKb25S5/mXPjyu/sB2Px0qnG7wwMxw8N0dqPeCILdQtdK95RQbvLXAwP+0DI8iq7PiIrqpa3GorN3Metw/VH03qNOCnVGmlukzztLUD2/aWLct5ccz/ZPLXWEu/sQRipWB5yqw5s1q7coDLxTDhi1KoPwBeb5KpZgp+l/ZZ1NYB+EakL0veD8zYUaFdUA14of43Sy3mGaYikzwLOInTmoQjtGPV3gzy1K3FfMaLTyZSgtdB98uugOYMpuPpvVqsJupxxQRpBikQP93vjbTgLjJsIhHSM2KYyUnmRET+nT7onvjdQwCRWzxYBde7tszOEgKe76pipAF+bEDB015wCcDCZabMxO6cvutATufaFAQP1T1MEzqFCxVSwmkWQuH/1mqtIY2RqjLiAXe4JYGqQo7G6XUT78pB6lCphlvAcsuTIhjgTpYByrYSsbPxU5pl/ARnCwV2Wi8wEznaaJhfOyyjFAcPlGIncxCFbKCxa5v/UUg7XPnjE4D0p3ArMKR/lHoYD4j93EFF0RSnpyx4qRgmFqDrulG5vq8F/B3Sze2HXJd/Wzm8CBqs730CaMQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39850400004)(346002)(396003)(136003)(451199018)(36756003)(54906003)(478600001)(6486002)(316002)(71200400001)(5660300002)(2906002)(8976002)(76116006)(64756008)(8936002)(91956017)(8676002)(66556008)(66476007)(66446008)(66946007)(41300700001)(6916009)(4326008)(107886003)(122000001)(38070700005)(86362001)(38100700002)(186003)(2616005)(6512007)(6506007)(1076003)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?0gXQeL6io0PbmHUNH/2hDGEBdtVHv2HVNV9P4orrpl5ndUYs32kJxVD/?=
 =?Windows-1252?Q?hgj7WLY8jgp80s3kadWR1N/05nnfF+GALGwmA99Q5FVJ06hS4QPI/mN2?=
 =?Windows-1252?Q?zIDQQYxmK0tsBZnSne7xGMwIg4DstPguhfUHuHqeMiEPrs4yQfjxUVE8?=
 =?Windows-1252?Q?RlX0NlYdLgiAOAtG68bqqsmYzH1hx3wHympOEUUNBLD+NINJZWBKkoGb?=
 =?Windows-1252?Q?UivO2TLdX2NxyuqGgYGYUQT/R9YOf8j1TeNiiIt2pxOxw9Of+b1QtTDc?=
 =?Windows-1252?Q?b6VTXLC30XUpG9dFWeJ+ViSovkt/kU4HingUa2ynn+Ao7A4ElPA5V3AW?=
 =?Windows-1252?Q?NAPZ6ApaM7BuvlLvTZHXW0Yd6oWmmIc5MDjLJgwd1zoW6xMAA1xmrkdO?=
 =?Windows-1252?Q?43oN04RpWgKaOZBPtBAL6Hd8qs3VW3AmSDrrWeKhtekkOlqfxHofs7p5?=
 =?Windows-1252?Q?OjINqqRNwVMuGzPasDvdL+cWmCPHTHE+LL5IXWFe3zgF2p3FFsGIkWqR?=
 =?Windows-1252?Q?B+dAAZh8BqZ5Uw5EQTz/G2ImImyLnAw5bc+0ej9oktQO1Bmzs2fAZ/Z6?=
 =?Windows-1252?Q?hs09hMEjsbNydGPq+Pv6SkGWd9ETqz566b4Z+qUfOht3vmml9ACpjO36?=
 =?Windows-1252?Q?ot4Bs0k478fLqBojWZGtP/Tp+l8s9ZHJC4pHbevKtYE/ATa6PaNu89js?=
 =?Windows-1252?Q?Lmet/iGE8+u6Ba3LQgQ8SFIWd+LIDfQaGhFUjqoktagkp+RTc6llRORU?=
 =?Windows-1252?Q?0Ed7jqNdhz/xHIlcXGUBLa3iIM4DvmWGcDKTVqC3sZtFuGJfDcr+CSFo?=
 =?Windows-1252?Q?lEzMzy9eIXEhx9zCFcN9PgpfKHA0jWac5XDabB0Vgl9Ls6PGNYbcwe8k?=
 =?Windows-1252?Q?UxM+tihoHF0TVv9kVdXDMR5mLEGubn7s0/mDVTV4zSxWMnVJKv4c8f9y?=
 =?Windows-1252?Q?sDk9TTN/J/H7xewVbZnaWMooSMLx+x+lWc9AZpjdjSa55X5z3FoATII6?=
 =?Windows-1252?Q?p4EFH0Cz12hcmuII2ySG11XaAphqUw8JbBP86KFR6gSLP/98XJ7HXBRN?=
 =?Windows-1252?Q?l0kjXu5ZhQRWqGDjB2rmisK03rn4Q9ncmBv7gkiZl2j9AfVAHoyzpymF?=
 =?Windows-1252?Q?+7c2xSkkU07k3FSNpaO4AOzwgfgD8KdKXO+dx97G0P2ApcwqobXH3JDo?=
 =?Windows-1252?Q?dCltRKxsgMxCaY0s4zugRgOOZBWkvevxBcqg0tTHlMBQ2R+SuJ4EAKfx?=
 =?Windows-1252?Q?hj8lFJ32AZvE/FbSlfnQdH1E/HYEBm2ZlepM1fXg9z8v3OWoSgrN5MsY?=
 =?Windows-1252?Q?EQkgSQGZPYrtnjTFH+rBgy2ujuOUcLsCG6YTorkPlEmSoWU9FMDvpu4c?=
 =?Windows-1252?Q?tgbdGAw9tyiEjdIYiCRbZdFw93yG1TWaUsqNkahoU2OqLpBgQS5wDHAJ?=
 =?Windows-1252?Q?uYNTZstG++ktcuKYyBPDLCS+/IqdCH3HQS36/DG43jhH0FyPsy6ywGES?=
 =?Windows-1252?Q?49ZwzxCZMZooIOXEqzIj/KA0aPFTxTpz00/+WRl+JBGi6ifFLYrsjbpg?=
 =?Windows-1252?Q?6NyGbfvPzQZqhyWrXv0N9oh+tW5a9q1p6nMPOiqbzwx57tE5GYQ1izzj?=
 =?Windows-1252?Q?B6z6fdfs1OXQLP2acCEN9WrQG9SMpfPoRd3/NXup3RZC50uENixfHGOY?=
 =?Windows-1252?Q?OaCjuAr8R4PsNOF4IETs+E/jCQmdVuTYo2VxmqpKw3kadgHbVSEFLQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d83d058-eb2e-4ac3-68ac-08db206b288f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 06:54:41.5571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 DscM0BNymFJdoXK6FT6JsCxtzX2oR+OuTCZbe8uA8t0yGdqJVOSTuqwFMWBLLvGWvOs5UIREFXBs6K98c4821Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9188
X-MailFrom: EMAS@bang-olufsen.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GIADRXQL223BCRK3ZLABDU4H22AIXFON
X-Message-ID-Hash: GIADRXQL223BCRK3ZLABDU4H22AIXFON
X-Mailman-Approved-At: Thu, 09 Mar 2023 07:02:21 +0000
CC: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIADRXQL223BCRK3ZLABDU4H22AIXFON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently only one stream is supported. This isn't usally a problem
until you have a multi codec audio card. Because the audio card will run
startup and shutdown on both capture and playback streams. So if your
hdmi-codec only support either playback or capture. Then ALSA can't open
for playback and capture.

This patch will ignore if startup and shutdown are called with a non
supported stream. Thus, allowing an audio card like this:

           +-+
 cpu1 <--@-| |-> codec1 (HDMI-CODEC)
           | |<- codec2 (NOT HDMI-CODEC)
           +-+

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 sound/soc/codecs/hdmi-codec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 01e8ffda2a4b..6d980fbc4207 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -428,8 +428,13 @@ static int hdmi_codec_startup(struct snd_pcm_substream=
 *substream,
 {
 	struct hdmi_codec_priv *hcp =3D snd_soc_dai_get_drvdata(dai);
 	bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
+	bool has_capture =3D !hcp->hcd.no_i2s_capture;
+	bool has_playback =3D !hcp->hcd.no_i2s_playback;
 	int ret =3D 0;
=20
+	if (!((has_playback && tx) || (has_capture && !tx)))
+		return 0;
+
 	mutex_lock(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
@@ -468,6 +473,12 @@ static void hdmi_codec_shutdown(struct snd_pcm_substre=
am *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp =3D snd_soc_dai_get_drvdata(dai);
+	bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
+	bool has_capture =3D !hcp->hcd.no_i2s_capture;
+	bool has_playback =3D !hcp->hcd.no_i2s_playback;
+
+	if (!((has_playback && tx) || (has_capture && !tx)))
+		return;
=20
 	hcp->chmap_idx =3D HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
--=20
2.34.1
