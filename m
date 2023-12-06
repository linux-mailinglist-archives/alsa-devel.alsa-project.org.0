Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D154806AF0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 10:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65413950;
	Wed,  6 Dec 2023 10:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65413950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701855850;
	bh=QwbdI+d1fSBoR7LNQF5X6YbqsBSiNv4gmh/zLfcouo0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Kr53ksZE/t99fQCBR8QqoQt7whdxIxe5DAOm88uFn17iQm1miRd3pspbDTPQq+rpV
	 MXvRt9MVm6jwcUQenFJmMgx/wGXk/dkYmTv9BTi57qTKFhNsKR0Q9U/LkUJ+Nb2AS7
	 UsPduUhhLTT8qSj00EHHtY/SO97pA6siO5SRBJ+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D41F80494; Wed,  6 Dec 2023 10:43:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DBF2F80570;
	Wed,  6 Dec 2023 10:43:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F36F8024E; Wed,  6 Dec 2023 10:37:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E6DF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 10:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15E6DF800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701855435160843372-webhooks-bot@alsa-project.org>
References: <1701855435160843372-webhooks-bot@alsa-project.org>
Subject: pcm: Add MSBITS subformat options
Message-Id: <20231206093752.B2F36F8024E@alsa1.perex.cz>
Date: Wed,  6 Dec 2023 10:37:52 +0100 (CET)
Message-ID-Hash: TMJ6ZKVPXLQWO3IBOANTPFGKC645QW5T
X-Message-ID-Hash: TMJ6ZKVPXLQWO3IBOANTPFGKC645QW5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMJ6ZKVPXLQWO3IBOANTPFGKC645QW5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #342 was edited from crojewsk-intel:

Improve granularity of format selection for S32/U32 formats by adding masks representing 20, 24 and 32 most significant bits. As a preparation step introduce `snd_pcm_subformat_value()` for easy name-to-subformat conversions.

While at it, fix few warnings that pop up in subformat-related code during compilation.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/342
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/342.patch
Repository URL: https://github.com/alsa-project/alsa-lib
