Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F4B0875B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 09:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AAAE601DD;
	Thu, 17 Jul 2025 09:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AAAE601DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752738993;
	bh=NV/LxW1yWSbwNSGSyL9OwVHy/16oujR/Rfi/QNZZqHU=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p2QLGKmwJ+xy31SXAo2vUOzEyi461Zyb+7nEr8HFAEANACtJm7gg7Ym+QQe/xe3x1
	 QI3oNHNr2u29xAHTiMKZg4nnJpcq5AMDdUOoK81CY71/IO5cunmbU65A5VTum8cWIB
	 DbaIcAhKCLItdnKMrUwcFmWo0A4r2uWQ97BvBjLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03BEF805B5; Thu, 17 Jul 2025 09:56:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9440BF805C2;
	Thu, 17 Jul 2025 09:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C105F80217; Thu, 17 Jul 2025 09:55:51 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 49ACBF800B6
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 09:55:51 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
From: 21basic@mechanicspedia.com
To: alsa-devel@alsa-project.org
Date: Thu, 17 Jul 2025 07:55:51 -0000
Message-ID: 
 <175273895121.21.13261830615894390126@mailman-web.alsa-project.org>
In-Reply-To: <173082470066.77847.3145634719799599408.b4-ty@kernel.org>
References: <173082470066.77847.3145634719799599408.b4-ty@kernel.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: CNTGJZNX45GHCSW6QPQHLWWQBXMKHPOE
X-Message-ID-Hash: CNTGJZNX45GHCSW6QPQHLWWQBXMKHPOE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBRNGNTZLFKAP2QASXQ5PBVPTHTHOAPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Great news on the Linux kernel integration! Let's hope it merges smoothly. Rigorous testing is key to avoiding regressions. Speaking of tests, anyone up for a quick game of Uno Online while we wait? It's a fun way to unwind and contribute to the community while keeping an eye on updates! Looking forward to seeing this land. https://unoonlinefree.com
