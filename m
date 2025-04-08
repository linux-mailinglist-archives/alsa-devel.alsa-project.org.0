Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D5A7F2AB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Apr 2025 04:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACEEF61486;
	Tue,  8 Apr 2025 04:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACEEF61486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744079465;
	bh=kd3AR4l3o0nQ238a3aa2fyYyxE7iLod6V+ByAGq7qTo=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Efo4g8RnWUWa8YjaJjYMIfJtAbd9N0GFqnQmJAiRV8R66CAzf7mxYx1zS2qmweJVU
	 OXa+cnNnmAZakO8TdQ/prhZ9ol0G260bbwyqvsu9B/wxded5EK/OraV8v0GZ8ej0/F
	 q92DNg/kD1QWnqgcozX3usaul7D3OLGR352Fag40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4671F80579; Tue,  8 Apr 2025 04:30:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93473F805BE;
	Tue,  8 Apr 2025 04:30:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 176B8F8055B; Tue,  8 Apr 2025 04:30:29 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC94F8003C
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 04:30:29 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Fireworks Alsa Driver Buffer SIze
From: jayt0808@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 08 Apr 2025 02:30:29 -0000
Message-ID: 
 <174407942905.20.18091745518547812642@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: L5CGMJVERENMMIDOFKUQQZOTKPXUNGCH
X-Message-ID-Hash: L5CGMJVERENMMIDOFKUQQZOTKPXUNGCH
X-MailFrom: jayt0808@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTH4GFV7FEBL7KTG33GTCGO52J3RVQU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi

I'm using an AudioFire 8a that has 16 channels over the firewire bus and the snd-fireworks alsa firewire driver.  In Jack, when I set Frames/Period to anything higher than 64, alsa fails with an error saying 

Mon Apr  7 22:15:35 2025: ERROR: ALSA: cannot set hardware parameters for capture
Mon Apr  7 22:15:35 2025: ERROR: ALSA: cannot configure capture channel

I noticed that the output of "aplay -D hw:1,0 --dump-hw-params /dev/zero" indicated the following alsa settings:
Playing raw data '/dev/zero' : Unsigned 8 bit, Rate 8000 Hz, Mono
HW Params of device "hw:1,0":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: 32
FRAME_BITS: [384 512]
CHANNELS: [12 16]
RATE: [32000 96000]
PERIOD_TIME: [250 32000]
PERIOD_SIZE: [16 2720]
PERIOD_BYTES: [768 131072]
PERIODS: [2 341]
BUFFER_TIME: (333 170500]
BUFFER_SIZE: [32 5456]
BUFFER_BYTES: [1536 262144]
TICK_TIME: ALL
--------------------
aplay: set_params:1371: Sample format non available
Available formats:
- S32_LE

I was concerned that the BUFFER_SIZE was too small to support 16 channels at a 128 Frames/Period size.  But when I modded the driver to increase this figure, it did not fix the issue.

Anyone have any insight on this issue?  Running Ubuntu 24.04 with kernel 6.8.0-57-lowlatency.  Everything seems to work fine when I set 64 Frames/Period (except the occasional annoying stuttering that one can expect in that scenario; with a buffer that is too small to support the system load).

Thanks

Jay
