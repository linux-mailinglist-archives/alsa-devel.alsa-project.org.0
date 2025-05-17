Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE9ABAA66
	for <lists+alsa-devel@lfdr.de>; Sat, 17 May 2025 15:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD56860192;
	Sat, 17 May 2025 15:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD56860192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747488608;
	bh=NvTjTHElCOYLryzgHtXlBheJ3iNYqFbKKYnNlSzHEZA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uzpHLPNWNsAtE8FuYzjxtfbxpEmjsvaEIVW+pdiJb4Xk2kEX8rsLZYHc37oo5jOdS
	 jdpAif4g+5L3o3PkxQZW7oKON9ENMl8VC7p//3jIAfAbmNOcmQd4lvX/qrW2qM+v56
	 7pfdh1YCWxzKf0/+ug78+Az8A+NWMa+GIG8nkQJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE46F80527; Sat, 17 May 2025 15:29:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 641F3F80272;
	Sat, 17 May 2025 15:29:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1DB4F8027B; Sat, 17 May 2025 15:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A65F80134
	for <alsa-devel@alsa-project.org>; Sat, 17 May 2025 15:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A65F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18405398c358ce00-webhooks-bot@alsa-project.org>
In-Reply-To: <18405398c351bd00-webhooks-bot@alsa-project.org>
References: <18405398c351bd00-webhooks-bot@alsa-project.org>
Subject: New include guard in seq_event.h breaks DSSI header
Date: Sat, 17 May 2025 15:29:33 +0200 (CEST)
Message-ID-Hash: Y62XUULPBM7ZW4ZHMLPKXNXMSSZ2EWOI
X-Message-ID-Hash: Y62XUULPBM7ZW4ZHMLPKXNXMSSZ2EWOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y62XUULPBM7ZW4ZHMLPKXNXMSSZ2EWOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #455 was edited from cannam:

Hello! I am one of the original authors of [DSSI](https://dssi.sourceforge.net/), a soft-synth API that was created about 20 years ago. It's not an active project, it was basically "done" by about 2011 but is still used in a number of applications.

The DSSI header `dssi.h` includes `<alsa/seq_event.h>` in order to pick up a structure for MIDI-like events.

I see that following a report of breakage in #431, a guard was added to seq_event.h in ea8972c to warn against including that header directly. This of course breaks for packagers using `-Werror` builds and the like.

The official fix seems to be to include the whole of `<alsa/asoundlib.h>`, and that is what packagers appear to be patching the DSSI header with currently (and I see it is also what the guard does itself after emitting the warning). Unfortunately from the perspective of DSSI as an API, that isn't really a fix at all because all we need is an event structure - there is no other dependency on ALSA as a library and there was never any intention to require linking with ALSA.

Probably the historical error was to use an ALSA header at all, and the best option for us might be to duplicate enough of the contents of `seq_event.h` locally to sever the dependency that way. But that would be a significant intervention at this point - I think it would be the first substantive change to `dssi.h` since 2004 so I am wary of the risks in terms of breaking other things.

I thought I should first check whether you can suggest a better approach, for example whether you might be open to making it possible (again) to make use of `seq_event.h` specifically without pulling in a dependency on everything else in ALSA.

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/455
Repository URL: https://github.com/alsa-project/alsa-lib
