Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLDmGkNOhGkE2gMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 09:01:07 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A4EFAC2
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 09:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B248F601BA;
	Thu,  5 Feb 2026 09:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B248F601BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770278463;
	bh=vmVc24mljoC8IP/Z3mdlraNevNIMdIyUkMRnLUQgkhw=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p3uvgQTfTK4Hyzq41OBNdpIhifr6QUpJYO13uecT6D5S1K65RTiM+mBLMASGEsEah
	 Bke2kNanL4e1EcwyfThEL0YKWlioPAfYa32wzsAvqLKRtdKZ16HZdp/y3WYUPYkiGu
	 VJoAx1iBJEStuazRmOqh1gAKS8bm7yVKFaCMH8DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6989AF805EC; Thu,  5 Feb 2026 09:00:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C4EAF805ED;
	Thu,  5 Feb 2026 09:00:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50FF4F804FB; Thu,  5 Feb 2026 09:00:25 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D4DF8010B
	for <alsa-devel@alsa-project.org>; Thu,  5 Feb 2026 09:00:25 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] MAINTAINERS: update Tzung-Bi's email address
From: dikalopisoman@gmail.com
To: alsa-devel@alsa-project.org
Date: Thu, 05 Feb 2026 08:00:25 -0000
Message-ID: 
 <177027842523.22.14150047072568357308@mailman-web.alsa-project.org>
In-Reply-To: 
 <177027836714.22.11582388238947937193@mailman-web.alsa-project.org>
References: 
 <177027836714.22.11582388238947937193@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: HBQ2HB2RSULLKHZ25B7HWQIGQJBEMBWX
X-Message-ID-Hash: HBQ2HB2RSULLKHZ25B7HWQIGQJBEMBWX
X-MailFrom: dikalopisoman@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SLITV7RURV6HDF62OUEBEIN76RGS3FI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikalopisoman@gmail.com,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,mailman-web.alsa-project.org:mid,geometry-lite.com:url]
X-Rspamd-Queue-Id: 234A4EFAC2
X-Rspamd-Action: no action

It could also be here.: https://geometry-lite.com
