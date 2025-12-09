Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628ACAF599
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 09:55:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BB56601F1;
	Tue,  9 Dec 2025 09:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BB56601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765270540;
	bh=ePwoLRTGas/YMOtuihXLyB4RlVXrttr9Q2Rn+eCG8oU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iRE7iv/ExNDCooqLa+/rdlZXSAdSqnccre+I+T74NbM7g2qA8HjrPSi1gtSQeJg7G
	 V2OtsSckBW0ztZmB8SNEY7WWksDiSQHsXqwswdyRVRF5yxERj5OEAQ+5e5bFLBY9M1
	 nye73QzdNrHbGig+C48yscFYrN6EOfQg/Twno4KA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D7D8F805DF; Tue,  9 Dec 2025 09:55:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 582E0F805D3;
	Tue,  9 Dec 2025 09:55:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98256F8028B; Tue,  9 Dec 2025 09:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C03F800B8
	for <alsa-devel@alsa-project.org>; Tue,  9 Dec 2025 09:53:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C03F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187f801b81ea8a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/657@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/657@alsa-project.org>
Subject: ucm2: codecs: rt722: add condition to SetLED for mic
Date: Tue,  9 Dec 2025 09:53:57 +0100 (CET)
Message-ID-Hash: IPCFL2TJEHYDSQZ7EGDPKPK6EZBQJ32Z
X-Message-ID-Hash: IPCFL2TJEHYDSQZ7EGDPKPK6EZBQJ32Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPCFL2TJEHYDSQZ7EGDPKPK6EZBQJ32Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #657 was opened from shumingfan:

Some SKUs don't have the internal mic, so the patch adds the condition to check whether the SKU has the internal mic or not.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/657
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/657.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
