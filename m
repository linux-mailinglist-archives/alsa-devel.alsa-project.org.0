Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEACB43A6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE471167B;
	Mon, 16 Sep 2019 23:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE471167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568671131;
	bh=IR4K8ucbmJQkelaYFyGIwn7ZgYw32EUeBJoLaFGZpqo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rYgWPLhGnUdlvefVP5Z1trS86inb0jr112G+ANLjMnqgtAJKNoxlax8Aleq+H0hFE
	 MlHdYAMzd75laibItE5k1jELqP60xLU0FW3PNzZNgzOcrIrZUam/d9gX5SJY4GYOwJ
	 8h7PF4lBx6RWbkSHTlnyW6I33zj5MQjgNHBoBsg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 823B7F80534;
	Mon, 16 Sep 2019 23:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB5DDF80506; Mon, 16 Sep 2019 16:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005032.outbound.protection.outlook.com [40.92.5.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12084F801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 16:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12084F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="VzB/b+HK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnWrI/s4ixJW+NZEWjQzO5tzSVqiM8d9u6ftK+rlmStlzW6d3dvuDZrIDHWSwMHwrrKLi8XcG4bWYcQFqakMyPbn1ZwazAB1Baa39fi5HdVwbX0DpKST9CfUSaMAXPSLu8/ddClfTrNYTghT26gChYOvycXgnp1YVw/rCukv9YxbnONLJhUx4Zp6UURqT3JRrAkGkmUioSQoBRN7sKr6UMOHrqziKc9s9iELZ8Dy2La538AucJcuNGoZtqg5h/Z4tQ8CmyL6xqZewf0A7xiZwsUPkk7+roxHjaFKfQrDtqOQlmfypOxl0El91qOhJPjysnyWVaghSIXRNopB2dzGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgbvXigfLP+3OxoecAMH723VjwrM1eMS2GT/lzXtPy0=;
 b=HUVVj+nIxCEbK2aQruE7tCq/0JmrFJZA0dmRNg6UsPqVa+sE5phSgQL7PyuAe9MrKFUl0pHmV0N8A9zL9DRan7NCyC3Ij4AJeAduqIx2kp7T4QfVhWPu3BUv3s+StERfzfehzfKg4w0aolxdjK0HWyMuTEd48dVW09Bw6ZQD65vm7CAe5ch8QKPnu69cQpZ+0edTtv1+suw90YSzLtB45Pt8U6QkVK+21HeVY4SPdu4Jd8Gks27i9IUyYh/nntcgS0JXD1xiBeUs5lgAcNHJEgarnHzCYJegz/QJkxO8YYQ8CbHIkaK1MNotQZFTSZPCq5A7amyNrHtF8C1w5+KdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgbvXigfLP+3OxoecAMH723VjwrM1eMS2GT/lzXtPy0=;
 b=VzB/b+HKLTHbH+xQ/LMnMQwRmfSiznlJVfuUfEaoa7dawuazhPSqkUhmrJ5p1nM9g6WbA+eQefUb2gpZw13hY9lhtAPtQ0CkvnE4yDVNJ8aP3RGnu6rNg3lJmDKCrsT9BXZibEBYsxOJQ8nJpedbUECQGBg/kYBDnyUBrWyQj6G+rfUbZUSt9sRKkuO8dmhVJBNVPjTYxbEJ3JNBsZ7Rsytks1VeOG9bLtObxl5jTehC8aVQd6ChoDrsZqY1HzNWe6NK3FhvsJxMt2Aox+4HLFqtiYNYKWkwRMpGTXSQOdzTjoZ6RBu36c20ah1o/jZkCqbprDxdFQZi+ERr5hoE7w==
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (10.152.74.59) by CY1NAM02HT074.eop-nam02.prod.protection.outlook.com
 (10.152.74.136) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.17; Mon, 16 Sep
 2019 14:53:39 +0000
Received: from QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM (10.152.74.60) by
 CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17 via Frontend Transport; Mon, 16 Sep 2019 14:53:39 +0000
Received: from QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::15a9:a7c5:2cec:57e5]) by QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::15a9:a7c5:2cec:57e5%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 14:53:39 +0000
From: James McDonnell <james_mcdonnell@hotmail.com>
To: "tiwai@suse.de" <tiwai@suse.de>
Thread-Topic: [PATCH] ALSA: hda/realtek - Fix alienware headset mic
Thread-Index: AQHVbJ6G2Vunf/hRFEKA0G1tEh8VvQ==
Date: Mon, 16 Sep 2019 14:53:38 +0000
Message-ID: <QB1PR01MB2337D0367C2E3ADB0010134F808C0@QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:300:115::15) To QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:3c::26)
x-incomingtopheadermarker: OriginalChecksum:C208EACCEC4B0764972C23A3FFC6C30F2C1788660BC44222613331AA09EF37A1;
 UpperCasedChecksum:4623E21316FB1A34652F707F49FDCAF66362AB688E5659D7AA2060931D6F5540;
 SizeAsReceived:7290; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2VX0GzhggRchv3wJ1/ABPtmZanXMNezs]
x-microsoft-original-message-id: <20190916115334.GA8936@manjaro.telus>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:CY1NAM02HT074; 
x-ms-traffictypediagnostic: CY1NAM02HT074:
x-microsoft-antispam-message-info: XQPvgCH0p6Bts+XeKP1lb4csZQfCjA8A+7xKnv1basp6nZoi84PohG/rkv1cmWQBv7dNlmGsNaAe4BsvgT3Ty5Y2+/uk+i13daTySUt4qOhDIqlWUiSVxZ41BIvEl3UuR+owDvuMYfPF/Mumf0aEsGanQwUMAB1hp6/XLOoaEPc5tteouLULhtK3es3+svdT
x-ms-exchange-transport-forked: True
Content-ID: <D92A9111D620B64886DF70C42F1D856B@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c12786ab-6669-47f8-7539-08d73ab5a880
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 14:53:38.9695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT074
X-Mailman-Approved-At: Mon, 16 Sep 2019 23:56:40 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix alienware headset mic
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

From: James McDonnell <james_mcdonnell@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek - Fix alienware headset mic

Headset microphone quirk for alienware 15r3. Without this using
a headset with mic attached will not work.

Signed-off-by: James McDonnell <james_mcdonnell@hotmail.com>
Cc: alsa-devel@alsa-project.org
---
 sound/pci/hda/patch_realtek.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e333b3e30e31..347fcd755571 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5745,6 +5745,7 @@ enum {
 	ALC292_FIXUP_DELL_E7X,
 	ALC292_FIXUP_DISABLE_AAMIX,
 	ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK,
+	ALC298_FIXUP_ALIENWARE_MIC_NO_PRESENCE,
 	ALC298_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC298_FIXUP_DELL_AIO_MIC_NO_PRESENCE,
 	ALC275_FIXUP_DELL_XPS,
@@ -6426,6 +6427,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC292_FIXUP_DISABLE_AAMIX
 	},
+	[ALC298_FIXUP_ALIENWARE_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x01a1913c }, /* headset mic w/o jack detect */
+			{ }
+		},
+		.chained_before = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
 	[ALC298_FIXUP_DELL1_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7680,6 +7690,11 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x17, 0x90170110},
 		{0x1a, 0x03011020},
 		{0x21, 0x03211030}),
+	SND_HDA_PIN_QUIRK(0x10ec0298, 0x1028, "Dell", ALC298_FIXUP_ALIENWARE_MIC_NO_PRESENCE,
+		{0x12, 0xb7a60140},
+		{0x17, 0x90170110},
+		{0x1a, 0x03a11030},
+		{0x21, 0x03211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0299, 0x1028, "Dell", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 		ALC225_STANDARD_PINS,
 		{0x12, 0xb7a60130},
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
