Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E95EEF97
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:47:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932A115E5;
	Thu, 29 Sep 2022 09:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932A115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437674;
	bh=jNKdk0bOoYwd3cOwAJK3KoSwK6A5FelqTs0O1LYeSjA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnff/fqLDRT73GC1gCC65HAZwDPtE5Z6HGI44bkx30XPRTMu1OgNAlpOQstPE3b++
	 Hn+A5BZYqU7qLnEpnvimKDLfxJg2AgbCupIR3veXubvA6lxoT8mHGBtO3RqK2h/x9S
	 sPLBlw77uskYla5MYfzO1XnQAJkGQ67fE9e9UoU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E368AF803DD;
	Thu, 29 Sep 2022 09:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B32CF8023A; Thu, 29 Sep 2022 09:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D247F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:46:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AD111A0046;
 Thu, 29 Sep 2022 09:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AD111A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1664437609; bh=K07nEsmemVw/soepRa2kAnyBMJLOU3Z8QlwgrnUCcAQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=xggaI4JCGPhap4wDNCheD337Y4zwBHewWmA5dnFJFJl1xX3vPnhT0FyBQ8D4veZcf
 YPneZk7JoJrtnAAL1gnBFKCWdF55echsGUq0Gc74dcJ56bnRFJUK+d38nWJ7z2A20N
 +4dI4KslGin5deJOMlpj9kALx40WXYF6slALuhac=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 29 Sep 2022 09:46:47 +0200 (CEST)
Message-ID: <e9375848-039c-6648-7038-fa8f081370ee@perex.cz>
Date: Thu, 29 Sep 2022 09:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/8] ALSA: hda: Add model option to codec drivers, too
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220929073545.1085-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220929073545.1085-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29. 09. 22 9:35, Takashi Iwai wrote:
> Hi,
> 
> this is a trivial patch set to add the "model" option to each HD-audio
> codec driver that works equivalently with snd-hda-intel or SOF
> driver's model option.  It makes it easer for users to specify the
> quirk to the right target.

I am not convinced, if it's "easier" for users. Perhaps, it will make more 
sense to add this option to the snd_intel_dspcfg module (so the model can be 
controlled in the one place). I admit that users are a bit confused with the 
snd-hda-intel and SOF differences.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
