Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F51FC5B5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 07:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8297167C;
	Wed, 17 Jun 2020 07:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8297167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592372212;
	bh=sWl5IIZNAzBqMaisVqzqBuaElVHzAf0XuAEa02ClmK4=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mSLN2CFVLBiLuAU1ZOnkQlMdprIk6YQI122gI9SNQXJ56REDTCs6g8uW70ERoCppU
	 K05ZGNu1Pjx4CaJgeQCoJkWZeVUOisGKgOx28sQTfbQJUZf/ofd6WMoRjiV7VE+AGh
	 AOhqVmI2Du0Cid+HvxfZ4JVJIdQ3hqnuYlvprBkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4EE1F800EF;
	Wed, 17 Jun 2020 07:35:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C314F80171; Wed, 17 Jun 2020 07:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D07AF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 07:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D07AF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="DQifyK3b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsWuubr0WQtBtIgpt83IyE9mbB2TrNtcc36XwlGuvmxU93B/te5wXjvWVRdZB0bKW0eVniRsivhBq1sTcVGd+JkZKBuXPmJZM/TH6H2xBXMyVAXVu31HBhAUbaEpIrn4CThHQ80bnRd96z5FfUpmBwmxTdQnjPbYtv3h22I6JpqyvFYyNEHH+rx0rGhwOla4xdH0a6U7/LbH7+mypBTnKPnsSYhAWt5xbGEemFXZ3gq0xBbrTjhHVaxSfOxqUhzXBDNLk8lDUrabKKfg09tVIUGIWwxxAzC8ekxYJS9pkGaxZuKnpOeBjVEPym4BtDqjjUs06oGYfOZzj43WLHKq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoCFgDhXCPmlYxxdBk32Hv0nN/QqTkh7C1VV4fM0VDA=;
 b=M4Kv7q0AFWG2ebaTOR7kdQE3SzSR5j7eEyKNlp/hcit1T4FyGmgAAqXpnVSm8iWeFebdNOiYxjULL0lEsdghuCPDGXc9wrShpBohIjXklpNglYY8juGi1+KaGIh3IZWPaqT4IJ6CB+gNJrLgkv5tR8/PN0fhks1IEhB52ko0BpHHG4qrjOPRha/dK07NT20BMcgr8Iyt/6VGCogRP1MOs3Gy8mpDWVqMzO8PHn8LzTeX2LlnA7UenyWYtR55Fb2ocsDQkdqjgA9Q1Zv5fjeb1ODTcXoMW0082gWZnV82w/mrQg9IFzNWFLaiMJ9t5x/+rFTekYdyIlyFr0n5m8OM3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoCFgDhXCPmlYxxdBk32Hv0nN/QqTkh7C1VV4fM0VDA=;
 b=DQifyK3bEOyztSqxGp8cpGSAtNUQVQCZPT27Y0zjjZrhLpkQGrU52muvlVifUQIXTR5LXZ2Zy1SfEzLmseI9+O+3sUpfRbXMcWL0ZA745/ulzKUidGojQKNO5crjLisBwWYVQMu/FROmWhpBAevRxY9UZfCg/Espx74u5Dn4MRM=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3785.namprd12.prod.outlook.com (2603:10b6:5:1cd::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Wed, 17 Jun 2020 05:34:55 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3088.026; Wed, 17 Jun 2020
 05:34:54 +0000
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: How to populate required string as audio endpoint name in gnome audio
 devices tab
Message-ID: <7c9bdd7c-efe9-c37c-3fa6-a6f611c43fc3@amd.com>
Date: Wed, 17 Jun 2020 11:17:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::31) To DM6PR12MB2633.namprd12.prod.outlook.com
 (2603:10b6:5:50::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 PN1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Wed, 17 Jun 2020 05:34:53 +0000
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 010e1ce8-59d4-44fb-cbf5-08d812802a06
X-MS-TrafficTypeDiagnostic: DM6PR12MB3785:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3785F5B9C661F30ABCB219A7979A0@DM6PR12MB3785.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UvAI8u6Uh8fyLCuZpZFswcBmB7JZfFLOwgXnMPKoXBxpqdIbg3MMHa74t/WKP90OlzPaj0QzwoyYjBp66tVUmjlMukPdqvFWdOsAfn4QJRcP++pioeN3NBfA5pe2OrII263OA6sZSYeYGEEe7lbNatidehBb4opo9Q32w/MdQV4F1AeiKlzLAaIQZaxoJIf/TbCeJdHb+gX0oEjhmEZ7uNrc9kQ4GJfyjx/f1kauivOXmz2Vp17pRNZa17MYVeP/46JX8S4Jd2vkJEo77gTWwNmQISZSd8Q7ji6zTTbz1UN0i8rJFEbBs1X+qSSGLBOVFgW4E55bccnqMAtbblX8yb3AedUP0qiX+E/adiBS9liTbk/e8/3gDc9VPfGV2SUMnumD2eQNBEddaPLmjw3K5b5Wz4MXRuTOF2QMaG0Uc4AHFn8RPA+H4CXpRj93fsQ7Vu1GXD2e8ftAUxgdL53FzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(8676002)(966005)(83380400001)(16576012)(6666004)(4744005)(5660300002)(478600001)(8936002)(186003)(31686004)(16526019)(2906002)(316002)(66476007)(36756003)(26005)(66946007)(6916009)(66556008)(86362001)(6486002)(52116002)(31696002)(956004)(2616005)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aY0L4pa6l/syXEZWX44F8T8SAEcvhJaXBOOsNZSTqM196JsMlfxK6rDq0Nn84JsLcOzdCYT5PrlYx1gUR8xIFSaW0TWIZOCKAUjFFoXy/czlDklGiuhqzN+vDpBszMIZob6NiBQjAbJ/Xtz4CbOpW2OKYbT77HfQ+cfr4lMZi9t8s5n+oNl3BdM3n88gAYoyCWZiclni2K4X2d+1FFrbzhH9SwEtAuJrYvcB+knDw5zXMImYm1obIgaLwAGLRZCdOzLHONdX+FUBkpaU4B8JmA0gUK86tcJOk8HVt+0jV8NKInOGvAJM2H3hiSjn6/NVacA1p2awlCi2G3fpA81hiZVuvNuqEo1pmoSRF2sGi7zC3kcerSXyJIZN8a3Mlj1NTcoWuwr/NQHgm7ZXp7Xi2UK6YNAeH2udF9dxIQz8X135rvGJpHF0N5nufBFd1mXBf0AZ+W4D0ROGxj30JAtqeuv2AHF+7mKfksqGea4+DomuF0GgvkjyyVmWEWMAZF9o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010e1ce8-59d4-44fb-cbf5-08d812802a06
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 05:34:54.7105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0YFXOjlSHld7kxssUVgy/Elbl2DM885nmblMDYQT1zft6bWrRPxDmMaskgcrJjKH1NOCHsNr2K9jIsaWVkr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3785
Cc: hui.wang@canonical.com
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

Renoir platform has onboard dmic + south bridge HD Audio endpoint support.
For onboard Dmic, Audio endpoint name is populated as "Analog Input"
in Audio input devices.
How can we populate name as "Internal Mic" or "Dmic" in audio input 
devices tab  in sound settings?

Alsa info link: https://pastebin.ubuntu.com/p/4kprhDZYbg/
Pluse audio info output: https://pastebin.ubuntu.com/p/sdx9Xs234C/

Thanks,
Vijendar
