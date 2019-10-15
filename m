Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF2D7A95
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 17:53:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9661614;
	Tue, 15 Oct 2019 17:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9661614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571154837;
	bh=eC3an+sLSJIr7uqaEqfkVyne5T2ssTtoCOuH5pyCbps=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=A8OFrMzPgB2zxl1eH5A257eO+c1FS8DnArXiSeT9HSTyyE0b9PG7mQgwyrhQUvPhK
	 wPfuMuh4R0hkIp+Is0aU8VaUyg5eRO2+yABtOJMbUvK4mq041Pu2Plgk8nNW/8Bu7N
	 1lKd2kf4FfHTzwsjxWUazI+LNnwESL55IqvXFgaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DDAF804AA;
	Tue, 15 Oct 2019 17:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 389D7F804AA; Tue, 15 Oct 2019 17:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB60F8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 17:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB60F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="ytTb7U79"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 07F3D117F5C;
 Tue, 15 Oct 2019 15:52:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id C53BD3E869;
 Tue, 15 Oct 2019 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1571154723; bh=Du5GC1eegq5oZfHhj7cgpcqqhcPYzqrMOWf3mSVvhnI=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ytTb7U79swrCWJ3kG4z4gyOYIhgCyJKS8Y6shFebPVkiYf5jd+cI+SddYBrukxLBL
 I/QN/2/++z4TCHTDHrlAXXzlBPRi1n4dUd1MMJ5Cj3tDcL/sMgSqfbBOWkwWMlLctx
 XtRVkTsX7/rwbTVsrJQPwpQRlRBx0rKbpjm+9mZtwPzIQLYTPznxIvRB3N73hmDPvg
 2vExn4QwOcILomXNZS8En5e1X3v7Az0gUOQDJK8W1DfOB6U8vPEDOE4B67P76LCNaM
 px4QxtJTGQrTtMFBxXy6+2NcuMxqf6vUHqOZSsSMzbNrkFYDREpe05egkRN7DNEdj0
 KjEApyfy82e9A==
Received: from frederik by localhost.localdomain with local (Exim 4.92.2)
 (envelope-from <frederik@localhost.localdomain>)
 id 1iKP7C-0004ZZ-P2; Tue, 15 Oct 2019 08:52:02 -0700
Date: Tue, 15 Oct 2019 08:52:02 -0700
From: frederik@ofb.net
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191015155202.bqcqzvvpeesfvuwg@localhost>
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <s5hv9u19x2f.wl-tiwai@suse.de>
 <20190910173345.63bv2xa4vlkxicxj@localhost>
 <365e4bcc033c151076140471225db51c80808b7f.camel@iki.fi>
 <s5himprulnt.wl-tiwai@suse.de>
 <e294e2985eda906be3c3625235cc28643208dab2.camel@iki.fi>
 <s5hblvjukn6.wl-tiwai@suse.de>
 <20190919211244.buu3d6ey4k2dxyul@localhost>
 <7c81ae80233efb25b25f2d1f941e9c11acb3967b.camel@iki.fi>
 <s5hh857o1ik.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hh857o1ik.wl-tiwai@suse.de>
User-Agent: NeoMutt/20180716
Cc: Tanu Kaskinen <tanuk@iki.fi>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] parameter for pulse device?
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
Reply-To: frederik@ofb.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Takashi,

I tested your patch, after commenting some lines in my ~/.asoundrc, and I can confirm that it works. I can now specify a pulse device to 'ecasound':

    ecasound -o alsa,pulse:music -i song.wav

and when I do it with no "DEVICE" argument, then it outputs to the sink defined by "pacmd set-default-sink":

    ecasound -o alsa,pulse -i song.wav

I guess this only exercises one of the cases in your patch where the empty string is recognized as NULL:

+			} else if (!*device) {
+				device = NULL;

Let me know if you want me to do more testing, and apologies for the long delay in my reply.

Thanks,

Frederick


On Fri, Sep 20, 2019 at 09:44:19AM +0200, Takashi Iwai wrote:
>On Fri, 20 Sep 2019 09:35:59 +0200,
>Tanu Kaskinen wrote:
>>
>> On Thu, 2019-09-19 at 14:12 -0700, frederik@ofb.net wrote:
>> > Thank you for the tips.
>> >
>> > I don't know if my input is still needed, but I figured out from
>> > looking at some of the syntax you linked to that I can put this in
>> > ~/.asoundrc and it does the job (this is what I had had in mind when
>> > I asked about "magic with macros", it is somewhat advanced for me):
>> >
>> >     pcm.!pulse {
>> >         @args [ DEV ]
>> >         @args.DEV {
>> >             type string
>> >             default "default"
>> >         }
>> >         type pulse;
>> >         device $DEV
>> >     }
>> >
>> > Now I can set up a filter like this:
>> >
>> >     ecasound -i alsa,pulse:mic -o alsa,pulse:monitor
>> >
>> > Is something like this going into the alsa-plugins repo?
>>
>> I'm sure something like this will be accepted if you submit a patch. I
>> got the impression that Takashi isn't willing to write the patch
>> himself, and nor am I, so you're in the best position to make this
>> happen.
>
>I have a test patch but had no chance to test the stuff at all
>currently as I am (and will be for the next few weeks) traveling.
>
>> Note that
>>
>>             default "default"
>>
>> doesn't do the intended thing with the current pcm_pulse.c code. With
>> the current code the plugin will request PulseAudio to use a device
>> named "default", which most likely won't exist and playback or
>> recording will fail. The plugin code needs to pass NULL as the device
>> name to pa_stream_connect_playback() and pa_stream_connect_record()
>> when it detects that the default device is requested, so you'll need to
>> modify pcm_pulse.c in order to make this work. Instead of "default" as
>> the special string in the configuration, I suggested using "".
>
>Below is the totally untested patch (even not build-tested!)
>If anyone interested, feel free to cook it.
>
>
>thanks,
>
>Takashi
>
>---
>diff --git a/pulse/50-pulseaudio.conf b/pulse/50-pulseaudio.conf
>index 62da207af9ca..916258d942af 100644
>--- a/pulse/50-pulseaudio.conf
>+++ b/pulse/50-pulseaudio.conf
>@@ -1,7 +1,13 @@
> # Add a specific named PulseAudio pcm and ctl (typically useful for testing)
>
> pcm.pulse {
>+	@args [ DEVICE ]
>+	@args.DEVICE {
>+		type string
>+		default ""
>+	}
> 	type pulse
>+	device $DEVICE
> 	hint {
> 		show {
> 			@func refer
>diff --git a/pulse/ctl_pulse.c b/pulse/ctl_pulse.c
>index fbb6eae2ec76..9b820fd04b15 100644
>--- a/pulse/ctl_pulse.c
>+++ b/pulse/ctl_pulse.c
>@@ -664,6 +664,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &server) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*server) {
>+				server = NULL;
> 			}
> 			continue;
> 		}
>@@ -671,6 +673,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &device) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*device) {
>+				device = NULL;
> 			}
> 			continue;
> 		}
>@@ -678,6 +682,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &source) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*source) {
>+				source = NULL;
> 			}
> 			continue;
> 		}
>@@ -685,6 +691,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &sink) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*sink) {
>+				sink = NULL;
> 			}
> 			continue;
> 		}
>diff --git a/pulse/pcm_pulse.c b/pulse/pcm_pulse.c
>index 283174357e8b..869c9b674c6b 100644
>--- a/pulse/pcm_pulse.c
>+++ b/pulse/pcm_pulse.c
>@@ -1069,6 +1069,8 @@ SND_PCM_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &server) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*server) {
>+				server = NULL;
> 			}
> 			continue;
> 		}
>@@ -1076,6 +1078,8 @@ SND_PCM_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &device) < 0) {
> 				SNDERR("Invalid type for %s", id);
> 				return -EINVAL;
>+			} else if (!*device) {
>+				device = NULL;
> 			}
> 			continue;
> 		}
>@@ -1091,6 +1095,8 @@ SND_PCM_PLUGIN_DEFINE_FUNC(pulse)
> 			if (snd_config_get_string(n, &fallback_name) < 0) {
> 				SNDERR("Invalid value for %s", id);
> 				return -EINVAL;
>+			} else if (!*fallback_name) {
>+				fallback_name = NULL;
> 			}
> 			continue;
> 		}
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
