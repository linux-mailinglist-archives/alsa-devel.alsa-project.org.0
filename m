Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6666B48253
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Sep 2025 04:01:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46889601F7;
	Mon,  8 Sep 2025 04:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46889601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757296876;
	bh=dHtCNQggg/KHKzmzNHz0lDdYkQVmjDjJqtb+gJIffiI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GZqRMiDehNgg/Zb0ACrrtjgr+xWo6gWZiPJIpIwujoAVsMyBf1emvO4obZVzBqlTH
	 Mu31G66OMEHjet/5mKEn51/ND7ARbzhSJcKBYhvEsH6uv34LQkqLb0PU6f/EWTtud6
	 LtO4nJIzkwRxVx4I+5NAYR/yiRZKpHTMlXFtpC7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 457B7F805C1; Mon,  8 Sep 2025 04:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79121F805C2;
	Mon,  8 Sep 2025 04:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FB31F80185; Mon,  8 Sep 2025 04:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B747F8016E
	for <alsa-devel@alsa-project.org>; Mon,  8 Sep 2025 04:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B747F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18632c26b8b2b200-webhooks-bot@alsa-project.org>
In-Reply-To: <18632c26b7126d00-webhooks-bot@alsa-project.org>
References: <18632c26b7126d00-webhooks-bot@alsa-project.org>
Subject: Feature Request: conf.d for USB-Audio
Date: Mon,  8 Sep 2025 04:00:29 +0200 (CEST)
Message-ID-Hash: JXTT6NDVOLEYNWHL77DDQORJLURXBZ3R
X-Message-ID-Hash: JXTT6NDVOLEYNWHL77DDQORJLURXBZ3R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXTT6NDVOLEYNWHL77DDQORJLURXBZ3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #609 was opened from FrostyCoolSlug:

The release cadence of `alsa-ucm-conf` tends to be a little on the slow side (generally around 6 months between releases), but the problem I'm hitting currently is the requirement for users to manually edit `USB-Audio.conf` in order to get support for their devices (and depending on distribution, support could be delayed upwards of two years).

I think a method where a package could be created to drop files into a conf.d style directory would allow for a users device to be configured, without the need for manually editing `USB-Audio.conf` to add support.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/609
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
