Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C735EABCB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 17:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5829F6;
	Mon, 26 Sep 2022 17:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5829F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664207843;
	bh=bvHWKchOfHzUeXSElp3VV6K6fgeLBwbhKgmSrd9r8CY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBBrN0RVHNj7eiNf9IcDYPd06Te9IKV+Rfgdw+p5WfSmFT5RXfBVbGekbiJPYw+Gm
	 //pRlhU4Ti4TiB8QnoHBbbVXdCAf9+wPoMdxwWymU394ZgWj+FdooRfB2DinBRsijC
	 +YSyseh7hsHbchFarYdgqwwQPNgT6AhVDFp+gxvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B225F802BE;
	Mon, 26 Sep 2022 17:56:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15052F8011C; Mon, 26 Sep 2022 17:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26346F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 17:56:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3CF0EA003F;
 Mon, 26 Sep 2022 17:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3CF0EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1664207778; bh=++VagZDXtcXJJD03NWByRWiViog8WfYrDlyjvP2s4Ik=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=VPidQVCrZEK4wp77nWsmtOpasa5r9s64Jdq/myx0AfggSY6JFS9QIyQFtx7EJePPx
 jOSFUnnhTWCD7CAHdg4oqxTlxnXwNx7HpA1aU0czfmLf4RpQ6aGPH8mV/LFpafoXiI
 dvf0/B2QFav4csjuC1TFcfDGH8591/NkyX5uo5CI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 26 Sep 2022 17:56:16 +0200 (CEST)
Message-ID: <3d89afec-26fb-a92b-4dd7-76a09739e066@perex.cz>
Date: Mon, 26 Sep 2022 17:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/11] ALSA: PCM state reference optimization
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 26. 09. 22 15:55, Takashi Iwai wrote:
> Hi,
> 
> this is a patch set for simplifying the reference to the current PCM
> state by having the local copy in runtime instead of relying on
> runtime->status indirection.  This also hardens against the attack by
> modifying the mmapped status record.
> 
> The first patch does the basic job in the core PCM side, and the
> second patch flips the PCM status mmap to read-only for hardening,
> while the remaining patches are for drivers to follow the core
> change.
> 
> The conversions are straightforward.  In most places, it's just
> replacing runtime->status->state with runtime->state.
> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (11):
>    ALSA: pcm: Avoid reference to status->state
>    ALSA: pcm: Make mmap status read-only
>    ALSA: aloop: Replace runtime->status->state reference to
>      runtime->state
>    ALSA: firewire: Replace runtime->status->state reference to
>      runtime->state
>    ALSA: hda: Replace runtime->status->state reference to runtime->state
>    ALSA: asihpi: Replace runtime->status->state reference to
>      runtime->state
>    ALSA: usb-audio: Replace runtime->status->state reference to
>      runtime->state
>    ALSA: usx2y: Replace runtime->status->state reference to
>      runtime->state
>    ASoC: intel: Replace runtime->status->state reference to
>      runtime->state
>    ASoC: sh: Replace runtime->status->state reference to runtime->state
>    usb: gadget: Replace runtime->status->state reference to
>      runtime->state

Nice cleanup. Perhaps, you may add a note to the second patch that the status 
is already mmaped as read-only in alsa-lib for ages. So no regressions are 
expected.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
