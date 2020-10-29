Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFD29EE80
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 15:39:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611D715DC;
	Thu, 29 Oct 2020 15:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611D715DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603982380;
	bh=ONSmfHgKYnjawTiZIARg1OX0i1sG0xDrmDSxXXDgcoc=;
	h=From:Date:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cx4Rl2PrPn4GnOVzL+6w573koeJaM4pEtpSOBNaFjVSh5Riv/Y5H/Ujm/IDcrELDF
	 63ljEXI+Jfqhsv3KJ04mjrINYBQPdT8zCD7sadLg8Np8J0U8Q1R0p9nIanGRJ1EFp+
	 TJRKIS02S2UOpgQkOGa93VgN/7Qx4Gny1ZPPQjxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DBAF80217;
	Thu, 29 Oct 2020 15:38:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0ECFF8020D; Thu, 29 Oct 2020 15:38:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852BEF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 15:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852BEF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tLPZY9nw"
Received: by mail-pg1-x542.google.com with SMTP id n16so2479983pgv.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0Vvgyk1ppIl/T/Eqmf3bzsBqm8UMHTtFA399dLy7jnw=;
 b=tLPZY9nwXhcpd/xxtFYpqk6+OT07X0f6Mzrac2gOvCqy5sy+oS5cWATMj8lsHkzwmf
 YjfcQuuJusTCFNrj9jBIZQWiaZdehlPuE+hW5xLqx+mh1zXzZUGRCMr2NXfeYPdtWgva
 Rt2Vou75O1jTuhNn6ecWzShtlapwrNobwXIwuSpKO7cMyq0GHug2DcMAHkYa5pRpwitK
 Ti6pfoZOw8oJnrC0cLip+eisDkW9lX+sUcsYwn3SO0Q3CPqm8AHXS89+qhnc/m8e71Ce
 Y5ogELfnBPTtAogFMGWVWtpj0BD+1lCAfYadugTEK3GpGG1iuE13GuXBZRThShsLCeOB
 PJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Vvgyk1ppIl/T/Eqmf3bzsBqm8UMHTtFA399dLy7jnw=;
 b=RWVr+j/B4SMaqbs1oeRRS/xNbrDkEhBClVfTXrX2IscIpyp/0F2PDIWCMIrfvp3mUK
 N8GahEO9w5rvmIFufbPi8Rm2MKlQ1ozkXNHCPuLS6DYLPCAMM+G+xl0WBovuHKoPx+E5
 h8Vk7HfpSJkJqbuUQINlT//7xfSOrgR3yfM8bqBmVCuBvDudz68tbDDl9QwKMbsyOz2B
 BonsxNS1j5UZaCL4Ey8mxtcx158KMDpiflZr7RTuZawwRk9pLFpQpoxFmwPNWusDdSMC
 QllgUg+l02QFsSCB0HWBjgPRfQJCzMhpKO0QdS/zC5VmYr3nE8D32Tp+NPfYT/5zkKPT
 yIZw==
X-Gm-Message-State: AOAM532fvg+kpzqldNRuhIq5dptKi6RhMOSY4mrIpse0oeizv5K4KOo0
 8D7o+/fLHpuPqVQDSBBIzfQ=
X-Google-Smtp-Source: ABdhPJzGPd8hJFVyCMC6l8+84XZ7S8EheBEuBNB6VAubzL2xAL75DMWRxdy5cR93MwHqyfMe4MzdfA==
X-Received: by 2002:a62:5213:0:b029:164:97aa:b672 with SMTP id
 g19-20020a6252130000b029016497aab672mr4448913pfb.15.1603982279695; 
 Thu, 29 Oct 2020 07:37:59 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id k9sm3160208pfi.188.2020.10.29.07.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 07:37:59 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 29 Oct 2020 22:37:33 +0800
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 01/25] ALSA: core: pcm: remove unnecessary CONFIG_PM_SLEEP
Message-ID: <20201029143733.d53pu2ri5ykqlff2@Rk>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
 <s5hpn51wjyw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5hpn51wjyw.wl-tiwai@suse.de>
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, Oct 29, 2020 at 08:48:55AM +0100, Takashi Iwai wrote:
>On Thu, 29 Oct 2020 08:42:37 +0100,
>Coiby Xu wrote:
>>
>> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>
>It caused compile warnings.  Was it already addressed in general?
>
It hasn't been addressed in general. Thank you for the reminding!

>Or we may use __maybe_unused attribute instead, but it's just a matter
>of taste.
>
I'll add __maybe_unused in v2 since __maybe_unused should be preferred over
CONFIG_PM_SLEEP according to Arnd Bergmann [1],

> > By and large, drivers handle this by using a CONFIG_PM_SLEEP ifdef.
> >
> > Unless you can make an extremely convincing argument why not to do
> > so here, I'd like you to handle it that way instead.
>
> [adding linux-pm to Cc]
>
> The main reason is that everyone gets the #ifdef wrong, I run into
> half a dozen new build regressions with linux-next every week on
> average, the typical problems being:
>
> - testing CONFIG_PM_SLEEP instead of CONFIG_PM, leading to an unused
>   function warning
> - testing CONFIG_PM instead of CONFIG_PM_SLEEP, leading to a build
>   failure
> - calling a function outside of the #ifdef only from inside an
>   otherwise correct #ifdef, again leading to an unused function
>   warning
> - causing a warning inside of the #ifdef but only testing if that
>   is disabled, leading to a problem if the macro is set (this is
>   rare these days for CONFIG_PM as that is normally enabled)
>
> Using __maybe_unused avoids all of the above.

[1] https://lore.kernel.org/patchwork/comment/919944/
>
>thanks,
>
>Takashi
>
>> ---
>>  sound/core/pcm.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
>> index be5714f1bb58..5a281ac92958 100644
>> --- a/sound/core/pcm.c
>> +++ b/sound/core/pcm.c
>> @@ -599,7 +599,6 @@ static const struct attribute_group *pcm_dev_attr_groups[];
>>   * PM callbacks: we need to deal only with suspend here, as the resume is
>>   * triggered either from user-space or the driver's resume callback
>>   */
>> -#ifdef CONFIG_PM_SLEEP
>>  static int do_pcm_suspend(struct device *dev)
>>  {
>>  	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
>> @@ -608,7 +607,6 @@ static int do_pcm_suspend(struct device *dev)
>>  		snd_pcm_suspend_all(pstr->pcm);
>>  	return 0;
>>  }
>> -#endif
>>
>>  static const struct dev_pm_ops pcm_dev_pm_ops = {
>>  	SET_SYSTEM_SLEEP_PM_OPS(do_pcm_suspend, NULL)
>> --
>> 2.28.0
>>

--
Best regards,
Coiby
