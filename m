Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6B74101C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D771ED;
	Wed, 28 Jun 2023 13:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D771ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951986;
	bh=lBnJsgd30hu0hrXKPX6HII2d92SyEdVj5cY5H5y0e7A=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=I24FW1j+1Ing1+GO5MpK5gsh+y3/61qNnyzp1B2FwIH4kqjEWjElXk5kpq6dGkCcG
	 Sk55PoBn4GKRKVlzsbuBqbSxUwN1CcuYaij6oIaKF8zRfhS2h3BC368dRta1kO38EZ
	 I3qYMi4UnbwtRsnwsYqth/MbBMPWry/r57GIL/6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65635F80431; Wed, 28 Jun 2023 13:32:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1ADDF80212;
	Wed, 28 Jun 2023 13:32:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF717F80246; Wed, 28 Jun 2023 13:32:12 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F83F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 13:32:12 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 28 Jun 2023 11:32:12 -0000
Message-ID: <168795193282.22.889084679335823356@mailman-web.alsa-project.org>
In-Reply-To: <87r0pvet82.wl-tiwai@suse.de>
References: <87r0pvet82.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: ZGXM3NZCPQMQ456YKETOSHZBXICYDXYN
X-Message-ID-Hash: ZGXM3NZCPQMQ456YKETOSHZBXICYDXYN
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGXM3NZCPQMQ456YKETOSHZBXICYDXYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for the notes. I read the (USB) spec again page 27/28.  (well multiple times) and as I understood 1 endpoint has 1 or more multiple  Group Terminal Blocks for which GTB each has  1 to 16 groups (group = in/out or bi =  similar to one or two midi cables/ports)  per terminal block  The spec I have is from May 5th, 2020. i wonder how the driver get the Function Block information function blocks are not mentioned in the USB spec. Is there a a newer USB spec? if yes, it may make no sense to develop a device now if the descriptors and USB functions calls changed. Page 28 still refers to MIDI -CI protocol negotiation which already has been removed.  It's a bit confusing. Would have been better to first release the updated USB spec before releasing the updated MIDI specs.
