Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB1ADBFA3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 05:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A128601F1;
	Tue, 17 Jun 2025 05:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A128601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750130275;
	bh=aBV+m71pGGi3krAHwt0TmdVe4G7Fo3jd29eofSIj71w=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=szM3zbxEU4eklKtr6N8CrTkAK/Oum0lwcDGgPvefn2LJ1hM/MJYcpPVR1FF7YHzNI
	 PNI3fekjr6eUV7HMtcSkLoEOOYKfbUi4CJ3HaabWSEw45vKr0OI5WE3Akuf8hxFgmX
	 zwJHDplv7miOc0POeIFdKsziv5eQFOWYZHek6fa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AA2FF805C8; Tue, 17 Jun 2025 05:17:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEEAF805BF;
	Tue, 17 Jun 2025 05:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24629F80224; Tue, 17 Jun 2025 05:17:15 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D1A3F800C1
	for <alsa-devel@alsa-project.org>; Tue, 17 Jun 2025 05:17:15 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [alsa-devel] Applied "ASoC: tlv320aic32x4: Model CODEC_CLKIN in
 CCF" to
 the asoc tree
From: roycarlson56@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 17 Jun 2025 03:17:15 -0000
Message-ID: 
 <175013023511.22.16458694387384303213@mailman-web.alsa-project.org>
In-Reply-To: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
References: <20190325161140.A0E0111288F1@debutante.sirena.org.uk>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: L6KRGFM2IHEYXNJG7VHK6HTIRVHYQPYS
X-Message-ID-Hash: L6KRGFM2IHEYXNJG7VHK6HTIRVHYQPYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXTLEFLOX7Y6H3GD2W33LLNG4XJHMJ7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Every time I land perfectly in Moto X3M, the resulting speed boost makes me feel like a pro rider. It’s a great way to keep the gameplay fast and addictive. https://moto-x3m.io
