Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25FE6A2AD5
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Feb 2023 17:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A34F201;
	Sat, 25 Feb 2023 17:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A34F201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677343554;
	bh=J7P6p44HlK5X3rGjvFYKJEUrNuEXZMwKH27oB6BcOxQ=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jdrO+j+p4gtz8fP6o+vojqF1D17Ud4E4cWfqQEWvRePm3HVPwg0GUfD3ziN3AUgXY
	 kLScjfvLi0+XLnOpvNE2GjqRsjLvdAtsun123MIYayTe0yt4siicdd718wS0VDOeHM
	 3Y6m2EQTOoWf/zB392njLTjo6A5DnNOv8Z2NniHI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF51DF800DF;
	Sat, 25 Feb 2023 17:45:03 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id E9086F800DF
	for <alsa-devel@alsa-project.org>; Sat, 25 Feb 2023 17:44:52 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: infinite loop in src/pcm/pcm_params.c function
 snd_pcm_sw_params_default()
From: bumpelo@gmail.com
To: alsa-devel@alsa-project.org
Date: Sat, 25 Feb 2023 16:44:52 -0000
Message-ID: <167734349294.22.1388671545195719262@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: VDXVYNVL4GA276KJW74NKYP57Z7YR2LR
X-Message-ID-Hash: VDXVYNVL4GA276KJW74NKYP57Z7YR2LR
X-MailFrom: bumpelo@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDXVYNVL4GA276KJW74NKYP57Z7YR2LR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I found this infinite loop while playing with the test/latency.c function. When I specify too small of a minimum latency (in my case -m 256 or smaller) it winds up:

at line line 2337:
	params->boundary = pcm->buffer_size;
	while (params->boundary * 2 <= LONG_MAX - pcm->buffer_size)
		params->boundary *= 2;
	return 0;

but when pcm->buffer_size is zero this is an infinite loop. It does this *after* setting the scheduling to round-robin which makes the infinite loop so much more painful.

The return value from this function is ignored where it's called so I'm not sure what the best fix is. I'm guessing it's a rare case since it's not been previously reported but it deserves fixing anyway.
