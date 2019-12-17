Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DA122D24
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05CB2166B;
	Tue, 17 Dec 2019 14:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05CB2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590035;
	bh=/QjfNn9eDU58oHwHzE8L5iPsbb2Fvi3+e//ti0SNZ+k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcxNs0w0URYRzwAkBR9MncuMZpRGTB91hGjlTyCfoAQl2iN8ENkDjIuryItxKiuov
	 B3ixgII2DRqNi+W0wqI6WbAdTnorVXnfdRwmOoGG22YM5UqRFmcnyak07qdAyjxuhO
	 7qexEkjNsAR8kBjysB/A7yXI805UHdv78wDzMEYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2EF7F8025A;
	Tue, 17 Dec 2019 14:39:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3307BF8023F; Tue, 17 Dec 2019 14:39:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68388F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 14:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68388F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C3MO13fg"
Received: by mail-pj1-x1043.google.com with SMTP id w23so4612596pjd.2
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 05:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gQB/ChgAWQAu7G8p8psPdHNZa+37XvUfN0MT2cx9AJw=;
 b=C3MO13fg4kp2wcV2fZP/7YYtFp8l8UWm0p9xA1Bos9vl/PuNhwOyCdzuykCwsdhhhJ
 mZVLQ25wX6+IU13xBaSHVYujN1KaGKj+EwXi5VXyWAyk/Sn8ZxDT5eh614WxXIWBfFr/
 W+KWUrHuAh6SV7u1dycxa1nAXZe19I+H/iUqhSOaey/IWw2YAmXFcx/jG4z+exbMNm5S
 IdOxzZtEZb+d0bj47FE+4xVVHlH8AWZGfYeMU1ukivBeOTNLCyYAxorH8BuDT+BYwoEG
 +rjAKa5iqifn4uqo7wVcN6hfF2mznO2cj6skjB9x5kbOJqADfajGEBSUBSnzodCdeCgv
 LUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gQB/ChgAWQAu7G8p8psPdHNZa+37XvUfN0MT2cx9AJw=;
 b=bfrS3to/TYoDpt5qf9q40qCKSrbJePl0vln+0MqS1RbjUjbfF5RQKCsqu5bDB4kJct
 tnTky2jbpovtDvdaPl0NsygRo8kHHm/Ggr2LJyvlGW2cSXQZZ2VyPHGJ09vxclPBiCUn
 W7j1ZWYE381T72Os0BTRQ39Atl18CT5m5o4DtjMHHRe5QlKU/uF154RrH6a/tmcTSjEX
 olIdthJrhZU1uAmo1MaLauP4gt9/23e7cx5/VVKmXSx5HRvhMhpwK3F80bTIZN035zGw
 8beVWlWI6BWvgSsE4zD3QX3gyOu/c3MrF92B9m1CSHEPNnsRfVlyr3PKFzl8XzLBGffB
 7Frg==
X-Gm-Message-State: APjAAAVjnlLfaJTfyZ9odHivZvv1f/g0cZNfNbmcgJS4BIU+tBPXhBH6
 nBAcLpN0lE+c2/trGxqtd2Y=
X-Google-Smtp-Source: APXvYqxF6nDsn2S+SZ2JsyXauAy4vKm2CsBjNVueBRjJRtIGiRQUsnU+9dwPP0IoTdHioTk8H/3j/g==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr21807077pll.341.1576589944270; 
 Tue, 17 Dec 2019 05:39:04 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.134?
 ([2402:f000:1:1501:200:5efe:a66f:8b86])
 by smtp.gmail.com with ESMTPSA id d2sm3675360pja.1.2019.12.17.05.39.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 05:39:03 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>
References: <db47108d-3967-6760-3de2-17bf60741bc2@gmail.com>
 <s5hh81z9iob.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <1583e474-55e3-ec13-f8c9-029bb23971bb@gmail.com>
Date: Tue, 17 Dec 2019 21:39:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <s5hh81z9iob.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 gregkh@linuxfoundation.org, tiwai@suse.com, rfontana@redhat.com,
 tglx@linutronix.de, allison@lohutok.net
Subject: Re: [alsa-devel] [BUG] ALSA: seq: a possible
 sleep-in-atomic-context bug in snd_virmidi_dev_receive_event()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAyMDE5LzEyLzE3IDIxOjM3LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gVHVlLCAxNyBE
ZWMgMjAxOSAxNDoyNDoyMSArMDEwMCwKPiBKaWEtSnUgQmFpIHdyb3RlOgo+PiBUaGUgZHJpdmVy
IG1heSBzbGVlcCB3aGlsZSBob2xkaW5nIGEgcmVhZCBsb2NrLgo+PiBUaGUgZnVuY3Rpb24gY2Fs
bCBwYXRoIChmcm9tIGJvdHRvbSB0byB0b3ApIGluIExpbnV4IDQuMTkgaXM6Cj4+Cj4+IHNvdW5k
L2NvcmUvc2VxL3NlcV9tZW1vcnkuYywgOTY6Cj4+ICDCoMKgwqAgY29weV9mcm9tX3VzZXIgaW4g
c25kX3NlcV9kdW1wX3Zhcl9ldmVudAo+PiBzb3VuZC9jb3JlL3NlcS9zZXFfdmlybWlkaS5jLCA5
NzoKPj4gIMKgwqDCoCBzbmRfc2VxX2R1bXBfdmFyX2V2ZW50IGluIHNuZF92aXJtaWRpX2Rldl9y
ZWNlaXZlX2V2ZW50Cj4+IHNvdW5kL2NvcmUvc2VxL3NlcV92aXJtaWRpLmMsIDg4Ogo+PiAgwqDC
oMKgIF9yYXdfcmVhZF9sb2NrIGluIHNuZF92aXJtaWRpX2Rldl9yZWNlaXZlX2V2ZW50Cj4gVGhp
cyBjYW4ndCBoYXBwZW4uICBzbmRfdmlybWlkaV9kZXZfcmVjZWl2ZV9ldmVudCgpIHRha2VzCj4g
Y29uZGl0aW9uYWxseSBlaXRoZXIgcmVhZF9sb2NrIG9yIHJ3X3NlbSBkZXBlbmRpbmcgb24gdGhl
IGF0b21pYwo+IGFyZ3VtZW50LiAgQW5kIHRoZSBkYXRhIGluY2x1ZGluZyB1c2VyLXNwYWNlIHBv
aW50ZXIgaXMgaGFuZGxlZCBhbHdheXMKPiB3aXRoIGF0b21pYz0xLCBoZW5jZSBkb3duX3JlYWQo
KSBpcyB1c2VkIGluc3RlYWQgb2YgcmVhZF9sb2NrKCkgaGVyZS4KPgoKT2theSwgdGhhbmtzIGZv
ciB0aGUgZXhwbGFuYXRpb24uCgoKQmVzdCB3aXNoZXMsCkppYS1KdSBCYWkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
