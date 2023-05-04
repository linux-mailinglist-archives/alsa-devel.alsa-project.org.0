Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D06F6985
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 13:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D5C1F9B;
	Thu,  4 May 2023 13:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D5C1F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683198447;
	bh=VUqBSpPrY48cG7514tSf8SDz6kybJv2rT/wj7OY60Ro=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=P3mDIAgipdHkloJKoQscGFzDSpvcps8ssbTOCs6DeVepQT1YAJLsEYsE5Mp0ERTmr
	 4/S/P2eFGDplCS0UWsDp3GERiXnZu3duDJG0N+DGC+rAeU4aXR0ANfmAmfKmsvnFS9
	 u3TuT1PhzpfVCxPUh+3F+1Jr4EpcBDqw9cKIj3Qk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74536F80529;
	Thu,  4 May 2023 13:06:36 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACADF804B1
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 13:06:32 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: How to mix multiple pcm capture stream into one and save to wav
 file as if
 it's from one single multi channel alsa card device
From: semiydsemiyd@163.com
To: alsa-devel@alsa-project.org
Date: Thu, 04 May 2023 11:06:32 -0000
Message-ID: 
 <168319839248.21.13628311961075383599@mailman-web.alsa-project.org>
In-Reply-To: <ZEvrvsooKSynbnzU@geday>
References: <ZEvrvsooKSynbnzU@geday>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: LU2H76B7WJKFLFRLX3VDJ6JTKB6TQVSS
X-Message-ID-Hash: LU2H76B7WJKFLFRLX3VDJ6JTKB6TQVSS
X-MailFrom: semiydsemiyd@163.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OICNBAKAXPC746W4AIKVOLK3RCZALOFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

thank you Geraldo !  i'll look into these tools.
