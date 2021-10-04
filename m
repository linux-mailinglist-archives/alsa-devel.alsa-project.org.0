Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0442117F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 16:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5D51688;
	Mon,  4 Oct 2021 16:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5D51688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633358058;
	bh=NwCSAhsFNkV2YspsEkRwMNcZUnQHx1dXUFTvpBvIk74=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2GVoUuciKJ88rha8wLR0VEphaOorg/ZgNK+L5ZgcdRlCoK7CLEjks8XZIGjdqYrk
	 zYnD2X2Sz3dBmr04ykqFTMWVk+rKHz3ly0q4eYM8sFTAzvn0oT6Voakse0g/IyRDO3
	 GWdh+7wSyOYdBn85IbsOsNuzqeEafjwkq/i3Ac7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A59F80229;
	Mon,  4 Oct 2021 16:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79403F80240; Mon,  4 Oct 2021 16:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AAC2F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 16:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAC2F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="kbuSm7mT"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="sAtfaqTj"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id E4A0EA1A3D403;
 Mon,  4 Oct 2021 16:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633357972; bh=NwCSAhsFNkV2YspsEkRwMNcZUnQHx1dXUFTvpBvIk74=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kbuSm7mTQQF3jkAWqljI04gzyryevq7XIqN5Y7CLrVGeOGr0pWL9rVJ1+VQNicBkC
 yGDfrGIP5LfFDOYAlcHy76gvGZXpOHT6HK/KhDvVaTunu2fsLagAffY6VBtTr6Z1Yn
 9rPF8c4FG7AlG6z1Ag8ATEnz7LCRph1HvMBxsDeE=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXZZDCcnuIY7; Mon,  4 Oct 2021 16:32:46 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id D4DDEA1A3D402;
 Mon,  4 Oct 2021 16:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633357965; bh=NwCSAhsFNkV2YspsEkRwMNcZUnQHx1dXUFTvpBvIk74=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sAtfaqTjdQnF9FNef4CxQXQEQixeSJuaIvdOR7eD6PjL37o4vDPy3TFX+e57Ue98l
 tFO+SrUp5b38u/EkwpujZ1q9TG2gi1wa+sMEbG8vtgoyHjhaM9cw8aYMlSycLsPIvP
 +Uaycy9yjUeDo9HmQbSzTlKVY1SO6rxkWgssNcpk=
Subject: Re: Alsaloop: sync mode PLAYSHIFT + Loopback on playback side
To: Jaroslav Kysela <perex@perex.cz>
References: <a87670e2-302b-8408-cdc2-f0f010646fdc@ivitera.com>
 <958623cd-7d0d-5329-567b-74edbbf0c16d@perex.cz>
 <b18c5b00-e3a8-14d1-15aa-c7d7c577530d@ivitera.com>
 <2ad744ed-5618-0ea0-e2a4-b919ee9dfeeb@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <c9804070-e520-24e5-d5a7-9ba7e2bb8abe@ivitera.com>
Date: Mon, 4 Oct 2021 16:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2ad744ed-5618-0ea0-e2a4-b919ee9dfeeb@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 04. 10. 21 v 13:55 Jaroslav Kysela napsal(a):
>>> Hi,
>>>
>>> I would not touch the controls associated to the capture PCM by default.
>>> It would be possible to add another alsaloop option and code to
>>> configure the rate shift control identifier separately for this use
>>> case. The user should avoid the double pitch control (playback +
>>> capture) for the loopback devices.
>>
>> Thanks for your input. I am not sure I understand correctly your 
>> intention.
>>
>> The current code already avoids running playback and capture pitch
>> control concurrently by one alsaloop as the loop->sync is either
>> SYNC_TYPE_CAPTRATESHIFT or SYNC_TYPE_PLAYRATESHIFT. IMO the current code
>> ignores SYNC_TYPE_PLAYRATESHIFT because the code jumps to
>> set_rate_shift(loop->play, pitch)
>> https://github.com/alsa-project/alsa-utils/blob/master/alsaloop/pcmjob.c#L1103 
>>
>> but the lhandle->ctl_rate_shift elem is never set for playback side in
>> pcmjob.c:openctl
>> https://github.com/alsa-project/alsa-utils/blob/master/alsaloop/pcmjob.c#L1208 
>>
>> (lhandle->loopback->play == lhandle). I confirmed it using the debug
>> patch you accepted today (thanks! :-)).
>>
>> Therefore my patch of the openctl moves the "PCM Notify" and "PCM Rate
>> Shift 100000" setup before the playback check, so that lhandles of both
>> directions can have the two elems configured.
>>
>> But the loopback->play lhandle should configure elements for the capture
>> side of the snd-aloop pipe which I do not know how to locate nicely. I
>> can always use some hack "if device==0 then use device = 1" for the
>> playback side etc. but that does not look nice.
> 
> Please, assume that the 'PCM Rate Shift 100000' control is for the 
> capture PCM only by default. The applications should not handle those 
> driver specific mapping.
> 
> If the user wants to use this control for the playback side, a new 
> command line option may be added to cope with the alternate playback 
> rate shift control indentifier (it may be parsed using 
> snd_ctl_ascii_elem_id_parse() for example). So the user may specify the 
> correct (different) device number there.

Thanks, please can you comment on this patch? alsaloop.1 not updated 
yet. Tested to work OK, while checking via amixer that the elem 'PCM 
Rate Shift 100000',device=1 gets controlled:

pavel@precision:~/work/rpi-gadget/alsa-utils/alsaloop$ ./alsaloop -vv -l 
10000 v -c 2 -r 48000 -f S32_LE -C hw:Quartet -P hw:Loopback -S 
playshift -x iface=PCM,name='PCM Rate Shift 100000',device=1

!!!Scheduler set to Round Robin with priority 99 FAILED!
Opened PCM element 'iface=PCM,name=PCM Rate Shift 100000,device=1' for 
playback rate adjust of hw:10
Hardware PCM card 10 'Loopback' device 0 subdevice 0
Its setup is:
   stream       : PLAYBACK
   access       : RW_INTERLEAVED
   format       : S32_LE
   subformat    : STD
   channels     : 2
   rate         : 48000
   exact rate   : 48000 (48000/1)
   msbits       : 32
   buffer_size  : 39992
   period_size  : 4999
   period_time  : 104145
   tstamp_mode  : NONE
   tstamp_type  : MONOTONIC
   period_step  : 1
   avail_min    : 32494
   period_event : 0
   start_threshold  : 2147483647
   stop_threshold   : 39992
   silence_threshold: 0
   silence_size : 0
   boundary     : 5628373634306277376
   appl_ptr     : 0
   hw_ptr       : 0
Hardware PCM card 0 'Infrasonic Quartet' device 0 subdevice 0
Its setup is:
   stream       : CAPTURE
   access       : RW_INTERLEAVED
   format       : S32_LE
   subformat    : STD
   channels     : 2
   rate         : 48000
   exact rate   : 48000 (48000/1)
   msbits       : 24
   buffer_size  : 32768
   period_size  : 4096
   period_time  : 85333
   tstamp_mode  : NONE
   tstamp_type  : MONOTONIC
   period_step  : 1
   avail_min    : 4096
   period_event : 0
   start_threshold  : 2147483647
   stop_threshold   : 32768
   silence_threshold: 0
   silence_size : 0
   boundary     : 4611686018427387904
   appl_ptr     : 0
   hw_ptr       : 0
Latency 9999 frames, 208312.500us, 208.312500ms (4.8005Hz)
shared buffer!!!
playback hw:Loopback/capture hw:Quartet sync type: PLAYRATESHIFT
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = 0/0)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = 0/35)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = 0/35)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = 0/35)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = 0/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = 0/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = 0/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = -14/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = -29/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00003125 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = -32/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = -38/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 0.99998958 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = -41/39)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = -41/39)


Without specifying the -x CONTROL_NAME param (no rate control applied) 
the pitch starts diverging:

New pitch for playback hw:Loopback/capture hw:Quartet: 1.00000000 
(min/max samples = 0/0)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00001042 
(min/max samples = 0/14)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00002083 
(min/max samples = 0/16)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00003125 
(min/max samples = 0/17)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00004167 
(min/max samples = 0/21)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00005208 
(min/max samples = 0/23)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00006250 
(min/max samples = 0/27)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00007292 
(min/max samples = 0/29)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00008333 
(min/max samples = 0/33)
New pitch for playback hw:Loopback/capture hw:Quartet: 1.00009375 
(min/max samples = 0/34)

Thanks a lot,

Pavel.


=============================================================
diff --git a/alsaloop/alsaloop.c b/alsaloop/alsaloop.c
index 06ffadf..4358db0 100644
--- a/alsaloop/alsaloop.c
+++ b/alsaloop/alsaloop.c
@@ -175,6 +175,7 @@ void help(void)
  "-C,--cdevice   capture device\n"
  "-X,--pctl      playback ctl device\n"
  "-Y,--cctl      capture ctl device\n"
+"-x,--prateshift playback 'PCM Rate Shift 100000' ascii ctl name\n"
  "-l,--latency   requested latency in frames\n"
  "-t,--tlatency  requested latency in usec (1/1000000sec)\n"
  "-f,--format    sample format\n"
@@ -362,6 +363,7 @@ static int parse_config(int argc, char *argv[], 
snd_output_t *output,
  		{"cdevice", 1, NULL, 'C'},
  		{"pctl", 1, NULL, 'X'},
  		{"cctl", 1, NULL, 'Y'},
+		{"prateshift", 1, NULL, 'x'},
  		{"latency", 1, NULL, 'l'},
  		{"tlatency", 1, NULL, 't'},
  		{"format", 1, NULL, 'f'},
@@ -391,6 +393,7 @@ static int parse_config(int argc, char *argv[], 
snd_output_t *output,
  	char *arg_cdevice = NULL;
  	char *arg_pctl = NULL;
  	char *arg_cctl = NULL;
+	char *arg_prateshift = NULL;
  	unsigned int arg_latency_req = 0;
  	unsigned int arg_latency_reqtime = 10000;
  	snd_pcm_format_t arg_format = SND_PCM_FORMAT_S16_LE;
@@ -420,7 +423,7 @@ static int parse_config(int argc, char *argv[], 
snd_output_t *output,
  	while (1) {
  		int c;
  		if ((c = getopt_long(argc, argv,
-				"hdg:P:C:X:Y:l:t:F:f:c:r:s:benvA:S:a:m:T:O:w:UW:z",
+				"hdg:P:C:X:Y:x:l:t:F:f:c:r:s:benvA:S:a:m:T:O:w:UW:z",
  				long_option, NULL)) < 0)
  			break;
  		switch (c) {
@@ -446,6 +449,9 @@ static int parse_config(int argc, char *argv[], 
snd_output_t *output,
  		case 'Y':
  			arg_cctl = strdup(optarg);
  			break;
+		case 'x':
+			arg_prateshift = strdup(optarg);
+			break;
  		case 'l':
  			err = atoi(optarg);
  			arg_latency_req = err >= 4 ? err : 4;
@@ -627,6 +633,10 @@ static int parse_config(int argc, char *argv[], 
snd_output_t *output,
  			logit(LOG_CRIT, "Unable to add ossmixer controls.\n");
  			exit(EXIT_FAILURE);
  		}
+		if (arg_prateshift) {
+			play->prateshift_name = arg_prateshift;
+		}
+
  #ifdef USE_SAMPLERATE
  		loop->src_enable = arg_samplerate > 0;
  		if (loop->src_enable)
diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
index 1dbcefe..7a98ef3 100644
--- a/alsaloop/alsaloop.h
+++ b/alsaloop/alsaloop.h
@@ -127,6 +127,7 @@ struct loopback_handle {
  	snd_ctl_elem_value_t *ctl_format;
  	snd_ctl_elem_value_t *ctl_rate;
  	snd_ctl_elem_value_t *ctl_channels;
+	char *prateshift_name; /* ascii name for the playback rate shift ctl 
elem */
  };

  struct loopback {
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 845ab82..a4b28e3 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1101,7 +1101,8 @@ void update_pitch(struct loopback *loop)
  #endif
  	}
  	else if (loop->sync == SYNC_TYPE_PLAYRATESHIFT) {
-		set_rate_shift(loop->play, pitch);
+		// pitch is capture-based, playback side requires reciprocal
+		set_rate_shift(loop->play, 1 / pitch);
  #ifdef USE_SAMPLERATE
  		if (loop->use_samplerate) {
  			loop->src_data.src_ratio =
@@ -1200,16 +1201,66 @@ static void openctl_elem(struct loopback_handle 
*lhandle,
  	}
  }

+static int openctl_play_rateshift(struct loopback_handle *lhandle,
+			char *ascii_name) {
+	int err;
+	snd_ctl_elem_id_t *id;
+	snd_ctl_elem_value_t **elem;
+
+	elem = &lhandle->ctl_rate_shift;
+
+	if (snd_ctl_elem_value_malloc(elem) < 0) {
+		return -ENOMEM;
+	}
+
+	if (snd_ctl_elem_id_malloc(&id)) {
+		snd_ctl_elem_value_free(*elem);
+		return -ENOMEM;
+	}
+
+	if (snd_ctl_ascii_elem_id_parse(id, ascii_name)) {
+		snd_ctl_elem_id_free(id);
+		snd_ctl_elem_value_free(*elem);
+		fprintf(stderr, "Wrong control identifier: %s\n", ascii_name);
+		return -EINVAL;
+	}
+
+	snd_ctl_elem_value_set_id(*elem, id);
+	err = snd_ctl_elem_read(lhandle->ctl, *elem);
+	if (err < 0) {
+		snd_ctl_elem_id_free(id);
+		snd_ctl_elem_value_free(*elem);
+		return err;
+	} else {
+		snd_output_printf(lhandle->loopback->output,
+				"Opened PCM element '%s' for playback rate adjust of %s\n",
+				ascii_name, snd_ctl_name(lhandle->ctl));
+	}
+	return 0;
+}
+
+
  static int openctl(struct loopback_handle *lhandle, int device, int 
subdevice)
  {
  	int err;

-	lhandle->ctl_rate_shift = NULL;
  	if (lhandle->loopback->play == lhandle) {
+		// play only
+		if (lhandle->prateshift_name) {
+			err = openctl_play_rateshift(lhandle, lhandle->prateshift_name);
+			if (err < 0) {
+				logit(LOG_CRIT, "Unable to open playback PCM Rate Shift elem '%s'.\n",
+						lhandle->prateshift_name);
+				exit(EXIT_FAILURE);
+			}
+		}
+
  		if (lhandle->loopback->controls)
  			goto __events;
  		return 0;
  	}
+	// capture only
+	lhandle->ctl_rate_shift = NULL;
  	openctl_elem(lhandle, device, subdevice, "PCM Notify",
  			&lhandle->ctl_notify);
  	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
