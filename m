Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCKHIIrirmmoJgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 16:08:58 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CA23B4D3
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 16:08:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E13A60206;
	Mon,  9 Mar 2026 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E13A60206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773068936;
	bh=Abgan1EJzbpcQ7XHnjDddIkKtUS044SlK/G3/N/xQw8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KhfZCLMDQMAVGyAEikew65bVdOcgeibo/M2gPNiWgNDkCR3GDSMfYSOjMTa8NpUtZ
	 YGINtgMLVB3/OcTe+BGSUx0kSa8vgZutUwWgvwhFXRnRRY3u8UqkyJtWVD242abD4/
	 P+sbM4CtCmoVF9InycD2uj+/UKlzRdyfolSyt4K8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D401BF805E7; Mon,  9 Mar 2026 16:08:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8497BF805E4;
	Mon,  9 Mar 2026 16:08:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0032F80571; Mon,  9 Mar 2026 16:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_FAIL,SPF_HELO_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A264F8052D
	for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2026 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A264F8052D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <189b34c336779300-webhooks-bot@alsa-project.org>
In-Reply-To: <189b34c33673d400-webhooks-bot@alsa-project.org>
References: <189b34c33673d400-webhooks-bot@alsa-project.org>
Subject: Asus ROG STRIX X870E-E Gaming Wifi (ACL4082) - No audio from rear
 microphone
Date: Mon,  9 Mar 2026 16:08:14 +0100 (CET)
Message-ID-Hash: 4KZIJLVF2AEW27C7UVIXJUWDYOGWT6Y2
X-Message-ID-Hash: 4KZIJLVF2AEW27C7UVIXJUWDYOGWT6Y2
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KZIJLVF2AEW27C7UVIXJUWDYOGWT6Y2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 408CA23B4D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa-project.org:mid]
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #718 was edited from cristian-tamblay:

The Rear Microphone is detected as Line In when I plug in my mic. There is no sound from the microphone. 
Motherboard: Asus ROG STRIX X870E-E GAMING WIFI
Audio Device: ALC4082
USB ID: 0b05:1b9b  
Distro: Ubuntu 24.04
Window Manager: Gnome-Shell

Before patching UCM locally, Linux exposed only generic USB audio profiles and the rear jack behaved like line input.
After adding USB ID `0b05:1b9b` to the UCM matching rules, the device now loads proper `HiFi` profiles and exposes `Microphone`, `Front Microphone`, and `Line Input` sources, but the rear microphone still does not record actual voice audio.

Recording now produces at most a small click/pop when capture starts, but no usable microphone signal.

I added `1b9b` in two places.

1) `/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf`
2) `/usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf`

`lsusb | grep -i audio`
`Bus 003 Device 004: ID 0b05:1b9b ASUSTek Computer, Inc. USB Audio`

`alsactl monitor`  (unplugging and plugging mic)

```
node hw:3, #23 (0,0,0,Speaker - Output Jack,0) VALUE
node hw:3, #23 (0,0,0,Speaker - Output Jack,0) VALUE
```
`amixer -c 3 contents`
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
numid=26,iface=CARD,name='Clock Source 6 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=29,iface=CARD,name='Clock Source 8 Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=27,iface=CARD,name='Headphone - Output Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
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
  : values=87,87,87,87,87,87,87,87
  | dBminmax-min=-65.25dB,max=0.00dB
numid=25,iface=MIXER,name='PCM Playback Volume',index=1
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
  : values=60,60
  | dBminmax-min=-65.25dB,max=0.00dB
numid=13,iface=MIXER,name='Line Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=off
numid=14,iface=MIXER,name='Line Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=39,39
  | dBminmax-min=-17.25dB,max=12.00dB
numid=17,iface=MIXER,name='Mic Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=on
numid=18,iface=MIXER,name='Mic Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=39,39
  | dBminmax-min=-17.25dB,max=12.00dB
numid=9,iface=MIXER,name='Analog In Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=off
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
  : values=0,0
  | container
    | chmap-fixed=FL,FR
    | chmap-fixed=FL,FR,RL,RR
    | chmap-fixed=FL,FR,FC,LFE,RL,RR
    | chmap-fixed=FL,FR,FC,LFE,RL,RR,SL,SR
numid=2,iface=PCM,name='Capture Channel Map',device=1
  ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
  : values=0,0
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
card 3: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
`alsaucm -c hw:3 dump text`
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
		Comment "Front Microphone"
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
	Device.Mic2 {
		Comment Microphone
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem "Analog In,0"
			CapturePCM "_ucm0001.hw:Audio"
			CapturePriority 400
			JackControl "Analog In - Input Jack"
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
		Comment "Front Microphone"
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
	Device.Mic2 {
		Comment Microphone
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem "Analog In,0"
			CapturePCM "_ucm0001.hw:Audio"
			CapturePriority 400
			JackControl "Analog In - Input Jack"
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
		Comment "Front Microphone"
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
	Device.Mic2 {
		Comment Microphone
		Values {
			CaptureCTL "_ucm0001.hw:Audio"
			CaptureMixerElem "Analog In,0"
			CapturePCM "_ucm0001.hw:Audio"
			CapturePriority 400
			JackControl "Analog In - Input Jack"
			PlaybackCTL "_ucm0001.hw:Audio"
			TQ HiFi
		}
	}
}
```

[alsa-info.txt](https://github.com/user-attachments/files/25845950/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/718
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
