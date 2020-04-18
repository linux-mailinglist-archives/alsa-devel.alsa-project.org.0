Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AF1AEBE0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 12:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C016A1666;
	Sat, 18 Apr 2020 12:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C016A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587206695;
	bh=8p7AhXXcRyBTQ3Ragm6Gx3+cDM+dZgcgFEoVUj0pSzM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TU5R8jQNVr2UXjcx73SjxvIw0B4PEat2REJtUjpJZMrVIOuhLwSK3RKhw2wqhMmP2
	 lU/O9MU6zl9zsu6HMEXz1YzJ3PReuQcZYaI9TJBjoj8amwyL/lyShFJBZfccKC0J6d
	 zi58ylppiHw9zYqLAgpcmySF7fVSP975YouIJcBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C85F8012E;
	Sat, 18 Apr 2020 12:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38BFF8014E; Sat, 18 Apr 2020 12:43:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254080.outbound.protection.outlook.com [40.92.254.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2342F8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 12:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2342F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="pEPOWvtQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWdmemVETOtmtDkkwTfRL03dt2btwDqozZAgvYbGrykwqhdHrBiRDKFW9gy5tRaaGn3Gv+YoJCBuM4ajSPjWhc/r3eEw8iCxujS6kESAUJLLbijjRwNFvLd9HOqMF705sVVWXnZ61p8nLr6SVUZ1cMgw5Ke++TmFTicwVQwYiDka/e2YO+7beYa7sju/8FpOwwgcb6jaHlEvhdUGcamYcdiyNMn7jFL7BkPclfl19p2yBbEo5gvvMp8MqhHik0/gCryeFtgZ1CnFTW+FfWpuUCuyKdaoQ41RwglbXumfAM6rKUfKyNcO5LV7todFxsbHB7upp2ISjWEx2zjuhFXADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p7AhXXcRyBTQ3Ragm6Gx3+cDM+dZgcgFEoVUj0pSzM=;
 b=Qzw9gmFfEXkiu8xmR2IHkemjR7gSFdxdQiO5cutzhkSeMegmho5AI7C+k2am3NFi88/pyEVoBIQUYt2yydW+GJcZpPCrKWMw5ak2DOUSQwXfC76UdlTH6jSbRFOvDm71uMa1cucnIorvafGI0w2WDqz2MQBlKwcOMF1asBz/rEjg703LVq0WpFHu2Cc7rVtt1kovwwm9PwSzHhBIg/hJ6q1hIRNMJZFHVkI2T6r4uO0Gyj80ZeE5LWVM9cwb/jKTrHukVL/IydtQxJ4PFVd/WLmCFsOfJ1MvIY2BXDrGddugQq2oKHgHrfC+LEU4EjpcZ1oUjq4iu3f+r37H+Ua8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p7AhXXcRyBTQ3Ragm6Gx3+cDM+dZgcgFEoVUj0pSzM=;
 b=pEPOWvtQZ4vypCgyEQc5Zg76X8h3aOnYn8JojeNQ6M4fC7VmYfzKV7cCadutkvRAEjZAtleyw1izYEvtrKt+bIUQqv5eGt5r+xcuqa0iQWkECp7ZfWH67eKqDUmhgQazZM9NenLKskGNED9nNhLC5nQP01sZDLdelNT/1oxjJQZlwGV8clrGof70OnK2G3kv69BEjzttc8EwS7+egv4lasomqLHK0Y4BuP+PBv6QZs5yXpYVKAiYnq4EpLktk2fhB5rVG8RBMZY+VH++8TeEzp/kTI7//e3m4ul/B+4zuEQxMyyfIRqxrZp2LsGjAGgjlq1V+/bVgz1FRS4BxvVWWA==
Received: from HK2APC01FT012.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4a) by
 HK2APC01HT105.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::384)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sat, 18 Apr
 2020 10:42:50 +0000
Received: from TY2PR02MB3886.apcprd02.prod.outlook.com
 (2a01:111:e400:7ebc::41) by HK2APC01FT012.mail.protection.outlook.com
 (2a01:111:e400:7ebc::165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Sat, 18 Apr 2020 10:42:50 +0000
Received: from TY2PR02MB3886.apcprd02.prod.outlook.com
 ([fe80::bc31:a01f:f2b8:2a8d]) by TY2PR02MB3886.apcprd02.prod.outlook.com
 ([fe80::bc31:a01f:f2b8:2a8d%2]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 10:42:50 +0000
From: Moosa Mahsoom <mahsoom_m@outlook.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: State of hda-analyser.py
Thread-Topic: State of hda-analyser.py
Thread-Index: AQHWFW4bJrlw5iY6pUy+HkYNKLNH7g==
Date: Sat, 18 Apr 2020 10:42:50 +0000
Message-ID: <305468a60f09cd8ee07d1617e8998f932f8ce877.camel@outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:34DABF3793E259681C1C04324C46EB6158B83DE6264694CE356513084E67CD2C;
 UpperCasedChecksum:13F9579D2DB388D686EB299DE0DDFFDE79940EBCF75C40B917B6D92A4F94A53D;
 SizeAsReceived:6678; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [y4eRKkHLHeRT16IeFqw108iaDA84YGVP]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: e7bfeb78-db05-469a-9658-08d7e3853e00
x-ms-traffictypediagnostic: HK2APC01HT105:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E4EId0gnmnavtwFJTVhS5pMjzCke8NexUMOaKbCdI4oGHh7IesaBoKkc+Ar4yEUk4vfiCRh8xyoGJNpW8EyqPl0falye8MqIqOmQBQVItQpp3QrTTRIGjrSM8uOQUdJMGJcEmAyc9dZbxNISeCFVw0JB/R2+Iu07XBRGNfBpUzAawWn89BPng4+BIRw0dYgRbgfrjuDF9LlnQYm4TWf1eQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB3886.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: gw2mdGHVFX7nAA7VTnoDK1bHNis6Z6MofkTMfUhFOLPjO4coF0fiorW0yZZNFa+V+4G3HQaEv9TIVF3+Ooo9+28J5XGHvPIVcfjioc3DDnujjwy3W0Th74cqtA6PetYOSAwQwKnvSC3veMlbH1Wnew==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <64589DF0276E28438700C566BA34A382@apcprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bfeb78-db05-469a-9658-08d7e3853e00
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 10:42:50.4407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT105
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

SGksIA0KSSBhbSBhIGZpbmFsIHllYXIgc3R1ZGVudCBmcm9tIEJJVFMgUGlsYW5pLCBJbmRpYS4g
SSBoYXZlIGJlZW4gZmFjaW5nDQpzb21lIGlzc3VlcyB3aXRoIG15IGxhcHRvcCBhdWRpbyBhbmQg
aGVuY2Ugd2FudGVkIHRvIHVzZSB0aGUNCmhkYV9hbmFseXNlciBzY3JpcHQuIEhvd2V2ZXIsIEkg
bm90aWNlZCB0aGF0IHRoZSBweXRob24gc2NyaXB0IGRvZXNuJ3QNCnNlZW0gdG8gY29tcGF0aWJs
ZSB3aXRoIHRoZSBjdXJyZW50IHB5Z3RrIGxpYnJhcmllcy4gSWYgcG9zc2libGUsSQ0Kd291bGQg
bGlrZSB0byBjb250cmlidXRlIHRvd2FyZHMgYnJpbmdpbmcgdGhlIHNjcmlwdHMgdG8gcGFyaXR5
LiANCg0KWW91cnMgU2luY2VyZWx5LA0KTW9vc2EgTWFoc29vbQ0K
