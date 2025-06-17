Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E015FADBFA6
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 05:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B9F601F5;
	Tue, 17 Jun 2025 05:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B9F601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750130341;
	bh=GUottyxIS5TOo4g0hJIOjdBb0fof54Lxre3f18TCUds=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LMJ+IEPP+IFKr7uMecTRy+4chxfxPmE5+Llj3ciGzDGyzX3GCxhKrXhEwKnGsywI/
	 KaHTpwYFltsd+0tEmCE2lj7LCF12AEHspIvgcfUYQo/rCISbMo4NKhsl51l5sGTMzt
	 dYw/xSWczNHE6oTr3DGzsOac6929HpgHxENLbQ8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11DC7F805C7; Tue, 17 Jun 2025 05:18:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CEEF805B4;
	Tue, 17 Jun 2025 05:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8757F80224; Tue, 17 Jun 2025 05:18:22 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id A00EBF800E4
	for <alsa-devel@alsa-project.org>; Tue, 17 Jun 2025 05:18:22 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
From: roycarlson56@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 17 Jun 2025 03:18:22 -0000
Message-ID: <175013030265.22.9224378210972219469@mailman-web.alsa-project.org>
In-Reply-To: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
References: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: CCH5DHGWQQRG3JZK4O2YREB5A7NL52C6
X-Message-ID-Hash: CCH5DHGWQQRG3JZK4O2YREB5A7NL52C6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCH5DHGWQQRG3JZK4O2YREB5A7NL52C6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I love how Wacky Flip makes you stay on your toes. It challenges your speed, timing, and precision all at once, offering a truly engaging experience. https://wackyflip.com
