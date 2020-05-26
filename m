Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CD1E1886
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 02:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582CD1724;
	Tue, 26 May 2020 02:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582CD1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590453728;
	bh=b8t2APAyV6xTg+tca5LeI+6lW/0Adna2CbYU3IX73g0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hrkNNopCHwzbGeCiRnhNkH5jpjY5XasYudwppzPk4j6INaz/Cj0FJIv/HdfwlUQ4r
	 daWsqGDj3DOSgzQKvXPgLgH33fTW0n06PsK3iU751BZBvR2ZyWp8kj548bAJYLiHBn
	 8W6Q6E6440XIxZ8HrNxh9Px29tgMG4KPE60ifNDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA82F8014E;
	Tue, 26 May 2020 02:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72E85F8016F; Tue, 26 May 2020 02:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2124.outbound.protection.outlook.com [40.107.243.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC02F8014A
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 02:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC02F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=northeastern.edu header.i=@northeastern.edu
 header.b="nYc6FiGk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX9XINK/MyIStwG6+9rCs9siSISxyhpvlmmS7UtZHtDinqFajH2+UIDKwNlSt12ANnIlfs4yPTnDVK5bTN0DCVhwXx+5VYtQQn92e2417wyyq8fH7CZOhpwWEZ5c2pfDNCTgtxOWdD9JPsQ05K45EjBe0lO4btsUgMfcp4IGLGhcYBEvsOB6HPBUOz81zl51hzW6FkXMpe9KppRAYIL+Zq4xp/x+R1H6kSD5qA4kLStvJq2DkbL7mP8mu5HFLGc9xepq/mnSvbhApk38zRuqkURTyHi+i/L1Wdywv0jqdqrKFBn2M9K15a85MJEWZienKPLwDISPEv+ncq/AX6esTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zdf7QWFGGRL6f38p9M8F4g93aNXXH6gD0c/GMd8Ner4=;
 b=dii/QnGpV3kD06gCTIkkvbqAc2hoSMKaA4c74UF8zFd9T3ykDnW2GObjI+LRbNYHnKSpFoqsMkkZtQyWiaSgGT1BVldeqYzKxRJ2dHEuuX9CP7Hfvv5cme2TQ94yXk4AQAiknNjgq1myg6/1fyUp8qKaWcLMX9N70k3hakgFLGkOz7vLFyWaktVpRnQ9pqGU0VCf3uKkbaaATJHLKLZBsNmxu26jzWbFDwuklQHSVoi/Uc5kdNXx9ipjqSqlJjx074oHuT/9kHhzTlfqqK5uzYew0wmQRh2pj8pd3qBfOKHFwRYJ6t9knBM6SfKQsFG5+zy20eyNfJjB0n1ZGBlZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zdf7QWFGGRL6f38p9M8F4g93aNXXH6gD0c/GMd8Ner4=;
 b=nYc6FiGkRO1j5EefqNuYV+dSiBlB9FNFa1FdpWOC/3punMn+W/+fAaVQK5KKI5nHqac0CcIQRokX/+5Uor71Rs1qR70djzhNn+FZTV0Ta9wmR52H3yFl3wswS5h5p+EVPOlOITNE0erlTjcpiegRIv/Cio5we/Gy47k9CbmuWq0=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4724.namprd06.prod.outlook.com (2603:10b6:208:59::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 00:39:22 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 00:39:22 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: "tiwai@suse.de" <tiwai@suse.de>
Subject: [PATCH] ALSA: hwdep: fix a left shifting 1 by 31 UB bug
Thread-Topic: [PATCH] ALSA: hwdep: fix a left shifting 1 by 31 UB bug
Thread-Index: AdYy9F48QYRXqNjTTWulqJQ/P/wZiQ==
Date: Tue, 26 May 2020 00:39:21 +0000
Message-ID: <BL0PR06MB4548170B842CB055C9AF695DE5B00@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fbc263-f8d9-4313-6263-08d8010d3bbb
x-ms-traffictypediagnostic: BL0PR06MB4724:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4724553326514B58941F93ADE5B00@BL0PR06MB4724.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBXNRUKEeVSQeeYRLwz8xSQY+JceHkmHu/wtOCVoavib4IZ2qYfZEzgwXcm+oBD0roDcGW+txTmb+xn9j/oFfNoDfOcAjEra2GMe3RJWYOOfpww504N18ITbJGhPAmwYTBSP5Ux7lfX7xMsS3Q20TDogDluJJE1EJR0HvWBwuffQcqilGYaPMfBVKB2qlOILHn85ZLQWw8eDL9lbi6Dqh7Y4gA1UtydHTJgE8dz8I0NXB3mprUiv89tgl1LmFcnGJJW7FRlHOkkZVinJsxEoPovl7VCfgiNV/YoWpLE1oFQ4JcGMS1H/i45DTKu+W7XQKPXtzJwPHc05uDhPsDR4Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(86362001)(33656002)(186003)(76116006)(52536014)(5660300002)(66946007)(66446008)(66476007)(64756008)(6916009)(66556008)(107886003)(4744005)(4326008)(75432002)(786003)(71200400001)(54906003)(8676002)(7696005)(6506007)(26005)(9686003)(316002)(8936002)(2906002)(55016002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WhsYO7pSKghufdJPln+kpfX3hWEujO9hOcpA5dURAcrTCUs7uBLgNQ4LmZScOcurhZUYJAqMdYP2uHEyJCdEA1X1LHl9DPf7w46oNCVj1ZFQJCDziclXIDkTzKjcyGX6JskCGLneYSTNBUaBArQMIkxgnPxWnw31zn+hSlZ0wB4X4t3Q+KRwOYSPuxxrD2NgRkCWtVzWRgbj5NCJAD/DIYgl6xyUR9PPi62uP8kZfACOEWYgoH6DXxE8BfPLMtLdms8W8aYwupiIwcS0csE+gYfaeDIJWXfTxnT+v6gDozCjQeS9tVwu0VAlxhvmI74vHp1AM0snzhRegtN9WdxLE6PXtDYwFM9twxoTG00+83Xa9uWsMf18ZGJJsCnb58rrTe+XQlH19LwnUTL0FwRamwE7xzzuEZTKVcUu8eunVRnYzHDl82JwY4kghnm2/AzPTcYWnut8dgrGwFyg+CqHuCSJIuRn8InblF+OclJfwwQgO13NGTTtjWcD1JaSVzIc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fbc263-f8d9-4313-6263-08d8010d3bbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 00:39:22.0284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhd8OANMBjB4qaHdr1LT/Y7GejKlBSAv+g3jpK/drjVdMXRJu1juR0LlkfiquwEKPfKoKPtD2CkejDvBc0tdf5YH/LT+hc02BtumafVMSx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4724
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Changming Liu <liu.changm@northeastern.edu>
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

The "info.index" variable can be 31 in "1 << info.index".
This might trigger an undefined behavior since 1 is signed.

Fix this by casting 1 to 1u just to be sure "1u << 31" is defined.

Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
---
 sound/core/hwdep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index b412d3b3d5ff..21edb8ac95eb 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -216,12 +216,12 @@ static int snd_hwdep_dsp_load(struct snd_hwdep *hw,
        if (info.index >=3D 32)
                return -EINVAL;
        /* check whether the dsp was already loaded */
-       if (hw->dsp_loaded & (1 << info.index))
+       if (hw->dsp_loaded & (1u << info.index))
                return -EBUSY;
        err =3D hw->ops.dsp_load(hw, &info);
        if (err < 0)
                return err;
-       hw->dsp_loaded |=3D (1 << info.index);
+       hw->dsp_loaded |=3D (1u << info.index);
        return 0;
 }

--
2.17.1
