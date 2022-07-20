Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54257AD5B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E89B1731;
	Wed, 20 Jul 2022 03:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E89B1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658281622;
	bh=pt9hzlS8agplNwuILzDWs5Mwh98qqKQeAP5Ea0ub4y8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DywgRBnAvPpojQ3YEUQ4b3x+YqYBdMNv2vj8QQQZlm+m3VJ2F+npaIfp3Da4Un1oS
	 QWpPlOhcF+ObmegWMnABUBJh0HzOCPuNaGAho8SrEC3DX1vGQJERKO+THvTEh8Qk1+
	 ZGnRbbPajdMp8cd1xdssDLZCyHik35cahuLzf1l8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 804BAF80118;
	Wed, 20 Jul 2022 03:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A08F80169; Wed, 20 Jul 2022 03:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68CC8F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68CC8F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="S8sFopAr"
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7A3B13F12B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658281551;
 bh=iOuR3EM03nrpsetThLhUXGtVu7Isu8s8xoqrJT0diWs=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=S8sFopArTZPAyTLnBlNI6k/vuVZRO7LQJ4L0ICto3DzdWeDPZKM8kTtt3cx+s1c7Q
 lGDN+mBNFyObzSMaVmbvkeBa7ONQHMnNetmXsJ7mTdis5MUHQ4HqjTOv1O2GqlXM/5
 eGn1+fMbN1oj6StCdkXBHz9myw+iKYgi0eskz65SnJOLvK67cHRI1AzM5GEEKfKZ5o
 YqE3J/VBgY6by+TFQfJ4+XoydyPfmyyQepewmZxODwao6rLF0drhWTreN4yMzccOeS
 WxE5oIS7nAoaFWDi3ww980KLbKgEa/x9V78FXptVXaeg4G54uWR4sOxh2JFRTohgdC
 60QE3OdLJNTBQ==
Received: by mail-oi1-f200.google.com with SMTP id
 i128-20020acaea86000000b00335a8dbcdd7so3687174oih.19
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 18:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOuR3EM03nrpsetThLhUXGtVu7Isu8s8xoqrJT0diWs=;
 b=UtJ4mrpMWDuoj+h4KuB0kUCImajjcjfgdVWscEuNVR/iC78v+pAbQYEedj6KxRwP5/
 DV/XGIig503YH5/Nx1SAy89nMNrEzYyQJhUFyZAo3LjdYK4C1cRcFdBch6SsEA5Mlo1y
 MMM4onVj2zrGsftuEPvF3X+DZlhHvd/W0rn8t8hFdiuDjsA/DV5kyYzyRYYAoFN2hE90
 H9Qe24J7llQ2dc+LQNL/dQBc06tJCpPUT4WgyjDLckptNa8f45Jxo5Xq8V1J/C1AZOqj
 9V54u1gM2cuQoVAaanAcfvCTk7fXfeOUmahaTAX5HVUn9usgc/4HNlpcsF7PyGnWCXqj
 UDPw==
X-Gm-Message-State: AJIora/oaLKXXbP3EFyfeXySr/T9R81uwwEPn/5Unmm7HiIp8mxbcP+V
 rO6g3daMdgSg60hcsItFo7HIipr5/5xpRrX6iMD3UtfmvTMqtlFo1/tOMOOEN39o5b2K5YvC6CI
 EOmx1tQsXrWvC3OjU+NJgSmRTBi71Avu4itjGEI9wUO+BLxXQLVklH7MN
X-Received: by 2002:a05:6808:1643:b0:335:19ba:b696 with SMTP id
 az3-20020a056808164300b0033519bab696mr1182861oib.42.1658281550363; 
 Tue, 19 Jul 2022 18:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkqVMnvlcjLzvddK7hpCOREpVXa/YHDQEvQpn434ZWcGkUjDvObTxsU7wR38MQurF9rMrutmsOZ9CbmJ5gYNU=
X-Received: by 2002:a05:6808:1643:b0:335:19ba:b696 with SMTP id
 az3-20020a056808164300b0033519bab696mr1182847oib.42.1658281549971; Tue, 19
 Jul 2022 18:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
 <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
In-Reply-To: <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 20 Jul 2022 09:45:37 +0800
Message-ID: <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Tue, Jul 19, 2022 at 11:41 PM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
> > On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
> > light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
> > topology: use new sound control LED layer").
> >
> > The micmute LED itself is still working via sysfs, but it doesn't follow
> > mute anymore. That's because unlike vendors like Dell and Lenovo, HP
> > laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
> > laptops, both SOF and HDA create captures with
> > SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
> > there are two different kcontrols and one of them is not muted.
>
> It does not mean that it's a wrong behavior. When both controls are muted, the
> LED should be turned on. It just requires that all inputs are off (and it may
> be the default - probably we can set in UCM or so). If you turn the "Capture
> Switch" off in amixer / alsamixer, do things work as expected ?

Yes. When all captures are muted the micmute LED is on.

>
> > So skip creating captures for HDA when it's called from SOF, the
> > captures are already handled by SOF.
>
> The capture controls are for other inputs like external analog microphone. If
> it is required to suppress the MIC LED for some hardware, just skip the
> "spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
> "codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
> if the topology really sets the MIC LED flag.

AFAIK the external analog microphone on DMIC laptop is driven by SOF driver too.
If those capture controls are indeed needed for external analog mics,
use UCM to mute them by default won't work either.

Skip "mic_mute_led = 1" can be hard because it's still needed for legacy HDA.
If checking "HDA_DEV_ASOC" isn't sufficient, is it possible to just
check "card" in snd_ctl_led_set_state(), instead of kcontrols?
I think it's reasonable to assume a card has just one speaker LED and
one microphone LED.

Kai-Heng

>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
