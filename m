Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FEC8D51B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Nov 2025 09:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2A060203;
	Thu, 27 Nov 2025 09:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2A060203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764231779;
	bh=9JOWcvlihhEdCrjuVQbYWu2J8LYCRFv+WkzX2nxuuHg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZrglZ9yZLPjnb6c9z21EOICfeB3GO3dh6BBzRNQhkJxdTRwFGf4VnefTXRzBC7AZM
	 KKXgeAmAusOIFjyPBRbzrW50KaaGgbXawhquuCrBaPJ+qydXVqgq8Bdxg9nJ/MKe34
	 uPgb0C3Jv+RV4FFwBaY368IVSMVTtmV/vhzZ6ujY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4440FF805C9; Thu, 27 Nov 2025 09:22:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C599F805C9;
	Thu, 27 Nov 2025 09:22:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5418AF80551; Thu, 27 Nov 2025 09:22:14 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 4706EF80087
	for <alsa-devel@alsa-project.org>; Thu, 27 Nov 2025 09:22:14 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate:
 IRQ_RESOURCE_AUTO
 should be compatible with IRQ_RESOURCE_NONE
From: 5bea@comfythings.com
To: alsa-devel@alsa-project.org
Date: Thu, 27 Nov 2025 08:22:14 -0000
Message-ID: <176423173428.20.6437925942711566408@mailman-web.alsa-project.org>
In-Reply-To: <aSV190mwCKZ6WOoA@smile.fi.intel.com>
References: <aSV190mwCKZ6WOoA@smile.fi.intel.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 3NPQV7IP7B2Y3RUJINUXC52KHKFACF2J
X-Message-ID-Hash: 3NPQV7IP7B2Y3RUJINUXC52KHKFACF2J
X-MailFrom: 5bea@comfythings.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NPQV7IP7B2Y3RUJINUXC52KHKFACF2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Good change making IRQ_RESOURCE_AUTO compatible with IRQ_RESOURCE_NONE. This clarifies the behavior when no IRQ is needed, preventing potential errors. Has anyone considered the power management implications in the no-IRQ scenario? It's like strategically placing blocks in Block Blast to maximize efficiency! https://blockblastfree.com
