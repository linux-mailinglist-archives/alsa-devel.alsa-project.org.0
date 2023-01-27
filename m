Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766ED67EADD
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:28:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1A8AE9;
	Fri, 27 Jan 2023 17:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1A8AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674836903;
	bh=vm69eyagdYqTUOZptTU7MW7H41NucGoiJPt0P6HA7yc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=abgwftt+sax0LKaaqDhmjIckq74zdWG+VpWDVx12tbpcaRU6FwqBhv1vNT8JVor0L
	 ohNfJneQhY2+hJV+eyCEbmqNeGLb08lpFPIWdVg8sfvtR/G57/jdbt8ULeqvh3G6Np
	 KAWPGWqYIdogwFzbF3ComAJdghPLaybEwcTF4l/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A728F801F7;
	Fri, 27 Jan 2023 17:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F81F80272; Fri, 27 Jan 2023 17:27:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D1DFF801F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D1DFF801F7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=ZbLodWCB
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2B1C411E3;
 Fri, 27 Jan 2023 17:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2B1C411E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1674836840; bh=pKos4VWGHVjA0eJuN5awctVwSEdS/b+ZMpZ5sSl2fMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZbLodWCBoe7DG/pjJSoLTtDWEmZGCzS5IF80bO6a8H0xmiaxOSTlc/rgiGIqgMez7
 2DA5ANrQa6MtUztdHerK90vC5BWjP5RZ7adJ8QOu570MrNkHsCsbv4gRbZTWHHNctt
 1p8fGYpE3Ix6UJgdSeHP0jbLhT0T5w2Ag/gvw13g=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Jan 2023 17:27:14 +0100 (CET)
Message-ID: <9f98fb6e-ff4b-5cac-9606-fcc0b3f256fe@perex.cz>
Date: Fri, 27 Jan 2023 17:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 28. 01. 23 0:11, Amadeusz Sławiński wrote:
> Following is series of fixes and cleanups for core topology code. Few
> patches fixing various problems all around and few fixing function
> names.

Just an info - the sent date seems to be in future in your git patch sets.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

