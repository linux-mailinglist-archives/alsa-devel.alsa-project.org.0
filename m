Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C9A4B06A
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Mar 2025 09:15:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF89601DB;
	Sun,  2 Mar 2025 09:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF89601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740903325;
	bh=V2M1/Af+GARsj/45jDdlcDN37rLZNKHISa9G8YoKZ+4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rzl5mJl2T9z5y7YKWwmeCkgVyvXGKCJXp5LqmKrbUzFMGIBZy7syw/V6c36qHd/GU
	 YRt9k7XKbOp34G/vOQqqWT1ydfuGcB7LlguuFetDWb/YORbXku5dK594IUaChjfdku
	 Eaz2BZqBaJuiuhVDz5dDPdkPvodVZrgr0q0DlxHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CAA0F805B4; Sun,  2 Mar 2025 09:14:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4008F805BD;
	Sun,  2 Mar 2025 09:14:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05A0BF80301; Sun,  2 Mar 2025 09:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7679EF8014B
	for <alsa-devel@alsa-project.org>; Sun,  2 Mar 2025 09:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7679EF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740903260076287985-webhooks-bot@alsa-project.org>
References: <1740903260076287985-webhooks-bot@alsa-project.org>
Subject: Fine-grained control bar
Message-Id: <20250302081425.05A0BF80301@alsa1.perex.cz>
Date: Sun,  2 Mar 2025 09:14:25 +0100 (CET)
Message-ID-Hash: VPDMEDSAOAWEKLRVW7IBMKBUQC5XHLMX
X-Message-ID-Hash: VPDMEDSAOAWEKLRVW7IBMKBUQC5XHLMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPDMEDSAOAWEKLRVW7IBMKBUQC5XHLMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #295 was opened from egmontkob:

The control bars of `alsamixer` are quite coarse. They jump by whole character cells. Often a notable amount of increase or decrease (pressing the Up or Down arrow) isn't reflected visually.

I'd like to ask for an opion for more fine-grained looking control bars.

If the terminal's / locale's claimed charset, as reported by `nl_langinfo(CODESET)`, is "UTF-8" (as it should be pretty much everywhere nowadays), you could use the Unicode characters [U+2581 to U+2588](https://www.unicode.org/charts/PDF/U2580.pdf) for this purpose. They jump by eighths of a cell's hight.

Their foreground color would be the desired bar color (red/white/green) and their background would be the default (or black for `-B`). For consistency, this mode should probably replace the current checkerboard (ACS_CKBOARD) characters by the full block U+2588 and only set its foreground, but maybe this doesn't matter.

There are several terminal emulators out there (at least VTE-based ones such as GNOME Terminal and many others; Konsole; and presumably much more) that don't take these glyphs from the font but rather draw them manually to perfectly align them at cell boundaries. In these terminals the bar would look perfectly. In other terminals there might be some ugly gaps at cell boundaries (subject to the selected font), but some people might still prefer this tiny visual glitch over the current coarseness of the bar (again: this would be an option, not a forced new behavior).

Thanks for considering this feature request!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/295
Repository URL: https://github.com/alsa-project/alsa-utils
