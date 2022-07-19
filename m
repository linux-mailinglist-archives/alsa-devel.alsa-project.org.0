Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D957A35F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 17:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E9A16F5;
	Tue, 19 Jul 2022 17:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E9A16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658245385;
	bh=af6hEL9HJhMbqmlQA5sdL8Og4Jpim5EEURxiEz9bkJI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Locvqkp4FD1bNVLUKRUr6SWXFnrluY6ZtRMAbk+KeGm5RodRLwurHBNpQdQgPpr/5
	 KKhSiuM99+pgLISwjWrITMcX/+q+47YhKkTOR+aNEec+By+/0P+7AVPDiGJf7MCjKv
	 5Wd+WFuQWb28aX8u95zPGWnkmRr3zNDh8THGmlsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAC7F80224;
	Tue, 19 Jul 2022 17:42:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CC11F801EC; Tue, 19 Jul 2022 17:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DBC7F80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 17:41:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 46DC5A003F;
 Tue, 19 Jul 2022 17:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 46DC5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1658245316; bh=jssVzMeaCJcQDwD4u3tZ8207RFaqTSc9M9ptu2f+vCI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FMWvYpBirh9cFBmm40mf+DsZ4mt75fcCz8owBBKedUD9xf30twBsJgTb/g01nCGBu
 MSRwrrt/7h0QbRNFU+IJs4nX4OCdRFCw0FDzGFebvjGcyy/Po3KE0+0UbJy4MINS+w
 Mhlv391yX544o35qth9i6KnSyhKK27lOjJrc8Y8c=
Received: from [192.168.88.20] (unknown [95.168.116.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Jul 2022 17:41:49 +0200 (CEST)
Message-ID: <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
Date: Tue, 19 Jul 2022 17:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, tiwai@suse.com
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220719144753.252231-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
> On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
> light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
> topology: use new sound control LED layer").
> 
> The micmute LED itself is still working via sysfs, but it doesn't follow
> mute anymore. That's because unlike vendors like Dell and Lenovo, HP
> laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
> laptops, both SOF and HDA create captures with
> SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
> there are two different kcontrols and one of them is not muted.

It does not mean that it's a wrong behavior. When both controls are muted, the
LED should be turned on. It just requires that all inputs are off (and it may
be the default - probably we can set in UCM or so). If you turn the "Capture
Switch" off in amixer / alsamixer, do things work as expected ?

> So skip creating captures for HDA when it's called from SOF, the
> captures are already handled by SOF.

The capture controls are for other inputs like external analog microphone. If
it is required to suppress the MIC LED for some hardware, just skip the
"spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
"codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
if the topology really sets the MIC LED flag.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
