Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA09685CF2
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:01:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA37983A;
	Wed,  1 Feb 2023 03:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA37983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216896;
	bh=91Axqi74xdJv700kvBkl9r6bwzVvWbPBwvxsa+zEFyQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WJWo5kGNeG31JeY83/7qvopbk9MJntkQKM5x0+W26W5hBnZTPpWpSveDHTHEc1JgC
	 QXFk40LO4ytFRCDKmzGV7d4AnJ+cIxQdq9nrIgsED0s4fnvyGXGhrkWllrrp4hc/jc
	 ExozcUqc/tmgBRAsWpl52f4i94OmDU7jHZEPnjd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8203DF8055B;
	Wed,  1 Feb 2023 03:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA84F8055A; Wed,  1 Feb 2023 03:00:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81E65F80544
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E65F80544
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bCPHP9V4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBnBkJ27kCnGsHO4bUgFaQ7BEfPE4lhabNDpz1zAVF5ZoGJIVOmQTIRsq0wScMs1jgXC5sKR0KPP24t7ABx9z0BaYRc1izFyqhKtBA7LhQZ6kTfdeeLq4vq7XVg+XOAC4Dx96SAQ08M/Zba0V9OViqGZhjKgpsPs4L9oVLdG38SyuabS7AXisLu75OnZrqjtjd8jQC7Fd9t2W0yhzuNVnsX1LqsRBEbJdWmNlOMrAybJgf9Fy9hcUWyH06dBtNTUB8jSp2nhELhQHmqbzJ1jo/sNEDqtFQuWJwSRWtyXAqFE3ESvKBzbrNMdAnAY/iho6R4EswaqSz4JuluDzV5giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+b6JiMv9xGNQHw7tkOhtiFRMfjhdrSWVfLdQ5J954EU=;
 b=iQpyxy/0bO4IM/v+bh3aFlCGiEPdfN4oEUWblnhfd+xjgLhAnQ9+LVrGiqXEGJpL9sZNfnxpgV+KJPtvPH4nGImYtNFB4Rav5e8FOGuL7X5HknB3MXWbJigf9NGBbpJpM4aQMZNKHsGn4XWBexRiqwoaKtz7W+bElgKEzK+8IElfb1OcsVmuK7C65/1UTlda8GStTcQ2uSDKWo/N0asVP7ROyCr3uNfC8rccq/3/itj+rarPWotTEOg2RWNAbfWt3BkDiq9sHhykYLjldEeDfO3zEHCLK8p3NYqjkAbV0abWvj368GQ+IUaDvlu/hJQIFKl40SaT6UKw06uiP/Nu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+b6JiMv9xGNQHw7tkOhtiFRMfjhdrSWVfLdQ5J954EU=;
 b=bCPHP9V41/wddshsiu+x7TOVY2WI9IVTLeNaGUauiWEFxB+Wn2JwJS0E4k7o9gZS3TJQtjTIMdIoECkySFOxokS0fiJZhobE/gvFuVcFV1XGW5lBTHkuL77pvLCU3v9Tcufq2Ucy+vdJykN8LuCMXlUoPNuDUOpw47fORSqHDgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 01:59:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 01:59:58 +0000
Message-ID: <875ycm6t7l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/15] ASoC: rsnd: Remove unnecessary rsnd_dbg_dai_call()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 01:59:58 +0000
X-ClientProxiedBy: TY2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:404:f6::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d2910c-c2e1-4a0c-70f1-08db03f805a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oS1/uipMfGwK8qOzIDFCwHuMHO14OsdVfelqLfaF3LSV1dLGAdtqMlce9a8iPL+gOsttDvNo6vF0keKj/3Oy1ERe1ZxBXm+PysudM35eXhLX4xu1qhKUsFfzcldTkkSZwv+UNZucVuPjD61eFAtVELQjSP/QUR710A2X9TF/AogCGzQeHtOINVqMFo3+Fka3pLt8vL9ntcG78NyRgM9s0ibe/4Xrh/kAfneIbz357UggZ1m/7fFvXKZ9gTLOgNLaV0jKMevSWdAGkmajuziGvqd4xg/XIs539O5r2ik8OZVkMtwN6tGc4jGaiX2PPKx2OpIvz2M84ugzTqP5d/HbPi6m2KX27Z+Qvt2X5d3W1SFgVJeL2jOl98m8NNwPWp1+TzpI3TWxeJvzrUzxqc2DhdbNqymwLYCSHhU7OSezxK3XsIFkFGlAX8jCwG2npJIRH0vk4+gkBxR/GJyRPN5zYBJE7ZR8ZtRtpk+BfIxbxqEjDnkJqbXTJ7lGTaaQFYuih62o9Vnjpk66w2BjXk4zuZYuI9yhr4YticMB89RDER9mOAI6hbLohu/tjkoyMfakLQofQ997ngJi1RUlryY2n1jXyVSN633SqUpgpfC7Phm//xUWVtcpbVD2jwHCMLlieqOB0/eD/cZ4Kc7zlwZx1BztoJaXC/bennOx5Wnca54lkBX8ySvxqICAcPgwlFxRi0ehlm5aPIdcwNxNfNQ5Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zpT5eTu/+vnNpgikL+oMLZYey+2SuOjn66NmlI+R9EwZBFUig9/QsygkqsTS?=
 =?us-ascii?Q?ZdCWiFSm2NpFI9gLR0ZeMD7jaML/dly1HSgFcDT8dP2lDuaAJvTE7kbndjTm?=
 =?us-ascii?Q?OUP4NN2JoinlHwdJZnKV289ypo1mAvaFD12j22gLTvIY7BeUb1GbPd2gikAm?=
 =?us-ascii?Q?DgHdCbeNRPsNPbV/gX0ycz55uW//jNdp4YlwhSWuL2AoX+TL/5tmH/nyf43Y?=
 =?us-ascii?Q?X5Q7ecmyh2BDBK9L420TCf1BKMKZew1msxDVr8LhIC9P4q0v3xZWWtLZC1kd?=
 =?us-ascii?Q?qDyN6i0A526VYzuIXdx4xlcPSvP3EyK3hsPzp/n0aRlUKL4dJyx9tNRlpx11?=
 =?us-ascii?Q?g+Z0bx5d/Yh+PFG0G7qvtXs1ic/QI8w05rUtPESQbWMjAvbdoPeOVU/Byo4S?=
 =?us-ascii?Q?OO9nwCBZHjFd5zxQ/RflMH+aCh1/08cpGYpgP7pCToVlzWzQOybeg+At32kU?=
 =?us-ascii?Q?a9PWGBFomVJy925gtNb4GFVl1IusPikksZOUide9IxLSdJlrvXhrttqK20Uh?=
 =?us-ascii?Q?edFrci7RGJMTksrpTP+CrtpwBFbC6E+GO7/nTZeNhYWou9kG9TJ7yjeymdlf?=
 =?us-ascii?Q?FqigvKKf9DNbMypLsqX8TAdmGefq8Mdmjd4lllD6BHxwb2RtP9++V4Odd4eb?=
 =?us-ascii?Q?gsBmgMuNpaXYW4zUMJPGQxBPLiX1NcwSJ9WoZee26Z8QY3w87vfwEwFa09jt?=
 =?us-ascii?Q?9K6WsGg810gvHfMlERUQZPMyPz2ShJWUvZhhHMHNdAzYeGTiPAJQfHYcG7Ss?=
 =?us-ascii?Q?HVQClawZn8AGs9bHpOttjdMITsnBOZSJL88/+hIbD49/2aQUHJhaoR6wus2U?=
 =?us-ascii?Q?L9BPFZwCHZzMVkYVk7eGQIS9CefvK7Evl3LsG2CRlwbd9snmTlZ8y6fzoTHu?=
 =?us-ascii?Q?MzJxpgcpfv4V2ypXHZ3caxGOy1M/S62MEkJxSbkyl/0XAtORZi7BAT4iYNIq?=
 =?us-ascii?Q?zn8vdhaQx5QBzeHBvyly7pl+Gsl7W8lHXolP109fwkWPPYSbJjllUrXfTEoW?=
 =?us-ascii?Q?2wBOqfLtvvowe2lwqwmdtpABj5V6wqEdDV9Z3vxqmJjkY34veEBMp4pkfpDK?=
 =?us-ascii?Q?+HsW9IDDbOJfiUURprJKpk8vKB7V+xkiGzvUWu0jNuIXxsqnnQiI6YGCvZ3c?=
 =?us-ascii?Q?FAVdGSw5X0F3h9WkJ270Ce8RYj7KwQIDB5VAGryLUn/XcZ4KC8hX6aWi9dT1?=
 =?us-ascii?Q?awZ/nhnYoYRr9JiDtE2Tsr2HmyzzSif1Iq49rIy0VuazKaI/TySzGp3IgtAb?=
 =?us-ascii?Q?UEOekNqvXPlePDVk6ojqiOqPIAwS4YBflZO8VVp9pYA5EmCcvwLVWXaHVsiy?=
 =?us-ascii?Q?QlAayeRTRMtoLKUXmwPu4Yq0gENNNgP3hMqntp3DDIQjh7cElHZsYYRo0DQO?=
 =?us-ascii?Q?YYzMdAPoqANVNCnL0x1abD5lKL/XQp/FVbeaMxklHK6g4PRTi+28jNp6b407?=
 =?us-ascii?Q?72/ymKutKYocJdZhXd6q56sBnybaBGb/yQu0334c4GvfeXgNO4bUrroOy7Hp?=
 =?us-ascii?Q?JBdWJh4Q8/S8dGQ8NmODduXHMhCXYHW84VDsx6LR1UTtZ59/GIueiW2Kp5iX?=
 =?us-ascii?Q?BcChLP9E4ECm7CyjcWLGs3rM0tbc6D6HvUJrhXNOfbaVx4q0/OxnQHAz0nkd?=
 =?us-ascii?Q?goy5Dd/BXLHxrsJz//YhS5s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2910c-c2e1-4a0c-70f1-08db03f805a1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 01:59:58.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMd/7f6+BfK6yKq5q82XWi/FEbD1OXJFm8mkPlCqsBBQpMh6SFQEHC9XRapXR5vzS8mT6B+R3Tf5N72PfTri5mdQ/gf4Ct21ZGUFuXvKiSyj4o9dQN+cntn+PvjmJA1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit b43b8ae87c8e0a8 ("ASoC: rsnd: protect mod->status") removed
RSND_DEBUG_NO_DAI_CALL and rsnd_dbg_dai_call(), but these are still
exist on rsnd.h. This patch removes it.

Fixes: b43b8ae87c8e ("ASoC: rsnd: protect mod->status")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/rsnd.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index f8ef6836ef84..a09b3612b7f9 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -891,16 +891,6 @@ void rsnd_mod_make_sure(struct rsnd_mod *mod, enum rsnd_mod_type type);
 		dev_info(dev, param);			\
 } while (0)
 
-/*
- * If you don't need rsnd_dai_call debug message,
- * define RSND_DEBUG_NO_DAI_CALL as 1 on top of core.c
- *
- * #define RSND_DEBUG_NO_DAI_CALL 1
- */
-#define rsnd_dbg_dai_call(dev, param...)		\
-	if (!IS_BUILTIN(RSND_DEBUG_NO_DAI_CALL))	\
-		dev_dbg(dev, param)
-
 #ifdef CONFIG_DEBUG_FS
 int rsnd_debugfs_probe(struct snd_soc_component *component);
 void rsnd_debugfs_reg_show(struct seq_file *m, phys_addr_t _addr,
-- 
2.25.1

