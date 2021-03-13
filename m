Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C2339E01
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 13:12:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4F71901;
	Sat, 13 Mar 2021 13:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4F71901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615637525;
	bh=YdCZpoVXzBIt9QIWCJscGLnBiYW7c9GQ5cyb7HuM+v4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEgjv+Fzzruwx8tacNWM30mRJzUQW713nEG6WzoySkyphmwTVpx9tiY7ixO3Ytryr
	 hWuN0usRQNkIhiWPqfp7HabnaIwGEvI8rrlnv66E6Ibi3/HCevt+3lHFVaxda37pEM
	 EXFoUYYuyA5ANzmDXlkSeOb85Ov1BfTFfy36O5Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9663BF80256;
	Sat, 13 Mar 2021 13:10:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F285DF80227; Sat, 13 Mar 2021 13:10:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF251F80148
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 13:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF251F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bb8jb3PA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615637427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1TNOI0fDhSMNlmYWaAdI+ORAeIT3TuvCkbJRtDjxh0=;
 b=bb8jb3PAMr66RtxmIpOJlOruv/haXhPsI/c9Ib+SMx7D/H2bXl6cxwu1khMCH50D7/XEcU
 K9lSKS4LczCLXhdpCBaZLYyWiZcT+j9iGImn3uT8EHltpkT6kfHjyOQ7reytombYTwLvbJ
 LCi3SAuXHfB80zW6pHPA9zDgcZTjOKs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-_jLqaJA7Mf2-_iSgLZ9flQ-1; Sat, 13 Mar 2021 07:10:25 -0500
X-MC-Unique: _jLqaJA7Mf2-_iSgLZ9flQ-1
Received: by mail-ed1-f72.google.com with SMTP id o24so13027749edt.15
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 04:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p1TNOI0fDhSMNlmYWaAdI+ORAeIT3TuvCkbJRtDjxh0=;
 b=TezfMJUlZMOJ+d0DspB7SKZBpFjviEzDWH4W0DhoLoyU61otTNpKejvpBvw/72ULp1
 N5eC5wbCWShGe2QIbjecqSoZSNQKYhTLNMCQzK4y3HpL01I6o6I9b6a9RB9E4XVRJx9D
 5yhvzr03eediigpvIq0O0DIIsXf+op77x2YOMl2fsKReb0FsMgKEVUTaVdCv5o5a20Ph
 LAAQvZha0b2/UVxfZqRzME7/TwksxotmpUOB5FKa/Jo82LP9fx0l/KAy4DxsA/R/CbrG
 UpXlMutIq/HCZHobY1gUCUVEdhkF5CdeNP/XUtuD4Es54dY6LL4CDQEz/te3PbSPexDM
 YlFg==
X-Gm-Message-State: AOAM531Wqo9YY1bCwqMnZuNUFCUAGrP0BZ2Y/tRmXpll2WkEJWBmsrY0
 /9c9XvExPVYCkENEmrMkYL7UT1TEkH9a4hdN23MfxN31/gfIHrH01/EIIuSAPWwOBzs483a9Vbl
 DLzWzJjZWn34gk54DUH+TEhVniF2PN+oYHO3X/fcQs3w1Ofc8Mrq/NBtPrXQWkPbqmgvmFXIoFI
 c=
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr13232839ejz.249.1615637423524; 
 Sat, 13 Mar 2021 04:10:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDoUMzTYsZ6IzNq9nSlH0ZElnkwaOThWjhpKlB44PZAiPZ91f82C5P7szmmkKC8oMxlS9KWg==
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr13232821ejz.249.1615637423308; 
 Sat, 13 Mar 2021 04:10:23 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id p3sm3979802ejd.7.2021.03.13.04.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 04:10:22 -0800 (PST)
Subject: Re: [PATCH alsa-ucm-conf v2 7/7] codecs/rt5640: Specify
 Playback/CaptureMasterElem for HW volume-control
To: Jaroslav Kysela <perex@perex.cz>
References: <20210308220554.76111-1-hdegoede@redhat.com>
 <20210308220554.76111-8-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <784b0a8e-7308-9b08-c751-4f8571576c13@redhat.com>
Date: Sat, 13 Mar 2021 13:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308220554.76111-8-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Hi,

On 3/8/21 11:05 PM, Hans de Goede wrote:
> Newer kernels add "aif:1" or "aif:2" to the components string to let
> us know which AIF is being used.
> 
> Use this to specify the correct Playback/CaptureMasterElem for HW
> volume-control, based on which AIF is being used.
> 
> On older kernels, where there is no "aif:%d" string in the components
> string, no Playback/CaptureMasterElem is specified.
> 
> In DigitalMics.conf the master mixer is used as regular CaptureMixerElem
> instead of as CaptureMasterElem since the DMICs don't have any analog
> volume control.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

The kernel side of this patch has landed now, so this patch can
be merged now.

Thanks & Regards,

Hans


> ---
>  ucm2/bytcr-rt5640/HiFi.conf             | 21 +++++++++++++++++++++
>  ucm2/codecs/rt5640/DigitalMics.conf     | 16 ++++++++++++++++
>  ucm2/codecs/rt5640/HeadPhones.conf      | 12 ++++++++++++
>  ucm2/codecs/rt5640/HeadsetMic.conf      | 12 ++++++++++++
>  ucm2/codecs/rt5640/IN1-InternalMic.conf | 12 ++++++++++++
>  ucm2/codecs/rt5640/IN3-InternalMic.conf | 12 ++++++++++++
>  ucm2/codecs/rt5640/MonoSpeaker.conf     | 12 ++++++++++++
>  ucm2/codecs/rt5640/Speaker.conf         | 12 ++++++++++++
>  8 files changed, 109 insertions(+)
> 
> diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
> index a5c05ba..7d504d1 100644
> --- a/ucm2/bytcr-rt5640/HiFi.conf
> +++ b/ucm2/bytcr-rt5640/HiFi.conf
> @@ -1,5 +1,26 @@
>  # Use case Configuration for bytcr-rt5640
>  
> +Define.HaveAif1 ""
> +Define.HaveAif2 ""
> +
> +If.DefineAif1 {
> +	Condition {
> +		Type String
> +		Haystack "${CardComponents}"
> +		Needle "aif:1"
> +	}
> +	True.Define.HaveAif1 "yes"
> +}
> +
> +If.DefineAif2 {
> +	Condition {
> +		Type String
> +		Haystack "${CardComponents}"
> +		Needle "aif:2"
> +	}
> +	True.Define.HaveAif2 "yes"
> +}
> +
>  SectionVerb {
>  	Include.e.File "/codecs/rt5640/EnableSeq.conf"
>  
> diff --git a/ucm2/codecs/rt5640/DigitalMics.conf b/ucm2/codecs/rt5640/DigitalMics.conf
> index 157c544..032d954 100644
> --- a/ucm2/codecs/rt5640/DigitalMics.conf
> +++ b/ucm2/codecs/rt5640/DigitalMics.conf
> @@ -26,5 +26,21 @@ SectionDevice."Mic" {
>  	Value {
>  		CapturePriority 100
>  		CapturePCM "hw:${CardId}"
> +		If.DmicAif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				CaptureMixerElem "ADC"
> +				CaptureVolume "ADC Capture Volume"
> +				CaptureSwitch "ADC Capture Switch"
> +			}
> +		}
> +		If.DmicAif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				CaptureMixerElem "Mono ADC"
> +				CaptureVolume "Mono ADC Capture Volume"
> +				CaptureSwitch "Mono ADC Capture Switch"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
> index 5535111..4fbe95d 100644
> --- a/ucm2/codecs/rt5640/HeadPhones.conf
> +++ b/ucm2/codecs/rt5640/HeadPhones.conf
> @@ -37,5 +37,17 @@ SectionDevice."Headphones" {
>  		JackControl "Headphone Jack"
>  		PlaybackMixerElem "HP"
>  		PlaybackVolume "HP Playback Volume"
> +		If.HpAif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				PlaybackMasterElem "DAC1"
> +			}
> +		}
> +		If.HpAif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				PlaybackMasterElem "DAC2"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/HeadsetMic.conf b/ucm2/codecs/rt5640/HeadsetMic.conf
> index 8479672..b49dad4 100644
> --- a/ucm2/codecs/rt5640/HeadsetMic.conf
> +++ b/ucm2/codecs/rt5640/HeadsetMic.conf
> @@ -43,5 +43,17 @@ SectionDevice."Headset" {
>  		JackControl "Headset Mic Jack"
>  		CaptureMixerElem "IN2 Boost"
>  		CaptureVolume "IN2 Boost"
> +		If.HSmicAif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				CaptureMasterElem "ADC"
> +			}
> +		}
> +		If.HSmicAif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				CaptureMasterElem "Mono ADC"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/IN1-InternalMic.conf b/ucm2/codecs/rt5640/IN1-InternalMic.conf
> index a317388..d670484 100644
> --- a/ucm2/codecs/rt5640/IN1-InternalMic.conf
> +++ b/ucm2/codecs/rt5640/IN1-InternalMic.conf
> @@ -34,5 +34,17 @@ SectionDevice."Mic" {
>  		CapturePCM "hw:${CardId}"
>  		CaptureMixerElem "IN1 Boost"
>  		CaptureVolume "IN1 Boost"
> +		If.In1Aif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				CaptureMasterElem "ADC"
> +			}
> +		}
> +		If.In1Aif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				CaptureMasterElem "Mono ADC"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/IN3-InternalMic.conf b/ucm2/codecs/rt5640/IN3-InternalMic.conf
> index ef4eaba..345db1e 100644
> --- a/ucm2/codecs/rt5640/IN3-InternalMic.conf
> +++ b/ucm2/codecs/rt5640/IN3-InternalMic.conf
> @@ -34,5 +34,17 @@ SectionDevice."Mic" {
>  		CapturePCM "hw:${CardId}"
>  		CaptureMixerElem "IN3 Boost"
>  		CaptureVolume "IN3 Boost"
> +		If.In3Aif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				CaptureMasterElem "ADC"
> +			}
> +		}
> +		If.In3Aif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				CaptureMasterElem "Mono ADC"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/MonoSpeaker.conf b/ucm2/codecs/rt5640/MonoSpeaker.conf
> index 3cbeafd..addaddd 100644
> --- a/ucm2/codecs/rt5640/MonoSpeaker.conf
> +++ b/ucm2/codecs/rt5640/MonoSpeaker.conf
> @@ -31,5 +31,17 @@ SectionDevice."Speaker" {
>  		PlaybackPCM "hw:${CardId}"
>  		PlaybackMixerElem "Speaker"
>  		PlaybackVolume "Speaker Playback Volume"
> +		If.MonoSpkAif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				PlaybackMasterElem "DAC1"
> +			}
> +		}
> +		If.MonoSpkAif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				PlaybackMasterElem "DAC2"
> +			}
> +		}
>  	}
>  }
> diff --git a/ucm2/codecs/rt5640/Speaker.conf b/ucm2/codecs/rt5640/Speaker.conf
> index 0924f9c..e7ff673 100644
> --- a/ucm2/codecs/rt5640/Speaker.conf
> +++ b/ucm2/codecs/rt5640/Speaker.conf
> @@ -31,5 +31,17 @@ SectionDevice."Speaker" {
>  		PlaybackPCM "hw:${CardId}"
>  		PlaybackMixerElem "Speaker"
>  		PlaybackVolume "Speaker Playback Volume"
> +		If.SpkAif1 {
> +			Condition { Type String Empty "${var:HaveAif1}" }
> +			False {
> +				PlaybackMasterElem "DAC1"
> +			}
> +		}
> +		If.SpkAif2 {
> +			Condition { Type String Empty "${var:HaveAif2}" }
> +			False {
> +				PlaybackMasterElem "DAC2"
> +			}
> +		}
>  	}
>  }
> 

