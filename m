Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D9411792
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 16:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F8116AD;
	Mon, 20 Sep 2021 16:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F8116AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632149472;
	bh=t1vfVmwoofcC3elCGh0Ztll3wKQ6MITjIitgHT7754Y=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FnPu0LT5a9mSUXvZOxx9xSBWweTv4FsPgm3vLgHzdxH6uvLRDWh6C9Ak3XzufO36n
	 hct0O4WVZd+GYPFuKcS9fBVmwdVYTNorCI250CAg92JVyqfLAYRluwVoS0x9xYrJ8z
	 Mwmnd4dg0UPCdI0Mz1f5imjeUvjtEl0L7HD/ZS10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3AEF80279;
	Mon, 20 Sep 2021 16:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C846F8025D; Mon, 20 Sep 2021 16:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140121.outbound.protection.outlook.com [40.107.14.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9497DF80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 16:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9497DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="pQ33plq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5Z08nTgPOcRDoLnWNDVUJCzXi8CLyQ7ml80O9uxTyN62tKJ3CyefGt7J59xc9NbGBIWQA2ERT3IRm5VD/S/i7Q781JJbqEpOWKCw8MJ0UNNIFxp4yfdeHYyg/ewJd0fIfU39MiujPl6u6fT9WnGsp6GXwfXoFi+9LfcRnjHCNRdPewRvRLitjFI/IwUZHsFkdKzkweUz+lt/is9NWv1lVyOSVR8zAH/NmzLtxBbqGsZZJeA95hpmEVjTEZPY1r7symcT9l+CkWhKZuvrIrinu4IU0wpKQcvl3b7c/0Uzu76dqjszM63eTz6NRHJWUVQoZzN92gaUSrLr9gqs/QIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0vehaNvh4dgCqP5qYIUca+GhoopBTqC6eacYd6NE5pg=;
 b=dxjHusjMeANDpLhP6zt+mMKjn8eniN5LsTC32zUkF2NOtDQlHzpsRkmod8LTDQz6zFD1UuN/H6SRQLYeHRD4x3EWXdkajrCSvQAfCCyadGSJj1cPgtW/eh/1wYG7O3UWrSUkJo3m6lgWwoRKOh0sclPFlMfS7j1+Jg+D27rSPk9gDa+O87vG8Gg1kqFcSXEty8YEGglg/CK7rdob45LOjWkOcoIYu/SuDouZB7hFntQhpspu6s2kS2S6ym9BR6rYRwU8R3//J5b+qvCEvM2HFGxahS/+2LeR+V8z7aTXwVexbqPh28+K4xNstUns/ngpIMuES6Gyd8VNfS+iyjKeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vehaNvh4dgCqP5qYIUca+GhoopBTqC6eacYd6NE5pg=;
 b=pQ33plq48JZERD3MwkX72J/LzS/FR13WSV6LlFNEz8tzycHHy0n/LfPd2C7IyNo58RQa/NklK1TkSt4Monse2j4Pw81jylkNOYuqSFf1Z1poAhsZGOtwgUDOx5v1E5f5plutB8m5ezyyk/oJ12w9Ezl5xFcqf8IStw5+yT4y6Yc=
Authentication-Results: birdec.com; dkim=none (message not signed)
 header.d=none;birdec.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB6556.eurprd02.prod.outlook.com (2603:10a6:10:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 14:49:43 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4500.019; Mon, 20 Sep 2021
 14:49:43 +0000
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Peter Rosin <peda@axentia.se>
Subject: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2 registers
Organization: Axentia Technologies AB
Message-ID: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
Date: Mon, 20 Sep 2021 16:49:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0101CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::16) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR0101CA0006.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 14:49:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1178a95c-2344-4df3-d534-08d97c45e1cf
X-MS-TrafficTypeDiagnostic: DB9PR02MB6556:
X-Microsoft-Antispam-PRVS: <DB9PR02MB65567D448BCD213F0AD5D178BCA09@DB9PR02MB6556.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dns6H0E9L4W/q16UVnlkRxhwVaAVbP2k+4GZaGeL14zNDLzmZK168OmgNeOCit4VRWrEl/2ABNiy4L7PBS6PbWFnXfZpi/mrL9c49VtJCdjfo/n1XtT5S6QCNPbGywN4COLM7Bwf+sLkMaIIsuoceNG/4nTSu2ZWtCl7EcbQGJatx0+7qTGYg1X5YqdBjhfdcGi/+8QG/MrKpUyfnjvL2S59ucrOSSRGtXY2KWlzvHdnV5Dnqo1Frke6Vkz7HLNnEpJS5pWSBh6Wf3ceqMVR/WU7HubwS4L0gyEqisssprzsPWvAUSl9+jcrx2eYyRa6+g6OzPC18aU02yZl5eRg2fhvzQJGSeXA3AyYmS9z0LtvNJR6C8qX3lNpQZ5xfc2MQAbIgWkPbjaD6cMuCuE7z4iFa904rB6FVPwGBfpMNw5iOxVxakcZyTeO1QDNnPDO1e+9dIKg5IKdiPyDa3bwz5aEwFaubrb/XkZaHJKA9ar1KRbm9w1nfbq5ssm7sGlYpsfwn2zH/CJQl7F2Acvc1ST8ZDrnDF+uYA2tep3GvmkkVTDR5Q7HCjH/ZnY9cQzh/OMKCNGBFQZl7wKXOGj3p5hF/u65eFD38lieuEDbXUMYMkMf6uFmmSI4acOOWspDXuPyvKwlZ7pB0LchpF73yeAccwZe8j10uOSlXgyOCZSQgsJK0v8C1xwwzENd2rBJTQt9xN26i5MS2IF0zC1stQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39840400004)(136003)(346002)(396003)(5660300002)(66556008)(4326008)(66476007)(66946007)(31696002)(31686004)(2616005)(36756003)(6916009)(8676002)(956004)(36916002)(26005)(186003)(6486002)(8936002)(38100700002)(83380400001)(2906002)(316002)(6666004)(86362001)(54906003)(16576012)(508600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0w1RVFOZlZ3bU96VzlMT2ZLRncxOTBBMXhlMlBiVDk5eGR3Ly92OFZCV0xY?=
 =?utf-8?B?V29YMGdmS0lLTU5qajBINU5YK0FlVHd4MjFtc3lxS0wrSGVHR0g1ZnQ5aVBU?=
 =?utf-8?B?RmxvQmxWT0tseVRwTnhPSlpkeXlpUjlDUTVtVGdBM2ZmakdGV2lseUdoV0tR?=
 =?utf-8?B?K2ExaWtUcXBla2I4RXlZSTdldm94STZCclhFY0RCY1N6cm1NUlk1ZkQ1dVI4?=
 =?utf-8?B?bG9CbWQwK29LUmhzM2hqdWtDM2N6a2l3Qmw4ck9PWmpyWTR2N3hTdys4aUt2?=
 =?utf-8?B?R1JXWURsTlh6aFV6bVpMZW95YThTc2pyVEw1V1cyeGdYcnhvSnI4TDdTVjA3?=
 =?utf-8?B?Q21URFpZdFErTEFuK1RDUlF3OHZ6aTlEOTZaY2RSOEVmSituTUZPY1ljd2JO?=
 =?utf-8?B?M0hFK1RIaWJjSU84dFVrQWVCSzgwMThhV25FU2tCK3pRZS9ZRlR0NmM5L3hX?=
 =?utf-8?B?c0xRWVVvRnkvbENoRlRTaFBHVjc5MTVGN3RrZ01ETDdwbVF0K1RDNEV2NnZG?=
 =?utf-8?B?aEtDVkhYY0gyclovQjlrdVRZRDI0enhOblYvdXBva1V5TmUyQ20wa1B4TkNZ?=
 =?utf-8?B?b3BNVm43SW1sM2dtdkhmYm1hMWp3UkZYUkhTNjdIQURORGJwWXdrSGswUlQy?=
 =?utf-8?B?M2YxTFNSOWxxejNNci9SUkV2djhoSS8zZVB1NHdzcnB6bjRDZkUybkx2T1Vi?=
 =?utf-8?B?OENMMk5yTnlYaTZqMy9rYnNTY1lCQTdFVE4vbXZqbUp5QlNBR0xZQlB6dEpI?=
 =?utf-8?B?ekVMamNLbm1Xb2UwdjVZR21Ea1dTVFMyYndoQjFaVS9qRkhvY2d5dE9oVzIr?=
 =?utf-8?B?cWlDYjZlTHhRcGVKNnpCNk5LYy9YdUs4ejllZ0NidkZ6ZnZQZ3JnN3pndXpK?=
 =?utf-8?B?U3Y5Vm1VcnpYOFdPVVZhRWJGdURkNXo2MGg1OURuTHd4UmQxTXhVVWpjbHMw?=
 =?utf-8?B?ak9mSHc1QVNTd1FkUkYvK09Ndi9YYlovZDZZYXY3V3p6ejY4UjM3TUVIUEEr?=
 =?utf-8?B?bGozQm92QmVkYi9oYjB2SnMycGtpb1dydmdod1pPZWplSWwxMXphcHhibEdy?=
 =?utf-8?B?TElmRlV6Rk41ZXA1U0t1alY3c1dWNDQrVHR4ejRXMFNYeXhSZEV3dVp4dHN5?=
 =?utf-8?B?akRaOW91cGZ5c1BJRHZLOUNLUHBVR1ZWN2k3WnJ6ZlFqak1kV2NzMjJ1TGlY?=
 =?utf-8?B?d2lxa0FuQUJzQVpTNEFFODUyMGozcmVkT0lDNUVqK0hVNTZwbnNrTVYrOGZ6?=
 =?utf-8?B?SlRGVktoWTdMdWM2ditDOWh4WEFTNTJkVXVIcGl1TEJKQXI5dDFpcm1nbHJN?=
 =?utf-8?B?MVN4TGhvUFFoWHVjUFBmZnZDb05SNGYwTWNIbmZiVkg0dTF3blBYT1JHa2RI?=
 =?utf-8?B?L2FNeUZ3WU5aMlJvMGdHcEFQYmN5NVd6cG5Bd1FCekt1ZzZzUGZYeUFGNXgz?=
 =?utf-8?B?MVRqRTZqVE4xdS9KaVZmZlJIUVcza0o3NENKdFovbGlGZS9lUEFoWjBmQ05R?=
 =?utf-8?B?aVdNOGt1U0RHQjU5WUMwUXorc2dhT1o5SE5STFU0THFVWGovbEdoVEJHeldR?=
 =?utf-8?B?TXRGTkdHKzRlN3VJdTJ0akZOU2Q5SVVFVE94MXRPWWRMM0RDcFdvdDdSRVlN?=
 =?utf-8?B?dWFWdXVUSS8xZnBYQ3p2UnIzbHR3N3IrOFh4aFgyQ0Y1ZTQ0ZjNULzJnWm10?=
 =?utf-8?B?RVhJU3hNeFFqMnB2WDB6UHRTT0FLbUh4aDZpWkNOamloQUU4V2dpSWNSWGFw?=
 =?utf-8?Q?AniQkiW1ywx+VnClfvLfkkPDyFjB55x1CW2Pe1Z?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1178a95c-2344-4df3-d534-08d97c45e1cf
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 14:49:43.5066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OAElpbGRGpfKCFhKaNrTrILN8a0/3ge7xrIwV3tb9FB7dsgFRILElLlBgr6hIrz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6556
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Mark Brown <broonie@kernel.org>
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

From 625f858894af2b7e547cc723b97361081438b123 Mon Sep 17 00:00:00 2001
From: Peter Rosin <peda@axentia.se>

Commit 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
breaks the TSE-850 device, which is using a pcm5142 in I2S and
CBM_CFS mode (maybe not relevant). Without this fix, the result
is:

pcm512x 0-004c: Failed to set data format: -16

And after that, no sound.

This fix is not 100% correct. The datasheet of at least the pcm5142
states that four bits (0xcc) in the I2S_1 register are "RSV"
("Reserved. Do not access.") and no hint is given as to what the
initial values are supposed to be. So, specifying defaults for
these bits is wrong. But perhaps better than a broken driver?

Fixes: 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 sound/soc/codecs/pcm512x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4dc844f3c1fc..60dee41816dc 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -116,6 +116,8 @@ static const struct reg_default pcm512x_reg_defaults[] = {
 	{ PCM512x_FS_SPEED_MODE,     0x00 },
 	{ PCM512x_IDAC_1,            0x01 },
 	{ PCM512x_IDAC_2,            0x00 },
+	{ PCM512x_I2S_1,             0x02 },
+	{ PCM512x_I2S_2,             0x00 },
 };
 
 static bool pcm512x_readable(struct device *dev, unsigned int reg)
-- 
2.20.1

