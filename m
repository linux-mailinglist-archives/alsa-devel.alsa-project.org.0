Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6CADBFA1
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 05:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68B5601F3;
	Tue, 17 Jun 2025 05:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68B5601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750130187;
	bh=vk6YZ68GS0VE9nQ3RADjuGAJsczX5aps7dXg2OXLQyo=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PLQkzuNYTjNXI1FOAX4tnC82u4gEDdacF30rpL+JdmwnhBp5LsEOdv5erBCWj8/Zm
	 KALQSoPlrRMEX4Io5R25EcKHn2SoPdF0smxUHhf0YJP0yZHF6iaYQBKTR+SRT2fSMj
	 8wmCa5j+6EszpQ1is5J7sqSj0L9OBY3MLt9QyaCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09891F805D2; Tue, 17 Jun 2025 05:16:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA729F805BF;
	Tue, 17 Jun 2025 05:16:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97064F80224; Tue, 17 Jun 2025 05:16:02 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C698F800E4
	for <alsa-devel@alsa-project.org>; Tue, 17 Jun 2025 05:16:02 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: amd: acp: Fix support for a Huawei Matebook laptop
From: roycarlson56@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 17 Jun 2025 03:16:02 -0000
Message-ID: 
 <175013016257.22.13523840110427556974@mailman-web.alsa-project.org>
In-Reply-To: <20240128172229.657142-1-posteuca@mutex.one>
References: <20240128172229.657142-1-posteuca@mutex.one>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: KFYATYHA4RVALTCNCJA42GZV2J6BLEUW
X-Message-ID-Hash: KFYATYHA4RVALTCNCJA42GZV2J6BLEUW
X-MailFrom: roycarlson56@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVP3VUABPQFXUIL6RBOTKS5T64JQ6NTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One of my favorite aspects of Basketball Stars is unlocking new playgrounds. Each one has its own unique charm and adds depth to the overall gaming experience. https://basketballstars-game.io
