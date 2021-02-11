Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D653192ED
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 20:18:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC98172E;
	Thu, 11 Feb 2021 20:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC98172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613071086;
	bh=pfI8yXJy96jN7XH4vTRF6q8fGIf+54cWvPbYLdkYz0Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqxBF2lyXW1QBcBIABhyy3wMj0+WinsHQ8uDQHNVXjcv3LFN68C9BFwRGEkV05iUD
	 t1gwO0Ve51x8wIEtG3kdvTdLN2eMsWQHzSox5aMQgLy2UEqZ3BHok783D8GmY8Z0UQ
	 LaHA9pOBAGsLHHM8kCK1XjXWOaD20Kx/YNEpe3RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0409F8025F;
	Thu, 11 Feb 2021 20:16:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CB1F80259; Thu, 11 Feb 2021 20:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCBE6F801D5
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 20:16:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 97FE0A0042;
 Thu, 11 Feb 2021 20:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 97FE0A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613070995; bh=d7j98pwCyrcyBGT/5uOk6AJXDIQ2QGY6iskMeY3x1z4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yGXZIDccYEA1JOaVeYSQDCW04MdS2EUvqpPZ1qHgbINVGvoNvJWg5SDWJLyK+L90p
 OGLjTRphFzcSW0cvciDoxuNBngPsDT48nAIO9N/U9kUZtNPvPT4M5K/pAdW7QtCdK8
 m6bxLvyuCa95XO4QocM8ml06N0jTjrmTmsailTdo=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 20:16:31 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf] codecs/rt5672: Remove Intel SST specific
 HeadsetMic workaround
To: Hans de Goede <hdegoede@redhat.com>
References: <20210209210101.76119-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c48e825a-586d-34d9-f2f3-22bbf53903c2@perex.cz>
Date: Thu, 11 Feb 2021 20:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209210101.76119-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Dne 09. 02. 21 v 22:01 Hans de Goede napsal(a):
> There used to be an issue with the HeadsetMic on BYT devices with
> a rt5672 codec only being recorded on the left channel, while the
> right channel recorded silence.
> 
> The ucm2/codecs/rt5672/HeadsetMic.conf contains a workaround for
> this which changes the SST record-stream demuxer settings to
> use "slot 0" for both the left and right channels when recording
> from the HeadsetMic.
> 
> There are 2 problems with this workaround:
> 
> 1. It uses SST specific mixer settings causing things to break
> when using the SOF driver.
> 
> 2. Files under uc2m/codecs should be architecture agnostic and should
> not depend on platform dependent mixer settings such as the SST driver
> mixer settings.
> 
> The problem which the workaround used to work around has since been
> fixed in the kernel by switching the wire format from TDM/DSP A to I2S:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ceb8a36d023d4bb4ffca3474a452fb1dfaa0ef2
> 
> This fix has landed in 5.8 and has been backported to all recent
> stable kernel releases.
> 
> Since this is fixed in the kernel now, we can drop the workaround,
> fixing the 2 problems mentioned above.
> 
> This was tested on a ThinkPad 8 tablet, which is the same device as
> where the HeadsetMic problem was originally noticed.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The patch was applied to the alsa-ucm-conf repository.

					Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
