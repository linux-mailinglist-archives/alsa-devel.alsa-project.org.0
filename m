Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C47828CB7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 19:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F43EEAB;
	Tue,  9 Jan 2024 19:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F43EEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704825484;
	bh=60Y8ZGv+HDkv2xM6PNOBL1FCyS5iOUcHMjFLuYr4NfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fGdE+CevYxp9MMIGUx7oopmKa9wiKPWdaKjBrF2Ujkm8tOSpYNxx1Ab2/EKj+PtUW
	 qO1dvxsUXDUCxAgPZUhFwln2xHMLISMpPrmY7/CfaSno2vVP3TXmuhOygmzVBHE2hv
	 VpQKLg9n1kFW1VylS3kmm2QXBplZpc/mQ5O5o5I8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2B08F80580; Tue,  9 Jan 2024 19:37:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD1D1F80580;
	Tue,  9 Jan 2024 19:37:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A235F80254; Tue,  9 Jan 2024 19:37:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 42562F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 19:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42562F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704825433004208326-webhooks-bot@alsa-project.org>
References: <1704825433004208326-webhooks-bot@alsa-project.org>
Subject: Line & Mic In detected,
 but not working on MPG B650I EDGE WIFI (0db0:36e7)
Message-Id: <20240109183724.0A235F80254@alsa1.perex.cz>
Date: Tue,  9 Jan 2024 19:37:24 +0100 (CET)
Message-ID-Hash: ZACW6YW7PNKA4RBS6II4A7FUCHHHWIPM
X-Message-ID-Hash: ZACW6YW7PNKA4RBS6II4A7FUCHHHWIPM
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZACW6YW7PNKA4RBS6II4A7FUCHHHWIPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #281 was reopened from 13r0ck:

Seems to have been broken by 33b934c29d2911ef060d48b1a0ca9682645b68c8 , as it was completely functional in 1.2.7.2
  
  I did manage to find a patch that fixes the line in on 1.2.8:
  All it does is disable spdif for that usb id.
  ```
  Index: alsa-ucm-conf/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf
  ===================================================================
  --- alsa-ucm-conf.orig/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf
  +++ alsa-ucm-conf/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf
  @@ -100,6 +100,17 @@ If.msi-meg-unify {
 	  }
   }
   
  +If.b650i {
  +	Condition {
  +		Type RegexMatch
  +		String "${CardComponents}"
  +		Regex "USB(0db0:36e7)"
  +	}
  +	True.Define {
  +		SpdifName ""
  +	}
  +}
  +
   If.asus-rog-strix {
 	  Condition {
 		  Type RegexMatch
  ```
  
  But I am struggling to find what is missing to make mic work. Jack detection is fine, and I can get recordings via `arecord`, but I am missing something with the ucm conf.
  
  ### Here are the config dumps for a few different situations
  
  #### Without the patch above
  
  `$ alsa-info` -> http://alsa-project.org/db/?f=ac8aa25f882540a20c95ee555491a498bd3a88a4
  
  <details>
  <summary> ` $ alsaucm dump -c hw:1 text ` </summary>
  <br>
  
  ```
  
  Verb.HiFi {
	  Comment "HiFi 2.0 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 2
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.SPDIF {
		  Comment "S/PDIF Output"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,2
			  PlaybackPCM "_ucm0001.hw:Audio,3"
			  PlaybackPriority 100
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  Verb."HiFi 5+1" {
	  Comment "HiFi 5.1 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 6
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.SPDIF {
		  Comment "S/PDIF Output"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,2
			  PlaybackPCM "_ucm0001.hw:Audio,3"
			  PlaybackPriority 100
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  Verb."HiFi 7+1" {
	  Comment "HiFi 7.1 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 8
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.SPDIF {
		  Comment "S/PDIF Output"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,2
			  PlaybackPCM "_ucm0001.hw:Audio,3"
			  PlaybackPriority 100
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  
  ```
  
  <br>
  </details>
  
  #### With the patch above 
  
  `$ alsa-info` -> http://alsa-project.org/db/?f=7b95b33ddf71324505c7dd696bcc7f24ca64ca52
  
  <details>
  <summary> ` $ alsaucm dump -c hw:1 text ` </summary>
  <br>
  
  ```
  
  Verb.HiFi {
	  Comment "HiFi 2.0 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 2
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  Verb."HiFi 5+1" {
	  Comment "HiFi 5.1 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 6
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  Verb."HiFi 7+1" {
	  Comment "HiFi 7.1 channels"
	  Device.Speaker {
		  Comment Speakers
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Speaker - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackChannels 8
			  PlaybackMixerElem PCM,0
			  PlaybackPCM "_ucm0001.hw:Audio"
			  PlaybackPriority 200
			  TQ HiFi
		  }
	  }
	  Device.Headphones {
		  Comment "Front Headphones"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  JackControl "Headphone - Output Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  PlaybackMixerElem PCM,1
			  PlaybackPCM "_ucm0001.hw:Audio,1"
			  PlaybackPriority 300
			  TQ HiFi
		  }
	  }
	  Device.Line1 {
		  Comment "Line Input"
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Line,0
			  CapturePCM "_ucm0001.hw:Audio,1"
			  CapturePriority 100
			  JackControl "Line - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
	  Device.Mic1 {
		  Comment Microphone
		  Values {
			  CaptureCTL "_ucm0001.hw:Audio"
			  CaptureMixerElem Mic,0
			  CapturePCM "_ucm0001.hw:Audio,2"
			  CapturePriority 300
			  JackControl "Mic - Input Jack"
			  PlaybackCTL "_ucm0001.hw:Audio"
			  TQ HiFi
		  }
	  }
  }
  
  ```
  
  <br>
  </details>


  #### On 1.2.7.2 ( with `USB-Audio.conf` quirk to add 0bd0:36e7 to Realtek ALC4080. See https://github.com/alsa-project/alsa-ucm-conf/commit/1923bd19c0bef947c085e2941dd8ed2d1310731e but for 1.2.7.2 )

  `$ alsa-info` -> http://alsa-project.org/db/?f=f148616a3e9b8c0dffffbe57a6bc9ede78c9d309

  <details>
  <summary> ` $ alsaucm dump -c hw:1 text ` </summary>
  <br>

  ```
  
  Verb.HiFi {
	Comment "Play HiFi quality Music"
	Device.Speaker {
		Comment Speakers
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			JackControl "Speaker - Output Jack"
			PlaybackCTL "_ucm0001.hw:Audio"
			PlaybackChannels 2
			PlaybackMixerElem Speaker
			PlaybackPCM "_ucm0001.hw:Audio"
			PlaybackPriority 200
		}
	}
	Device.Line {
		Comment "Line In"
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem Line
			CapturePCM "_ucm0001.hw:Audio,1"
			CapturePriority 100
			JackControl "Line - Input Jack"
			PlaybackCTL "_ucm0001.hw:Audio"
		}
	}
	Device.Mic1 {
		Comment Microphone
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem Mic
			CapturePCM "_ucm0001.hw:Audio,2"
			CapturePriority 200
			JackControl "Mic - Input Jack"
			PlaybackCTL "_ucm0001.hw:Audio"
		}
	}
}


  ```

  <br>

  </details>

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/281
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
