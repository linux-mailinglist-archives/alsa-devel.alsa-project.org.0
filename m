Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4AABA93A
	for <lists+alsa-devel@lfdr.de>; Sat, 17 May 2025 11:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6161F601B7;
	Sat, 17 May 2025 11:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6161F601B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747475646;
	bh=l07Rdut/5Q1ajNjTbDDJqZU0MtC0gl+fTRyC7i4vU9M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U5rFwysW9z1QMQZXL560md9qs4YhftnW0xftu8+nYBYqOx5EihksdaAl+GWcTCdb9
	 /BW0IXYg19j3SeXT8ykWwFhM5Irrhr84csx6yQHqBuqlSODbByXzsZsVC5UqaobA1Y
	 kyQET7JxXb6M6Oi+4Qo2awJJFjQdV28fo7B1cd4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED61FF80549; Sat, 17 May 2025 11:53:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A02DDF804FC;
	Sat, 17 May 2025 11:53:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA70F8027B; Sat, 17 May 2025 11:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 52BF9F80016
	for <alsa-devel@alsa-project.org>; Sat, 17 May 2025 11:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BF9F80016
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184047ce0ad2f400-webhooks-bot@alsa-project.org>
In-Reply-To: <184047ce0acdbd00-webhooks-bot@alsa-project.org>
References: <184047ce0acdbd00-webhooks-bot@alsa-project.org>
Subject: New include guard in seq_event.h breaks DSSI header
Date: Sat, 17 May 2025 11:53:28 +0200 (CEST)
Message-ID-Hash: UXWZF3BHTIVQXZ2UZBJ3XJUZZX3UZXHC
X-Message-ID-Hash: UXWZF3BHTIVQXZ2UZBJ3XJUZZX3UZXHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXWZF3BHTIVQXZ2UZBJ3XJUZZX3UZXHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #455 was opened from cannam:

Hello! I am one of the original authors of [DSSI](https://dssi.sourceforge.net/), a soft-synth API that was created about 20 years ago. It's not an active project, it was basically "done" by about 2011 but is still used in a number of applications.

The DSSI header `dssi.h` includes `<alsa/seq_event.h>` in order to pick up a structure for MIDI-like events.

I see that following a report of breakage in #431, a guard was added to seq_event.h in ea8972c to warn against including that header directly.

The official fix seems to be to include the whole of `<alsa/asoundlib.h>`, and that is what packagers appear to be patching the DSSI header with currently (and I see it is also what the guard does itself after emitting the warning). Unfortunately from the perspective of DSSI as an API, that isn't really a fix at all because all we need is an event structure - there is no other dependency on ALSA as a library and there was never any intention to require linking with ALSA.

Probably the historical error was to use an ALSA header at all, and the best option for us might be to duplicate enough of the contents of `seq_event.h` locally to sever the dependency that way.

But I thought I should first check whether you can suggest a better approach, for example whether you might be open to making it possible (again) to make use of `seq_event.h` specifically without pulling in a dependency on everything else in ALSA.

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/455
Repository URL: https://github.com/alsa-project/alsa-lib
