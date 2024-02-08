Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660284E357
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 15:41:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496D1823;
	Thu,  8 Feb 2024 15:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496D1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707403304;
	bh=MQwK1VllVrtr2tQbDWcrDLGcVxQAn1vf4Tn++B9EBKk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=H051vuap7GFyxsHuVbqvNKtSgnDR65DKHDHMHQZgRzdRYSyg6C6a/sFwGusWNA4qR
	 M0976nxBdju7zAiF488znYPxYIo5JZg9HhYkh/Uf9iMKdwtE4pYup5r+5wLmcyh/jQ
	 5oLOIR0vm+An977rMA1Dd/sAMDtLBqAWFWZ88U48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6247F80548; Thu,  8 Feb 2024 15:41:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7328EF804E7;
	Thu,  8 Feb 2024 15:41:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66009F801EB; Thu,  8 Feb 2024 15:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97FBCF80153
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 15:40:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 59BEB5BA4;
	Thu,  8 Feb 2024 15:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 59BEB5BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1707403256; bh=FkCD3lKLk5OqMVMl36QpNQhEKG29m180bi19U4Y/6FM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=yPXdpJg6XBLM7Q4+5c6AQK+0zj/dfCgQ3TCaP/kc7ymVzsnKyJeA/O0QD4SNi+DQ6
	 5KqIso8ZvXTle3WocC8Ym6zw88j9/ORNhg9M0lxdYQS+Z9DeHB1kUl2hhfXWAA4IIL
	 VF8RD5A5+3JT6K/mV1Z5mJU29iniiTu4z7JArFqg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  8 Feb 2024 15:40:54 +0100 (CET)
Message-ID: <a250b821-1876-4936-8082-d40475e60155@perex.cz>
Date: Thu, 8 Feb 2024 15:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
 <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
 <79934c5e-25b2-4d71-a426-c05f9a4e6b40@perex.cz>
 <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
 <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
 <1a852449-cd3e-acc0-57ec-f6163e82c620@ivitera.com>
 <5b4afa93-5ab9-2ff1-c440-d05c66a4cef5@ivitera.com>
 <25d7fac4-a7c6-4bbd-ef8a-7eefbcf03784@ivitera.com>
 <e63029c7-caed-c6ce-2395-e34eb9f5082c@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <e63029c7-caed-c6ce-2395-e34eb9f5082c@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WKHKIPVP3XWNJBHW3L5O3D6W2UMTOG2P
X-Message-ID-Hash: WKHKIPVP3XWNJBHW3L5O3D6W2UMTOG2P
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKHKIPVP3XWNJBHW3L5O3D6W2UMTOG2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07. 02. 24 16:34, Pavel Hofman wrote:

> But honestly I still do not understand what it actually does and what is
> the goal of snd_pcm_plug_slave_format().
> 
> Without that I cannot modify snd_pcm_plug_slave_format() correctly to
> incorporate support for IEC958.

I believe you're looking to a wrong place. Here's incomplete code:

==========
diff --git a/configure.ac b/configure.ac
index 7a152a4a..3f238302 100644
--- a/configure.ac
+++ b/configure.ac
@@ -642,6 +642,9 @@ fi
  if test "$build_pcm_alaw" = "yes"; then
    AC_DEFINE([BUILD_PCM_PLUGIN_ALAW], "1", [Build PCM alaw plugin])
  fi
+if test "$build_pcm_iec958" = "yes"; then
+  AC_DEFINE([BUILD_PCM_PLUGIN_IEC958], "1", [Build PCM iec958 plugin])
+fi
  if test "$build_pcm_mmap_emul" = "yes"; then
    AC_DEFINE([BUILD_PCM_PLUGIN_MMAP_EMUL], "1", [Build PCM mmap-emul plugin])
  fi
diff --git a/include/pcm_plugin.h b/include/pcm_plugin.h
index 2d014394..f3e8f3b5 100644
--- a/include/pcm_plugin.h
+++ b/include/pcm_plugin.h
@@ -133,6 +133,19 @@ int _snd_pcm_adpcm_open(snd_pcm_t **pcmp, const char *name,
  			snd_config_t *root, snd_config_t *conf,
  			snd_pcm_stream_t stream, int mode);
  
+/*
+ *  IEC958 subframe conversion plugin
+ */
+int snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
+			snd_pcm_format_t sformat, snd_pcm_t *slave,
+			int close_slave,
+			const unsigned char *status_bits,
+			const unsigned char *preamble_vals,
+			int hdmi_mode);
+int _snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name,
+			 snd_config_t *root, snd_config_t *conf,
+			 snd_pcm_stream_t stream, int mode);
+
  /*
   *  Route plugin for linear formats
   */
diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
index e5a3a189..287fb9f9 100644
--- a/src/pcm/pcm_plug.c
+++ b/src/pcm/pcm_plug.c
@@ -186,7 +186,8 @@ static const snd_pcm_format_t linear_preferred_formats[] = {
  
  #if defined(BUILD_PCM_PLUGIN_MULAW) || \
  	defined(BUILD_PCM_PLUGIN_ALAW) || \
-	defined(BUILD_PCM_PLUGIN_ADPCM)
+	defined(BUILD_PCM_PLUGIN_ADPCM) || \
+	defined(BUILD_PCM_PLUGIN_IEC958)
  #define BUILD_PCM_NONLINEAR
  #endif
  
@@ -201,6 +202,10 @@ static const snd_pcm_format_t nonlinear_preferred_formats[] = {
  #ifdef BUILD_PCM_PLUGIN_ADPCM
  	SND_PCM_FORMAT_IMA_ADPCM,
  #endif
+#ifdef BUILD_PCM_PLUGIN_IEC958
+	SND_PCM_FORMAT_IEC958_SUBFRAME_LE,
+	SND_PCM_FORMAT_IEC958_SUBFRAME_BE,
+#endif
  };
  #endif
  
@@ -490,6 +495,18 @@ static int snd_pcm_plug_change_channels(snd_pcm_t *pcm, snd_pcm_t **new, snd_pcm
  }
  #endif
  
+#ifdef BUILD_PCM_PLUGIN_IEC958
+static int iec958_open(snd_pcm_t **pcmp, const char *name,
+		       snd_pcm_format_t sformat, snd_pcm_t *slave,
+		       int close_slave)
+{
+	unsigned char preamble_vals[3] = {
+	      0x08, 0x02, 0x04 /* Z, X, Y */
+        };
+	return snd_pcm_iec958_open(pcmp, name, sformat, slave, close_slave, NULL, preamble_vals, 0);
+}
+#endif
+
  static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
  {
  	snd_pcm_plug_t *plug = pcm->private_data;
@@ -526,6 +543,12 @@ static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, snd_pcm_p
  		case SND_PCM_FORMAT_IMA_ADPCM:
  			f = snd_pcm_adpcm_open;
  			break;
+#endif
+#ifdef BUILD_PCM_PLUGIN_IEC958
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
+			f = iec958_open;
+			break;
  #endif
  		default:
  #ifdef BUILD_PCM_PLUGIN_LFLOAT
@@ -566,6 +589,12 @@ static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, snd_pcm_p
  		case SND_PCM_FORMAT_IMA_ADPCM:
  			f = snd_pcm_adpcm_open;
  			break;
+#endif
+#ifdef BUILD_PCM_PLUGIN_IEC958
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
+			f = iec958_open;
+			break;
  #endif
  		default:
  			return -EINVAL;
=========

Test:

========= ~/.asoundrc
pcm.test123 {
   type plug
   slave {
     pcm null
     format IEC958_SUBFRAME_LE
   }
}
=========

$ LD_PRELOAD=~/alsa/alsa-lib/src/.libs/libasound.so aplay -v -D test123 /dev/zero
Playing raw data '/dev/zero' : Unsigned 8 bit, Rate 8000 Hz, Mono
Plug PCM: IEC958 subframe conversion PCM (IEC958_SUBFRAME_LE)
Its setup is:
   stream       : PLAYBACK
   access       : RW_INTERLEAVED
   format       : U8
   subformat    : STD
   channels     : 1
   rate         : 8000
   exact rate   : 8000 (8000/1)
   msbits       : 8
   buffer_size  : 4000
   period_size  : 1000
   period_time  : 125000
   tstamp_mode  : ENABLE
   tstamp_type  : GETTIMEOFDAY
   period_step  : 1
   avail_min    : 1000
   period_event : 0
   start_threshold  : 4000
   stop_threshold   : 4000
   silence_threshold: 0
   silence_size : 0
   boundary     : 9007199254740992000
Slave: Null PCM
Its setup is:
   stream       : PLAYBACK
   access       : MMAP_INTERLEAVED
   format       : IEC958_SUBFRAME_LE
   subformat    : STD
   channels     : 1
   rate         : 8000
   exact rate   : 8000 (8000/1)
   msbits       : 32
   buffer_size  : 4000
   period_size  : 1000
   period_time  : 125000
   tstamp_mode  : ENABLE
   tstamp_type  : GETTIMEOFDAY
   period_step  : 1
   avail_min    : 1000
   period_event : 0
   start_threshold  : 4000
   stop_threshold   : 4000
   silence_threshold: 0
   silence_size : 0
   boundary     : 9007199254740992000

							Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

