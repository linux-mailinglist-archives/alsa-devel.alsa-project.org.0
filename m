Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4C1EB100
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 23:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C217B1665;
	Mon,  1 Jun 2020 23:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C217B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591047479;
	bh=4TMfWyEQYpMNuEPlWphIzxfEIjjGWs595HYxkZNjCJY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUKMjDbXq95ZxQ3uwkckRa+iK+FnVl/C+vmzhzTEjKFJ4IcXRxKnW8R31+4DId9f4
	 eWAiQrlKkhPYCd00hwWzRBTqDqiivKxaWeGgvxTFOWi8YZ0LAbnLr4OSE8TWAlWEv1
	 OmIyY9X1/r5E9pmPUltMzLRx/dXiFFz6DiK1RZPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB914F801ED;
	Mon,  1 Jun 2020 23:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C51F801ED; Mon,  1 Jun 2020 23:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx.slunecnicejitka.cz (rosemary.pkrn.net [31.31.72.173])
 by alsa1.perex.cz (Postfix) with ESMTP id 99B11F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 23:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B11F800B8
Received: from [172.31.0.131] (ip-94-112-38-60.net.upcbroadband.cz
 [94.112.38.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: poki@poki.me)
 by mx.slunecnicejitka.cz (Postfix) with ESMTPSA id CB19041540;
 Mon,  1 Jun 2020 23:36:08 +0200 (CEST)
Subject: Re: Lenovo P520/Realtek ALC662 - front jack & mic in
To: alsa-devel@alsa-project.org
References: <ebbabedc-195b-afb7-d1e6-ce5523f92530@poki.me>
 <e523ea58-892d-4ab7-58aa-beb3c94a10a3@poki.me>
From: Jan Pokorny <lists@t.poki.me>
Message-ID: <b25fc548-981e-5ae6-2895-ef9eb85912e1@poki.me>
Date: Mon, 1 Jun 2020 23:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e523ea58-892d-4ab7-58aa-beb3c94a10a3@poki.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Mark Pearson <mpearson@lenovo.com>
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

On 5/31/20 6:07 PM, Jan Pokorny wrote:
> So, what can be done about getting these work?
> 
> * front panel headset jack
>    - headphones mode only
>    - headset
> 
> * rear mic jack for the mic
> 
> * internal speaker without said noise, just in case it is
>    ever needed as a backup ... it definitely worked rather
>    well under Windows

Ah, this last one can be marked as checked, suddenly noticed
that graphical terminal generated "nice" alarm just resounded
unexpectedly :-)

Sadly, this snd_pcsp appears to be a prerequisite and it is
not loaded automatically in this Fedora Rawhide installation
and with this audio HW (~ no out of the box experience,
not sure where to forward this after more testing, cannot
immediately as it cannot be unloaded for being in use).

The noisy sound will only appear when a separate (not
present unless snd_pcsp is loaded) PC-Speaker (Master)
channel gets unmuted.  Maybe I even confused cause and
effect about this, it's all, well, confusing, so sorry
if that was the case.

-- 
Jan
