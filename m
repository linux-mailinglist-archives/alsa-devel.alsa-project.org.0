Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BJ6JHT/qGm/0AAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 04:58:44 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D120AB02
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 04:58:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D9C6029E;
	Thu,  5 Mar 2026 04:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D9C6029E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772683123;
	bh=elMKCtlfR0TFjhbeEYrjV40bI4ekOfT7Lk9YBm/UXBc=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aG6FoZLkc/y8JjKDeX6RM6Y9MYLgcJmioPoX5Dt2NlQ+gSgumKQXclNsMoWrHGvq5
	 znRcgWbcMaWbw4nIYCgbMrA5S+9F/JxKFNfr1wmm1PKcSEdQEtx2sie8lElJEWGZRU
	 AGVVLEKvduWKA70IgN4sR/uuqucIVoSyMwAKUPww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F13F805E5; Thu,  5 Mar 2026 04:58:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE70F805F3;
	Thu,  5 Mar 2026 04:58:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C24F8025A; Thu,  5 Mar 2026 04:57:55 +0100 (CET)
Received: from mailman (unknown [10.254.200.3])
	by alsa1.perex.cz (Postfix) with ESMTP id AB99EF8014E
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 04:57:55 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: USB-Audio: Motu: M6-HiFi.conf - m6 has only 4 outputs, not 6
From: aggregatebabyish@gmail.com
To: alsa-devel@alsa-project.org
Date: Thu, 05 Mar 2026 03:57:55 -0000
Message-ID: <177268307569.415.4189341981325329768@mailman>
In-Reply-To: <189170a7dcbeae00-webhooks-bot@alsa-project.org>
References: <189170a7dcbeae00-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on http://mailman.alsa-project.org/
Message-ID-Hash: 5IPOK7JUFM4GFMJ6UMVGAAXCIP3KWYAR
X-Message-ID-Hash: 5IPOK7JUFM4GFMJ6UMVGAAXCIP3KWYAR
X-MailFrom: aggregatebabyish@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IPOK7JUFM4GFMJ6UMVGAAXCIP3KWYAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 323D120AB02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aggregatebabyish@gmail.com,alsa-devel-bounces@alsa-project.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fnaf-online.io:url,alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

I made use of the new toolset and put it to use in order to locate favorable SP indicators for my game; you can check it out here. https://fnaf-online.io
