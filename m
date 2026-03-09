Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LoYOZ+HrmnKFgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 09:41:03 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76B235964
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 09:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C2060253;
	Mon,  9 Mar 2026 09:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C2060253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773045662;
	bh=0bd4k97VFgTK8uYp9F+D5B/Q9aR8UnsUhyoNiDCLt7k=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ePsGm4J/JE/8a5bMXNlV96y648EQLfhPxKaATCXKdhPdPuTIrpRwVzMZu/fSb9Fje
	 Y60EozKzgUV5NdCLuly9+xAEtmcZMCkU0QFPcUwvMcOBg6/Sb5LxjD5OacLrx+dCdy
	 gN+2sNsHNxb3El+MJoFz71p91UHKWmRF+nojyVtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83A0F805EB; Mon,  9 Mar 2026 09:40:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DFBF805EC;
	Mon,  9 Mar 2026 09:40:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 531F6F8001E; Mon,  9 Mar 2026 09:40:20 +0100 (CET)
Received: from mailman (unknown [10.254.200.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DFD7F8001E
	for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2026 09:40:20 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [alsa-devel] MOTU Midi Express XT
From: dcj64832@laoia.com
To: alsa-devel@alsa-project.org
Date: Mon, 09 Mar 2026 08:40:20 -0000
Message-ID: <177304562008.20.15846015012980139598@mailman>
In-Reply-To: 
 <176733414601.20.12467795621587134001@mailman-web.alsa-project.org>
References: 
 <176733414601.20.12467795621587134001@mailman-web.alsa-project.org>
User-Agent: HyperKitty on http://mailman.alsa-project.org/
Message-ID-Hash: 4WZQOM45SNSAQQPUAB44ED7JJLXJ2A6R
X-Message-ID-Hash: 4WZQOM45SNSAQQPUAB44ED7JJLXJ2A6R
X-MailFrom: dcj64832@laoia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WZQOM45SNSAQQPUAB44ED7JJLXJ2A6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 6B76B235964
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	DMARC_NA(0.00)[laoia.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo];
	FROM_NEQ_ENVFROM(0.00)[dcj64832@laoia.com,alsa-devel-bounces@alsa-project.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Action: no action

This thread on the MOTU Midi Express XT is such a treasure trove of insights! I appreciate how you delved into specific driver challenges; it’s vital for enhancing MIDI workflows. Any thoughts on implementing better error handling? 
https://drivemad3.io
