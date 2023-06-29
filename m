Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322C5742666
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 14:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B61822;
	Thu, 29 Jun 2023 14:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B61822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688041662;
	bh=AfuJFxB5HGB5dEw8d2RoLhSRtTYMkciocrrBGYrJmqQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TyZ9BfgU13k97P5AfVw/2gGCn5VjCzFDiyK3FrmC+fg3EXhS79RYSH9t6/G8Nvoeh
	 uAaMY1bga/1LFPzAMPFu5gPz1E1mJQ4+Y5Xhr5wd4fetI3ppg26WGKa5Vjhef7ZbCp
	 DhcRCJqO275dvYV0B9B/Upd01FpTBurj7ja3JJ5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3C2FF80534; Thu, 29 Jun 2023 14:26:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F14F80212;
	Thu, 29 Jun 2023 14:26:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41224F80246; Thu, 29 Jun 2023 14:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EA459F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 14:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA459F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1688041568288369894-webhooks-bot@alsa-project.org>
References: <1688041568288369894-webhooks-bot@alsa-project.org>
Subject: Arturia Minifuse 2 (and probably any other using SplitPCM macro) -
 lost sample rate range on each in/out (and forced to 48000)
Message-Id: <20230629122625.41224F80246@alsa1.perex.cz>
Date: Thu, 29 Jun 2023 14:26:25 +0200 (CEST)
Message-ID-Hash: SUHUPFFCS5R56RZH3YIXDJOONBNJPLVQ
X-Message-ID-Hash: SUHUPFFCS5R56RZH3YIXDJOONBNJPLVQ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUHUPFFCS5R56RZH3YIXDJOONBNJPLVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #333 was opened from kmarty:

Hi,
I have Arturia MiniFuse 2 card allowing playback/capture sample rate in range 44100 - 192000. But using channel name (e.g. `Mic/Line/Inst 1 (L)`, `Main Output L/R`) created by UCM, it offers 48000 only (and in case o playback, it offers S15_LE only).

Looks like something is lost when `SplitPCM` macro is used or so (I have absolutely no idea what's going on here).

Is there any possibility to make it work as it should?


=================================
`/proc/asound/card4/stream0` output:
```
ARTURIA MiniFuse 2 at usb-0000:16:00.0-6.2, high speed : USB Audio

Playback:
  Status: Stop
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 4
    Endpoint: 0x01 (1 OUT) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR FC LFE
    Sync Endpoint: 0x81 (1 IN)
    Sync EP Interface: 1
    Sync EP Altset: 1
    Implicit Feedback Mode: No
  Interface 1
    Altset 2
    Format: S16_LE
    Channels: 4
    Endpoint: 0x01 (1 OUT) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 16
    Channel map: FL FR FC LFE
    Sync Endpoint: 0x81 (1 IN)
    Sync EP Interface: 1
    Sync EP Altset: 2
    Implicit Feedback Mode: No

Capture:
  Status: Stop
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 4
    Endpoint: 0x82 (2 IN) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR FC LFE
```

`alsaucm -c hw:4 dump text` output:
```
Verb.HiFi {
	Comment "Default Alsa Profile"
	Device.Line1 {
		Comment "Main Output L/R"
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			PlaybackCTL "_ucm0001.hw:M2"
			PlaybackChannels 2
			PlaybackPCM "_ucm0001.minifuse12_stereo_out:M2,0,0,1"
			PlaybackPriority 300
		}
	}
	Device.Line2 {
		Comment "Loopback L/R"
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			CaptureChannels 2
			CapturePCM "_ucm0001.minifuse12_stereo_in:M2,0,2,3"
			CapturePriority 200
			PlaybackCTL "_ucm0001.hw:M2"
			PlaybackChannels 2
			PlaybackPCM "_ucm0001.minifuse12_stereo_out:M2,0,2,3"
			PlaybackPriority 200
		}
	}
	Device.Line3 {
		Comment "Stereo Input 1+2 L/R"
		ConflictingDevices [
			Mic2,
			Mic1
		]
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			CaptureChannels 2
			CapturePCM "_ucm0001.minifuse12_stereo_in:M2,0,0,1"
			CapturePriority 100
			PlaybackCTL "_ucm0001.hw:M2"
		}
	}
	Device.Mic1 {
		Comment "Mic/Line/Inst 1 (L)"
		ConflictingDevices [
			Line3
		]
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			CaptureChannels 1
			CapturePCM "_ucm0001.minifuse12_mono_in:M2,0,0"
			CapturePriority 400
			PlaybackCTL "_ucm0001.hw:M2"
		}
	}
	Device.Mic2 {
		Comment "Mic/Line/Inst 2 (R)"
		ConflictingDevices [
			Line3
		]
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			CaptureChannels 1
			CapturePCM "_ucm0001.minifuse12_mono_in:M2,0,1"
			CapturePriority 300
			PlaybackCTL "_ucm0001.hw:M2"
		}
	}
}
Verb.Direct {
	Comment "Direct MiniFuse 2"
	Device.Direct {
		Comment "Direct MiniFuse 2"
		Values {
			CaptureCTL "_ucm0001.hw:M2"
			CaptureChannels 4
			CapturePCM "_ucm0001.hw:M2"
			CapturePriority 1000
			PlaybackCTL "_ucm0001.hw:M2"
			PlaybackChannels 4
			PlaybackPCM "_ucm0001.hw:M2"
			PlaybackPriority 1000
		}
	}
}
```

Pipewire debug log "spa.alsa:D" excerpts (I have no idea how to get this elsewhere, but it matches to offered reality):
```
[I][12125.973616] spa.alsa     | [      alsa-pcm.c:  618 spa_alsa_open()] 0x562ee6e95448: ALSA device open '_ucm0001.minifuse12_mono_in:M2,0,0' capture
[I][12125.993003] spa.alsa     | [      alsa-pcm.c:  568 probe_pitch_ctl()] minifuse12_mono_in:M2,0,0 could not find ctl device: No such file or directory
[D][12125.993047] spa.alsa     | [      alsa-pcm.c: 1048 debug_hw_params()] enum_pcm_formats:
[D][12125.993065] spa.alsa     | [      alsa-pcm.c:  469 log_write()] ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED RW_INTERLEAVED RW_NONINTERLEAVED
[D][12125.993075] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FORMAT:  S32_LE
[D][12125.993082] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SUBFORMAT:  STD
[D][12125.993089] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SAMPLE_BITS: 32
[D][12125.993095] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FRAME_BITS: 32
[D][12125.993101] spa.alsa     | [      alsa-pcm.c:  469 log_write()] CHANNELS: 1
[D][12125.993107] spa.alsa     | [      alsa-pcm.c:  469 log_write()] RATE: 48000
[D][12125.993113] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_TIME: 10000
[D][12125.993119] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_SIZE: 480
[D][12125.993124] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_BYTES: 1920
[D][12125.993130] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIODS: [2 50]
[D][12125.993136] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_TIME: [20000 500000]
[D][12125.993142] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_SIZE: [960 24000]
[D][12125.993148] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_BYTES: [3840 96000]
[D][12125.993153] spa.alsa     | [      alsa-pcm.c:  469 log_write()] TICK_TIME: ALL
[D][12125.993165] spa.alsa     | [      alsa-pcm.c:  885 add_rate()] min:48000 max:48000 min-allowed:0 scale:1 interleave:1 all:0
[D][12125.993172] spa.alsa     | [      alsa-pcm.c:  909 add_rate()] rate:48000 multi:1 card:0 def:0
[D][12125.993180] spa.alsa     | [      alsa-pcm.c:  963 add_channels()] channels (1 1) default:1 all:0
[D][12125.993187] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x562ee6e95448: position 0 2
```
```
[I][12125.637937] spa.alsa     | [      alsa-pcm.c:  618 spa_alsa_open()] 0x562ee6e24218: ALSA device open '_ucm0001.minifuse12_stereo_out:M2,0,0,1' playback
[I][12125.657353] spa.alsa     | [      alsa-pcm.c:  568 probe_pitch_ctl()] minifuse12_stereo_out:M2,0,0,1 could not find ctl device: No such file or directory
[D][12125.657379] spa.alsa     | [      alsa-pcm.c: 1048 debug_hw_params()] enum_pcm_formats:
[D][12125.657398] spa.alsa     | [      alsa-pcm.c:  469 log_write()] ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED RW_INTERLEAVED RW_NONINTERLEAVED
[D][12125.657407] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FORMAT:  S16_LE
[D][12125.657414] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SUBFORMAT:  STD
[D][12125.657420] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SAMPLE_BITS: 16
[D][12125.657427] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FRAME_BITS: 32
[D][12125.657433] spa.alsa     | [      alsa-pcm.c:  469 log_write()] CHANNELS: 2
[D][12125.657439] spa.alsa     | [      alsa-pcm.c:  469 log_write()] RATE: 48000
[D][12125.657445] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_TIME: 10000
[D][12125.657452] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_SIZE: 480
[D][12125.657458] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_BYTES: 1920
[D][12125.657463] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIODS: [2 50]
[D][12125.657468] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_TIME: [20000 500000]
[D][12125.657474] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_SIZE: [960 24000]
[D][12125.657481] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_BYTES: [3840 96000]
[D][12125.657488] spa.alsa     | [      alsa-pcm.c:  469 log_write()] TICK_TIME: ALL
[D][12125.657499] spa.alsa     | [      alsa-pcm.c:  885 add_rate()] min:48000 max:48000 min-allowed:0 scale:1 interleave:1 all:0
[D][12125.657507] spa.alsa     | [      alsa-pcm.c:  909 add_rate()] rate:48000 multi:1 card:0 def:0
[D][12125.657514] spa.alsa     | [      alsa-pcm.c:  963 add_channels()] channels (2 2) default:2 all:0
[D][12125.657521] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x562ee6e24218: position 0 3
[D][12125.657528] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x562ee6e24218: position 1 4
```

Without matching UCM profile the in/outs offers the full range (but everything is mapped as "surround" 4-channel):
```
[D][13133.383190] spa.alsa     | [      alsa-pcm.c: 1346 spa_alsa_enum_format()] opened:0 format:0 started:0
[I][13133.383199] spa.alsa     | [      alsa-pcm.c:  618 spa_alsa_open()] 0x5629c57893f8: ALSA device open 'surround40:4' capture
[I][13133.384911] spa.alsa     | [      alsa-pcm.c:  568 probe_pitch_ctl()] surround40:4 could not find ctl device: No such file or directory
[D][13133.384928] spa.alsa     | [      alsa-pcm.c: 1048 debug_hw_params()] enum_pcm_formats:
[D][13133.384941] spa.alsa     | [      alsa-pcm.c:  469 log_write()] ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
[D][13133.384947] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FORMAT:  S32_LE
[D][13133.384951] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SUBFORMAT:  STD
[D][13133.384955] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SAMPLE_BITS: 32
[D][13133.384959] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FRAME_BITS: 128
[D][13133.384963] spa.alsa     | [      alsa-pcm.c:  469 log_write()] CHANNELS: 4
[D][13133.384967] spa.alsa     | [      alsa-pcm.c:  469 log_write()] RATE: [44100 192000]
[D][13133.384970] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_TIME: [125 1000000]
[D][13133.384974] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_SIZE: [6 192000]
[D][13133.384978] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_BYTES: [96 3072000]
[D][13133.384982] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIODS: [2 1024]
[D][13133.384986] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_TIME: (62 2000000]
[D][13133.384990] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_SIZE: [12 384000]
[D][13133.384993] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_BYTES: [192 6144000]
[D][13133.384997] spa.alsa     | [      alsa-pcm.c:  469 log_write()] TICK_TIME: ALL
[D][13133.385004] spa.alsa     | [      alsa-pcm.c:  885 add_rate()] min:44100 max:192000 min-allowed:0 scale:1 interleave:1 all:0
[D][13133.385009] spa.alsa     | [      alsa-pcm.c:  909 add_rate()] rate:48000 multi:1 card:0 def:0
[D][13133.385014] spa.alsa     | [      alsa-pcm.c:  963 add_channels()] channels (4 4) default:4 all:0
[D][13133.385018] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57893f8: position 0 3
[D][13133.385022] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57893f8: position 1 4
[D][13133.385026] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57893f8: position 2 12
[D][13133.385030] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57893f8: position 3 13
```
```
[D][13133.381023] spa.alsa     | [      alsa-pcm.c: 1346 spa_alsa_enum_format()] opened:0 format:0 started:0
[I][13133.381032] spa.alsa     | [      alsa-pcm.c:  618 spa_alsa_open()] 0x5629c57650b8: ALSA device open 'surround40:4' playback
[I][13133.382756] spa.alsa     | [      alsa-pcm.c:  568 probe_pitch_ctl()] surround40:4 could not find ctl device: No such file or directory
[D][13133.382772] spa.alsa     | [      alsa-pcm.c: 1048 debug_hw_params()] enum_pcm_formats:
[D][13133.382786] spa.alsa     | [      alsa-pcm.c:  469 log_write()] ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
[D][13133.382792] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FORMAT:  S16_LE S32_LE
[D][13133.382796] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SUBFORMAT:  STD
[D][13133.382800] spa.alsa     | [      alsa-pcm.c:  469 log_write()] SAMPLE_BITS: [16 32]
[D][13133.382804] spa.alsa     | [      alsa-pcm.c:  469 log_write()] FRAME_BITS: [64 128]
[D][13133.382808] spa.alsa     | [      alsa-pcm.c:  469 log_write()] CHANNELS: 4
[D][13133.382812] spa.alsa     | [      alsa-pcm.c:  469 log_write()] RATE: [44100 192000]
[D][13133.382816] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_TIME: [125 1000000]
[D][13133.382820] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_SIZE: [6 192000]
[D][13133.382824] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIOD_BYTES: [64 3072000]
[D][13133.382827] spa.alsa     | [      alsa-pcm.c:  469 log_write()] PERIODS: [2 1024]
[D][13133.382831] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_TIME: (62 2000000]
[D][13133.382835] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_SIZE: [12 384000]
[D][13133.382839] spa.alsa     | [      alsa-pcm.c:  469 log_write()] BUFFER_BYTES: [96 6144000]
[D][13133.382843] spa.alsa     | [      alsa-pcm.c:  469 log_write()] TICK_TIME: ALL
[D][13133.382850] spa.alsa     | [      alsa-pcm.c:  885 add_rate()] min:44100 max:192000 min-allowed:0 scale:1 interleave:1 all:0
[D][13133.382855] spa.alsa     | [      alsa-pcm.c:  909 add_rate()] rate:48000 multi:1 card:0 def:0
[D][13133.382859] spa.alsa     | [      alsa-pcm.c:  963 add_channels()] channels (4 4) default:4 all:0
[D][13133.382864] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57650b8: position 0 3
[D][13133.382868] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57650b8: position 1 4
[D][13133.382872] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57650b8: position 2 12
[D][13133.382876] spa.alsa     | [      alsa-pcm.c: 1036 add_channels()] 0x5629c57650b8: position 3 13
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/333
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
