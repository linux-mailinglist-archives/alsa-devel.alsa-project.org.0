Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F25C72370
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 05:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA29260209;
	Thu, 20 Nov 2025 05:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA29260209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763614319;
	bh=5wUAceWdKHZ0wFq+RqDKtM8niYZzZrbjmWv2u6A8cUY=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lCkZWnH/4+BPdTKQ7nvn3DBIyweLrheH3/nGIcEwhSESSedLuVbo9DY94AkJkveV1
	 JBdPPgTbA/TZF3NliLWCkbmae6T24Nm85dAkmJlh+aeI+Coc3TEbBtb/jCaEoFjpPU
	 oWMuKVk9AzRUmkz937W1WNNzrJ4eCKoijHalkcRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39027F805C6; Thu, 20 Nov 2025 05:51:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E184F805CA;
	Thu, 20 Nov 2025 05:51:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63A6EF8021D; Thu, 20 Nov 2025 05:51:11 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 52359F80149
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 05:51:11 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: wm8994: Prevent access to invalid VU register bits
 on WM1811
From: snowlovesuny@gmail.com
To: alsa-devel@alsa-project.org
Date: Thu, 20 Nov 2025 04:51:11 -0000
Message-ID: <176361427129.20.7571238022762774002@mailman-web.alsa-project.org>
In-Reply-To: <20200804141043.11425-1-s.nawrocki@samsung.com>
References: <20200804141043.11425-1-s.nawrocki@samsung.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: LAGFQDWF3ZTEJWQHU5UZNYFKIUFJSW3I
X-Message-ID-Hash: LAGFQDWF3ZTEJWQHU5UZNYFKIUFJSW3I
X-MailFrom: snowlovesuny@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAGFQDWF3ZTEJWQHU5UZNYFKIUFJSW3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Snow Rider is a quick, addicting, and graphically stunning winter-themed racing https://snow-rider3d.io game in which players ride a sleek snowboard down snowy mountains, encountering obstacles, surprises, and thrilling moments that make each run seem new and spectacular.
