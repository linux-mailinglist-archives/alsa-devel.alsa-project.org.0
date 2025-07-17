Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57032B0875E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 09:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D3E6019A;
	Thu, 17 Jul 2025 09:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D3E6019A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752739021;
	bh=GHP5iHTfr4QzVlKWqV8F3TWa0dSIjpMi9zPoEZx1sDk=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pJjKWv8oPqpDgl7FbLhDSwfhGSw7FusDh9VzorSCTfiCZZs1vKVtWGY2/+y3UC9k+
	 RPJp71zYfdnEY/fRhBAhHdrjeWDRalLudpM/GrskoeLFLLvs7F7gBSdNOY0IF//EFi
	 we0FWqF6j/X8ChyJOYn/oQNnym4HHGuk180ui8/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D83B1F805C1; Thu, 17 Jul 2025 09:56:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E6EF805C3;
	Thu, 17 Jul 2025 09:56:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD3B1F80236; Thu, 17 Jul 2025 09:56:39 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FEDF800B6
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 09:56:39 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [alsa-devel] Applied "ASoC: tlv320aic32x4: Model CODEC_CLKIN in
 CCF" to
 the asoc tree
From: 21basic@mechanicspedia.com
To: alsa-devel@alsa-project.org
Date: Thu, 17 Jul 2025 07:56:39 -0000
Message-ID: <175273899951.21.2439672690330855254@mailman-web.alsa-project.org>
In-Reply-To: 
 <175013023511.22.16458694387384303213@mailman-web.alsa-project.org>
References: 
 <175013023511.22.16458694387384303213@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 46ZNB4DARSQNSZOQBG44RP6SSW7CPGUH
X-Message-ID-Hash: 46ZNB4DARSQNSZOQBG44RP6SSW7CPGUH
X-MailFrom: 21basic@mechanicspedia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46ZNB4DARSQNSZOQBG44RP6SSW7CPGUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I wonder if anyone has implemented similar tweaks while playing Uno Online, needing minimal audio delay for perfect timing? Any insights on clock synchronization methods used here would be appreciated. https://unoonlinefree.com
