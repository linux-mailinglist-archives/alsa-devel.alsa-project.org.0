Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB03B40C0B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Sep 2025 19:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDA760203;
	Tue,  2 Sep 2025 19:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDA760203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756834170;
	bh=bZ3Xcjv1ty5/G2UIcoMlj/ylIwVtWrxDcIqg3tTWf44=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a9w1p7gJg0K8PjNHPOziEAXpTyTbz8Lu7XDJq+qKgm9JyQLAR7Z9t0iZnOCRzqTIS
	 w+WlOCpfMZxVKul+cb+x0CL2Hk+dN/R1SXlmA8mPtmO6ma5SDO16Nry5FHjre7Rvv4
	 1Pe+hpBmlxfgWCOw4wII0OvTEKrBy4jRQEbL19AM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0932F805D8; Tue,  2 Sep 2025 19:28:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C916F805CB;
	Tue,  2 Sep 2025 19:28:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82F43F80254; Tue,  2 Sep 2025 19:28:38 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 132E3F801F5
	for <alsa-devel@alsa-project.org>; Tue,  2 Sep 2025 19:28:37 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: I2S Stereo ADC Soundcard Hacking
From: sylvain.gre@proton.me
To: alsa-devel@alsa-project.org
Date: Tue, 02 Sep 2025 17:28:37 -0000
Message-ID: <175683411791.22.8567698481450101045@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: TNHPA2IDX36Z56I3JGLDQNW5ON335BMT
X-Message-ID-Hash: TNHPA2IDX36Z56I3JGLDQNW5ON335BMT
X-MailFrom: sylvain.gre@proton.me
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNHPA2IDX36Z56I3JGLDQNW5ON335BMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

My idea is to exchange two input signals (CH_L1_IN and CH_L2_IN) at the sampling rate (192kHz) to produce one signal (CH_L_OUT), sampled at 192kHz (small electronic cicuit cf https://electronics.stackexchange.com/questions/754648/i2s-stereo-adc-soundcard-hacking). In this way, in the digital domain I will receive CH_L1_IN, CH_R1_IN, CH_L2_IN, CH_R2_IN...
Of course, the sampling frequency will be decreased by 2 using this method (96kHz instead of 192kHz). But the number of channels is increased by 2 also (4 instead of 2).
Where can I begin with alsa to increase the number of channels and adjust the sampling frequency ?
Something like a virtual soundcard maybe ?
I have skills in dev but don't know where I have to start with alsa fot this hack...
