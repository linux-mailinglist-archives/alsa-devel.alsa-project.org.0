Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84AB58B4A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Sep 2025 03:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97805601CB;
	Tue, 16 Sep 2025 03:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97805601CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757986680;
	bh=xQzG4npVYQ6E2obYbboh3Ak2w8ys/PDuqcy2RmfF/Po=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aG8eQDo7LV5OZzuWIdX73oe04njM6emzTMdydTDMwIAyXBWG5pdYDNjTFX1LGosYT
	 TJSvxFI9WZKclySxW3+Fr+NsVAxt1nBu3lMF4zoqP3wV6ifUSYrLCTovkI9gFL0zUY
	 nmjT61MBQ6wBjoZ8Y5B+bDN/QBicMUolP1Nagl1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E32BF805D2; Tue, 16 Sep 2025 03:37:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF6EF805BF;
	Tue, 16 Sep 2025 03:37:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC1AFF804FC; Tue, 16 Sep 2025 03:36:49 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E4E9F80075
	for <alsa-devel@alsa-project.org>; Tue, 16 Sep 2025 03:36:49 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [alsa-devel] Applied "ASoC: tlv320aic32x4: Model CODEC_CLKIN in
 CCF" to
 the asoc tree
From: great.marten.znnf@rapidletter.net
To: alsa-devel@alsa-project.org
Date: Tue, 16 Sep 2025 01:36:49 -0000
Message-ID: <175798660963.22.9375444662127178296@mailman-web.alsa-project.org>
In-Reply-To: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
References: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: CAZEZW364QQMZ7POLM76USLI7IEPAL7K
X-Message-ID-Hash: CAZEZW364QQMZ7POLM76USLI7IEPAL7K
X-MailFrom: great.marten.znnf@rapidletter.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAZEZW364QQMZ7POLM76USLI7IEPAL7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Good advice, Mark! Keeping patches incremental and engaging with testers is key for smooth integration. It's a bit like playing Wordle Unlimited – small steps, iterative improvement until you solve the problem! Don't forget relevant CCs for visibility. This workflow helps avoid unnecessary reverts. Thanks for the clear guidance. https://wordleunlimitedplay.com/
