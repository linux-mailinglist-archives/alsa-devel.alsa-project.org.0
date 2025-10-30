Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2FC1ECED
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Oct 2025 08:40:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB9CF601CB;
	Thu, 30 Oct 2025 08:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB9CF601CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761809999;
	bh=LiJAbOmTjTjzl7xkCJCtpPipGZoQezmAb2fZiUEGdMg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AiKQbePFB22YACHsXrtwUA7iuS/Ur3RSGEXzUOCsI2CW9PMqN8JxyBh9QzVumYazb
	 cmSso2qUvkgeY14yH5v8AtjXc5bwgZeoDeJh+IhZ7BpXfcht7QlOAaD6Lhrju1xtog
	 qWZeAnQw0y6ItMRYRK4aDK+B0onnqFG/3W463Za8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F1CAF805B6; Thu, 30 Oct 2025 08:39:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6308DF805C9;
	Thu, 30 Oct 2025 08:39:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CAEFF80240; Thu, 30 Oct 2025 08:39:22 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 366FAF8003C
	for <alsa-devel@alsa-project.org>; Thu, 30 Oct 2025 08:39:22 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: aseqsend silently fails (ENODEV) with hardware port
From: braxtonangelic97@gmail.com
To: alsa-devel@alsa-project.org
Date: Thu, 30 Oct 2025 07:39:22 -0000
Message-ID: <176180996219.20.8348580675139345386@mailman-web.alsa-project.org>
In-Reply-To: <1844bddc59f45200-webhooks-bot@alsa-project.org>
References: <1844bddc59f45200-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 57UHBVF3CMDIEMAWTTGSZPQV2ESRHVDM
X-Message-ID-Hash: 57UHBVF3CMDIEMAWTTGSZPQV2ESRHVDM
X-MailFrom: braxtonangelic97@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57UHBVF3CMDIEMAWTTGSZPQV2ESRHVDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Older ALSA behavior or some virtual/software ports didn’t enforce this strict requirement — those ports accept events without a subscription. On modern kernels and with hardware endpoints, this handshake step became necessary for correct device activation.
https://driftbossgame.io
