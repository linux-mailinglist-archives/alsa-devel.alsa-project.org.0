Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D391212E85D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 16:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4463016A3;
	Thu,  2 Jan 2020 16:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4463016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577980745;
	bh=OlLINDSrAA9k5MOw+4yU0Q0QsnLThAWEFXFmHAsvtQQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDaPVA0f1B79Dn4fKeXUiu+n66y1cgf3VcrdU0A1lpfmaBAxddd6H+CCXBFdpX+zQ
	 qGf+k/5d5p/7O4kGpFoIlA2gv8dZKJumacZTaURqsF0KSOfbJd10O+DrERZZzxJjCG
	 Hv3HqMxTQIO4YLoFanTnzee+ohtlJk306eNUYSv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 409ECF8014F;
	Thu,  2 Jan 2020 16:57:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7F9F80157; Thu,  2 Jan 2020 16:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F6A0F8013E
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 16:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F6A0F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l3fFiR4L"
Received: by mail-lf1-x141.google.com with SMTP id y1so30142963lfb.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Jan 2020 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6nJzNxoHHP2qeQwJAX7JtKv6dI5N1gKdyhYamT8Rigk=;
 b=l3fFiR4LY1WvW8xQWZy2Yq/6iUVx9c1wc1ZM8GnmvPQbaRrpJRKULjQKkF3TKR0F38
 wTIV1g4wHUyMmbeEH/YkwmPhsb/Zav1cQKsRxaHfvwJ+eCFOS+yYi1ioQqEYoWNWxU5u
 2DQ0rjcH+gOVH7n+8K9atyKtPV4W1Uu6gQj7RtLHsMnQ9iSIXROptDfJ1huIy6E/uWcs
 +rVcm3sYkOT9YVIcFKyBSCKS48k1dMnkcl/Yi/AoDaD5pnrYoz7J+1Z8ufvAq6HkB/zU
 ojMQ+Q31MOyx4wedjoaOe7o0xto7QS6DKcQZ1o1kUPi34/74vJwBadCG/6Gy4vaI9xOC
 ehzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6nJzNxoHHP2qeQwJAX7JtKv6dI5N1gKdyhYamT8Rigk=;
 b=OctRSzsnvLNf+MdZoQsruKAD3r6PMZ3+RWoCY14b2bEV+tMNnQdukWybfykZZw7u59
 Wwbrx6BnpVaDSx/kwEP+DqzGd53uJNbHVSeeCKDd2dJdz/Yyix40UUNWYNNN5X84ZBp5
 9OdwCGdwiVeYVu+e3XqqZ6V9WxhXkvObIs9o6cybIqQGW6YKhPoCvEf2AYEapu0mtYfX
 vkWWVfXMeL5tYJQlCSfsAp/ZiEq4LbolRhWRgAp0no1PdwYBdNpTxQsmt7NbcxI6CdNn
 PHhC1IqYkkovzfbgMzia2uReWNgVPYKKETbgjiYC4iu0AwfaE9cgcQchgYGUP5FF1U4X
 Cv2Q==
X-Gm-Message-State: APjAAAVl+D+ONSu7yRVT6Xon75lkvfAIAW3b5RoZb/IZIv+U3A/B5417
 ml94TLtYiHOqU+xn9ktEbxg=
X-Google-Smtp-Source: APXvYqwBEgyRMN2xwOc7zrBPderdE1gHsR38bw0rFNEK+8PQNUje3gqEWIQwQ1Qzlhl2uZkLaFsj4Q==
X-Received: by 2002:a19:2d0d:: with SMTP id k13mr46205902lfj.12.1577980636121; 
 Thu, 02 Jan 2020 07:57:16 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id r20sm23384004lfi.91.2020.01.02.07.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 07:57:15 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
Date: Thu, 2 Jan 2020 18:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191231001719.GC3897@sirena.org.uk>
Content-Language: en-US
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Bard Liao <bardliao@realtek.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: rt5640: Fix NULL dereference on
	module unload
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

MzEuMTIuMjAxOSAwMzoxNywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFN1biwgRGVjIDI5
LCAyMDE5IGF0IDA2OjA0OjU0UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gVGhl
IHJ0NTY0MC0+amFjayBpcyBOVUxMIGlmIGphY2sgaXMgYWxyZWFkeSBkaXNhYmxlZCBhdCB0aGUg
dGltZSBvZgo+PiBkcml2ZXIncyBtb2R1bGUgdW5sb2FkaW5nLgo+Pgo+PiAgVW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAw
MDAwMDAyNAo+PiAgLi4uCj4+ICAocnQ1NjQwX3NldF9qYWNrIFtzbmRfc29jX3J0NTY0MF0pIGZy
b20gWzxiZjg2ZjdlZD5dIChzbmRfc29jX2NvbXBvbmVudF9zZXRfamFjaysweDExLzB4MWMgW3Nu
ZF9zb2NfY29yZV0pCj4+ICAoc25kX3NvY19jb21wb25lbnRfc2V0X2phY2sgW3NuZF9zb2NfY29y
ZV0pIGZyb20gWzxiZjg2NzVjZj5dIChzb2NfcmVtb3ZlX2NvbXBvbmVudCsweDFiLzB4NTQgW3Nu
ZF9zb2NfY29yZV0pCj4+ICAoc29jX3JlbW92ZV9jb21wb25lbnQgW3NuZF9zb2NfY29yZV0pIGZy
b20gWzxiZjg2ODg1OT5dIChzb2NfY2xlYW51cF9jYXJkX3Jlc291cmNlcysweGFkLzB4MWNjIFtz
bmRfc29jX2NvcmVdKQo+IAo+IEluIGFkZGl0aW9uIHRvIHdoYXQgVGFrYXNoaSBzYWlkOgo+IAo+
IFBsZWFzZSB0aGluayBoYXJkIGJlZm9yZSBpbmNsdWRpbmcgY29tcGxldGUgYmFja3RyYWNlcyBp
biB1cHN0cmVhbQo+IHJlcG9ydHMsIHRoZXkgYXJlIHZlcnkgbGFyZ2UgYW5kIGNvbnRhaW4gYWxt
b3N0IG5vIHVzZWZ1bCBpbmZvcm1hdGlvbgo+IHJlbGF0aXZlIHRvIHRoZWlyIHNpemUgc28gb2Z0
ZW4gb2JzY3VyZSB0aGUgcmVsZXZhbnQgY29udGVudCBpbiB5b3VyCj4gbWVzc2FnZS4gSWYgcGFy
dCBvZiB0aGUgYmFja3RyYWNlIGlzIHVzZWZ1bGx5IGlsbHVzdHJhdGl2ZSB0aGVuIGl0J3MKPiB1
c3VhbGx5IGJldHRlciB0byBwdWxsIG91dCB0aGUgcmVsZXZhbnQgc2VjdGlvbnMuCgpZZWFoLCBw
ZXJoYXBzIGl0J3Mgbm90IHJlYWxseSB1c2VmdWwgdG8gaGF2ZSBiYWNrdHJhY2UgaW4gdGhlIGNv
bW1pdCdzCmRlc2NyaXB0aW9uIGZvciB0aGUgY2FzZSBvZiB0aGlzIHBhdGNoIGluIHBhcnRpY3Vs
YXIuIEJ1dCBpbiBnZW5lcmFsIGl0CmlzIHZlcnkgdXNlZnVsIHRvIGhhdmUgYmFja3RyYWNlcyBz
b21ld2hlcmUgbmVhciB0aGUgcGF0Y2ggc3VjaCB0aGF0Cm9ubGluZSBzZWFyY2ggZW5naW5lcywg
bGlrZSBnb29nbGUsIGNvdWxkIHBpY2sgaXQgdXAuIEknbGwgbW92ZSB0aGUKYmFja3RyYWNlIGJl
bG93IC0tLSBpbiB2MiwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
