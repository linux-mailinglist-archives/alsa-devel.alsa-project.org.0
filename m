Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8179DCF3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 02:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D71B7886;
	Wed, 13 Sep 2023 02:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D71B7886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694563580;
	bh=si24ZIRtMVvv1gdJhOjaDg745kHnKoAg3pfgRwnZo2Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VymJQffGPxt+UD8cvalz7kv4OXR3V228soe9NSl8+46fTefDPffIB0euvDF6U3Nr8
	 YXfXyFt7++2FZfkUiTLBi2p6UmZWHmhtI9TAU51F+3lL+yDcpm3wLClyInouWuifVw
	 JgvnzQDiCeJfnlSfvMw59vzSWVx26t3ph7rH1IUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16B52F80551; Wed, 13 Sep 2023 02:05:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B2FCF80246;
	Wed, 13 Sep 2023 02:05:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A86F80425; Wed, 13 Sep 2023 02:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BC28AF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 02:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC28AF801F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694563517493747950-webhooks-bot@alsa-project.org>
References: <1694563517493747950-webhooks-bot@alsa-project.org>
Subject: time to remove COPYING.GPL from alsa-plugins?
Message-Id: <20230913000524.29A86F80425@alsa1.perex.cz>
Date: Wed, 13 Sep 2023 02:05:24 +0200 (CEST)
Message-ID-Hash: 6FEP2WRVY22OUO25AZ7CKB6DDCJI5PW6
X-Message-ID-Hash: 6FEP2WRVY22OUO25AZ7CKB6DDCJI5PW6
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FEP2WRVY22OUO25AZ7CKB6DDCJI5PW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #54 was opened from michael-mw-wang:

It seems the only thing in alsa-plugins that could have a GPL license is rate/rate_samplerate.c, which has this at the top of the file:

 * This plugin code is supposed to be used and distributed primarily
 * under GPL v2 or later, in order to follow the license of libsamplerate.
 * However, if you already own a commercial license to use libsamplerate
 * for dynamic linking, this plugin code can be used and distributed also
 * under LGPL v2.1 or later.

In 2016, libsamplerate dropped its commercial license requirement and was released with the 2-Clause BSD license.   (See http://libsndfile.github.io/libsamplerate//license.html)

So I was wondering if the license for rate_samplerate.c can be updated to remove the GPLv2, which means the COPYING.GPL file can also be removed from the alsa-plugins package?

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/54
Repository URL: https://github.com/alsa-project/alsa-plugins
