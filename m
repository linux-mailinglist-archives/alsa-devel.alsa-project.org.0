Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53640BA44A4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 16:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA98B601F8;
	Fri, 26 Sep 2025 16:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA98B601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758898242;
	bh=c7c9+xBTGOhbDYFyUcRzvnlubAICVFzsdQQ2MvFGYtg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=a15UphPxp1/ZqO/w62GiN6pX6IdmUfx9gCVoaJOOYRb6XrLVZG2eNESd0aNbmEwuz
	 RwhdrhPsPi7ITqcfVGEDaSCiZrB3LK+9nqCCqG4NCICxmhHCv926h+wO0Lj4w8CZn8
	 gbrSRtg2xyidFeSaRT7W3nLrmMdMo9etFeucCloE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1660BF805D6; Fri, 26 Sep 2025 16:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE193F805C0;
	Fri, 26 Sep 2025 16:50:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F9AF804FC; Fri, 26 Sep 2025 16:50:03 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EA1F8011B
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 16:50:03 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: ASOC - Manage sound card with multiple optional codecs
From: claudio.mocci@abinsula.com
To: alsa-devel@alsa-project.org
Date: Fri, 26 Sep 2025 14:50:03 -0000
Message-ID: 
 <175889820325.20.13824184826260903055@mailman-web.alsa-project.org>
In-Reply-To: 
 <175872697852.20.16571469264981576402@mailman-web.alsa-project.org>
References: 
 <175872697852.20.16571469264981576402@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 7IUNP54HEW3ARTRNR7P2WSYZ5TESLXIJ
X-Message-ID-Hash: 7IUNP54HEW3ARTRNR7P2WSYZ5TESLXIJ
X-MailFrom: claudio.mocci@abinsula.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJOGQD7P7XTEZNDR5MTKMYG6EIZCXZCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I add further explanation of the audio topology I want to implement: My CPU_DAI (esai0) is configured to exit with 4 channels and, the first two are redirected to codec1, the 3 an 4 to codec2. In the future implementations we will be implementing 8 channels to 4 optional plug and play codecs.

I also tried to implement a solution with multiple dais instead of a single DAI with multiple codecs but this solution does not allow a simultaneous play through both codecs.
