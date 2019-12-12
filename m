Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5C11CFAB
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A6016F5;
	Thu, 12 Dec 2019 15:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A6016F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160585;
	bh=NO5czc/FSEeBQAZuVoSaPZ80sEXB3xM6x4mygvU26Q8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mADqrsanyaZACUn3ip8fFwUk7Wh63+FC3dpuV73+0GMklYu9UsxsIyx9adF/becZR
	 2PpqX0jPZ2rK5uzee4IxfiLbj/a1vocd4C5ki+MN+ARAo5BWE1uy2CmhypbpohaP+c
	 FMafucErdadeMG9eV24gvd7YPxT0pZMlprT8cPgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD0CFF80264;
	Thu, 12 Dec 2019 15:19:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD38F801F4; Thu, 12 Dec 2019 02:43:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD519F800F3
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 02:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD519F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ulz7/dF+"
Received: by mail-lf1-x143.google.com with SMTP id i23so370013lfo.7
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k3MT7+L3kNReQ0aWj6ky2KsiTx1YfA3d7iiuzNpuvhM=;
 b=Ulz7/dF+kPJTSCqiGltQdo8sS30X4xoZfoyGQsNApxOE66T6t3UCN8p/TfQqzO7qIZ
 HWe/sNp2OzuTk3l+8gt3Arx2UpV/BGQmlswxT7spwdqu3zrkTxSpJYvphoZEZxmyIxop
 LaDSPwDjiveJJBVrVJPTbv36fxKUrO93aCoD4t3zk2ohI5ja5Pof0Fp0q7lcJGNNFyA8
 m2RbiNhh3jGnlgHqh9uD5MnEe00FJ1NKOHfZYqjK43UaGSqoQHv9htySiVVCVDYacxDX
 r+fdQBd6Ra6aNPeK73GIeT9VGPANBF1/Dtd1hOiekU6ZE2rewxuEK9ungY4D2QtbaSY/
 a65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k3MT7+L3kNReQ0aWj6ky2KsiTx1YfA3d7iiuzNpuvhM=;
 b=ObLUOP+f9IKx/zH5i/qBICk6Pjfb2WUfzOMHom32scSz7xqZeMjoI3IXHvW6Y4H5tF
 fIo50DBentm2dkKLsN01YZuaZ0zRPOXpLsChoPWwz9PfKXAwB5KG0voK6Jaqwh6eKvWs
 UN3O+Qhn7qD6E+km6aXTX4BVHYFyu944gvQ6TQONmw8qe42uvTy5iTBmwAjedh38puz8
 ztRd62b0UtlZ3h1B9gTDeN93adiPwa+w534A9OKD/nmZaOQUoeHKBYRB1MrLVNgwXqdm
 63k/jbNu+0ZsFU6dzM9OUx0LCj8NquO+3vIilkinssYhH4iA178A5alRlj0ONZ0scocf
 JjdQ==
X-Gm-Message-State: APjAAAUwEwXwM9JkNFJ9EUab/kQuylBVAdBRTXKwpgdU6akCVrfK6DoO
 0VLKluN5AVGVdR/sJaAvcHy5a1C6
X-Google-Smtp-Source: APXvYqz7aTD5v1Yosyuc0A6maHQLW08mG0PaBCEDjujtH7miw7vNqCc+VqmwSEbFKuQSiaGRS/LpQQ==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr4140344lfl.185.1576115035025; 
 Wed, 11 Dec 2019 17:43:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id i4sm2327370lji.0.2019.12.11.17.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:43:54 -0800 (PST)
To: Peter De Schrijver <pdeschrijver@nvidia.com>
References: <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
Date: Thu, 12 Dec 2019 04:43:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, mturquette@baylibre.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, spujar@nvidia.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, broonie@kernel.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

MTEuMTIuMjAxOSAxODoxMCwgUGV0ZXIgRGUgU2NocmlqdmVyINC/0LjRiNC10YI6Cj4gT24gVHVl
LCBEZWMgMTAsIDIwMTkgYXQgMDg6NDE6NTZQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3Rl
Ogo+IAo+IC4uCj4gCj4+Pgo+Pj4gUE1DIGNsb2NrIGdhdGUgaXMgYmFzZWQgb24gdGhlIHN0YXRl
IG9mIENMS3hfQUNDRVBUX1JFUSBhbmQgRk9SQ0VfRU4KPj4+IGxpa2UgZXhwbGFpbmVkIGFib3Zl
Lgo+Pj4KPj4+IENMS3hfQUNDRVBUX1JFUSBpcyAwIGRlZmF1bHQgYW5kIEZPUkNFX0VOIGFjdHMg
YXMgZ2F0ZSB0byBlbmFibGUvZGlzYWJsZQo+Pj4gRVhUUEVSSVBIIGNsb2NrIG91dHB1dCB0byBQ
TUMgQ0xLX09VVF8xLzIvMy4KPj4KPj4gW2FuZCB0byBlbmFibGUgT1NDIGFzIHdlbGxdCj4+Cj4+
PiBTbyBJIGJlbGlldmUgd2UgbmVlZCB0byByZWdpc3RlciBhcyBNVVggYW5kIEdhdGUgcmF0aGVy
IHRoYW4gYXMgYSBzaW5nbGUKPj4+IGNsb2NrLiBQbGVhc2UgY29uZmlybS4KPj4KPj4gMS4gVGhl
IGZvcmNlLWVuYWJsaW5nIGlzIGFwcGxpZWQgdG8gYm90aCBPU0MgYW5kIEVYVEVSTiBzb3VyY2Vz
IG9mCj4+IFBNQ19DTEtfT1VUX3ggYnkgUE1DIGF0IG9uY2UuCj4+Cj4+IDIuIEJvdGggb2YgUE1D
J3MgZm9yY2UtZW5hYmxpbmcgYW5kIE9TQy9FWFRFUk4gc2VsZWN0aW9uIGlzIGludGVybmFsIHRv
IFBNQy4KPj4KPj4gU2hvdWxkIGJlIGJldHRlciB0byBkZWZpbmUgaXQgYXMgYSBzaW5nbGUgInBt
Y19jbGtfb3V0X3giLiBJIGRvbid0IHNlZQo+PiBhbnkgZ29vZCByZWFzb25zIGZvciBkaWZmZXJl
bnRpYXRpbmcgUE1DJ3MgR2F0ZSBmcm9tIHRoZSBNVVgsIGl0J3MgYQo+PiBzaW5nbGUgaGFyZHdh
cmUgdW5pdCBmcm9tIGEgcG9pbnQgb2YgdmlldyBvZiB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtLgo+
Pgo+PiBQZXRlciwgZG8geW91IGhhdmUgYW55IG9iamVjdGlvbnM/Cj4gCj4gVGhlIHJlYXNvbiB0
byBoYXZlIHNlcGFyYXRlIGdhdGUgYW5kIG11eCBjbG9ja3MsIGlzIHRvIHByZXNlcnZlIGNvbXBh
dGliaWxpdHkKPiB3aXRoIGV4aXN0aW5nIHVzZXJzLgo+IE90aGVyd2lzZSB0aGUgY3VycmVudCB1
c2VycyB3b3VsZCBuZWVkIHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUncyBhCj4gc2luZ2xlIGNsb2Nr
IG9yIDIgY2xvY2tzIHRvIGNvbmZpZ3VyZS4gSSBkb24ndCB0aGluayBhZGRpbmcgdGhhdCBjb2Rl
IGluCj4gZWFjaCB1c2VyIGlzIHdvcnRoIGl0IG9ubHkgdG8gaGF2ZSBhIHNsaWd0aGx5IG5pY2Vy
IG1vZGVsbGluZyBvZiB0aGUKPiBoYXJkd2FyZS4KCkNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3
aGF0IGRvIHlvdSBtZWFuIGJ5IHRoZSAiZXhpc3RpbmcgdXNlcnMiPwpBRkFJSywgbm90aGluZyBp
biBrZXJuZWwgdXNlcyBtdXggY2xvY2tzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
