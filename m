Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9089DC2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 14:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E9E81679;
	Mon, 12 Aug 2019 14:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E9E81679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565611959;
	bh=WNuB1rahufYoT3iB0H0wtdQDXmrIuVWrwpgUPhXmBU8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1ZmBi8qnyJhRLKppiopO9XeMPMktUgC7L8FBdKANd4wbRgFXT+jM0QDgsmdWJdif
	 b2ctsuUO2niCKcM2zHHFuXo7L8ZEc0pDmrQxLUn/kEWA6kA/0GAqdz4rEWCwyelwLQ
	 WovWdO+WsOy6pU7t5wtJWQbc2ULeEwkL2au4Zu0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BBCF80214;
	Mon, 12 Aug 2019 14:10:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FE2F80213; Mon, 12 Aug 2019 14:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98762F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 14:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98762F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZlaFDJkn"
Received: by mail-yw1-xc43.google.com with SMTP id n69so2121147ywd.12
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4z7p+08vVGRKaFoY5K0HIJAi+xxlVs7dirH0vF1HBV8=;
 b=ZlaFDJkn8yLyk6xQ571Oe8ABNlq9Ly3tW4PGAUu0Hla738q5vre4pOqrZkuY8VjcLY
 QpxgkZTkbiY5sV9lQyaoMRfyOwYTWorH8Q/M9AGSYfXcB2QnWh+47f3RNUrhS2QpK/5e
 u3IU8gEwuMfoi3EGj67aC76xwxowAQLpbLbVGMW7agkwzX82V6xh1zjOBqIhiqHYbyaF
 yVd6r5BMz4VbmSsQ6rCvKNmfk8yfWU+9/KiQ0PdmBWgR/JeRaGFjSPZxUW9F6UL+1/eV
 wU+j+FFe1HlJHonkDpZU+uOHPi21H1I9DZdnZ2Adw2fBBWsnTpd0/OHNFbV2q6NBxxKh
 4VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4z7p+08vVGRKaFoY5K0HIJAi+xxlVs7dirH0vF1HBV8=;
 b=ZTGivag/b2bV7iIGgUG6Abq9PGmqYXpZJBrv+57uLqhK8vEx9AUFc+tH0/Ir6TcLPe
 FOhNAx/DzeeUWLrCZ9T6JHaOGp+epuQcYg5TBmEVW4vcuUMDY7K3oAl0d6gq9Vm5Lcur
 kl2RuT8qc73ZRzgTZeTRBm1gYz9qNquNFLaTkECUqjnGqM/LDvLKYEJ3WBk7I9bex0Kn
 /vLhXKgsbJjc0b+bJ5599ZiLXM4oEri0LHCF1rEH1nZ9Ks735+Zas2zzlHUqyAX/SlSQ
 jQnBtfvHcYxrSkZKx80bC/pJDo+SerqLvLuifLcuL+OWBuqiY42f1UDK7FEu/EkooLod
 94GA==
X-Gm-Message-State: APjAAAUEDZLoHlwkpf9FWjzHRTVDQeaSnFhS5IMC7e5eqKHBFiyWIRL7
 t26RFgFneMC3G3km+CII0QKzIWaSbqBC4guJLis=
X-Google-Smtp-Source: APXvYqzEXZhLUtV7pYNDbu1/3ce7u6Be+J9JdJvlDEwjC+aEheD9+kDaCkP9TtrZOgUEqijXeYpwIxIL2W3izU/ZO14=
X-Received: by 2002:a81:2655:: with SMTP id m82mr4525703ywm.306.1565611848215; 
 Mon, 12 Aug 2019 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
 <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
 <20190715193842.GC4503@sirena.org.uk>
 <CAJiuCceYDnyxRLLLLy6Dn6DLTZ+NmSaUnoX1Vmzvgiy0XvF_Fw@mail.gmail.com>
 <20190812110103.GD4592@sirena.co.uk>
In-Reply-To: <20190812110103.GD4592@sirena.co.uk>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 12 Aug 2019 14:10:36 +0200
Message-ID: <CAJiuCcdNFbKgo+oGZXKfBpyPKNOuUwpPbHdq-yBpcm3XYtPhEQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 0/7] Allwinner H6 SPDIF support
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

SGkgTWFyaywKCk9uIE1vbiwgMTIgQXVnIDIwMTkgYXQgMTM6MDEsIE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEF1ZyAxMCwgMjAxOSBhdCAxMDo0NToy
M0FNICswMjAwLCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4KPiA+IEhpLAo+Cj4gUGxlYXNlIGRv
bid0IHRvcCBwb3N0LCByZXBseSBpbiBsaW5lIHdpdGggbmVlZGVkIGNvbnRleHQuICBUaGlzIGFs
bG93cwo+IHJlYWRlcnMgdG8gcmVhZGlseSBmb2xsb3cgdGhlIGZsb3cgb2YgY29udmVyc2F0aW9u
IGFuZCB1bmRlcnN0YW5kIHdoYXQKPiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgYW5kIGFsc28gaGVs
cHMgZW5zdXJlIHRoYXQgZXZlcnl0aGluZyBpbiB0aGUKPiBkaXNjdXNzaW9uIGlzIGJlaW5nIGFk
ZHJlc3NlZC4KPgo+ID4gU29ycnksIEkganVzdCBkaXNjb3ZlcmVkIHRoYXQgdGhlIEFTb0MgcGF0
Y2hlcyBoYXZlIGJlZW4gbWVyZ2VkIGludG8KPiA+IHRoZSBicm9vbmllIGFuZCBsaW51cyB0cmVl
IGluIDUuMy4KPgo+ID4gSSdtIHN0aWxsIHF1aXRlIG5ldyBpbiB0aGUgc2VuZGluZyBvZiBwYXRj
aGVzIHRvIHRoZSBLZXJuZWwgYnV0Cj4gPiBzb3VsZG4ndCBiZSBhIGFjayBvciBhIG1haWwgc2Vu
dCB0byB3YXJuIHRoZSBzZW5kZXIgd2hlbiB0aGUgc2VyaWVzCj4gPiBhcmUgYWNjZXB0ZWQ/Cj4K
PiBOb3QgZXZlcnkgbWFpbnRhaW5lciB3aWxsIHNlbmQgdGhvc2UsIEkgZG8gYnV0IHlvdSBtaWdo
dCBmaW5kIHRoZXkndmUKPiBnb25lIGludG8geW91ciBzcGFtIGZvbGRlciBpZiB5b3UncmUgdXNp
bmcgZ21haWwuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgYW5zd2VyLApSZWdhcmRzLApD
bMOpbWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
