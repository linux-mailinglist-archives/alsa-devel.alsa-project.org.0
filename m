Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A079ECB24
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD3D23D1;
	Wed, 11 Dec 2024 12:27:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD3D23D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916462;
	bh=hBQRQ8ESi7Eq31G40nZCyMvXGjn2SEYp1AjX9awnGwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJ8Cuise1CG46pYOKx0q5fqmzplhGgNc6sz0kj1Z2QmG7Z40v0YxOXjqRE4+iFiIN
	 jwKaCx4KJyab4RNjIprBm1g7lZfP1xo2N/lUjDYMdtj0SMICWCu0E4S2aMmHn17d55
	 rpJEATat8IquvwjozEKWTIHJNRM8su/eVNPvbwpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 971ADF805C1; Wed, 11 Dec 2024 12:27:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77DABF805C2;
	Wed, 11 Dec 2024 12:27:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94578F80482; Mon,  9 Dec 2024 18:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE7ADF8032D
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 18:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE7ADF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=meesny header.b=r2OJ78qP
Received: from jyty (dsl-hkibng22-50ddb0-34.dhcp.inet.fi [80.221.176.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: msmakela)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y6TGf3qrrzyR7;
	Mon,  9 Dec 2024 19:23:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733765002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLw1c9ExvcQmf/sEr1pL9dAp+YXDJ/ofKOdrmeX/xUI=;
	b=r2OJ78qP9HPiOuES6mBoOn1rReKbdDM83KbqfL6RHcQ8SI2B69eUfx0tOpAWtSEowRcHbi
	avIqJangxR5VOgacFaRKD6SlMydv95zZpjRIHO+cBNdcOCwb7XoK7mBaOCESUj0YVyWPry
	EDRqPzm0eJP2Shv5W8QYLKzPLz6fEzs=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733765002; a=rsa-sha256; cv=none;
	b=t5njSnyigtZsvD8OK6ygQ+dakQMjjEKEzOhu3IlZMdd/wId1XDlcLW7IFerxkWrRXEB46k
	l9RKdqeuJQHpi5l4mIUSrCFvF5ypGvAmAMCh//pCkQls+RTLb3+lXafKf/Jk0t72uIGduS
	GQwrSS67dA4WtvsbNHR2zDbnfhl41pQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733765002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLw1c9ExvcQmf/sEr1pL9dAp+YXDJ/ofKOdrmeX/xUI=;
	b=AuFJt5ojkvujgJsJGOZTLfQeJn+mowizufpzvLcKLIMSMd3koGAkvc6ns5CHkNdShuQUo3
	FXipiK2w3+6rs7WWVo8KVc3o/NRJTSLyFF2sE2M4iYzXZxNcuAwJUVetRKv4otYV22Z3hW
	DxzC/Hw9OZtfsw1XfA/eFipTsR6INk8=
Date: Mon, 9 Dec 2024 19:23:21 +0200
From: Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To: VDR Mailing List <vdr@linuxtv.org>
Cc: alsa-devel@alsa-project.org
Subject: Re: [vdr] Re: Identifying MPEG-4 HE-AAC (LATM, LAOS) audio formats
Message-ID: <Z1cniaCIBoFt-NTo@jyty>
References: <Z1NfRupTvjFeTlbi@jyty>
 <4d80afb0-fd93-4ab7-afcd-06a9a4d7700a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d80afb0-fd93-4ab7-afcd-06a9a4d7700a@gmail.com>
X-MailFrom: marko.makela@iki.fi
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OGLNJIMPBSKVWVNIZLNFG34JXV7VPZUD
X-Message-ID-Hash: OGLNJIMPBSKVWVNIZLNFG34JXV7VPZUD
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGLNJIMPBSKVWVNIZLNFG34JXV7VPZUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Dec 06, 2024 at 10:31:06PM +0100, schorpp wrote:
>Am 06.12.24 um 21:32 schrieb Marko Mäkelä:
>>A couple of weeks ago, Finland took the penultimate step to get rid 
>>of DVB-T. Since years, we had DVB-T and DVB-T2 running in parallel. 
>>The DVB-T transponders should be shut down in 2025.
>
>same here but h.265 video and aac audio.

Right, it's H.265 video in Germany. I found somewhere a reference to 
something that would transcode H.265 into H.264 on the fly on a 
Raspberry Pi 3, so that the Videocore GPU could play it in real time.

>>The VDR channel search failed to find this transponder; I ran a 
>>patched version of https://github.com/mighty-p/t2scan/pull/15/ to 
>>generate a new channels.conf. (Is this a bug of VDR, or a feature? I 
>>remember that when I originally set up VDR, I had to get a 
>>channels.conf from tscan or t2scan.)
>
>have You tried the latest git version of scan in dvb-utils 
>@linuxtx.org repo?

At https://git.linuxtv.org/v4l-utils.git I found a reference to the 
command dvbv5-scan. An "apt search dvbv5-scan" on my Debian Sid as well 
as on Raspbian 12.8 yielded two packages: dvb-tools and w-scan-cpp. I 
vaguely remember that I had used the latter one a few years ago. I just 
invoked the following on the Raspberry Pi:

w_scan_cpp -c FI

The output during scanning looks convincing, but the program seems to 
get stuck waiting for something at the end, for several minutes.

I also tried to invoke dvbv5-scan from dvb-tools, but it seems to 
require a file that contains some initial parameters.

Anyway, I was mainly wondering if it is normal that the EPG update in 
VDR did not find the new transponder. I guess it is; the search space 
would be huge if it had to cover satellite, cable, terrestrial and some 
IPTV sources as well.

>>The HE-AAC support in rpihddevice is experimental,
>
>as it has been in ffmpeg until today and rpihddevive is based on it?

As in:

#ifdef ENABLE_AAC_LATM
#warning "experimental AAC-LATM frame parser enabled, only 2ch/48kHz supported!"
#endif

>Have You tried the latest git ffprobe version, does it detect the aac 
>flavor of Your dvb-t2 DVB channels correctly?

I only have 2-channel recordings or DVB-T2 streams available to me.  
Those already play without any problems. But I don't have any recording 
with multichannel audio. I would like to implement correct detection and 
playback of multichannel HE-AAC audio, so that the AAC audio support 
could be enabled by default in rpihddevice.

>Have You tried latest git mediainfo?

I was reading the libmediainfo source code a few days ago. I guess I 
should just have executed mediainfo on an MPEG-4 TS file inside a 
debugger, to find out how and where exactly it detects the audio 
parameters.

>Not at all academic. Since AVRs do not implement Fraunhofer codecs we 
>need a HDNI PCM Multichannel driver for the raspberry pi to playback 
>5.1 channel aac without transcoding it to ac3 which can be done with 
>mplayer on the fly.

Right, also according to the NorDig specification, some transcoding of 
audio is mandatory for some audio output options.

>I've made a HDMI PCM Multichannel output to AVR driver patch for the 
>Allwinner SoC alsa audio driver, look for it on the alsa-dev list 
>archives.

Sorry, I could not find it. I figured out that AVR here must refer to 
Audio Video Receiver. The only HDMI output devices that I have are 
displays with 2 built-in speakers. I believe that I am currently using 
2-channel PCM audio output.

Are there any sample MPEG TS recordings with 5.1 channel AAC audio?  
That would be very helpful. In a 2-channel setup, would it be customary 
to pass through only the first 2 channels and ignore the rest?

	Marko
