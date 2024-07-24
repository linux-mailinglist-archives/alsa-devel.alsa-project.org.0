Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984093B924
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 00:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CDC0E64;
	Thu, 25 Jul 2024 00:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CDC0E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721860177;
	bh=FOX3CF69PyQxiCr877/OkmnO+5fy6DMx7+bI5kwdjKU=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b8To2iMFo/yqwYcY4z8eXg395bErssJY82Wf/XylOqJBFflv5lcd9iiYIBwKdUMvs
	 rhoRl7hTvDCFJrgRuL5bhPBkX5wTZGlY/Adl9OfSV/tlU9Dp8HYni/cq8VrGrn3dO2
	 hIREvbxEa/nyhZOAtdPvEOqL8xq2KMgSlC/cHefs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A687F805B2; Thu, 25 Jul 2024 00:28:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3F3F80588;
	Thu, 25 Jul 2024 00:28:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A49F8026D; Thu, 25 Jul 2024 00:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch
 [185.70.40.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AF81F800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 00:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF81F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=Eivfab7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721859875; x=1722119075;
	bh=FOX3CF69PyQxiCr877/OkmnO+5fy6DMx7+bI5kwdjKU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Eivfab7hqgtkUXTNdb2EXVzsbeQvmvLqpGi+fq3NDaImsy9l8CnY1+stYNO/1x7l1
	 WUedn1jJ1OiWwcU+9Ldn//ULgGBmi439IwDnMxaixyBHJhDBDBa+s+0emS6sAfdh78
	 jzhlcaHiGS+j4POtjtnFIaR0vbSOAEltSt/uxEDpsp6ZWbCOzFLifoaLj5BEgXJ4Lg
	 3fRiH9YTgv53PnKPTMa5PBz0D5XQweBT5yi3iX5h2DjNvUq4RqKJVwR9kkqEx0Vp5s
	 Ypgq4p4gt+wlaSVkwfiYopsofbfu7Q1FnP8Gl02AGI4kb4wsRT5bxA6I30Ohl6ZuYU
	 0/uq/BSOadugw==
Date: Wed, 24 Jul 2024 22:24:29 +0000
To: alsa-devel@alsa-project.org, stable@vger.kernel.org
From: "edmund.raile" <edmund.raile@proton.me>
Cc: regressions@lists.linux.dev, o-takashi@sakamocchi.jp, tiwai@suse.de,
 gustavoars@kernel.org, clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: e4a59c6ab075e46504783ff58826a51143fc3be1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4GVQCWQAWSW4LAP4M67IJI2WJY4SITLW
X-Message-ID-Hash: 4GVQCWQAWSW4LAP4M67IJI2WJY4SITLW
X-MailFrom: edmund.raile@proton.me
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GVQCWQAWSW4LAP4M67IJI2WJY4SITLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bisection revealed that the bitcrushing distortion with RME FireFace 800
was caused by 1d717123bb1a7555
("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").

Reverting this commit yields restoration of clear audio output.
I will send in a patch reverting this commit for now, soonTM.

#regzbot introduced: 1d717123bb1a7555

