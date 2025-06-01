Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A9AC9F4B
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Jun 2025 18:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CAC6022E;
	Sun,  1 Jun 2025 18:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CAC6022E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748794147;
	bh=xHBZxQfiIybpl/QvBGjX+DZhlNmmIRF9FGSGtUDJnBg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EKlhOoxk5UsS6ju7dXMs8VPRRWayoT7ApQsG+dl8gZ8ABmp/wPHnL5MqI7rUOwn0T
	 r8VNfxFc2r/xpetJnDO1gTucWuogFZD/lZ+M2MnuyKcB/WOucEv3AYsGA7GxlgvzD9
	 gabc46S7kbstnloL1JueSyn7QaKDGun18CvJklv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFA79F805A8; Sun,  1 Jun 2025 18:08:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF1AF805D5;
	Sun,  1 Jun 2025 18:08:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55E63F80528; Sun,  1 Jun 2025 18:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id AF581F8016D
	for <alsa-devel@alsa-project.org>; Sun,  1 Jun 2025 18:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF581F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1844f6fc8125cc00-webhooks-bot@alsa-project.org>
In-Reply-To: <1844f6fc8123f700-webhooks-bot@alsa-project.org>
References: <1844f6fc8123f700-webhooks-bot@alsa-project.org>
Subject: ALC4080 Mic In not working on ASUS ROG Strix B850-E Gaming WIFI
Date: Sun,  1 Jun 2025 18:08:41 +0200 (CEST)
Message-ID-Hash: B74OWJ7IIEI5E6IYDP2SMFHR3XUTYI66
X-Message-ID-Hash: B74OWJ7IIEI5E6IYDP2SMFHR3XUTYI66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B74OWJ7IIEI5E6IYDP2SMFHR3XUTYI66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #569 was edited from kieran4333:

[alsa-info.sh](http://alsa-project.org/db/?f=edcbadeae18eb8f200b9625d2b0fb411c6146851)  

`lsusb | grep -i audio`

```
Bus 001 Device 002: ID 0b05:1b9b ASUSTek Computer, Inc. USB Audio  

``` 
`amixer -c 2  contents`

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
  : values=off
numid=21,iface=MIXER,name='PCM Playback Volume'
  ; type=INTEGER,access=rw---R--,values=8,min=0,max=87,step=0
  : values=56,56,56,56,56,56,56,56
  | dBminmax-min=-65.25dB,max=0.00dB
numid=25,iface=MIXER,name='PCM Playback Volume',index=1
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
  : values=59,59
  | dBminmax-min=-65.25dB,max=0.00dB
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
  : values=35,35
  | dBminmax-min=-17.25dB,max=12.00dB
numid=9,iface=MIXER,name='Analog In Capture Switch'
  ; type=BOOLEAN,access=rw------,values=1
  : values=off
numid=10,iface=MIXER,name='Analog In Capture Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=39,step=0
  : values=36,36
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
`alsactl monitor` (Unplugging and plugging the mic)
```
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
node hw:2, #12 (0,0,0,Line - Input Jack,0) VALUE
``` 

`amixer -c events` (Unplugging and plugging mic)

```
event value: numid=12,iface=CARD,name='Line - Input Jack'
event value: numid=12,iface=CARD,name='Line - Input Jack'

``` 
It appears the Mic In is being incorrectly identified as the Line In and I cannot record any sound through this jack.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/569
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
