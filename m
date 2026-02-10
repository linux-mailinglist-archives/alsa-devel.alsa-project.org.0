Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOSzGk2Iimk1LgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 02:22:21 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59C115F5F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 02:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3F66021D;
	Tue, 10 Feb 2026 02:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3F66021D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770686536;
	bh=CR8OAmmJ19gTgoyThFwDF415JPCJZzyTOySqrh92kL0=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qFe3vUNJ2SPmTAfBR9gJPxDb7vahSX9a/H2gnlQ5qhzP1/uY7C3UzVe7HOd9o/iS5
	 P2F8//h8il9ZfzX9YBrThZ1Bazi76pejceGlThnBp4o49a9XVMpKuxahNL4NqKcuXA
	 rzklyG7wXXsZzArs8KsPUr3kZzzJMCYYqyx0VHhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C3FEF80605; Tue, 10 Feb 2026 02:21:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73ABDF80605;
	Tue, 10 Feb 2026 02:21:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C77F805F8; Tue, 10 Feb 2026 02:21:36 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id CF728F805F6
	for <alsa-devel@alsa-project.org>; Tue, 10 Feb 2026 02:21:35 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: ucm2: sof-soundwire: fix a case MultiCodec1 string is in
 HeadsetCodec1
 string
From: haultalented@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 10 Feb 2026 01:21:35 -0000
Message-ID: 
 <177068649584.20.11653641541966137939@mailman-web.alsa-project.org>
In-Reply-To: <187df4091567b900-webhooks-bot@alsa-project.org>
References: <187df4091567b900-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: PWS7KKQM5UJ5HISIVKQTOPTMYNUVQEPJ
X-Message-ID-Hash: PWS7KKQM5UJ5HISIVKQTOPTMYNUVQEPJ
X-MailFrom: haultalented@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EL4XWYLGFSQ25G7WJ3J35VZYY4T2FHNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	ARC_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haultalented@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns,alsa-project.org:dkim];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Queue-Id: 1F59C115F5F
X-Rspamd-Action: no action

I find the discussion about the MultiCodec1 and HeadsetCodec1 string interrelation quite compelling. Having recently worked on a project involving soundwire protocol implementations, I encountered similar issues with codec mappings that led to audio discrepancies. It's fascinating how these nuanced adjustments can significantly enhance audio fidelity in complex environments. Thank you for addressing this critical aspect; it’s insights like these that foster better collaboration within our development communities!
