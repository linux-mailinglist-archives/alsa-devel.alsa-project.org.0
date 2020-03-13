Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E303B1845EC
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 12:26:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759BB17E0;
	Fri, 13 Mar 2020 12:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759BB17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584098778;
	bh=Eerr6S2Q942ISTxjKVTwuuKCU5dY/8Vuqt0I3UVo8YY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCH6FfMuFQog1SBzBfZVQcjM/DUK1CnDDIVpb/pa+7ARp+LBGAZFY3fAMdZPQaKcm
	 nL8sG9FmSkJfe3FXIH33F2MrZuJqbvIC+AsV58R0cvsGMKgHqfaJmrZtmklWGkXCFX
	 XA/avU/mXPeYoUixe6XnM7OQmEEvQ7IDGykt9CwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A22F80086;
	Fri, 13 Mar 2020 12:24:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520D6F801EB; Fri, 13 Mar 2020 12:24:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39879F80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 12:24:23 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6CE0AA0046;
 Fri, 13 Mar 2020 12:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6CE0AA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1584098662; bh=H42r/GY3arH2rNvkHkWyQh3WwDnp8CkMGdaAYndQBtM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Hc78OzU291sQvcr5dB9FcKQ+f9vvnjd/DTqAJK81MmYHn6zjZDXHG8mnS38ICRVzs
 hRMIzfhVn9Z5mIUEm6znY1n6dQ8AM06AZp02a1DXs4l7ZwvRU+6kASn1JK0LSCPkCG
 vQQ3CBqS7a1ZXVOyAhXCiJbr9zYqXEVGuB+MJMSU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 13 Mar 2020 12:24:18 +0100 (CET)
Subject: Re: [PATCH v2] ucm2: hdadsp: add basic ucm config
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200313110018.5145-1-mateusz.gorski@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ac6a75e3-8621-fd43-8260-2c8674166c6c@perex.cz>
Date: Fri, 13 Mar 2020 12:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313110018.5145-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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

Dne 13. 03. 20 v 12:00 Mateusz Gorski napsal(a):
> Basic UCM configuration for Intel Skylake SST HDA DSP generic machine
> driver enabling codec playback and capture on both HDA codec and DMIC
> ports.
> 
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> ---

...

> +SectionDevice."Headphones" {
> +	Comment "Headphones"
> +
> +	ConflictingDevice [
> +		"Speaker"
> +	]
> +
> +	EnableSequence [
> +		cset "name='Headphone Playback Switch' 1,1"
> +		cset "name='Speaker Playback Switch' 0,0"
> +	]
> +
> +	Value [
> +		PlaybackPriority 200
> +		PlaybackPCM "hw:${CardId},7"
> +		JackControl "Front Headphone Jack"
> +		JackHWMute "Speaker"
> +	]
> +}

If there is a volume control, it should be defined via PlaybackMixerElem (like 
PlaybackMixerElem "Headphone").

> +ValueDefaults {
> +        PlaybackChannels "2"
> +        CaptureChannels "2"
> +}

This ValueDefaults {} section with this contents should be removed. The stereo 
is the default settings.

						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
