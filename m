Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F76821C9
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:03:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2765E89;
	Tue, 31 Jan 2023 03:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2765E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130585;
	bh=uLwrBroZGudU/DKs+m6vh/yUYrxbeEoAeBSkDh039lA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BogaZZcOeCwXNYrfpkLkWhPphVaEm2SpVdEdZgnNHQXWyGvvyWhU3BjlQ+htY08xQ
	 RLXQkWatmfiXAFz+BwkpltEFsCWTsJhMk7Oe5KkT5Mb7QVmXq8leB1YtRYTTJTBOnI
	 aQeOeImPwdQu5lYkFG0LXrEUDk45VLWXFghZ64aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 395B8F80589;
	Tue, 31 Jan 2023 03:00:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C15F805A0; Tue, 31 Jan 2023 03:00:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD14AF8047D
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD14AF8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YvIHvtsX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA6k9RgcHIpmPSDXuMjGPeGiQzfIeNh1L3PMzYiDuV1n5O2LRpBodL1m2hPcYJ5r5xnlTUPhs9ZXQphLRFL2Q1VEXOeOLUOebOKs6vtdWc2VbVFAcnrJN/PD1mI5mwnDyGBY7EezLnn8qDCmP+gkh0th0+Und0HcaAsgC8XybI4SJPeJ+GS6k2K5Ji9G1IXzvJAKyLf5kf9cNiSGM34Tc+wzN6hlrq+kb1UYDhNeJysmlciyLH5qre2iCe5RC0pI03ElGHHDjJlbN4GrWsjoRNyI813/IKWyrjIv9NmYNAKuy0THlhb665QkdtJUUOIGzuUvdX2mFV1QV/zMn1HU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=AaOC2OYbNl9pCNGG6mgQk6EKgooEsBbcg0csq9Ou06oQb67C6GbgvyNkE/geZWVh2QbwwPPyk6OPL3cO470UK9ltqxqQrz9bb2WEa748+5B6Stb8DLo0vbXia1mJ+b0l3cNkoE+kI1tR3ezyvHMpfDLKQKOITJAxbivtbOw/UWStc+xWGWoru85mhOTeiAVrL4nfJ7S24/FejAlqCMP84GFaOVjKVVq3TPD+hQFrUCRwkID3vIO9+nBK8KtJJLiGYcfUQ6MCOb/AeNFE5CN1zHyfd4i47nWX44QXP+wPlAf6D02PRJO5VSiKQD5DV0rRU4+KSxgmhO2ArwF28XKf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=YvIHvtsX4U2o0mG3JSbPhrkAmndcnUy+FqqRJ/GrzlQE39G61uj82uKE0CPZbAZ/33Unqj8EWpfHe+Vixjl+OF5akAXyemULFYu24KjMZhiun9LLPeMLJVXyIoKCCtVx4litIr/KkmCb2iZAQFNQRDabAzGccwB3t900mhsxlVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:00:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:30 +0000
Message-ID: <87wn53ea4i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/25] ASoC: spear: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:29 +0000
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 998ed442-5fff-404b-7ee2-08db032eee12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZzs3f9rTljzrhfoxDByVshMGmlcPp3TC9XfId/uo59i9axCpgRQfAj3wHU9KzpLZdwefTN3wFxcG1Vu3NTSobiO6kNgOFj0s3BWZIn1yDO1b/7JbW1709VNLjodoXZmoOGDa/qDOBPReOYJz+5K7qJhtJdHyab9jclDuyjzEbST1m6xyqpF2hm+Y0GHBOkvIEyfpYy76R25rJEsR7kiOwec55jdZeyRcHlOot974KyLzXd80kYgTPXkF74tDx5S2pNW/1UMwDzOPEf91BJuU1LCc8xYKO9kZVKItq7UgnCW3FZAQhK8Qis8XhwnYVpUJvfNz5PhrAcd019phWtih76O6b9S3yFdqG1iI0XdhcRTMXN3C2m2/HJsu/HHdGcGv9eN3OM+vHAmHp39Jp0h1W9ntkwe0zMNWoOF5m9oAdgJ5Gl4+IwmMc9+C/T6+oS3g8P4uf1KcDucAmtMgwkLfVkePgVISAUfZzhlDV/+FppjVz8bA4Bk9loh49wmtsz3RTbF7l2QmJxhcKIy/P+9KgXKGo8EvmVQrV/pU+JGsFkU9Ich9ZtIY7am490Sg8tabRhB/P0Yv+WU+vzBWHn1NjAeBLAvxTtnTObpAo1nBVq84X2yt+cyDC5HBqlUWGY7JR5XHuQT7SXfDhLXBV/PxAt+JnrRA7S6B75a2T3qH0mtoA2n0Mqq8eUVetsa5fJ+SlH4DcFLpZjUyNOzpbW+7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(4744005)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5qT6qmy9qXUgL/j6cRAx9zeI2cXGXYJM0xe13XesplouWNVqEy6nFZ267wE0?=
 =?us-ascii?Q?L6VxMDmwAa3R7Us6pyh2L/2Fj5RP1K7NtRoawr8FEiVK+83nhe/TN1F4m6jL?=
 =?us-ascii?Q?fQEFTfwTPoC/KClp5YsSIFYvdBVN8DV5VFYRvn5kpUFRZpYqQy1uvp8WC2Rj?=
 =?us-ascii?Q?ON3o1R0iGNlcK7fhg/qAuI75tjoQSxxMATni/ghofp2/ukpsgEPcHoA52Fgt?=
 =?us-ascii?Q?BLdh/yxCWjMUdAphNQ154UpZRFbYF2sXJIqArmkOHhLKlYMHfiW3vjZw0N2h?=
 =?us-ascii?Q?eiMB8q8erqMY0+sIcmdFTk/6re/SqgR9DfGsJhpUHJ9px85DzqKkF1d8SOMQ?=
 =?us-ascii?Q?JhsZiqabz32JVgfcKCZUUTJnOUq3fhqQX5YuCsP8tS+Jr0Ax0U7VDb2v9oVG?=
 =?us-ascii?Q?4Waoz3MTo6KN1syjbwRuDF9HfGINmzde2EnuhBl7tqkvZCtqstxZqTgHsT/C?=
 =?us-ascii?Q?27WnNFiRZz4EEBcz/X2FSpLurjSov6ByzVpRKeGfuvw0bs/X3fqQGm8WwXZc?=
 =?us-ascii?Q?1KL9FvnaC5utyX8uU6TmZUdZ9Cm6SEcDNa9QfNNkICQPmxhu7XZfSF27VJVO?=
 =?us-ascii?Q?SFja2C51PMz6oE75TdVTyA3VWYWNS2dW1DFQtYXczdDNJgHbP+sFYWq/X8y3?=
 =?us-ascii?Q?FU44y3Ck9oebc+B72gzqBSsGUiwO7eJftCaCCtoIm8eqW1DbkigXPKGvF0fj?=
 =?us-ascii?Q?erUNacl92gan8zGPSQVMGXpm8CgbQgX3s/FuKZ41iESdimGHJ4kTGPPaNA2L?=
 =?us-ascii?Q?VNzdqqGvoQBJ8SiKj1i3/9mhatigIgQ1ZIG/O/sHK7G0KCttMe6Op0BxQ9QE?=
 =?us-ascii?Q?mBPHxNhppu7LqI5UOuU3ebcMbb01Jtac9nkhjLXskchX9x8yX0xGjv+2diwf?=
 =?us-ascii?Q?taeKbluacOq86WU6Pfo9SfsDHtAFxcdeFioq/Rw+EZqQoHF3NhtnuB1t0f43?=
 =?us-ascii?Q?0hAbJFDtVEg30H8KjcDmgaOmYcS38SkVY4EKfEl47u03SetFbHYRy7aOOy2A?=
 =?us-ascii?Q?3q30OqMjppf88pa0iwWoyQ4Qph7KSL12mXyva2a1MwEn1yoE3sql8jpDv/xL?=
 =?us-ascii?Q?Jacm9cBP5Hgn8CiLjhb4hAKNTcbotE/9a9tK9aYjmGyGzmmV8589TzXm6zCV?=
 =?us-ascii?Q?tKkPCewYcML0biZoTKP/taNZye5haTJ53yIWuo2Fz7Ek32WlWcuC8tvRV1yG?=
 =?us-ascii?Q?1OHLOSHMobDfb34dGglgZfWrexwjQDxPAJbWsGtw/XDu/wccnTIj7ZqHq96l?=
 =?us-ascii?Q?d7vihw+UbIbKq/FaVtG5tZ0ngKa139JRTcGvOP8vi+4SZYdM5hddOEQSILYl?=
 =?us-ascii?Q?7GEhb+LSdRezG03I8ujm3fxLNwvDcL8sq8A9nBUYt4c8xnhxT9vZT0ldbs4u?=
 =?us-ascii?Q?wTnfJyHyRsJp9l+h+KFopVCuPgcF/r7Lgc3aE44fddwQwhZU/bsmb3adinJ5?=
 =?us-ascii?Q?imU3FPolG7A37Gv/qbqRH/Oy9gLMPLaMZ2qBqw6ZyqE3nZa3BIsUJJeRlRom?=
 =?us-ascii?Q?Bt/9HHE19uGgg2mOi06SvX/cn/GmuSEt7YwkgmKLfVI6z6G57SYcosdY8SHA?=
 =?us-ascii?Q?gIocS2fLYJGxfhhtwQszj6+rzdxUgtMu3nbjYAcmpQf23ZBuhHGA2l3LclDL?=
 =?us-ascii?Q?Dw3MQNGhN1r7Os8RSPYyD2I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998ed442-5fff-404b-7ee2-08db032eee12
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:30.1542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCDRzpqcFaC7Mw42wVnYeoQ5AaMVb656j3wEGRw559UeOgkdJ7dA5aTz6y0lFCJaEa9e3XxJekfZHm5VGx2UcIJKvFkb9YngtR3ZsP6hEGCCwcXsJz5jOei0uMmO7dU3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/spdif_out.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index fb107c5790ad..469373d1bb41 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -244,7 +244,8 @@ static int spdif_soc_dai_probe(struct snd_soc_dai *dai)
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	host->dma_params_tx.filter_data = &host->dma_params;
-	dai->playback_dma_data = &host->dma_params_tx;
+
+	snd_soc_dai_dma_data_set_playback(dai, &host->dma_params_tx);
 
 	return snd_soc_add_dai_controls(dai, spdif_out_controls,
 				ARRAY_SIZE(spdif_out_controls));
-- 
2.25.1

