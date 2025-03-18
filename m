Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850DA67D24
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 20:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9377E60297;
	Tue, 18 Mar 2025 20:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9377E60297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742326262;
	bh=jfVLw0+sg4L4vCU1uey2F0pvT8uFRt6jamYc8rl6EUk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hYW4xxrAUuNxhlQVx/iT5z9hUgnU6+Wp8+NVWjOucahKtF4uXHtpWtWtDam4Cn2Xr
	 QZ1wVhnyGDi5wBu2Mj4xjCOJ9vmq9jX9lr92P88lM514THDB7YKsVJbY6mwhKxpH4R
	 scBTo/kEhxCa0KQUp1jRu7EvkWp8rSXZ5rXZ0tB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC3FDF805AF; Tue, 18 Mar 2025 20:30:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4F2F805AA;
	Tue, 18 Mar 2025 20:30:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BE79F80587; Tue, 18 Mar 2025 20:30:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D58F80093
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 20:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D58F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182dfc760c94e200-webhooks-bot@alsa-project.org>
In-Reply-To: <182dfc760b18d800-webhooks-bot@alsa-project.org>
References: <182dfc760b18d800-webhooks-bot@alsa-project.org>
Subject: No Micrphone detected on ALC4080
Date: Tue, 18 Mar 2025 20:30:17 +0100 (CET)
Message-ID-Hash: B4TQJ7XO3X4G6N35HAPBCPHJJCDMIJLK
X-Message-ID-Hash: B4TQJ7XO3X4G6N35HAPBCPHJJCDMIJLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4TQJ7XO3X4G6N35HAPBCPHJJCDMIJLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #528 was opened from chanster:

The Rear Microphone is not detected when I plug in my mic. I don't use the Front Audio connection as my case doesn't have I/O for it, I just used the 2 audio ports in the rear.

When I try recording directly I can get the mic to work, but it does not show up in the sound settings.

`arecord --duration=3 -D hw:CARD=2,DEV=1 -f dat -vvv a.wav`
```
Hardware PCM card 2 'USB Audio' device 1 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 24000
  period_size  : 6000
  period_time  : 125000
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 6000
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 24000
  silence_threshold: 0
  silence_size : 0
  boundary     : 6755399441055744000
  appl_ptr     : 0
  hw_ptr       : 0
Recording WAVE 'a.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
Max peak (12000 samples): 0x00000167 #                    1%
Max peak (12000 samples): 0x000000da #                    0%
Max peak (12000 samples): 0x000006b1 ##                   5%
Max peak (12000 samples): 0x00000547 #                    4%
Max peak (12000 samples): 0x00000729 ##                   5%
Max peak (12000 samples): 0x00000a77 ##                   8%
Max peak (12000 samples): 0x000006d2 ##                   5%
Max peak (12000 samples): 0x000005ec #                    4%
Max peak (12000 samples): 0x00000627 #                    4%
Max peak (12000 samples): 0x00000d32 ###                  10%
Max peak (12000 samples): 0x00000e9f ###                  11%
Max peak (12000 samples): 0x00003813 #########            43%
Max peak (12000 samples): 0x00006278 ################     76%
Max peak (12000 samples): 0x00007fff #################### 99%
Max peak (12000 samples): 0x00006694 #################    80%
Max peak (12000 samples): 0x000068ea #################    81%
Max peak (12000 samples): 0x00004ba0 ############         59%
Max peak (12000 samples): 0x0000207c ######               25%
Max peak (12000 samples): 0x000017e9 ####                 18%
Max peak (12000 samples): 0x00003938 #########            44%
Max peak (12000 samples): 0x00001f11 #####                24%
Max peak (12000 samples): 0x00000ee5 ###                  11%
Max peak (12000 samples): 0x00003944 #########            44%
Max peak (12000 samples): 0x00003942 #########            44%
```


Motherboard: Gigabyte B850I Aorus Pro (rev 1.0)
Audio Device: ALC4080
Distro: Fedora 41
Window Manager: Gnome-Shell
Packages:
```
dnf list --installed | grep 'pipewire\|pulseaudio\|alsa'
alsa-lib.i686                             1.2.13-3.fc41                      updates
alsa-lib.x86_64                           1.2.13-3.fc41                      updates
alsa-ucm.noarch                           1.2.13-3.fc41                      updates
alsa-ucm-utils.x86_64                     1.2.13-2.fc41                      updates
alsa-utils.x86_64                         1.2.13-2.fc41                      updates
pipewire.i686                             1.2.7-7.fc41                       updates
pipewire.x86_64                           1.2.7-7.fc41                       updates
pipewire-alsa.i686                        1.2.7-7.fc41                       updates
pipewire-alsa.x86_64                      1.2.7-7.fc41                       updates
pipewire-gstreamer.x86_64                 1.2.7-7.fc41                       updates
pipewire-libs.i686                        1.2.7-7.fc41                       updates
pipewire-libs.x86_64                      1.2.7-7.fc41                       updates
pipewire-pulseaudio.x86_64                1.2.7-7.fc41                       updates
pipewire-utils.x86_64                     1.2.7-7.fc41                       updates
pulseaudio-libs.i686                      17.0-2.fc41                        fedora
pulseaudio-libs.x86_64                    17.0-2.fc41                        fedora
pulseaudio-libs-glib2.x86_64              17.0-2.fc41                        fedora
wine-alsa.i686                            10.1-1.fc41                        updates
wine-alsa.x86_64                          10.1-1.fc41                        updates
wine-pulseaudio.i686                      10.1-1.fc41                        updates
wine-pulseaudio.x86_64                    10.1-1.fc41                        updates

```

`lsusb | grep -i audio`
```
Bus 001 Device 002: ID 0414:a014 Giga-Byte Technology Co., Ltd USB Audio
```

`alsactl monitor` (unplugging and plugging mic)
```
node hw:2, #9 (0,0,0,Mic - Input Jack,1) VALUE
node hw:2, #9 (0,0,0,Mic - Input Jack,1) VALUE
```

`arecord -l`
```
**** List of CAPTURE Hardware Devices ****
card 2: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

`alsaucm -c hw:2 dump text`
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
	Device.Mic1 {
		Comment "Front Microphone"
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem Mic,0
			CapturePCM "_ucm0001.hw:Audio,1"
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
	Device.Mic1 {
		Comment "Front Microphone"
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem Mic,0
			CapturePCM "_ucm0001.hw:Audio,1"
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
	Device.Mic1 {
		Comment "Front Microphone"
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem Mic,0
			CapturePCM "_ucm0001.hw:Audio,1"
			CapturePriority 300
			JackControl "Mic - Input Jack"
			PlaybackCTL "_ucm0001.hw:Audio"
			TQ HiFi
		}
	}
}
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/528
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
