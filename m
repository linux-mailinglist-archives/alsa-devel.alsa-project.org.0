Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4199C8B97
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 14:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A66F62355;
	Thu, 14 Nov 2024 14:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A66F62355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731590099;
	bh=yb51lT1q1fL7hr+3ECl0T2v2CVQU6cGDRq9w09frkUs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CDnNqyl5x8ndzXrXUAVsPGIIMUJv/NN0dqU+JV9fljGm79RfjfkMxH/U05TfAP0VA
	 HLHCnuLEzP6clSBrKTdaTIxDx9e245W+Z494pq1uVR59djGAd6tFYpNUxFtFV5phb/
	 CpPUoPsZm8NzLEuQiQhTzJXB0Ic2UDHe1+FdzydE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16B82F805C5; Thu, 14 Nov 2024 14:14:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD692F800D2;
	Thu, 14 Nov 2024 14:14:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A957DF8058C; Thu, 14 Nov 2024 14:14:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B0529F800D2
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 14:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0529F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731590060024505377-webhooks-bot@alsa-project.org>
References: <1731590060024505377-webhooks-bot@alsa-project.org>
Subject: alsa-lib-1.2.13: ld.lld: error: version script assignment of
 'ALSA_1.2.13' to symbol 'snd_seq_has_tempo_base' failed: symbol not defined
Message-Id: <20241114131422.A957DF8058C@alsa1.perex.cz>
Date: Thu, 14 Nov 2024 14:14:22 +0100 (CET)
Message-ID-Hash: DZ54XLAQR3K37FNHYUGGH5ECJXXP5XVW
X-Message-ID-Hash: DZ54XLAQR3K37FNHYUGGH5ECJXXP5XVW
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZ54XLAQR3K37FNHYUGGH5ECJXXP5XVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #420 was opened from nvinson:

libasound.so fails to link with ld.lld with error

```ld.lld: error: version script assignment of 'ALSA_1.2.13' to symbol 'snd_seq_has_tempo_base' failed: symbol not defined```

Bug: [Gentoo bug 943399](https://bugs.gentoo.org/9433399)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/420
Repository URL: https://github.com/alsa-project/alsa-lib
