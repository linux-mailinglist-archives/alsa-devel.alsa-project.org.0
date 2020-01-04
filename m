Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32012FFBA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 01:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E4B1794;
	Sat,  4 Jan 2020 01:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E4B1794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578098339;
	bh=pKD5tWh9KzCsxTj1BQ4P16uPI1GyL9u/dV+OYYs9fHI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAZ/Wx2TE1g55cGts4Pg2vpMI8lhe+Yf03cQqrDrtGpyNOgpqEjB4Isjox6OLmusR
	 Qi6MUfYqnG7IB62f2trE80gyEdX1sRougHqHGE8cY+tOQ1yp3LMkbS2lzEr6Zk4Lto
	 MbFnpItW/lgKAfxqWJP2r4FwGHE7OF+kGeT2ihnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A30D2F8015D;
	Sat,  4 Jan 2020 01:37:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04BDF8015D; Sat,  4 Jan 2020 01:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95173F80100
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 01:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95173F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cYJl/4rk"
Received: by mail-lj1-x242.google.com with SMTP id r19so45423489ljg.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Jan 2020 16:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ts+SjzC4Gm6lvTOxTySTq7TEeSE+o11aKR5We09tXnU=;
 b=cYJl/4rk1daPvvXESQWI91tjOBG8icZXyT/9Igjz8/1LNO0cfsQ7JkprURrKb5YZvx
 BzLzdLAO8LyKI1nxuKVpam8W8OH2I7iVRG6AVVBnzSpFkhzHEnHOM5jOTqjRcii6cXVs
 n4hFUGBUh0LQ+by8rhvJYvPXO4IOK5Puu2jF21IXaPzAYRKmxfyK3bEPWgLrsuhM7JJ3
 tS2oMh2J6zzz9QbUuuCpTZkwCOI/GNPPICX5jGXhSJhOvnGaJ+mTxgBixkabiHjZFVcD
 cj+d5Hk5sMjw0f89K9X6u2ynFxLC60GJlMkcp84B6BRkeaZ5xxbZc1GDpHvTlkmmjWBo
 eN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts+SjzC4Gm6lvTOxTySTq7TEeSE+o11aKR5We09tXnU=;
 b=nhkO5o9w7Xl6n28814u7bW3r6olEsryZiP8mP3qwEYhTSlu8CoGBmWJI2kbapKt5dp
 Pz677NfHFE04nu3LVsl0qvX9MYzvSW2kpcnGbISyFhf15qmOF8L0KBocdQ9h7hv6T6K5
 X8WsvoE/8RBPMN1FJQmAtZ5tT3A5p0+s2QEQ2R7iFTPpWcNW1oqbSV8e3iaqPqsf38T9
 82ZRRnX/VCJDonXnReBT7X2zbbUguyZJKyLVkCh65Kkp7xS56a9rLtjexH/93i4DLLTL
 myI6OTfEnjrf8gwr0tgcLfk6OV0XSJUm5PpHZz5iwJZG8T0zx3che8YuWcGNZ/+VYGiu
 RaKg==
X-Gm-Message-State: APjAAAVrW5SXMilal+MEFg9o8lzha1qbvq34S3s6EGiTuTi0sQmiIcJr
 oEUHRGVu8RJEjTJoj3GslPw=
X-Google-Smtp-Source: APXvYqw37Yl+OJvyHeQCjkpKB57wlb+8t1Igv6CyhuOjhC+4QP9VjjhZxbbwzeyWhmg1GJpHRz5cTg==
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr47757459ljk.51.1578098230268; 
 Fri, 03 Jan 2020 16:37:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id p26sm25418791lfh.64.2020.01.03.16.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 16:37:09 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
 <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
 <20200103005424.GF3897@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <059becd2-4a91-23b3-59e1-0c4b0f3c0844@gmail.com>
Date: Sat, 4 Jan 2020 03:37:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200103005424.GF3897@sirena.org.uk>
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

MDMuMDEuMjAyMCAwMzo1NCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFRodSwgSmFuIDAy
LCAyMDIwIGF0IDA2OjU3OjE0UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMzEu
MTIuMjAxOSAwMzoxNywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4gUGxlYXNlIHRoaW5r
IGhhcmQgYmVmb3JlIGluY2x1ZGluZyBjb21wbGV0ZSBiYWNrdHJhY2VzIGluIHVwc3RyZWFtCj4+
PiByZXBvcnRzLCB0aGV5IGFyZSB2ZXJ5IGxhcmdlIGFuZCBjb250YWluIGFsbW9zdCBubyB1c2Vm
dWwgaW5mb3JtYXRpb24KPj4+IHJlbGF0aXZlIHRvIHRoZWlyIHNpemUgc28gb2Z0ZW4gb2JzY3Vy
ZSB0aGUgcmVsZXZhbnQgY29udGVudCBpbiB5b3VyCj4+PiBtZXNzYWdlLiBJZiBwYXJ0IG9mIHRo
ZSBiYWNrdHJhY2UgaXMgdXNlZnVsbHkgaWxsdXN0cmF0aXZlIHRoZW4gaXQncwo+Pj4gdXN1YWxs
eSBiZXR0ZXIgdG8gcHVsbCBvdXQgdGhlIHJlbGV2YW50IHNlY3Rpb25zLgo+IAo+PiBZZWFoLCBw
ZXJoYXBzIGl0J3Mgbm90IHJlYWxseSB1c2VmdWwgdG8gaGF2ZSBiYWNrdHJhY2UgaW4gdGhlIGNv
bW1pdCdzCj4+IGRlc2NyaXB0aW9uIGZvciB0aGUgY2FzZSBvZiB0aGlzIHBhdGNoIGluIHBhcnRp
Y3VsYXIuIEJ1dCBpbiBnZW5lcmFsIGl0Cj4+IGlzIHZlcnkgdXNlZnVsIHRvIGhhdmUgYmFja3Ry
YWNlcyBzb21ld2hlcmUgbmVhciB0aGUgcGF0Y2ggc3VjaCB0aGF0Cj4+IG9ubGluZSBzZWFyY2gg
ZW5naW5lcywgbGlrZSBnb29nbGUsIGNvdWxkIHBpY2sgaXQgdXAuIEknbGwgbW92ZSB0aGUKPj4g
YmFja3RyYWNlIGJlbG93IC0tLSBpbiB2MiwgdGhhbmtzLgo+IAo+IFJpZ2h0LCB0aGlzIGlzIG1v
cmUgZGlyZWN0ZWQgYXQganVzdCBwYXN0aW5nIGluIHRoZSBlbnRpcmUKPiBiYWNrdHJhY2UgKHdo
aWNoIGNhbiBiZSBodWdlIHdpdGggbG90cyBvZiBnZW5lcmljIGJpdHMgYmVmb3JlIHRoZQo+IHNt
YWxsIG51bWJlciB0aGF0IGFyZSByZWxldmFudCkgYnV0IHNvbWUgZWRpdGVkIGhpZ2hsaWdodHMg
Y2FuCj4gZGVmaW5pdGVseSBiZSBoZWxwZnVsIGZvciBzZWFyY2ggZW5naW5lcyBhbmQgZm9yIGV4
cGxhaW5pbmcgdGhlCj4gcHJvYmxlbS4gIEknbGwgbW9kaWZ5IHdoYXQgSSdtIHNheWluZyB0aGVy
ZSB0byBjbGFyaWZ5IHRoaXMuCgpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
