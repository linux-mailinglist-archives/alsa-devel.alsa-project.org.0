Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0BCB8281
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 08:46:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D6660225;
	Fri, 12 Dec 2025 08:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D6660225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765525595;
	bh=9CKUI2nvehrhJUyEaZ1Liq7i7G7hBnTDzZdXU2V+yVg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VQUaT6mYeryWw0iRWF7hr91XDGoIKXKE0q9pFXD6RRVZi+uJGafTMP+sPZNESSAlp
	 /h0oUCysqHuu7FRNZK3KCv5yMpC6DYTt1Rx1MpyJzuUe/Q4/p7JfHTnDRIXAmmm9KT
	 qgCKkEOZ7M9mlKqOdyIj84Xr5qJUantJ3faQU3tQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A20AF805D4; Fri, 12 Dec 2025 08:46:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BA3F805D7;
	Fri, 12 Dec 2025 08:46:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0286F8014B; Fri, 12 Dec 2025 08:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5B1F80095
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 08:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5B1F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1880681f8ea42500-webhooks-bot@alsa-project.org>
In-Reply-To: <1880681f8c985a00-webhooks-bot@alsa-project.org>
References: <1880681f8c985a00-webhooks-bot@alsa-project.org>
Subject: alsa-info --upload should say HTTPS, not HTTP
Date: Fri, 12 Dec 2025 08:45:40 +0100 (CET)
Message-ID-Hash: H4YKBD3FBYWTRJDSO2NHDDTTJXVO3FL4
X-Message-ID-Hash: H4YKBD3FBYWTRJDSO2NHDDTTJXVO3FL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4YKBD3FBYWTRJDSO2NHDDTTJXVO3FL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #312 was opened from jidanni:

```
# alsa-info --upload
Your ALSA information is located at
http://alsa-project.org/db/?f=a87cd8ba94ebd2f08fde83d50e41782402f117f6
Please inform the person helping you.
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/312
Repository URL: https://github.com/alsa-project/alsa-utils
