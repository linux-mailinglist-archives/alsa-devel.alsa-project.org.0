Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733022F93E1
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F73014E;
	Sun, 17 Jan 2021 17:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F73014E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899998;
	bh=QIARP/XJSXJsRzWVeZcGiHW9m07X7T+1vBBjiZ3bsEI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOwTzk3LA9NCPTEdFwZwxhwp3wC0hfygKGQiuaZLrtXPKlJwBy6MJhhtC1lAyisuD
	 EmzQL33UoTmxqicF0xSXWlQTGa4iS7iCR+Cfw8MzFupm7pMw8MkbmD9MOPOFio/tCc
	 MlyFu0l7komG93Upy4vz+n2xk6DDITvZBMOGDkFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29DD1F802BE;
	Sun, 17 Jan 2021 17:09:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0490F80273; Sun, 17 Jan 2021 17:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DE3BF80255
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE3BF80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FRL8mSbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BHqYYpv5izZDrCDuNWU8fEuBbo3P2tnlDGx6w7LRIo=;
 b=FRL8mSbEPwvSNXd3gxU9dGja3YN5VGr7iwhRk0ulZBAzrGam728U/Bfvlv/pXuN/qFv44a
 XnA7AyKNCf0AhRdARtA0CXVCtyDWVdkb2XHydA2BlTcAIZhiN3o/4j1Xeu9MJ9oU02Lal9
 A879z/2ci698maMQ6eV+zoB+iVkRDh4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-J4h2LOYpP_yJUHDWLMOz7A-1; Sun, 17 Jan 2021 11:09:23 -0500
X-MC-Unique: J4h2LOYpP_yJUHDWLMOz7A-1
Received: by mail-ed1-f69.google.com with SMTP id y6so4729736edc.17
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 08:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8BHqYYpv5izZDrCDuNWU8fEuBbo3P2tnlDGx6w7LRIo=;
 b=EtKVqVbdQctRpHFdxcGvvs9vLHlXYt6Fc+Vm59w+qmXvZa1JMVtM8i66Q+8YVWMZ8v
 UREEMI6SonjBteNFmrDsWvp+VqczUygLURpidzeSbGwl1CczimIAH/hFVEigPG8d51uB
 +EJAaGctnC2e2M5grVHtTCPGxWQOtzHYCCCw3iChulmthJm1LeZHfGjD1ykLKhaRGK7L
 fqQRvLehG5cC46qZgKumtft9iQjkxzStAzgo9Gjp+nYjpVXf8haHEGRyFon2hoEL6mxB
 8kZzQLde55JPT9+rtpBpS7USH64lyra0fGXPy++CdxYelmwzE2oKA79RUmyL6rvscAcu
 ScfQ==
X-Gm-Message-State: AOAM532TYrvgZOXWbPdiXxeQOPgsZj31RDkrFPHSrClbyx64iMWU9hIM
 6izi1Lmp2ON6m7WiNCEZttorAGxX9HwCd73KDNo6Qpu7Rx4/e4Te7EbxbVCXOk1LC2xGLaZhduH
 KGXhbssoVK+pdY3eCwPXyJe5qBPWKi/bENeN6b+UmZazTGNcdZCHkPY2aa8we5OJs7dMroRTfJu
 8=
X-Received: by 2002:aa7:db82:: with SMTP id u2mr14717917edt.179.1610899762189; 
 Sun, 17 Jan 2021 08:09:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+dZ921yMJKWSLUMl9S8OawGKblX9UHh/WHs8tZGCd/GYOVC7uTc5KzokasU7hMrsTORZaXw==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr14717902edt.179.1610899761962; 
 Sun, 17 Jan 2021 08:09:21 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id fi14sm8407511ejb.53.2021.01.17.08.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 08:09:21 -0800 (PST)
Subject: Re: [PATCH alsa-ucm-conf 1/3] chtnau8824: Move DAC Channel Source
 selection to Speaker/Headphones EnableSeq
To: Jaroslav Kysela <perex@perex.cz>
References: <20201216153838.34945-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7c075e59-8576-99e9-3688-1ab858e59716@redhat.com>
Date: Sun, 17 Jan 2021 17:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216153838.34945-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
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

Hi,

On 12/16/20 4:38 PM, Hans de Goede wrote:
> Move DAC Channel Source selection to Speaker/Headphones EnableSeq.
> 
> The main reason for doing this is to make it easier to allow using
> variables, as the Speaker/Headphones conf files are evaluated after
> the main HiFi.conf had a chance to set them.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

ping? It would be nice to get this series merged for proper SOF
support.

Maybe this got confused with my other UCM chtnau8824 series which
I send 10 days before this one? That one did get merged, but this
is a different series.

Regards,

Hans



> ---
>  ucm2/codecs/nau8824/EnableSeq.conf   | 3 ---
>  ucm2/codecs/nau8824/HeadPhones.conf  | 2 ++
>  ucm2/codecs/nau8824/MonoSpeaker.conf | 2 ++
>  ucm2/codecs/nau8824/Speaker.conf     | 2 ++
>  4 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/ucm2/codecs/nau8824/EnableSeq.conf b/ucm2/codecs/nau8824/EnableSeq.conf
> index 3650d06..2595e5f 100644
> --- a/ucm2/codecs/nau8824/EnableSeq.conf
> +++ b/ucm2/codecs/nau8824/EnableSeq.conf
> @@ -1,7 +1,4 @@
>  EnableSequence [
> -	# Playback TDM configuration
> -	cset "name='DACL Channel Source' 0"
> -	cset "name='DACR Channel Source' 1"
>  	# Input Configuration
>  	cset "name='DMIC1 Enable Switch' off"
>  	cset "name='DMIC2 Enable Switch' off"
> diff --git a/ucm2/codecs/nau8824/HeadPhones.conf b/ucm2/codecs/nau8824/HeadPhones.conf
> index a807f84..46ec5d7 100644
> --- a/ucm2/codecs/nau8824/HeadPhones.conf
> +++ b/ucm2/codecs/nau8824/HeadPhones.conf
> @@ -12,6 +12,8 @@ SectionDevice."Headphones" {
>  	]
>  
>  	EnableSequence [
> +		cset "name='DACL Channel Source' 0"
> +		cset "name='DACR Channel Source' 1"
>  		cset "name='Headphone Switch' on"
>  	]
>  
> diff --git a/ucm2/codecs/nau8824/MonoSpeaker.conf b/ucm2/codecs/nau8824/MonoSpeaker.conf
> index 6b4ef8a..09edea5 100644
> --- a/ucm2/codecs/nau8824/MonoSpeaker.conf
> +++ b/ucm2/codecs/nau8824/MonoSpeaker.conf
> @@ -11,6 +11,8 @@ SectionDevice."Speaker" {
>  	]
>  
>  	EnableSequence [
> +		cset "name='DACL Channel Source' 0"
> +		cset "name='DACR Channel Source' 1"
>  		# nau8824 mono speaker boards have the speaker on the right chan
>  		cset "name='Speaker Left DACL Volume' 0"
>  		cset "name='Speaker Left DACR Volume' 0"
> diff --git a/ucm2/codecs/nau8824/Speaker.conf b/ucm2/codecs/nau8824/Speaker.conf
> index a995873..64d7eee 100644
> --- a/ucm2/codecs/nau8824/Speaker.conf
> +++ b/ucm2/codecs/nau8824/Speaker.conf
> @@ -11,6 +11,8 @@ SectionDevice."Speaker" {
>  	]
>  
>  	EnableSequence [
> +		cset "name='DACL Channel Source' 0"
> +		cset "name='DACR Channel Source' 1"
>  		cset "name='Speaker Left DACL Volume' 1"
>  		cset "name='Speaker Left DACR Volume' 0"
>  		cset "name='Speaker Right DACL Volume' 0"
> 

