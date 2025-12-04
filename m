Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4283CA23E2
	for <lists+alsa-devel@lfdr.de>; Thu, 04 Dec 2025 04:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448D460192;
	Thu,  4 Dec 2025 04:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448D460192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764818211;
	bh=tHZ1llqYOEViD9o/d8skPCDguEkmv776CJyv6V+I/1w=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UmnwXj/EXCVyiJLttjaUxaiwwu/yjBBegLd2iG3OoUReNnXZmjexiCWBBBjcut+a5
	 CjI5zW5EdqIcP/SF2TP1BkiJZ8x7SOYWXPjGTPlW18s96L0bPTn+GzDKP0/7BWgluU
	 j79OEoIzq53BPl5+O1Lf5brT9jriWBHzCyXPw5Wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B9C7F805D4; Thu,  4 Dec 2025 04:16:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7237F805C4;
	Thu,  4 Dec 2025 04:16:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64AA8F80542; Thu,  4 Dec 2025 04:16:24 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0B3F8007E
	for <alsa-devel@alsa-project.org>; Thu,  4 Dec 2025 04:16:24 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: rt5682: Support the ALC5682I-VE codec
From: piokyfara@gmail.com
To: alsa-devel@alsa-project.org
Date: Thu, 04 Dec 2025 03:16:24 -0000
Message-ID: <176481818436.20.1113253877869663567@mailman-web.alsa-project.org>
In-Reply-To: <20241225094307.3678837-1-derek.fang@realtek.com>
References: <20241225094307.3678837-1-derek.fang@realtek.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: H3H6M54YMCA67TUZLTD55GBGRXNXJGTK
X-Message-ID-Hash: H3H6M54YMCA67TUZLTD55GBGRXNXJGTK
X-MailFrom: piokyfara@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3H6M54YMCA67TUZLTD55GBGRXNXJGTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The landscapes in https://geoguessr.io/play are surprisingly calming. Even when I’m focusing intensely, I still enjoy the scenery. From snowy mountains to tropical beaches, you get a visual journey every round.
