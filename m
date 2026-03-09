Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F8NLMePrmnVGAIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:15:51 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E5235FC7
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:15:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C8160253;
	Mon,  9 Mar 2026 10:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C8160253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773047750;
	bh=nqJg3EhBm0ey/EiG0es8hkwJBMX4kxMDHPd1RGiEUmI=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CwM5eHDA8IUXjoV6MNRJnbVBor3o4F+9dsWKxiwJDfxRPy1FrEFhwAp46+ngQLDqK
	 VhVy2skXZKCjsyGVvjAVCcOVgh/T55oGk7zYBHStKbToG1PPEmoYBqZNoP5MOq14Yu
	 43v0d0kyBCkhbGJ6dSMR9GkwTKRzvnA2HgqsllCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9900F805F7; Mon,  9 Mar 2026 10:15:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5182CF805E7;
	Mon,  9 Mar 2026 10:15:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3261F80571; Mon,  9 Mar 2026 10:15:07 +0100 (CET)
Received: from mailman (unknown [10.254.200.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBF2F8001E
	for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2026 10:15:07 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rockchip-i2s-tdm
From: zib43236@laoia.com
To: alsa-devel@alsa-project.org
Date: Mon, 09 Mar 2026 09:15:07 -0000
Message-ID: <177304770752.21.12739413982324586422@mailman>
In-Reply-To: <87342wratj.wl-tiwai@suse.de>
References: <87342wratj.wl-tiwai@suse.de>
User-Agent: HyperKitty on http://mailman.alsa-project.org/
Message-ID-Hash: CTVP5BEVVGQTRYTE3X43ZISGJSV62BAY
X-Message-ID-Hash: CTVP5BEVVGQTRYTE3X43ZISGJSV62BAY
X-MailFrom: zib43236@laoia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTVP5BEVVGQTRYTE3X43ZISGJSV62BAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 5B9E5235FC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zib43236@laoia.com,alsa-devel-bounces@alsa-project.org];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,slope-play.com:url];
	DMARC_NA(0.00)[laoia.com];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Action: no action

Thank you for the detailed insights on the ASoC fixes! It’s refreshing to see how these updates enhance functionality. I wonder if exploring a more collaborative approach with community feedback could yield even broader improvements in future iterations.
https://slope-play.com
