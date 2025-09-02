Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14344B410E8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 01:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B287E601F6;
	Wed,  3 Sep 2025 01:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B287E601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756856821;
	bh=z+uRprAoN5iod/M6JoT+28194zivR1AYe4QB1Yn/DsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/rzcsmJnhBjAGH0f/7CWdg3C1bGYM0IToGJHvSJYL5exrSKH7eXqljWleE9jcT3Y
	 XGKBsGyoF8xx3BXP/29Dxji6YYrySf2qdskskdInhGvA9EGp5d4iWX3SMb5AlncctI
	 BDznpUYr/yxXAEPgtiRgPfaZg7gHNpny1W18g13I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E9E0F8059F; Wed,  3 Sep 2025 01:46:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDA7F805CA;
	Wed,  3 Sep 2025 01:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B26ECF804D6; Wed,  3 Sep 2025 01:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C77F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 01:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C77F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=abi7bdoT;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gvEIzGQh
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 44CB57A02F5;
	Tue,  2 Sep 2025 19:45:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 02 Sep 2025 19:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1756856745; x=1756943145; bh=uzzjP6Y2Jz2Kbm6qvX8GtYoIiDsoDsZc
	FHdnYF7v5Jo=; b=abi7bdoTlzlAkOEdYQ0VVvXNfGQ7CQxALm4Km8j33C8EJreT
	rq5AjMNPSYwps+pdHlPVqPtdECFj3hMjcLccn++evnSeZyqcSWFmUI2uKCxVxya7
	/7Bauc98ST087DJu/rZL1Du+5SsDlPdhwb3jM7ZQF3EtzlDu3D12vFDQJLnDZpto
	jyLZv7KQgJqtb0zZ58p710BXapejiv/MiW1Qj5gC0gxn3Fma5p1YdMiFdyf3jvDK
	GrPBYqxBNvbO7lfBL3k6RDKMJAUXOF/1D+Oy8W4gkibu/vtYmeFMzlnjwX3qIIjI
	SefB45cL+zLa60PSQm113jWYKrnRMhjyZlfhgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756856745; x=
	1756943145; bh=uzzjP6Y2Jz2Kbm6qvX8GtYoIiDsoDsZcFHdnYF7v5Jo=; b=g
	vEIzGQhyfR+WSoehMmkk0Zqu60+eZubA94bxXZNZv0JMpR6LIOjdcLVsBHEnjJtp
	ewggoCg3CJc0rlCUBDjh+SK6ac7mUR3nC9rapv39Hf636/UybO5Fnpmnnxv0QnMU
	gV72v6iWFmPBEzcxTYYrFkIw3BdxOOGbVyTgb48I6ZyOzefMrkFB859c1/zrWokH
	iZxHj8T5qMrLoSY/GLYQ5enZ7xNAJqLL64s1ADr05XL4+Dz1PFErxwcTQvO2pifB
	SlYy6FwqqX4IqRsTLN6zWssviqalMDpYWgYm0SdpVNQmFoh9On4mH2woYgAuU5xx
	SZVoO5r+5blGjyAAbz90w==
X-ME-Sender: <xms:qIG3aGSNZAbKub4EhIxRAc3JR3TU2uNGxxBCxuqQJ19n2VuzvxI4mw>
    <xme:qIG3aBAVBy-0IWA5TaUDo3EuzGEU-Md1g83t_k_VzMMGh_wSOZ9Ml7NvIdm9eDyrI
    ckGD_5Chp2W1nohQPg>
X-ME-Received: 
 <xmr:qIG3aFj3Q4Zgkx1O_HfwWrX9HFMPb1ovj94uLWeI7AHEFtfIHHP3sAmHsZftoiSNODLogDKrrseVhbnlIcKJOEzTDpd_UdfZTKM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttd
    dtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepheeifffffeeftd
    ejtdejhfdvveevgedtueelteettdeuleffuefgheffhfekjedtnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
    grmhhotggthhhirdhjphdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepiihlohihrdhtvggthhhnihgtsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:qIG3aKNWksRY1BQzAyKvY3tkvgW82DnH5oTYzW_zK-XGe9AmkAQZlw>
    <xmx:qIG3aG6eQ4xl9w53BBb54xZE1VssJ04zCAFb1XD45Gpleo2J4A-K5g>
    <xmx:qIG3aI3GT9QN7vET3G3WL2TxpvFY5edCSyl7jYR4cvRKyp0JqZzyIA>
    <xmx:qIG3aHYj7v9h5k6R2oxZybDxbaa7s_oTv3SVwCjFcOkkVABX7Wkh2A>
    <xmx:qYG3aBTZnzFYq2mc9JZrYIS8aX4Wl1PApSbHAZ1nkfa6SrRBLSzfvHSd>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Sep 2025 19:45:43 -0400 (EDT)
Date: Wed, 3 Sep 2025 08:45:40 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: =?utf-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?= <zloy.technic@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [BUG] ALSA FireWire: poll =?utf-8?Q?ti?=
 =?utf-8?Q?meout_causes_JACK_to_stop_=286=2E10_=E2=80=93?= 6.17-rc2)
Message-ID: <20250902234540.GA65685@workstation.local>
Mail-Followup-To: =?utf-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?=
 <zloy.technic@gmail.com>,
	alsa-devel@alsa-project.org
References: 
 <CAAnsHS64Pt9N2Ct3D6X=f6JytCiii9ntQ=MYqvweC=QaFpXPNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAAnsHS64Pt9N2Ct3D6X=f6JytCiii9ntQ=MYqvweC=QaFpXPNw@mail.gmail.com>
Message-ID-Hash: XH4FYSH6ZH4XJH6PM2STOMMCMBXSYPHT
X-Message-ID-Hash: XH4FYSH6ZH4XJH6PM2STOMMCMBXSYPHT
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XH4FYSH6ZH4XJH6PM2STOMMCMBXSYPHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I'm sorry for your inconvenience.

If you have ever used your device with Pipewire, I would like to see
your experiences how it works, since both servers uses the different
ways to handle ALSA PCM device in respect to no-period-wakeup mode..

On Tue, Sep 02, 2025 at 03:11:52PM +0500, Илья Кузнецов wrote:
> ________________________________
> 
> Hello ALSA developers,
> 
> I would like to report a reproducible issue with snd-fireface on Linux
> kernels 6.10 through 6.17-rc2.
> 
> ________________________________
> 
> System Information
> 
> Kernel versions tested: 6.10 → 6.17-rc2
> 
> Audio interface: RME Fireface 800
> 
> Driver in use: snd-fireface
> 
> Audio server: JACK (tested with jackd and QJackCtl)
> 
> Distribution: Debian 12
> 
> Kernel config: ALSA FireWire drivers enabled, no FFADO in use
> 
> Chip 1394: Texas Instrumets
> 
> ________________________________
> 
> Steps to Reproduce
> 
> Boot kernel 6.10 … 6.17-rc2 with snd-fireface loaded.
> 
> Start JACK with ALSA backend, for example:
> 
> jackd -d alsa -d hw:Fireface -p 64 -n 3
> 
> Use the system normally — during playback, recording, or even when
> idle. The issue may occur at any time without apparent external cause.
> 
> Actual Behavior
> 
> After some idle time, ALSA stops responding and JACK prints:
> 
> ERROR: ALSA: poll time out, polled for ... usecs
> ERROR: JackAudioDriver::ProcessAsync: read error, stopping...
> 
> JACK immediately terminates. The Fireface 800 does not recover until
> JACK is restarted.
> 
> ________________________________
> 
> Expected Behavior
> 
> The ALSA FireWire driver should maintain the stream and allow JACK to
> continue running without manual restart, even when idle.
> 
> ________________________________
> 
> Notes
> 
> With FFADO backend (jackd -d firewire), the same hardware works
> reliably and does not exhibit this issue.
> 
> This suggests that the problem lies in the ALSA FireWire streaming
> engine rather than the hardware itself.
> 
> The problem has been reproducible across all tested kernels (vanila,
> rt, liquorix) from 6.10 through 6.17-rc2.
> 
> ________________________________
> 
> Request
> 
> Could you please confirm if this issue is known?
> Is there any ongoing work on the ALSA FireWire streaming engine
> (snd-fireface) to address these poll timeout conditions?
> 
> I can provide additional logs (dmesg, journalctl) or test patches if needed.
> 
> Thank you,
> 
> Ilya Kuznetsov.


Regards

Takashi Sakamoto
