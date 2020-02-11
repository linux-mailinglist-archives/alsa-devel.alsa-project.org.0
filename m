Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05530159487
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:12:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25E91699;
	Tue, 11 Feb 2020 17:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25E91699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437567;
	bh=BP58NeAUsRvF+lIiyjpSCs29gvt48JN7hdAlnN6cSeY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luDcp73WR1G6ba9YU8paHFQim0rmx0BsV35r6B7Hs1/JFD3wHc5WzvCegr0RDW3Uq
	 xLJT/S5t6wuZZxKUpzyIL7HiqYFbKxUsgvQXY3jqrkNtijqz9Hv7vH5jJ6paoBD57V
	 QVchKjJWbGtxJ6jA2XNCF+DQIr3rlwzUCZ4/KeJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08145F80147;
	Tue, 11 Feb 2020 16:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A114BF80146; Tue, 11 Feb 2020 16:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E38F4F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38F4F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="EE85IQzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581436545;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=t90jt6sVN6dP7YrNRSr6MqJ/756QVI2zfknSDoTdYWg=;
 b=EE85IQzy3skzlFJ4raPs6mDPXkZ9NYLo4aTfxlv4zV08OIr8LYSC3Ka8aik/lu4kSD
 aQ5Ot6nVVVTkmbmkJ/F+0/rN2lHilaJYaKcS8TVUoFOFP2472gP6vSXr4awh49YLZGyj
 j73tovVGi9gSJunQzLOS8oHdRYs0AUmwIyiOIt4aVaZjBEutZ95Yk47NJw98dceg0zXE
 dsxE3I37OPcX2dXBqx8eU1U03YXPG73MyC13grEZDOB4ZLOFs5J2QrlqixWu8l3wPdtb
 FTarp/3ruvVGPh0CUI/lSK1EQYmDUA+6LaRprXlMQBm1VkURXh7hGSlAbJKPHGsk5BQi
 7xSg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4oHeF5+SwHE="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id a01fe9w1BFti6Cy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Feb 2020 16:55:44 +0100 (CET)
Date: Tue, 11 Feb 2020 16:55:37 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200211155537.GA16850@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
 <20200114112110.51983-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114112110.51983-3-stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH alsa-ucm-conf 2/7] DB410c: Split devices
 into re-usable fragments in codecs/msm8916-wcd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Tue, Jan 14, 2020 at 12:21:05PM +0100, Stephan Gerhold wrote:
> The DB410c use case configuration is also useful for other MSM8916 devices.
> 
> However, the available devices usually depend on the exact device model.
> For example, DB410c has nothing connected to the Earpiece,
> most MSM8916 smartphones do not have a DigitalMic, and some use
> a custom speaker amplifier (connected via I2S) instead of the
> speaker amplifier provided by PM8916.
> 
> Similar differences across devices are handled using re-usable
> device fragments in the codecs/ directory. Do the same for msm8916-wcd
> and move the device fragments to codecs/msm8916-wcd.

I'm trying to rebase this patch series on top of master after the
"corrections and fixes" commits you did a few days ago.

Unfortunately one change made there breaks an assumption required for
this patch: in DB410c/HiFi.conf PlaybackPCM/CapturePCM used to be
defined globally like:

	SectionVerb {
		Value {
			# ALSA PCM device for HiFi
			PlaybackPCM "plughw:${CardId},1"
			CapturePCM "plughw:${CardId},2"
		}
	}

	<codecs/msm8916-wcd/Speaker.conf>
	/* ... */

Now it is defined separately for each SectionDevice.
This means I would need to put one specific PlaybackPCM/CapturePCM
into the device fragments added in this patch.

e.g. ucm2/codecs/msm8916-wcd/Speaker.conf would now contain

	SectionDevice."Speaker" {
		/* ... */
		Value {
			PlaybackPCM "plughw:${CardId},1"
		}
	}

This does not work properly in my case because the numbering differs
depending on which board the UCM configuration is used.

DB410c has HDMI at index 0, playback at 1 and capture at 2.
My other MSM8916 boards do not have HDMI audio, so playback is index 0
and capture is index 1.

This used to work fine because I simply had a different HiFi.conf,
e.g. msm8916-samsung-a2015/HiFi.conf looked like

	SectionVerb {
		Value {
			PlaybackPCM "plughw:${CardId},0"
			CapturePCM "plughw:${CardId},1"
		}
	}

	<codecs/msm8916-wcd/Speaker.conf>
	/* ... */

(Note the different numbers compared to DB410c/HiFi.conf above...)

Do you have any suggestions how to handle this now?

Thanks,
Stephan

> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  ucm2/DB410c/HiFi.conf                     | 128 +---------------------
>  ucm2/codecs/msm8916-wcd/DigitalMic.conf   |  12 ++
>  ucm2/codecs/msm8916-wcd/Earpiece.conf     |   8 ++
>  ucm2/codecs/msm8916-wcd/Headphones.conf   |  30 +++++
>  ucm2/codecs/msm8916-wcd/HeadsetMic.conf   |  16 +++
>  ucm2/codecs/msm8916-wcd/PrimaryMic.conf   |  14 +++
>  ucm2/codecs/msm8916-wcd/SecondaryMic.conf |  16 +++
>  ucm2/codecs/msm8916-wcd/Speaker.conf      |  20 ++++
>  8 files changed, 122 insertions(+), 122 deletions(-)
>  create mode 100644 ucm2/codecs/msm8916-wcd/DigitalMic.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/Earpiece.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/Headphones.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/HeadsetMic.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/PrimaryMic.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/SecondaryMic.conf
>  create mode 100644 ucm2/codecs/msm8916-wcd/Speaker.conf
> 
> diff --git a/ucm2/DB410c/HiFi.conf b/ucm2/DB410c/HiFi.conf
> index a0ef42c..4b82fbf 100644
> --- a/ucm2/DB410c/HiFi.conf
> +++ b/ucm2/DB410c/HiFi.conf
> @@ -13,126 +13,10 @@ SectionVerb {
>  	}
>  }
>  
> +<codecs/msm8916-wcd/Speaker.conf>
> +<codecs/msm8916-wcd/Headphones.conf>
>  
> -SectionDevice."Speaker" {
> -	Comment "Speaker playback"
> -
> -	ConflictingDevice [
> -		"Headphones"
> -		"Earpiece"
> -	]
> -
> -	EnableSequence [
> -		cset "name='SPK DAC Switch' 1"
> -		cset "name='RX3 MIX1 INP1' RX1"
> -		## gain to  0dB
> -		cset "name='RX3 Digital Volume' 128"
> -	]
> -
> -	DisableSequence [
> -		cset "name='SPK DAC Switch' 0"
> -		cset "name='RX3 MIX1 INP1' ZERO"
> -	]
> -}
> -
> -
> -SectionDevice."Headphones" {
> -	Comment "Headphones playback"
> -
> -	ConflictingDevice [
> -		"Speaker"
> -		"Earpiece"
> -	]
> -	EnableSequence [
> -		cset "name='RX1 MIX1 INP1' RX1"
> -		cset "name='RX2 MIX1 INP1' RX2"
> -		cset "name='RDAC2 MUX' RX2"
> -		cset "name='HPHL' 1"
> -		cset "name='HPHR' 1"
> -		## gain to  0dB
> -		cset "name='RX1 Digital Volume' 128"
> -		## gain to  0dB
> -		cset "name='RX2 Digital Volume' 128"
> -	]
> -
> -	DisableSequence [
> -		cset "name='RX1 Digital Volume' 0"
> -		cset "name='RX2 Digital Volume' 0"
> -		cset "name='HPHL' 0"
> -		cset "name='HPHR' 0"
> -		cset "name='RDAC2 MUX' ZERO"
> -		cset "name='RX1 MIX1 INP1' ZERO"
> -		cset "name='RX2 MIX1 INP1' ZERO"
> -	]
> -}
> -
> -SectionDevice."Earpiece" {
> -	Comment "Earpiece playback"
> -
> -	ConflictingDevice [
> -		"Speaker"
> -		"Headphones"
> -	]
> -}
> -
> -SectionDevice."HeadsetMic" {
> -	Comment "Headset Microphone"
> -
> -	EnableSequence [
> -		cset "name='DEC1 MUX' ADC2"
> -		cset "name='CIC1 MUX' AMIC"
> -		cset "name='ADC2 Volume' 8"
> -		cset "name='ADC2 MUX' INP2"
> -	]
> -
> -	DisableSequence [
> -		cset "name='ADC2 MUX' ZERO"
> -		cset "name='ADC2 Volume' 0"
> -		cset "name='DEC1 MUX' ZERO"
> -	]
> -}
> -
> -SectionDevice."PrimaryMic" {
> -	Comment "Primary Microphone"
> -
> -	EnableSequence [
> -		cset "name='DEC1 MUX' ADC1"
> -		cset "name='CIC1 MUX' AMIC"
> -		cset "name='ADC1 Volume' 8"
> -	]
> -
> -	DisableSequence [
> -		cset "name='DEC1 MUX' ZERO"
> -		cset "name='ADC1 Volume' 0"
> -	]
> -}
> -
> -SectionDevice."SecondaryMic" {
> -	Comment "Secondary Microphone"
> -
> -	EnableSequence [
> -		cset "name='DEC1 MUX' ADC2"
> -		cset "name='CIC1 MUX' AMIC"
> -		cset "name='ADC2 Volume' 8"
> -		cset "name='ADC2 MUX' INP2"
> -	]
> -
> -	DisableSequence [
> -		cset "name='DEC1 MUX' ZERO"
> -		cset "name='ADC2 Volume' 0"
> -		cset "name='ADC2 MUX' ZERO"
> -	]
> -}
> -
> -SectionDevice."DigitalMic" {
> -	Comment "Digital Microphone"
> -
> -	EnableSequence [
> -		cset "name='DEC1 MUX' DMIC1"
> -		cset "name='CIC1 MUX' DMIC"
> -	]
> -
> -	DisableSequence [
> -		cset "name='DEC1 MUX' ZERO"
> -	]
> -}
> +<codecs/msm8916-wcd/PrimaryMic.conf>
> +<codecs/msm8916-wcd/HeadsetMic.conf>
> +<codecs/msm8916-wcd/SecondaryMic.conf>
> +<codecs/msm8916-wcd/DigitalMic.conf>
> diff --git a/ucm2/codecs/msm8916-wcd/DigitalMic.conf b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
> new file mode 100644
> index 0000000..35dfb1b
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
> @@ -0,0 +1,12 @@
> +SectionDevice."DigitalMic" {
> +	Comment "Digital Microphone"
> +
> +	EnableSequence [
> +		cset "name='DEC1 MUX' DMIC1"
> +		cset "name='CIC1 MUX' DMIC"
> +	]
> +
> +	DisableSequence [
> +		cset "name='DEC1 MUX' ZERO"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/Earpiece.conf b/ucm2/codecs/msm8916-wcd/Earpiece.conf
> new file mode 100644
> index 0000000..e9f8b9d
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/Earpiece.conf
> @@ -0,0 +1,8 @@
> +SectionDevice."Earpiece" {
> +	Comment "Earpiece playback"
> +
> +	ConflictingDevice [
> +		"Speaker"
> +		"Headphones"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/Headphones.conf b/ucm2/codecs/msm8916-wcd/Headphones.conf
> new file mode 100644
> index 0000000..7a2090e
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/Headphones.conf
> @@ -0,0 +1,30 @@
> +SectionDevice."Headphones" {
> +	Comment "Headphones playback"
> +
> +	ConflictingDevice [
> +		"Speaker"
> +		"Earpiece"
> +	]
> +
> +	EnableSequence [
> +		cset "name='RX1 MIX1 INP1' RX1"
> +		cset "name='RX2 MIX1 INP1' RX2"
> +		cset "name='RDAC2 MUX' RX2"
> +		cset "name='HPHL' 1"
> +		cset "name='HPHR' 1"
> +		## gain to  0dB
> +		cset "name='RX1 Digital Volume' 128"
> +		## gain to  0dB
> +		cset "name='RX2 Digital Volume' 128"
> +	]
> +
> +	DisableSequence [
> +		cset "name='RX1 Digital Volume' 0"
> +		cset "name='RX2 Digital Volume' 0"
> +		cset "name='HPHL' 0"
> +		cset "name='HPHR' 0"
> +		cset "name='RDAC2 MUX' ZERO"
> +		cset "name='RX1 MIX1 INP1' ZERO"
> +		cset "name='RX2 MIX1 INP1' ZERO"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/HeadsetMic.conf b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
> new file mode 100644
> index 0000000..538d895
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
> @@ -0,0 +1,16 @@
> +SectionDevice."HeadsetMic" {
> +	Comment "Headset Microphone"
> +
> +	EnableSequence [
> +		cset "name='DEC1 MUX' ADC2"
> +		cset "name='CIC1 MUX' AMIC"
> +		cset "name='ADC2 Volume' 8"
> +		cset "name='ADC2 MUX' INP2"
> +	]
> +
> +	DisableSequence [
> +		cset "name='ADC2 MUX' ZERO"
> +		cset "name='ADC2 Volume' 0"
> +		cset "name='DEC1 MUX' ZERO"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/PrimaryMic.conf b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
> new file mode 100644
> index 0000000..6998458
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
> @@ -0,0 +1,14 @@
> +SectionDevice."PrimaryMic" {
> +	Comment "Primary Microphone"
> +
> +	EnableSequence [
> +		cset "name='DEC1 MUX' ADC1"
> +		cset "name='CIC1 MUX' AMIC"
> +		cset "name='ADC1 Volume' 8"
> +	]
> +
> +	DisableSequence [
> +		cset "name='DEC1 MUX' ZERO"
> +		cset "name='ADC1 Volume' 0"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
> new file mode 100644
> index 0000000..7811509
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
> @@ -0,0 +1,16 @@
> +SectionDevice."SecondaryMic" {
> +	Comment "Secondary Microphone"
> +
> +	EnableSequence [
> +		cset "name='DEC1 MUX' ADC2"
> +		cset "name='CIC1 MUX' AMIC"
> +		cset "name='ADC2 Volume' 8"
> +		cset "name='ADC2 MUX' INP2"
> +	]
> +
> +	DisableSequence [
> +		cset "name='DEC1 MUX' ZERO"
> +		cset "name='ADC2 Volume' 0"
> +		cset "name='ADC2 MUX' ZERO"
> +	]
> +}
> diff --git a/ucm2/codecs/msm8916-wcd/Speaker.conf b/ucm2/codecs/msm8916-wcd/Speaker.conf
> new file mode 100644
> index 0000000..2b1dd8a
> --- /dev/null
> +++ b/ucm2/codecs/msm8916-wcd/Speaker.conf
> @@ -0,0 +1,20 @@
> +SectionDevice."Speaker" {
> +	Comment "Speaker playback"
> +
> +	ConflictingDevice [
> +		"Headphones"
> +		"Earpiece"
> +	]
> +
> +	EnableSequence [
> +		cset "name='SPK DAC Switch' 1"
> +		cset "name='RX3 MIX1 INP1' RX1"
> +		## gain to  0dB
> +		cset "name='RX3 Digital Volume' 128"
> +	]
> +
> +	DisableSequence [
> +		cset "name='SPK DAC Switch' 0"
> +		cset "name='RX3 MIX1 INP1' ZERO"
> +	]
> +}
> -- 
> 2.24.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
