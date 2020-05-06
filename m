Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC91C7538
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E579177C;
	Wed,  6 May 2020 17:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E579177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588779766;
	bh=wvuQguOC3FBPt9QvZRnmN9Vg6nbfGcNUakfmMVhwRDc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2jJCuEjFULRrs7Z0skxHebqyacyCeEo4hRkBO3pKi1DywW44XJnCkPnlr4cUfjWu
	 mpfKyMpO12UCyIJJmJwQ+ot4rsgl6VvBIUCcqCD7+B1hukEtay+8N9nemYQZCuEBgi
	 uZRgSbTGXvbXOp+Vk7CuvFOYCNiNJoNXj1TrWWT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972CCF800AD;
	Wed,  6 May 2020 17:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA00BF80249; Wed,  6 May 2020 17:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F263F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:40:49 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6FE8DA0055;
 Wed,  6 May 2020 17:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6FE8DA0055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1588779648; bh=0HiaUFAi5yY5KAs/xElEcbcsV0MGnSI6agkYBxnMsxY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ZvdKLhjvXvcdRBxrVxXaOs2Bv0AR/oad57pqNKsMDCKOZI/AIMyFO3YU8xGCD6p7Y
 wTcgSp45lLV3cmNlNgV3YkvslxGREKUHVJSYK9ASsCNcpnRayvAsuGCgejVRfhLr6N
 okoQi99VVZaugy6e2wofU7a/RcVHmrC/hUGM8JhM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  6 May 2020 17:40:46 +0200 (CEST)
Subject: Re: Keeping the codec running at all times
To: Ricard Wanderlof <ricardw@axis.com>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <alpine.DEB.2.20.2005061709110.12526@lnxricardw1.se.axis.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7a54134e-ce30-d7d5-bcf3-31269f1103f1@perex.cz>
Date: Wed, 6 May 2020 17:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2005061709110.12526@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 06. 05. 20 v 17:15 Ricard Wanderlof napsal(a):
> 
> In certain system-on-chip systems, with separate ADCs and DACs for
> instance, the ADC could generate clocks for the DAC, where it not for the
> fact that ALSA shuts down whatever device is not being used in order to
> conserve power. Is it possible to instruct ALSA not to do this, i.e. once
> a codec has been configured to operate at a given sample rate, it will
> continue to do so, even after all streams have stopped.
> 
> I suppose one way to do this would be to change the codec set_bias_level()
> callback so that the BIAS_OFF and BIAS_STANDBY cases don't do anything but
> leave the codec running. But it doesn't sound like a clean way of doing
> this.
> 
> Of course, one complication is that at system startup, before any capture
> or playback operations have been attempted, ALSA doesn't know which sample
> rate should be configured, as there is no concept of a 'default sample
> rate'; the sample rate is always set when a stream is opened.

The driver may limit the available rates (thus it may be possible to set the 
one accepted rate via the module parameter or so which may be used for the 
codec initialization before an application uses the PCM device).

						Jaroslav

> 
> /Ricard
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
