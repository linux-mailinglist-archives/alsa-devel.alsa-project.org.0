Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73185CA16C3
	for <lists+alsa-devel@lfdr.de>; Wed, 03 Dec 2025 20:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD7C60207;
	Wed,  3 Dec 2025 20:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD7C60207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764790652;
	bh=xj24tb0eYWhgF60bJsEdfnZffdWdGpC4WJdSyf+o8F8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AnPLOXzHe47c5R2+Q81ocrhFfq44YF43HZCOJHuvPhaF9umvmI/HsHIQpilFEeMQY
	 sRJiYLmuoDyZSa2clunsJo0SjArDj5IQTAXZGqs8Ofzq8JRtEp0GCFP7IHq0YszGT4
	 DBTBhiFfa0FpCzKPEzWj6m24rMmU3cSQpDpvxPZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 378B2F805CB; Wed,  3 Dec 2025 20:36:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E4AF800BA;
	Wed,  3 Dec 2025 20:36:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75236F8051D; Wed,  3 Dec 2025 20:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A643FF800BA
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 20:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A643FF800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187dcbaf8e561b00-webhooks-bot@alsa-project.org>
In-Reply-To: <187dcbaf8dbf5f00-webhooks-bot@alsa-project.org>
References: <187dcbaf8dbf5f00-webhooks-bot@alsa-project.org>
Subject: Asus ROG Crosshair X870E hero (ACL4082) - No audio from rear
 microphone
Date: Wed,  3 Dec 2025 20:36:34 +0100 (CET)
Message-ID-Hash: CHPAX7MLOXUQETLQXPVHWS5XCQPXO6M4
X-Message-ID-Hash: CHPAX7MLOXUQETLQXPVHWS5XCQPXO6M4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHPAX7MLOXUQETLQXPVHWS5XCQPXO6M4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #652 was opened from fixed77:

The Rear Microphone is detected as Line In when I plug in my mic. There is no sound from the microphone. I don't use the Front Audio connection as my case doesn't have I/O for it, I just used the 2 audio ports in the rear.

Motherboard: Asus ROG Crosshair X870E hero
Audio Device: ALC4082
Distro: Ubuntu 24.04
Window Manager: Gnome-Shell
Packages:
```
alsa-base/noble,noble,now 1.0.25+dfsg-0ubuntu7
alsa-topology-conf/noble,noble,now 1.2.5.1-2
alsa-ucm-conf/noble-updates,noble-updates,now 1.2.10-1ubuntu5.7
alsa-utils/noble,now 1.2.9-1ubuntu5
gstreamer1.0-alsa/noble-updates,noble-security,now 1.24.2-1ubuntu0.3
gstreamer1.0-pipewire/noble-updates,now 1.0.5-1ubuntu3.1
gstreamer1.0-pulseaudio/noble-updates,noble-security,now 1.24.2-1ubuntu1.2
libpipewire-0.3-0t64/noble-updates,now 1.0.5-1ubuntu3.1
libpipewire-0.3-common/noble-updates,noble-updates,now 1.0.5-1ubuntu3.1
libpipewire-0.3-modules/noble-updates,now 1.0.5-1ubuntu3.1
pipewire-alsa/noble-updates,now 1.0.5-1ubuntu3.1
pipewire-audio/noble-updates,noble-updates,now 1.0.5-1ubuntu3.1
pipewire-bin/noble-updates,now 1.0.5-1ubuntu3.1
pipewire-pulse/noble-updates,now 1.0.5-1ubuntu3.1
pipewire/noble-updates,now 1.0.5-1ubuntu3.1
pulseaudio-utils/noble-updates,now 1:16.1+dfsg1-2ubuntu10.1
```

`lsusb | grep -i audio`
```
Bus 001 Device 009: ID 0b05:1b7c ASUSTek Computer, Inc. USB Audio
```

`alsactl monitor` (unplugging and plugging mic)
```
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
```

`amixer -c 2 contents`
```
numid=8,iface=CARD,name='Analog In - Input Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=11,iface=CARD,name='Clock Source 1 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=15,iface=CARD,name='Clock Source 3 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=19,iface=CARD,name='Clock Source 4 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=22,iface=CARD,name='Clock Source 5 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=26,iface=CARD,name='Clock Source 7 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=29,iface=CARD,name='Clock Source 8 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=27,iface=CARD,name='Headphone - Output Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
numid=30,iface=CARD,name='IEC958 In - Output Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=12,iface=CARD,name='Line - Input Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=16,iface=CARD,name='Mic - Input Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
numid=23,iface=CARD,name='Speaker - Output Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=20,iface=MIXER,name='PCM Playback Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=on
numid=24,iface=MIXER,name='PCM Playback Switch',index=1
  ; type=BOOLEAN,access=rw------,values=1
  : values=off
numid=28,iface=MIXER,name='PCM Playback Switch',index=2
  ; type=BOOLEAN,access=rw------,values=1
  : values=on
numid=21,iface=MIXER,name='PCM Playback Volume'
  ; type=INTEGER,access=rw---R--,values=8,min=0,max=87,step=0
  : values=56,56,56,56,56,56,56,56
  | dBminmax-min=-65.25dB,max=0.00dB
numid=25,iface=MIXER,name='PCM Playback Volume',index=1
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=255,step=0
  : values=215,215
  | dBminmax-min=-127.50dB,max=0.00dB
numid=13,iface=MIXER,name='Line Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=on
numid=14,iface=MIXER,name='Line Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=39,39
  | dBminmax-min=-17.25dB,max=12.00dB
numid=17,iface=MIXER,name='Mic Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=off
numid=18,iface=MIXER,name='Mic Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=39,39
  | dBminmax-min=-17.25dB,max=12.00dB
numid=9,iface=MIXER,name='Analog In Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=on
numid=10,iface=MIXER,name='Analog In Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=39,39
  | dBminmax-min=-17.25dB,max=12.00dB
numid=1,iface=PCM,name='Capture Channel Map'
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
  | container
    | chmap-fixed=FL,FR
numid=4,iface=PCM,name='Playback Channel Map'
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=3,4
  | container
    | chmap-fixed=FL,FR
    | chmap-fixed=FL,FR,RL,RR
    | chmap-fixed=FL,FR,FC,LFE,RL,RR
    | chmap-fixed=FL,FR,FC,LFE,RL,RR,SL,SR
numid=2,iface=PCM,name='Capture Channel Map',device=1
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=3,4
  | container
    | chmap-fixed=FL,FR
numid=5,iface=PCM,name='Playback Channel Map',device=1
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
  | container
    | chmap-fixed=FL,FR
numid=3,iface=PCM,name='Capture Channel Map',device=2
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
  | container
    | chmap-fixed=FL,FR
numid=6,iface=PCM,name='Playback Channel Map',device=2
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
  | container
    | chmap-fixed=FL,FR
numid=7,iface=PCM,name='Playback Channel Map',device=3
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
  | container
    | chmap-fixed=FL,FR
```

`arecord -l`
```
**** List of CAPTURE Hardware Devices ****
card 2: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
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

[alsa-info.txt](https://github.com/user-attachments/files/23915492/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/652
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
