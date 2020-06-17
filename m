Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7831FD1B8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ACC61676;
	Wed, 17 Jun 2020 18:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ACC61676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592410484;
	bh=v/RtCrTs+FeaDq0ehxo++1i4N1/mC7IfQFMxuiTv450=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVQfOhV9ZMUwe30ojgoSSsTDOQGWZ5id1X2hIu9aAv8GkTqWpHZlEdXDc5MQloTqq
	 VVgeYWn25OZhrh176xXSYSdNFWtx+OkHzy/V71bMafMwFP0jaEt/b/Pp5WIHBkDtA7
	 8I/6uVnhLhLDh5Hs8Tkwulg3piSyz1OoxoG9hRjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 170D3F801D9;
	Wed, 17 Jun 2020 18:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD52F80171; Wed, 17 Jun 2020 18:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de
 [80.67.31.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ACC5F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACC5F80116
Received: from [87.123.36.99] (helo=yrla.localnet)
 by smtprelay06.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <alsa@reaktanz.de>)
 id 1jlagC-0006KX-MW; Wed, 17 Jun 2020 18:12:48 +0200
From: "m.eik michalke" <alsa@reaktanz.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: presonus StudioLive 24.4.2
Date: Wed, 17 Jun 2020 18:12:48 +0200
Message-ID: <1950143.FVrUTiCnyk@yrla>
Organization: https://reaktanz.de
X-Face: :Fk?kfw3:=Vz)np%nh,d4^[#)-y,9IYe:y,; }P|%`fw>/.msl.f=*6j*-f$vL09$qopvp6
 Ox|(^ge<|+0iS]{&|\<0>i7r'@'k+i=eB5y8*pO$#xT+$2uq=`
In-Reply-To: <20200617133704.GB274842@workstation>
References: <1859294.RmyynjnHiM@meadow> <5770610.t4SrzthkjT@yrla>
 <20200617133704.GB274842@workstation>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Df-Sender: MmRXRmFlNmlha21wWFBSNnA5Y1lAYWQuZ2VsZHVudGVyZ2FuZy5iaXo=
Cc: alsa-devel@alsa-project.org
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

hi,

Am Mittwoch, 17. Juni 2020, 15:37:04 CEST schrieb Takashi Sakamoto:
> > $ cat /proc/asound/pcm
> > [...]
> > 04-00: DICE : StudioLive : playback 1 : capture 1
> > 04-01: DICE : StudioLive : playback 1 : capture 1
=20
> I suggest users to use 'alsa_in' and 'alsa_out' in jackd
> session. Two pairs of PCM device (hw:x,0 and hw:x,1) need to be handled
> for all of PCM channels. I'm sorry but at present total channels are not
> available via one pair of PCM device.

ok, could a hack like this also help me out?

  http://www.jrigg.co.uk/linuxaudio/ice1712multi.html

> Well, this is a request from me. In IEEE 1394 bus, each device has
> 'configuration ROM' which the other device can read. Linux FireWire
> subsystem read it for device detection. I gather the ROM image[1] for
> better detection and would I request you to send the ROM image to me

sent to you off-list. hth.


viele gr=FC=DFe :: m.eik




