Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC79D4140
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 18:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1C41ED;
	Wed, 20 Nov 2024 18:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1C41ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732124250;
	bh=ZogOpOerkK9HNFg7RlZ0SPpeMmHeq6u7bR12z5X1S6s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LR92eKN9DwVMmaBcj4G7MtCQsbGOwEYZtxGMVhPAIX3QydDLazXyr5yGB0UheWYmZ
	 A+8jvl71NVMDAiuoHfQwYz5eN9qU/y44CgfZcWFnapW8ZD2/tmmTY6oZ3vQnED8Kaz
	 hhn5lZa8Z2UKXt/N+D3uhk8gFcDyYqfBbXHRVdzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1A9EF805BE; Wed, 20 Nov 2024 18:36:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEB3F805AF;
	Wed, 20 Nov 2024 18:36:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17BAAF8026D; Wed, 20 Nov 2024 18:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB0DF800BA
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 18:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB0DF800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732124207564141512-webhooks-bot@alsa-project.org>
References: <1732124207564141512-webhooks-bot@alsa-project.org>
Subject: Tiny sound on ASUS Zenbook UM5606 out of the box
Message-Id: <20241120173650.17BAAF8026D@alsa1.perex.cz>
Date: Wed, 20 Nov 2024 18:36:50 +0100 (CET)
Message-ID-Hash: 5QTGGO3LG4WIJFJ5B2RQCNMLJQHHBD6U
X-Message-ID-Hash: 5QTGGO3LG4WIJFJ5B2RQCNMLJQHHBD6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QTGGO3LG4WIJFJ5B2RQCNMLJQHHBD6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #467 was opened from IShashkin:

ASUS Zenbook UM5606 doesn't use subwoofers out of the box. So sound is tiny on the laptop. There is a workaround described here https://wiki.archlinux.org/title/ASUS_Zenbook_UM5606#Audio but it's broken in the last alsa release.

alsa-info.sh --no-upload
[alsa-info.txt.zip](https://github.com/user-attachments/files/17834654/alsa-info.txt.zip)

Let me know if you need more info.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/467
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
