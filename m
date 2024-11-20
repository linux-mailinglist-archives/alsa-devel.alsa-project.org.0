Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6B9D340E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 08:18:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1AC1931;
	Wed, 20 Nov 2024 08:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1AC1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732087105;
	bh=Ip9HWqOqJPrZbKjhlpOveLkV76XcO3Nn9u6dXUktw/g=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pUdRRJlGOAL5sTJBXt0Cx3P/e9tEQzODSiRVoY9ukYPJ15tJ+IV9fPFu02aZ1I8Ul
	 zle/6m7vvp3tDdICGNEVqrCfOjcANdQbB0bFTuTwqZzRbSKTEyY6WOH3FR1dFI2n7L
	 aP10FxDSt8CcfaJa2E9GDHgf95voNZ5jV8iz0n7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46CFEF805BB; Wed, 20 Nov 2024 08:17:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98074F805B1;
	Wed, 20 Nov 2024 08:17:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64E5BF8026D; Wed, 20 Nov 2024 08:17:47 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A9DF800BA
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 08:17:47 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [alsa-devel] Error patching file pcm_native.c
From: u413038@gmail.com
To: alsa-devel@alsa-project.org
Date: Wed, 20 Nov 2024 07:17:47 -0000
Message-ID: 
 <173208706731.11645.4566623017752806090@mailman-web.alsa-project.org>
In-Reply-To: <COL119-W9CBB298E3CE80E5F14C2D8FDC0@phx.gbl>
References: <COL119-W9CBB298E3CE80E5F14C2D8FDC0@phx.gbl>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: XY5ZD6VXFIBMVIU6QOBOTEYDVMFZUQBU
X-Message-ID-Hash: XY5ZD6VXFIBMVIU6QOBOTEYDVMFZUQBU
X-MailFrom: u413038@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SBW622E4FCH4BAYQ42VUEMOXE7HIELI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The issue seems related to mismatched offsets in the patching process, likely due to differences between your snapshot and the intended source files. Try ensuring your alsa-kernel source matches the version expected by the snapshot. Alternatively, check for recent updates or fixes in the ALSA mailing lists. If the issue persists, you may need to manually adjust the failed hunks in pcm_native.c.rej. http://therutificador.cl/
