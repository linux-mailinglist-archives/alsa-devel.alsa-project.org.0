Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF999E5A48
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2024 16:53:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370BA20C3;
	Thu,  5 Dec 2024 16:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370BA20C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733414004;
	bh=V3IqJXw3hjWYrNEH5sRJGyTkT4v9qkpMrrjwNFLfnWY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=go8ixcBCElzZGYOx+269og7dzuldFyaw316+D3D9f/Pu+pHcfn9K2LA5l4RCWf+3D
	 wECvlo4g0mm3v14+1z9pz0704+8gHo+mRJwcc6ClwyJFuUBwgUwbV0FRofKudC/Grm
	 MKPoM23Zr2ejWGVdAIfBC8bVR+B0sK5X6kvJSxlw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F760F805C1; Thu,  5 Dec 2024 16:52:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E10D0F805C0;
	Thu,  5 Dec 2024 16:52:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29FD9F8047C; Thu,  5 Dec 2024 16:52:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 704A0F80073
	for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2024 16:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 704A0F80073
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733413964857636213-webhooks-bot@alsa-project.org>
References: <1733413964857636213-webhooks-bot@alsa-project.org>
Subject: With SOF enabled in sof-hda-generic.tplg device (no DMIC) the control
 'Capture Source' is not controlled by UCM
Message-Id: <20241205155247.29FD9F8047C@alsa1.perex.cz>
Date: Thu,  5 Dec 2024 16:52:47 +0100 (CET)
Message-ID-Hash: CAMXWXBMOUEX3YHQZGDIA4HPTQHT3TGT
X-Message-ID-Hash: CAMXWXBMOUEX3YHQZGDIA4HPTQHT3TGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAMXWXBMOUEX3YHQZGDIA4HPTQHT3TGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #484 was opened from singalsu:

The configuration is not usual. If there is no DMIC in the system usually the legacy mode is selected (as with `options snd_intel_dspcfg dsp_driver=1`). In such PCs SOF can be enabled with `options snd_intel_dspcfg dsp_driver=3`.

When a headset is plugged/unplugged the playback correctly switches between speaker and headphone/headset earbuds.

But the microphone capture remains muted. I noticed with legacy mode where internal microphones work that control name='Capture Source' changes to 1 when headset is removed:

```
singalsu@asteri:~$ amixer -c0 cget name='Capture Source' 
numid=6,iface=MIXER,name='Capture Source'
  ; type=ENUMERATED,access=rw------,values=1,items=2
  ; Item #0 'Headset Mic'
  ; Item #1 'Internal Mic'
  : values=1
singalsu@asteri:~$ amixer -c0 cget name='Capture Source' 
numid=6,iface=MIXER,name='Capture Source'
  ; type=ENUMERATED,access=rw------,values=1,items=2
  ; Item #0 'Headset Mic'
  ; Item #1 'Internal Mic'
  : values=0
```

This is not happening when SOF is enabled. But I could make internal microphones capture work with `amixer -c0 cset name='Capture Source' 1`.  Is there a way to fix this in ucm2? I'm not absolutely sure about this issue in Fedora 41 but this happens with my modified ucm2 development code with git master branch.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/484
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
