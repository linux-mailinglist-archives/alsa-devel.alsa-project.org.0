Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572974CF45C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 10:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE54F170E;
	Mon,  7 Mar 2022 10:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE54F170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646644276;
	bh=uuCfDCLnMvHHqJs5imEb7n3vxA0hd2HrAV00OTwPoS8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=auv6gp7R+fHEs6p4P6MEpJrQIOF5XxH1dEmhAqkKqa6OUkcmOzWLMZ7lu2rupqm6E
	 EKKNY++On7q79PKQUS9qreKHIgFhsr8qeMcy6FjsFIxa2e1+M8NX1k4eoxFTewVQEL
	 4oFd1sLYL9c8OuN3RNiOVOv46//DSnsgyBnwg5iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D842F80159;
	Mon,  7 Mar 2022 10:10:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81D5EF8013F; Mon,  7 Mar 2022 10:10:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn20804.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::804])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D14F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 10:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D14F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="T/psk2vH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CM87ftEwSFznp5rJy/h1q2UIvhImXdYcHbxsbAlxf/0k0dks3zGOieVRIOyq4WkIicB/rs3unJCij/SFFgx1prWfAw8WpOx5KbQSXSSvYXfHuBZqWllEjZEPF4ydckkfhWGHHUKoMYckk41nai2h0GfIVl5Vp/7hfxjDqtS2rBKprQzE870a4sHC1X++ol6wROj9Za3zQcWmBy5YZxnSqb0CZ/43gCpC3FJ3Iw45o50SYHU55HQBec5+D7ukCeZtAGP6NVuoE10R2dIXZ3yaZgdF/59IaHgGBcEU8Oi/lQspjqpmUBYBhb4IdEPox8cv0np4h5SeDvuZaJaMPsTPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efqFz5PqrKTB61LpXlTtIGVCHDJMAsmTiOICHRKJ6H0=;
 b=BRBeeC9uj/XYorQSfgUuDwUUGf0I4oZoI6HyMGLelx/ZFutz5HnUn0Iz8aek84GChcMbZlQbkqJFIMKGQnjKUBz/BJqqw3tU1i65Dcvy9D17oPAmCbvihJcYPgGCT50JwWp+n9pACy7KD/HRAPHvn3H1++tyeGf+mzgsvcNk5msvV6E1mES5SOIvepqGPcXyKcyGw/2SeKAzUvPqIZCm8XC/jj2R4Kqz1VjETEnWl8S4BJ0UpeiUtI80DM5JlkwzjDfB1JZ415v8rjzwcAMvjZ962ZdhLLePGBPR8PKCTSSCh0gGCRbZhZRfoHClwNAjhvOYl9susP+wdll4zxt+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efqFz5PqrKTB61LpXlTtIGVCHDJMAsmTiOICHRKJ6H0=;
 b=T/psk2vHEIJuw3q8GEwJZ3Ydw53o0MfHWf5WZLhjJSowW+t4rm0fqwzSZUry/vN1UYE58hH0uA+NwLcXjyQqrHuXGIZdYN+vRK6C+FfeCHXnsInGanofKC+qZ0h/W7F+OI2rN4+PaMxYYfLNwSon8BuMJmVIus2CZEBtC/QyGel4yvrf3kBZEaqooO57hARNiiEK1ZGz1ZaWMeETav7wO0JuXJ17OcHv73w5Pw6XD1j2YJBN0AktbYlI2GP9zYXpSgF9Zro+pIZ3OL5JLaVV1RfpF2BRWs+gUKzrfcHENRPI9AFl2w89XBsQxdeDUzaditkdS/i97cpH6kyQmWlifA==
Received: from SY4P282MB1482.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:c1::14) by
 MEAP282MB0694.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:63::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Mon, 7 Mar 2022 09:09:55 +0000
Received: from SY4P282MB1482.AUSP282.PROD.OUTLOOK.COM
 ([fe80::8008:638e:9683:e5b2]) by SY4P282MB1482.AUSP282.PROD.OUTLOOK.COM
 ([fe80::8008:638e:9683:e5b2%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 09:09:56 +0000
From: Chengyi Zhao <chengyi.zhao@outlook.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: How to judge USB Audio device has no digital in/out.
Thread-Topic: How to judge USB Audio device has no digital in/out.
Thread-Index: AQHYMf9jzHDT/FYeEk+SaSP/oIz/kA==
Date: Mon, 7 Mar 2022 09:09:56 +0000
Message-ID: <ME3P282MB1473ECF3C97907838188223799089@ME3P282MB1473.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a4e667e3-331b-89d5-cbac-6fe41c276628
x-tmn: [MlOWKxLPXQbCIkqAFmIiyPMpray6+n5p]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38485cca-bf4a-4a95-3510-08da001a3f9d
x-ms-traffictypediagnostic: MEAP282MB0694:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xIYz0k4OC4bBs83sj7bwKlWPWaBXh0y5C1q5z+MQj31if7vEVX2phUYE4U6rfZ13R0iIN16SI426o2II+IVVFe6wqv8zqvveILB5+YotLP5FECOmDjiOplRapOSTui3Op3jGSKve7zbFNnD2jEdtc61CsSZ2jEu+EFITBfyr7+aYr1/I5Vv9TGD9Z5zOAzE73ARgnrT+rEz7eeSGXmHRrsNDwNlekdBRjC6fimRwdGFwTYVS4YETky/HC3C3zB61GYDm1HZ59x9X6Aj/XxyaZYeTBn6nbvdPaPo9o2VECmkR01Nf1WAZRP88lvfPJrtGqH2Zq8rZap0GhAELFizw0fHivyP6gqzNf8WTLJZ7Csn/Gk99ZZq8v/nfj0eqfkEhjTWPWXlxb7pET+A1CCB0ajV1ecL/zcQzr+Rjy0tw31OKWA+OkRaLwqsssT0OuaQFwssMOmZvOwnXPdyBml+/l1beXDonZBuoiXPvLrvku+2BNt9tnt6kxCqSdtoPtre+E/SUM1N7HFbJHnvtc3GGE7S2MaAHoOBaxZ60eORiGk9CHA/UrghLFdLUgRicNajmYr2HEWb/cx2jNvrzg5vzQw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: XcFYhLjgvicK+UVm9r9PEe8qHJdl5DkVPJD/V+dqeb0nP1d+weG9gQE0sQnjV+KRLJAmoiSeDFDw+loHXNkyBXgw3r5aZHvv6ES/s9ItrMK2cYt7NgSFTLpCwTOfyE3mfmnYISET1qf8d7IjoI3tVMNwjo2bnagSfRw9ksIorWUhNK2G9pfslAnmNxNfmj88zabTKJZbcC9jD8uJHarIBeVtindZscS2vhzNPmzu/EOzmKVuVURlk2Irg1OqWpeouxxXn7azj+qMhY+mASwK4Y1KAomIopcOOi5zb7F7YFbmWMyYy/SfonsjGu2bYa8N+WakW6HqSQtSBvIWNzd+u2g7xgcQUqCfTfwLVR2RuxyzLAHy4zTlV0NtsIvdfgPWRP3A16WdNakL9PSeebj+vscIz2a+MztlmOsCLqK3/kFfHo2vJr0J8Bb5jgmWwn2vS51jxHYXdDpbKSdTHnvV/6jKY4xF5XryzySS1FA7PIfdaG35A/V70WsW4ojyToqnuGi7dlOlk1Y3tusdCUH75FWmle1IA4/c31Nv9RoOF977b6gdK9maQ+iMN1rCRZ39h/1EydUBtBjzOE0JzC0/5lCWNUtzh1yGDSmEs6qK4B52YyxWhM0rSunISfpsM7HOmZ3a13CRKn1iw6VAvyzN4DiSoytCTo3xCflTafQOMu21nD42tqwYs+tbREbzgY48e+1Lu2EPpmTCPZr9PN4Sc6RfJ8O2OaQLSNqoknqok6HDsU7BAll/JrRek6N2aXJfdRZ73sSssrqVe7/WRALvjwNXlvpcMVug0fklqerpGYrQivGh6iv88vmwD6TsZE8RTJD/Va1bzNLLBRhLjNvV/Mr8zHSD6SVDXq0M5lwV1QrGhcp51qzQD6yjGQrrXovYgLdFq2Y1B1pkW2O2jjBHD34lPDZIpEhx43uVhq2ngNu1R3qkiCYwOsogNAPEB/B9
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB1482.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 38485cca-bf4a-4a95-3510-08da001a3f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 09:09:56.2138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAP282MB0694
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi guys,

I found that in the following configuration file "alsa-lib/src/conf/cards/U=
SB-Audio.conf" there are many kinds of
USB Audio devices that need to turn off digital in/out.

However, how can I judge that this USB Audio device has no digital in/out, =
thanks.

USB-Audio.pcm.iec958_device {

        # The below don't have digital in/out, so prevent them from being o=
pened.
        "Andrea PureAudio USB-SA Headset" 999
        "Blue Snowball" 999
        "C-Media USB Headphone Set" 999
        "Cmedia Audio" 999
        "DELL PROFESSIONAL SOUND BAR AE5" 999
        "HP Digital Stereo Headset" 999
        "GN 9330" 999
        "Logitech Speaker Lapdesk N700" 999
        "Logitech G35 Headset" 999
        "Logitech USB Headset" 999
        "Logitech USB Headset H540" 999
        "Logitech Wireless Headset" 999
        "Plantronics Blackwire 3220 Seri" 999
        "Plantronics GameCom 780" 999
        "Plantronics USB Headset" 999
        "Plantronics Wireless Audio" 999
        "SB WoW Headset" 999
        "Scarlett 2i2 USB" 999
        "Scarlett 2i4 USB" 999
        "Sennheiser USB headset" 999
        "SWTOR Gaming Headset by Razer" 999
        "ThinkStation P620 Main" 999
        "ThinkStation P620 Rear" 999
        "Thunderbolt Dock Audio Headset" 999
        "Thunderbolt Dock Audio Module" 999
        "USB Device 0x46d_0x821" 999
        "USB Device 0x46d_0x992" 999
        "WD15 Dock" 999
        "WD19 Dock" 999
}

Best Regards,
Chengyi
