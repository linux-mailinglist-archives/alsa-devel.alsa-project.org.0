Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAGAE2ZVpWnR9AUAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 02 Mar 2026 10:16:22 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32391D563B
	for <lists+alsa-devel@lfdr.de>; Mon, 02 Mar 2026 10:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2C0F60223;
	Mon,  2 Mar 2026 10:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2C0F60223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772442980;
	bh=VwOwtW8b8ijBRnurro2JPxYF87UNXTHGwkjourSjW3M=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HrSQwguhE78H393/veVyWsb2JlR66KZiN5mfQIUnpMnY2baXk2jDGHMDtZfG8wew2
	 EoW48sHbiO6iqrh65EjQCMJHkAM2mNSriHlcCTGphn/fMcyzpjYTWyzt7hrYuXUNWa
	 BAVwClVJyLYMXcUZ0bYW4ln+D3MBYjRvrWBUL4gA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24784F805EE; Mon,  2 Mar 2026 10:15:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F136F805E4;
	Mon,  2 Mar 2026 10:15:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CD64F800E2; Mon,  2 Mar 2026 10:15:18 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 057BBF800E2
	for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2026 10:15:17 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: MOTU M6 reports [ALSA UCM error] but seems to be working fine.
From: attractivecolt0219@gmail.com
To: alsa-devel@alsa-project.org
Date: Mon, 02 Mar 2026 09:15:17 -0000
Message-ID: 
 <177244291792.20.12038152548132527690@mailman-web.alsa-project.org>
In-Reply-To: <18916fc357b46f00-webhooks-bot@alsa-project.org>
References: <18916fc357b46f00-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: VGNYCHZ7UWPLS6KWNKSIBDFV3TBY7GVG
X-Message-ID-Hash: VGNYCHZ7UWPLS6KWNKSIBDFV3TBY7GVG
X-MailFrom: attractivecolt0219@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63ZMHNOJUI4OIKGFOBPAWAOQCIMB5M7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim];
	FROM_NEQ_ENVFROM(0.00)[attractivecolt0219@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Queue-Id: B32391D563B
X-Rspamd-Action: no action

The Art of Oversteer frames drifting as creative expression. Each slide resembles brushstrokes across asphalt, shaped by timing and technique. Players approach tracks with an artistic mindset. https://drifthunters2.io
