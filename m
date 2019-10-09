Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D8D117A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 16:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF931607;
	Wed,  9 Oct 2019 16:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF931607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570632032;
	bh=xDBnPOqGLrN00T1CCGvxgCPirqVDRD5f/fvTqvhlMeg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZBtQSnFo0ZGMNmqaN4vnei2I9f2hJPE6hWyJpL48BW2txWZiVmNWXlK/5ER4P0Ee2
	 Bo9wTmFAZD+EWXyc7k/rfc35NSc/1+TW+wk4z1Dns1mrBRYHeiQA2idZFcNjNQubhg
	 ldkAiBgyOF9DOIHBf8/bcmWTSYHk4qV9dt17cMA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E956CF802FB;
	Wed,  9 Oct 2019 16:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91505F802BE; Wed,  9 Oct 2019 16:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::70b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865A9F800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 16:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865A9F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="YaGf3iSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar79rxNhu3Lhy8l/8V9efWRu+HT05DHM/FKG5oDKMrSCNG3wlmunewGM2teWZUUHrDjne4pEEJ3FPn+IGjaToaUDrR3sIX00aiOV5xbIM5jMxp4kCzLZvjh/o5dKcVAkkjKVQtNQ+tNCuGdehqCo+Got3IKyI/Rdc0hVi6OnVM0LamR6ELP820OitcPMOh0AYmWvrzX1yH5n/nbuHzk+lCFA5S3uev8AhzQH6M0UWUgI4KbBHP6PqKp+W2mJOdV5hBjE7cEfdis3OIjVTMAMIoil3yC3Cg1p5W7b4kw8j4LId8XsYWrL5TH9/Yjdsr0CgxstrGRVuAl/10P/KkOSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UutOp5mdKOhITYpJnZrTOI3olImI772sxBGFnnXkPF0=;
 b=W1jKORypR54FjIvN+0+KRBjjyveVFnQin2d3TRMg6nN30vLEGbgdaFsI33Y7J+BmbzzLMyjC/sF99CJanTDTZpxTmOJPfES8nqC6KyUJ5WEyFbtMHqINvf8KpeadngLg6kpALoUFKjQCj0osj2xZlPTIMcKZjAcyMFw2D32JQ2i7gjvF+4w2OeMm3JDg4NQX+Lx3hR8bwIB8rZWoCaZpSr9ccppC602I+rriJ7CTHpMro2Yu8nOiQYMt5uP5iohj1BoNwrUDDXdWqXHhn6C4OGpyuE0/1cdhLJDnf13y28Zc2nY0z7X6+Y+y7RDw7z99AM74VQBHovzpN6TtJ5IHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UutOp5mdKOhITYpJnZrTOI3olImI772sxBGFnnXkPF0=;
 b=YaGf3iSqD/QHmFWbkKyKVUOoG9xzEPEVfiVLscm4V+RkSuNhO0HraX17SHsPoTY6XH0lR5M3/YXBLVyGkDlNaDhpJCf9sf/oTeBKuJiugwC7aRBkYT+s3RA3ThDPtsW32W8y36lQ5PK/sZ/nrofTN10/mrja/sq206TAHmn4IyY=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.212) by
 AM6PR05MB6038.eurprd05.prod.outlook.com (20.179.3.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 14:38:40 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c9f9:f21d:d401:7f35]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c9f9:f21d:d401:7f35%5]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 14:38:40 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Thread-Topic: [PATCH 0/1] [for 4.14] VAG power control improvement for
 sgtl5000 codec
Thread-Index: AQHVfq8+DC2aQlM+cUC20NYe/JfBGA==
Date: Wed, 9 Oct 2019 14:38:40 +0000
Message-ID: <20191009143836.16009-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0501CA0048.eurprd05.prod.outlook.com
 (2603:10a6:200:68::16) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:74::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70305c85-e6c3-4468-37a7-08d74cc660a7
x-ms-traffictypediagnostic: AM6PR05MB6038:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB603877F7252B1638D3E6AA69F9950@AM6PR05MB6038.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(199004)(189003)(71200400001)(14454004)(54906003)(558084003)(6512007)(25786009)(1076003)(5640700003)(256004)(2906002)(6486002)(66066001)(71190400001)(5660300002)(6436002)(478600001)(66946007)(66476007)(64756008)(66446008)(6116002)(186003)(316002)(50226002)(26005)(66556008)(8936002)(81166006)(7736002)(3846002)(44832011)(36756003)(4326008)(305945005)(486006)(2616005)(476003)(2351001)(2501003)(8676002)(86362001)(52116002)(6506007)(102836004)(99286004)(81156014)(1730700003)(6916009)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6038;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GQM0p+q+buV1o+AzDyaScT/vVv0E/iZ1vJH3OU+ALjJFSllO6EvYjhg10a0HLOfiipgiciyWDpWjhIQaub0mv/m8GcsxIAN8avLmdd+9pgArrnyhsJG+gyCZdOTnVjR/vsjq0qgsV2yVxBpjYFdCtJ5ywkkC9j3If9XI9OZN0+Qu+/z+logXGoPWVUOtGr5YICNuPWzu2ISjJ+COI7FAMvuHzyu3vK37D8Li6tsPyfvCvDEWeUCAQSrB4L1yfCzMG/tt7hy8FNIb6Ajl0s4fab9H4JkWJJQfZU4HCCmxvcd+JIsNb3u1SC2oAlsOTmEthUBZhUtVuDf8XrUu/r2ITs1NER9JEh+r9W1bE6gcYglkf2HpR7wjLMR/J9eDwdw/QzQDmsc032smPXQGCRr3xv34dGgg80QVjicAf/eZ4hY=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70305c85-e6c3-4468-37a7-08d74cc660a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 14:38:40.6380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iz4Q3jOTkDgjTvNzwinkoRH/Yu400XBJxFAtlr0ie/yxXV+K8aRno7uspLqSw7cokaPP8Tztq1mT6CbVbGLpmhcYVK8WYXSp6A0LT2mE7SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6038
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] [PATCH 0/1] [for 4.14] VAG power control improvement
 for sgtl5000 codec
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


This backport is for 4.14-stable.


Oleksandr Suvorov (1):
  ASoC: sgtl5000: Improve VAG power and mute control

 sound/soc/codecs/sgtl5000.c | 234 +++++++++++++++++++++++++++++++-----
 1 file changed, 203 insertions(+), 31 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
