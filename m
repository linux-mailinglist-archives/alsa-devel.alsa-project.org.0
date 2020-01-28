Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228B14BED7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 18:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90718166D;
	Tue, 28 Jan 2020 18:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90718166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580233625;
	bh=6Vs/LqZE1kWBkoMx8nRRudHuiw39brN6WCv6zqIq8h4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xb76io5+AfQ02RkiX0qALPJTcwB3jJogOKZnPGIpz/l9hMxZu8ftpmvbUWZRy1Ha4
	 vBG6XdGUsc8DTHvzNx49O/xfDJ8vfhObrEMsdwWJCRuta+1DAu98iPzRiTimow6vHj
	 N6zvXUQlI5ga1vGMjRBBb2d3wYxjcCNEzHPn8hr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2ADF80082;
	Tue, 28 Jan 2020 18:45:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BE1EF80123; Tue, 28 Jan 2020 18:45:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BA15F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 18:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA15F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tyRM2jJR"
Received: by mail-lj1-x242.google.com with SMTP id a13so15586960ljm.10
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=icILle18HVOYU+uj4/uNvBEQiUod1fP5bgB83wQWJnk=;
 b=tyRM2jJRNkoAJxaVoib7+S23mzDrbW7WsPPee7HvUcnnl0hiXgmLER8SlROe/QlR6J
 2+TRk8bvgmrE2VX08bGujTS2e1zNcWXH6I+1Tu1Is8KQJwpMTwnx+xCRHEbfn1nhPDqx
 jGseFjhe9JIen0SYm9WAPw1/BbptnRodHR783nrlnEI1Fu/1K4QYZyqvcxaQWhR0Pn11
 f8x28Ifsvexy0mIxRxvxmSPizllL8TCn8bi6INbMdWp5dc8ohIXXUUW6v2vbizmOeFrG
 Q+A9y69XXiqCrK8927L7XKpZr97uorA7/Sp0XnDOh8Wq54jyWALuseqex8B4UXWRxQq4
 m9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icILle18HVOYU+uj4/uNvBEQiUod1fP5bgB83wQWJnk=;
 b=b7qoPNs3cwGYBMWqdFY1CcVeheHiqthUUKDDt8fAoHPfSHR/g8ulIUkoYXC0GcYY8X
 7JqvD4s5dfe9XYwaQ8ya9dhDEAFy3aGP/80OFtgHVA3njoxvdPnk3YjEydzoY3GlGgsu
 SsDV+KcQbalqZSbHiLhnBhEIEWwYoqgO4g5ocxFbyVpw+qaH+ESAR7IEaBZpEcqfY4J4
 rWUCQIq1XLRSJ03jRoluLq9mU2hoiI9i5lQ3h8rBqTescFVzLkd4Y6lO+fp0xcSxFY75
 dLf/xP+dSfsnaDR8iimwI04ZSFnFWSlIHM7ay8kDw5ebimIYJVQJb1ytSHCz3jYiPsjv
 0LoA==
X-Gm-Message-State: APjAAAUQf9YW2GIr6paGphGZty6GUx5dxj3mSR04ltUPhMpsGu9YcCEM
 7nba47+xUo3EfaTuXqstmII=
X-Google-Smtp-Source: APXvYqz6tGItOVEzQ/02MHrmG4vWp62+B1xQn16Kd/IMfQjApCRvrnge+3eMOmx1l8H2wUO4buAm7Q==
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr8257219lja.131.1580233513348; 
 Tue, 28 Jan 2020 09:45:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id c8sm10104395lfm.65.2020.01.28.09.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 09:45:12 -0800 (PST)
To: Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
References: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
 <20200128152632.GF4689@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9ed4d18-94f6-06e0-d7b7-cbbcbee058b0@gmail.com>
Date: Tue, 28 Jan 2020 20:45:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200128152632.GF4689@sirena.org.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

MjguMDEuMjAyMCAxODoyNiwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFR1ZSwgSmFuIDI4
LCAyMDIwIGF0IDAxOjE5OjE3UE0gKzAwMDAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+IE9uIDI4LzAx
LzIwMjAgMDg6NTksIEJlbiBEb29rcyB3cm90ZToKPj4+IE9uIDI3LzAxLzIwMjAgMTk6MjMsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+PiAyNy4wMS4yMDIwIDIyOjIwLCBEbWl0cnkgT3NpcGVu
a28g0L/QuNGI0LXRgjoKPj4+PiBJIGFsc28gc3VzcGVjdCB0aGF0IHMzMiBtYXkgbmVlZCBzb21l
IGV4dHJhIHBhdGNoZXMgYW5kIHRodXMgY291bGQgYmUKPj4+PiB3b3J0aHdoaWxlIHRvIHN0b3Ag
YWR2ZXJ0aXNpbmcgaXQgYXMgd2VsbC4KPiAKPj4+IEFzIGZhciBhcyBJIGFtIGF3YXJlIHRoYXQg
d29ya3MgYW5kIHdlIGNhbiBoaXQgdGhlIGF1ZGlvIHJhdGVzIGZvciBpdC4KPiAKPj4gSSByYW4g
YSB0ZXN0IG9uIFRlZ3JhMTI0IEpldHNvbi1USzEgYW5kIDI0LWJpdCBwbGF5YmFjayBzZWVtcyB0
byB3b3JrIGFzCj4+IEJlbiBoYXMgaW5kaWNhdGVkLiBTbyBJIGRvbid0IHRoaW5rIGl0IGlzIGJy
b2tlbi4KPiAKPj4gQ2FuIHlvdSB0cnkgQmVuJ3MgdGVzdGNhc2Ugb24gVGVncmEzMCAoaWUuIGdl
bmVyYXRlIGEgdG9uZSB1c2luZyBzb3ggYW5kCj4+IHVzZSBhcGxheSB0byBwbGF5KT8KPiAKPiBB
bm90aGVyIHRlc3QgYXBwbGljYXRpb24gdGhhdCdzIHF1aXRlIHVzZWZ1bCBmb3IgdGhpcyBzb3J0
IG9mIHN0dWZmIGlzCj4gc3BlYWtlci10ZXN0LCBpdCBnZW5lcmF0ZXMgYXVkaW8gZGF0YSBkaXJl
Y3RseSBpbiBhcmJhdHJhcnkgZm9ybWF0cyBhbmQKPiBpdCdzIHBhcnQgb2YgYWxzYS11dGlscyBz
byBpZiB5b3UndmUgZ290IGFwbGF5IGFuZCBmcmllbmRzIHlvdSBtYXkKPiBhbHJlYWR5IGhhdmUg
aXQgYWxyZWFkeSBpbnN0YWxsZWQuCgpJIHRyaWVkIHNwZWFrZXItdGVzdCBhbmQgaXQgZG9lc24n
dCBzdXBwb3J0IFMyNF9MRToKCiMgc3BlYWtlci10ZXN0IC1oCgpzcGVha2VyLXRlc3QgMS4xLjkK
ClVzYWdlOiBzcGVha2VyLXRlc3QgW09QVElPTl0uLi4KLWgsLS1oZWxwICAgICAgIGhlbHAKLUQs
LS1kZXZpY2UgICAgIHBsYXliYWNrIGRldmljZQotciwtLXJhdGUgICAgICAgc3RyZWFtIHJhdGUg
aW4gSHoKLWMsLS1jaGFubmVscyAgIGNvdW50IG9mIGNoYW5uZWxzIGluIHN0cmVhbQotZiwtLWZy
ZXF1ZW5jeSAgc2luZSB3YXZlIGZyZXF1ZW5jeSBpbiBIegotRiwtLWZvcm1hdCAgICAgc2FtcGxl
IGZvcm1hdAotYiwtLWJ1ZmZlciAgICAgcmluZyBidWZmZXIgc2l6ZSBpbiB1cwotcCwtLXBlcmlv
ZCAgICAgcGVyaW9kIHNpemUgaW4gdXMKLVAsLS1ucGVyaW9kcyAgIG51bWJlciBvZiBwZXJpb2Rz
Ci10LC0tdGVzdCAgICAgICBwaW5rPXVzZSBwaW5rIG5vaXNlLCBzaW5lPXVzZSBzaW5lIHdhdmUs
IHdhdj1XQVYgZmlsZQotbCwtLW5sb29wcyAgICAgc3BlY2lmeSBudW1iZXIgb2YgbG9vcHMgdG8g
dGVzdCwgMCA9IGluZmluaXRlCi1zLC0tc3BlYWtlciAgICBzaW5nbGUgc3BlYWtlciB0ZXN0LiBW
YWx1ZXMgMT1MZWZ0LCAyPXJpZ2h0LCBldGMKLXcsLS13YXZmaWxlICAgIFVzZSB0aGUgZ2l2ZW4g
V0FWIGZpbGUgYXMgYSB0ZXN0IHNvdW5kCi1XLC0td2F2ZGlyICAgICBTcGVjaWZ5IHRoZSBkaXJl
Y3RvcnkgY29udGFpbmluZyBXQVYgZmlsZXMKLW0sLS1jaG1hcCAgICAgIFNwZWNpZnkgdGhlIGNo
YW5uZWwgbWFwIHRvIG92ZXJyaWRlCi1YLC0tZm9yY2UtZnJlcXVlbmN5ICAgIGZvcmNlIGZyZXF1
ZW5jaWVzIG91dHNpZGUgdGhlIDMwLTgwMDBoeiByYW5nZQotUywtLXNjYWxlICAgICAgU2NhbGUg
b2YgZ2VuZXJhdGVkIHRlc3QgdG9uZXMgaW4gcGVyY2VudCAoZGVmYXVsdD04MCkKClJlY29nbml6
ZWQgc2FtcGxlIGZvcm1hdHMgYXJlOiBTOCBTMTZfTEUgUzE2X0JFIEZMT0FUX0xFIFMyNF8zTEUg
UzI0XzNCRQpTMzJfTEUgUzMyX0JFCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
