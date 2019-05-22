Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899625DD3
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 07:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0222716D0;
	Wed, 22 May 2019 07:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0222716D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558504501;
	bh=z2y8/8fvh120KVqSexpIWdNfvp3GSY5GPHlF94yaZ4c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovUBkD5BwZpSSz8wAhdANv+dKV+OGk6nAUqg9MIrOm4MQvbx6zSbS8x27sf/fASP1
	 5OD4M0t4XdU/Tuci7NKYSjKg5eFfYDUSIlHkFWEv3vfc0ixjiYc1Bx8cIEwyJ4IuKj
	 1vWlsSf9qPi2xyU+mKSHjdDBCMX+hN6gLrwFo/ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5BE8F8962F;
	Wed, 22 May 2019 07:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09483F8962F; Wed, 22 May 2019 07:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85271F89625
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 07:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85271F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rIvrTlaA"
Received: by mail-wr1-x443.google.com with SMTP id b18so719534wrq.12
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=AHUIOEByr0m4e8bmYKW9unkrzC9v4z2NQ+RPUysVTIM=;
 b=rIvrTlaAD1pLZoNAm/8UsZc40zqWwcdIuRSZI4meDNRFXqHG2OQD7koy1hVMkWXOUE
 QNeK1pGllRWZxezOJHvyyQj5ZhV78Jr9a/gVLLQT+CBFO2WFbY4yfBz9v+AcE9xOScFp
 pv8Lvkq6M9UF/PWeNFnfN9NJc5NeMgP2m9GZj11ejOkKQvKDETcDTQDYUNn9w9iu+i8w
 dq0UfI1Lw+Sc+RMWwk0XfpfUtoVyvq+a+R0j1h6qBz3Tg37S+2YnPBuJZyOjcTriI4dr
 G/XUSurOODzJOS0LSuuOzKp4euciSkNuFH6jPrfKWHrJQAZ65+5qJlaUM+bt+WFth7P+
 W5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=AHUIOEByr0m4e8bmYKW9unkrzC9v4z2NQ+RPUysVTIM=;
 b=k7ShstwE1u/UxUWNSquObJNAn75T68x5f9+nUOGjMC8GwGmphojXsI9xB/8NXZzAny
 chRfNqgVYpQ3nuKe9WDBigm3qxzkNpgDi6O6l2uItEEuF3M5AVNtPIR6ZROlbYnCuU6R
 3KH6l6R8muFytZhYcLsrlB0/8Ka6xwoOG0PkHDmZ68acbLRMdVJqBD7kyAWMijWnAUz1
 s1GM78R2HgPKPXyQ21iEBpkP7TpQ6LAnAHby3SP9EDNF37k39oOXOm5SKvrL7F6CJx4d
 6kD2sM1j0h0mFeuG2+5WBHeM6BpsK+m4jsBRzOuv5Qbswj9zWeCT7IYsxg7HrNWBkYO0
 g5RA==
X-Gm-Message-State: APjAAAUSPl2+lVSXzYe30eNK2FhBQWyarR5YiIyeqJBLODtNXcZdGeAm
 HoZACwSyYfcgTZrXTvrshICQgw==
X-Google-Smtp-Source: APXvYqyXvQ6YlCncCaZyohVXqePSWI1HJn2NNbAQ6uQJ/JWVBjAhrtNXT3/rA0VJbHm2Bp8ks8sTHg==
X-Received: by 2002:adf:fa88:: with SMTP id h8mr1612015wrr.32.1558504388344;
 Tue, 21 May 2019 22:53:08 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id h8sm9733712wmf.5.2019.05.21.22.53.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 22:53:07 -0700 (PDT)
Date: Wed, 22 May 2019 06:53:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benson Leung <bleung@google.com>
Message-ID: <20190522055306.GC4574@dell>
References: <20190509211353.213194-1-gwendal@chromium.org>
 <CAPUE2ut4OUhrmbx6n8KCj7+ghXmC9iMnxGN8DMvyvZstznwwng@mail.gmail.com>
 <20190518063949.GY4319@dell> <20190521174438.GA2821@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521174438.GA2821@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

T24gVHVlLCAyMSBNYXkgMjAxOSwgQmVuc29uIExldW5nIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
T24gU2F0LCBNYXkgMTgsIDIwMTkgYXQgMDc6Mzk6NDlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gT24gRnJpLCAxNyBNYXkgMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgo+ID4gCj4g
PiA+IExlZSwKPiA+ID4gCj4gPiA+IEkgdmVyaWZpZWQgYW5kIG1lcmdlZCB0aGUgY2hhbmdlcyBv
biB0aGUga2VybmVscyAoMy4xOCwgNC40IGFuZCA0LjE0KQo+ID4gPiB1c2VkIG9uIGNocm9tZWJv
b2sgdXNpbmcgYSBzcXVhc2hlZCB2ZXJzaW9uIG9mIHRoZXNlIHBhdGNoZXMuCj4gPiA+IChjcnJl
di5jb20vYy8xNTgzMzIyLCBjcnJldi5jb20vYy8xNTgzMzg1LCBjcnJldi5jb20vYy8xNTgzMzIx
Cj4gPiA+IHJlc3BlY3RpdmVseSkKPiA+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZl
IGFueSBxdWVzdGlvbnMuCj4gPiAKPiA+IElzIG5vIG9uZSBlbHNlIGZyb20gQ2hyb21pdW0gZ29p
bmcgdG8gcmV2aWV3Pwo+ID4gCj4gPiBUaGVzZSBzZWVtIGxpa2UgcXVpdGUgaW1wb3J0YW50IGNo
YW5nZXMuCj4gPiAKPiAKPiBJJ3ZlIGdvbmUgYWhlYWQgYW5kIGFja2VkIHRoZSB3aG9sZSBzZXJp
ZXMuIEVucmljIGFuZCBJIGFyZSBPSyB3aXRoIHRoaXMgZ29pbmcKPiBpbiBmb3IgNS4zLCBhbmQg
YXMgR3dlbmRhbCBtZW50aW9uZWQsIGhlJ3MgbGFuZGVkIHRoZXNlIGNoYW5nZXMgaW50byBvdXIK
PiBwcm9kdWN0aW9uIGtlcm5lbHMgZm9yIENocm9tZSBPUyBhcyB3ZWxsLCBzbyB0aGlzIGlzIHdo
YXQgd2Ugd2FudCB0byBzeW5jIG9uLgoKV29uZGVyZnVsLCB0aGFuayB5b3UuCgo+IExldCBtZSBr
bm93IGlmIHlvdSBoYXZlIGFueSBvdGhlciBjb25jZXJucy4KPiAKPiBUaGFua3MsCj4gQmVuc29u
Cj4gCgoKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNh
bCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpG
b2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
