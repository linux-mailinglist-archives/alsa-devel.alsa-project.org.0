Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2179C99F64
	for <lists+alsa-devel@lfdr.de>; Tue, 02 Dec 2025 04:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE42601FA;
	Tue,  2 Dec 2025 04:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE42601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764645912;
	bh=j4wrihKJ12A0j83orNKlndV6pgKdRu9PO4SMm25zyFs=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pddNpjX8vP4gOrWMMFz5Fm1J+znU3z615Zfi5BzW34cyg967L9TY8xC0busSyIekw
	 gfJzH/xD9VwzBUeRHl71o01LG3I+WS8pc2cXeJ/jtrZiXJ1GLi5xSwJlDTLdQ9EJm+
	 CDSidTzKVRxO0tTl8dSdXddEcHZ3vLhBQAJtoxZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0676F805BD; Tue,  2 Dec 2025 04:24:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F73EF805C0;
	Tue,  2 Dec 2025 04:24:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 177D8F80246; Tue,  2 Dec 2025 04:24:35 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 018FAF800B5
	for <alsa-devel@alsa-project.org>; Tue,  2 Dec 2025 04:24:34 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [alsa-devel] Applied "ASoC: tlv320aic32x4: Model CODEC_CLKIN in
 CCF" to
 the asoc tree
From: satisfied.shrimp.ital@protectsmail.net
To: alsa-devel@alsa-project.org
Date: Tue, 02 Dec 2025 03:24:34 -0000
Message-ID: <176464587496.22.3926790229994363966@mailman-web.alsa-project.org>
In-Reply-To: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
References: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: MTPNLNXCDQH6L7V3YTR3IRCUWMAAI2KS
X-Message-ID-Hash: MTPNLNXCDQH6L7V3YTR3IRCUWMAAI2KS
X-MailFrom: satisfied.shrimp.ital@protectsmail.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTPNLNXCDQH6L7V3YTR3IRCUWMAAI2KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Okay, so the asoc tree patch seems to be moving through the pipeline, interesting. It's heading toward linux-next and then, potentially, the big boss Linus himself! Good luck with that; I hope everything goes smoothly. Keep an eye out for those automated tests, though! Speaking of potential issues, I remember one time Slope Unblocked, when I submitted a code change and didn't properly account for edge cases. Got immediately flagged by the build system; learned my lesson fast. Fingers crossed this asoc patch has smoother sailing. https://slopeunblocked3d.com
