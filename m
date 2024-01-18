Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C393831ABD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 14:43:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5142574C;
	Thu, 18 Jan 2024 14:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5142574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705585389;
	bh=q+L25Q7SnYGPXrQnURw8B/MAx6w0qYN86afAktdUzu4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WT0aJTrkYuYbqkx8QQmwY0nysifKsmozNm0v+1w1TYIH1sngYhCUMFOhm3EUxa4r+
	 aM//m1UmTGQCR3uGsUs+n/LIgaZHY+mcaAjvWaH6gZHUT7Fng/pk0trIAVdY9/9sdH
	 ujgtgI4qhVHs7PuipC19dJfsVwTZBJURgGqKrVXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79315F802E8; Thu, 18 Jan 2024 14:42:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC87F80578;
	Thu, 18 Jan 2024 14:42:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A0EEF801F5; Thu, 18 Jan 2024 14:42:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A600FF80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 14:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A600FF80074
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705585336248280764-webhooks-bot@alsa-project.org>
References: <1705585336248280764-webhooks-bot@alsa-project.org>
Subject: Clarify snd_pcm_hw_params_set_drain_silence documentation
Message-Id: <20240118134223.3A0EEF801F5@alsa1.perex.cz>
Date: Thu, 18 Jan 2024 14:42:23 +0100 (CET)
Message-ID-Hash: RJGZIQDNHMGEX5HSDLGMAWWNVYVSO5PT
X-Message-ID-Hash: RJGZIQDNHMGEX5HSDLGMAWWNVYVSO5PT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJGZIQDNHMGEX5HSDLGMAWWNVYVSO5PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #378 was opened from z-s-e:

The API documentation states that drain silence is enabled by default. But since this is a hardware parameter, is it possible that some hardware does not support this? Or is this always available (and will cause alsa-lib internal software workarounds for hardware that doesn't have perfect drain)?

Also, the documentation mentions the sw_params silencing mechanism as usable for a manual emulation of this, but the documentation of the sw_params silence_size/silence_threshold imply they only affect the silencing behavior in case of underrun, not in case of draining.

I can create a patch for the documentation if you'd like, as soon as I get the needed info.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/378
Repository URL: https://github.com/alsa-project/alsa-lib
