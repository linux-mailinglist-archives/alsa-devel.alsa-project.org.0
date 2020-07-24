Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306E22BDDE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 08:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD1561681;
	Fri, 24 Jul 2020 08:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD1561681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595570695;
	bh=U/Znku8EzjrOQffujBmbs4YE2kKqOQVZD8OkKUtIqX4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C9GJ+MbcR2e6VYT1mwvsPqBR1rxcL3KVbCBZMbEdY5YhDzcrBc9m2lTEzXRXDfBIg
	 grq2MqJobYV2eASk73u5dVSa18nIDyk+s79bD5u5wPitHLg/HD9TBSYdd9jaVApTe8
	 2V6lYpEDJKC/c5wrK/yc8G7gOqz9cKw8dxIwIf+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9FFF8011F;
	Fri, 24 Jul 2020 08:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5D44F80161; Fri, 24 Jul 2020 08:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680121.outbound.protection.outlook.com [40.107.68.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D78CF8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 08:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D78CF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="cGeKLFCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXkeyk5XHnekh5WQF6xVrvD6nNwmCSsiBwMWoi11GsvVQawNOi43AuP4tNTTw0TFnmnraxIsU1AZPi2Fp7YuyRX0Rw42DxBRRSUZJiiQTxuaqMIRNBSIdg9YbGPwDWixtKCsfFtaZ6xlY1nnNYxkUB0bqouEJYb6C83eBwZ/3V45ZIKXbfUc2DsxMVtTgRbl7kqoL41h8R9gXSx5tfvsZYeHbriPYjn1gN1HesJD92DnbsQcuLp5ZQg422KDy9xXHFA9EP0p5zctK8Ed+PIsU3YKx2gBFNvzLwP3QQE7hJPhMW1AMHi+gRK4RUGg3J+7UTx/p7BGLkWphrOorz3QdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDRH4qiL700yFDtGPrFJoisOMBcGYtSiOud1ZsmG/XE=;
 b=APytvjOTtLJ7um34t+1IWWRdaOFxT60Lp3WNeLPdO06gibXlI6jWwYg2Ey0dIY1JQG1X3TwBKcGezkFyYn+7XlqYVkV8svYYEmZIXSuoZso6VoMgv50rWR9u/gOfIog3q0yDDo4bRgqGgCGEQtsHkGG6ZLJCXJe74ON4TPTOgg+j4Po2wCOSnNU1G2lKiHdyFLwVPraFLkzf/VI0JYcwWILwRfiagnX+0WhkiA6A5JcfkXRZZe97YNrgQqiP+xocA1zan5BV9k+fFbOlJ09TOaTGL2JCI8i/QcwbVmMUy9Y0B4EGIRGROis/PL1oYXoPsXSe/rejB4nKrZDQ/G5f6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDRH4qiL700yFDtGPrFJoisOMBcGYtSiOud1ZsmG/XE=;
 b=cGeKLFCl0nCSR+S2XhaJZEHkF08Nf6m2OZxWwAJPdPEWmuEVF9aUGnJcYeSRBGlfaf9otmayOFNfYXcY3Mxo92ZtvAYLDIC7myDNraGhnij+dath2jxrDuqUum2PXzyreJ5roljyhOYRJwppXGbxxcKm3l5fl6OMZqFp7eUDKzg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1646.namprd11.prod.outlook.com (2603:10b6:301:c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:02:51 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:02:51 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: max98390: Update dsm init sequence and condition.
Date: Fri, 24 Jul 2020 15:01:49 +0900
Message-Id: <20200724060149.19261-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35)
 by SL2PR04CA0022.apcprd04.prod.outlook.com (2603:1096:100:2d::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 24 Jul 2020 06:02:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:e716:8b4b:b4b1:36e4:d148:7e35]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d46de89-761e-44e3-3ebe-08d82f97327c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1646B29943BD89C41342F24C92770@MWHPR11MB1646.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oApkqOozfGWLl8kZM2fPYCZ7j1I5q3MRywWYTz9VWKDJQFY5Cs8xMrGlwHcpdKvuQFu08Ivdt4R1myTiuLMfcuKdot0/GJknQa0Q5LQoUz3THQTbilWXfdUO7t43Ac4nXRx71PHk/ooUo8VXRRFWs1XfraL61aiYdHjF2i1qkp9DnPwo4L7Vj9Mz+LmzL/DimRwrEv8jB0XffI0VC6d1yT7IPe7pQzs2E48Tn7ZCaKiE5vMY1je4V+YnFkncXzfeKi7CimG6ZHG8FnOG1cjMg/dJIFZQX3pMtupzg8K/thy7WvfsfaveGs6xI2gJ7jyMbFbVhV7hTFqU7HASzlNeOhh8vNeIBILmnLzUg05f3ywYwLKMTFfoY5YD6QjwP90ZsgbzQYfbzSg4BHq/cyB7NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(7416002)(186003)(2616005)(478600001)(52116002)(69590400007)(6512007)(6486002)(6506007)(66476007)(36756003)(66946007)(83380400001)(1076003)(15650500001)(316002)(4326008)(86362001)(16526019)(5660300002)(8936002)(66556008)(8676002)(2906002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: jYNkumhiYx2nHC/8NY+HhNxU3QRmoMPRDCj0GkBLwC2WFjuvdvF97mnIvHmXtZF2TlVzJF8KswgK5Sp1tiVQFuV6QQpGhc68AK4CIfzQZSY8UcXV8oanuY/g2q8ykgBBdZsZuwg0Gs7ssQvnWd4nZAVwohNKtRx7+gYtTfRzNa9r0EpSXi7lSpi44sMyGMvOYsZ4QrSJqPMWOUJu4hz2eb+V2svzwjIv3D6zYGpmYUpo56kZYrQCJdJXlY2LbxBqbt+TMcMR/+0w59pAp4gy3q6rarRw48dSEMNYW8ZyLoK65hjUD4bTkyGWDi4KtOFRa+fX3pCTrjI4doAhcuzbBRd6d2srHcEyhcILr/MrKaf1WSAjJAXB1ljOBVoMHCkjTtbaPN5+ATFvp//sqLeJEA4KIJsr1habQk0oa3fBgY4s9co5Aj/ivqV+g1vfNbqvSEpq8iew5wRaXnmyDW9joxYWnEcY3hDbC1I4ordThszZSbRWVJE9hrI2ScqwL+Wy9mKdwGKVZ3fqg+ISWwE/6keSGctlfSnLWI8uWNWgUOc=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d46de89-761e-44e3-3ebe-08d82f97327c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:02:51.1093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laCP4zNWzpY4dLBbvClGHyuBiSOt/K2Xx7mJiqwzeZnYPzBIq5W1oX3Va/Ht8I9jTCIa5an5/8J6vVr0GvCz3fZVBAWNAl7DWLgvtiu+VXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 Modify dsm_init sequence and dsm param bin check condition.
  - Move dsm_init() to after amp init setting to
    make sure dsm init is last setting.
  - dsm param bin check condition changed for extended register setting.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 44ffebac15ad..ff5cc9bbec29 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -790,7 +790,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	param_start_addr = (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) << 8;
 	param_size = (dsm_param[2] & 0xff) | (dsm_param[3] & 0xff) << 8;
 	if (param_size > MAX98390_DSM_PARAM_MAX_SIZE ||
-		param_start_addr < DSM_STBASS_HPF_B0_BYTE0 ||
+		param_start_addr < MAX98390_IRQ_CTRL ||
 		fw->size < param_size + MAX98390_DSM_PAYLOAD_OFFSET) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
@@ -864,11 +864,11 @@ static int max98390_probe(struct snd_soc_component *component)
 	regmap_write(max98390->regmap, MAX98390_SOFTWARE_RESET, 0x01);
 	/* Sleep reset settle time */
 	msleep(20);
-	/* Update dsm bin param */
-	max98390_dsm_init(component);
 
 	/* Amp init setting */
 	max98390_init_regs(component);
+	/* Update dsm bin param */
+	max98390_dsm_init(component);
 
 	/* Dsm Setting */
 	if (max98390->ref_rdc_value) {
-- 
2.17.1

