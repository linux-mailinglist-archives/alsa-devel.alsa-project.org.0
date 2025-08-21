Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BAB302E6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 21:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B908F60258;
	Thu, 21 Aug 2025 21:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B908F60258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755804713;
	bh=hNdwWNVTwfY0CgMTjIeyx+twJ2xXZQ2HTKPyqcUJOOQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=moW3U6BCAY8wWDG8G+EnAeBaNtKpssmOIw+g/CiBQLP3S+elZ44CV1waBsXeqzgUZ
	 Oo0vpbd72o5noe2y6WqhiWWR+9rxCy8F08u3KbLSVFxmIFxk04qkFPpFndy/W8BVAo
	 q0lmUBLIqGe0XaLSE5Qn6fcdn0rkBYmf5nx48Vbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF961F805C6; Thu, 21 Aug 2025 21:31:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DFEF805D4;
	Thu, 21 Aug 2025 21:31:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49486F8052D; Thu, 21 Aug 2025 21:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F64F80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 21:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F64F80254
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185ddf0efa85c800-webhooks-bot@alsa-project.org>
In-Reply-To: <185ddf0efa53ce00-webhooks-bot@alsa-project.org>
References: <185ddf0efa53ce00-webhooks-bot@alsa-project.org>
Subject: Mute LED not working.
Date: Thu, 21 Aug 2025 21:31:27 +0200 (CEST)
Message-ID-Hash: 6SVBD6JQGGUXAORCJKHJX3C27MFMXKH2
X-Message-ID-Hash: 6SVBD6JQGGUXAORCJKHJX3C27MFMXKH2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SVBD6JQGGUXAORCJKHJX3C27MFMXKH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #473 was opened from Gropinou:

https://alsa-project.org/db/?f=a68feee728b669f547491855254add15fddad73e

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/473
Repository URL: https://github.com/alsa-project/alsa-lib
