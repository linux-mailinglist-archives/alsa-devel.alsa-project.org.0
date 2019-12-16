Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6D122D27
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:41:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1711658;
	Tue, 17 Dec 2019 14:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1711658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590104;
	bh=6Vtb9AVaxrHXlC5OyOSrCXM1wl8ENQgIEEGBeEbtmGA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJLJnFQmSeO+tCJqWsn/gSvy4eHFOSTbDwPaiXmk9BmmXoO+7epxRasGv1JZl0DmD
	 nODNuYWw0WrVyK7tNPwUFcV6DiDllVyTr2V5sgFp+ucn6u7iXSTjTlVgIIGy8mgl1M
	 06XNuw56vrp1vh7+Ets35WM1aGLsmQgtOV94xulk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF66F8026F;
	Tue, 17 Dec 2019 14:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A8BF80259; Mon, 16 Dec 2019 15:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4958F80257
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 15:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4958F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QSKs5fDu"
Received: by mail-lf1-x144.google.com with SMTP id r14so4372947lfm.5
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SDz/eeiUYW00uzzbWG7DKDZnUYir/tuNRcDkO6zwBsY=;
 b=QSKs5fDuzVkdH3m7fH8YkBd2PodkArxmfGtpqkuhuHCEVIp44IPGrWiUNbPNyXUmLD
 oSHUzqxTaiFBb6jPo1aKzD2rTL9ojEqbf5svoH5nxZ3IXiNAytr/ZoFCSKwRMPjHK0AS
 VT53eJgj9gMFfhc8TrEZZmPCIY3/4aD5AEJnsnqtICB+d4kXxpkYChbX6m4gYHiNoNgN
 3lQBVP3TF/xAnM5T0HqA0Fl6XY2exCS26s/auhrVPYFHtIKP4Y/WWPB9PHeqB1tnTF7O
 vPP1joK9iNxxU2KYaly0vR3sCwNXTHtMkMPBFzwGHAEeHKQI7rxEnM/hpZqrhD5n/bLk
 3nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SDz/eeiUYW00uzzbWG7DKDZnUYir/tuNRcDkO6zwBsY=;
 b=OD8YjyYpB/4uhDbccsUSZ8dqUlb3SYy4Sw+V0tv1ZyUjTMyowt7loVA1TLom181UPo
 aolbf6gZAARESF9gw7tIzkb+97CiwJySvnXppBAvzjwMJxr+EIdZKirZffpunJwdLVbC
 P2jF61lP8d6p7b4h5QOFclTwEG07r3gvX0Mb5xPHXcEYb2iI/eYE5tVWCvv5CGQU2zZC
 nsJEfgYQtiF0AhrJQXBMDNqtml17c+tUV36ClcGdHP8Bk2xftLpjizuIpXz4Ao10YsVK
 VY+oZ42AutYOvj7/vQy0TnptGZcl3M1hfU/JoBvg31rB+9wYww6f1Ctf+i4VOUJ3AXN5
 K45w==
X-Gm-Message-State: APjAAAXEM0LLB1xQMfvh5nBJcLcQ4k+urxxUBzrn0ol+9bKPyK2gH5Rl
 vSElDA+O9pfz/4ndI5Y1SCjvSDoV
X-Google-Smtp-Source: APXvYqzMOp3oG1zDPBMq6S4CYV0V+gLdClhVaX0UoySeNVrCOjjJid4LlJ3k7mjrc3KHQBTL0oZ4VA==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr17309513lfh.20.1576506205560; 
 Mon, 16 Dec 2019 06:23:25 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id q10sm10729440ljj.60.2019.12.16.06.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 06:23:24 -0800 (PST)
To: Peter De Schrijver <pdeschrijver@nvidia.com>
References: <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
 <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <53653719-f8e5-f6d1-a1d1-e53c7ccd7636@gmail.com>
Date: Mon, 16 Dec 2019 17:23:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 14:39:17 +0100
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

MTYuMTIuMjAxOSAxNToyMCwgUGV0ZXIgRGUgU2NocmlqdmVyINC/0LjRiNC10YI6Cj4gT24gVGh1
LCBEZWMgMTIsIDIwMTkgYXQgMDQ6NDM6NTNBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3Rl
Ogo+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2ht
ZW50cwo+Pgo+Pgo+PiAxMS4xMi4yMDE5IDE4OjEwLCBQZXRlciBEZSBTY2hyaWp2ZXIg0L/QuNGI
0LXRgjoKPj4+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDA4OjQxOjU2UE0gKzAzMDAsIERtaXRy
eSBPc2lwZW5rbyB3cm90ZToKPj4+Cj4+PiAuLgo+Pj4KPj4+Pj4KPj4+Pj4gUE1DIGNsb2NrIGdh
dGUgaXMgYmFzZWQgb24gdGhlIHN0YXRlIG9mIENMS3hfQUNDRVBUX1JFUSBhbmQgRk9SQ0VfRU4K
Pj4+Pj4gbGlrZSBleHBsYWluZWQgYWJvdmUuCj4+Pj4+Cj4+Pj4+IENMS3hfQUNDRVBUX1JFUSBp
cyAwIGRlZmF1bHQgYW5kIEZPUkNFX0VOIGFjdHMgYXMgZ2F0ZSB0byBlbmFibGUvZGlzYWJsZQo+
Pj4+PiBFWFRQRVJJUEggY2xvY2sgb3V0cHV0IHRvIFBNQyBDTEtfT1VUXzEvMi8zLgo+Pj4+Cj4+
Pj4gW2FuZCB0byBlbmFibGUgT1NDIGFzIHdlbGxdCj4+Pj4KPj4+Pj4gU28gSSBiZWxpZXZlIHdl
IG5lZWQgdG8gcmVnaXN0ZXIgYXMgTVVYIGFuZCBHYXRlIHJhdGhlciB0aGFuIGFzIGEgc2luZ2xl
Cj4+Pj4+IGNsb2NrLiBQbGVhc2UgY29uZmlybS4KPj4+Pgo+Pj4+IDEuIFRoZSBmb3JjZS1lbmFi
bGluZyBpcyBhcHBsaWVkIHRvIGJvdGggT1NDIGFuZCBFWFRFUk4gc291cmNlcyBvZgo+Pj4+IFBN
Q19DTEtfT1VUX3ggYnkgUE1DIGF0IG9uY2UuCj4+Pj4KPj4+PiAyLiBCb3RoIG9mIFBNQydzIGZv
cmNlLWVuYWJsaW5nIGFuZCBPU0MvRVhURVJOIHNlbGVjdGlvbiBpcyBpbnRlcm5hbCB0byBQTUMu
Cj4+Pj4KPj4+PiBTaG91bGQgYmUgYmV0dGVyIHRvIGRlZmluZSBpdCBhcyBhIHNpbmdsZSAicG1j
X2Nsa19vdXRfeCIuIEkgZG9uJ3Qgc2VlCj4+Pj4gYW55IGdvb2QgcmVhc29ucyBmb3IgZGlmZmVy
ZW50aWF0aW5nIFBNQydzIEdhdGUgZnJvbSB0aGUgTVVYLCBpdCdzIGEKPj4+PiBzaW5nbGUgaGFy
ZHdhcmUgdW5pdCBmcm9tIGEgcG9pbnQgb2YgdmlldyBvZiB0aGUgcmVzdCBvZiB0aGUgc3lzdGVt
Lgo+Pj4+Cj4+Pj4gUGV0ZXIsIGRvIHlvdSBoYXZlIGFueSBvYmplY3Rpb25zPwo+Pj4KPj4+IFRo
ZSByZWFzb24gdG8gaGF2ZSBzZXBhcmF0ZSBnYXRlIGFuZCBtdXggY2xvY2tzLCBpcyB0byBwcmVz
ZXJ2ZSBjb21wYXRpYmlsaXR5Cj4+PiB3aXRoIGV4aXN0aW5nIHVzZXJzLgo+Pj4gT3RoZXJ3aXNl
IHRoZSBjdXJyZW50IHVzZXJzIHdvdWxkIG5lZWQgdG8gZmlndXJlIG91dCBpZiB0aGVyZSdzIGEK
Pj4+IHNpbmdsZSBjbG9jayBvciAyIGNsb2NrcyB0byBjb25maWd1cmUuIEkgZG9uJ3QgdGhpbmsg
YWRkaW5nIHRoYXQgY29kZSBpbgo+Pj4gZWFjaCB1c2VyIGlzIHdvcnRoIGl0IG9ubHkgdG8gaGF2
ZSBhIHNsaWd0aGx5IG5pY2VyIG1vZGVsbGluZyBvZiB0aGUKPj4+IGhhcmR3YXJlLgo+Pgo+PiBD
b3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgd2hhdCBkbyB5b3UgbWVhbiBieSB0aGUgImV4aXN0aW5n
IHVzZXJzIj8KPj4gQUZBSUssIG5vdGhpbmcgaW4ga2VybmVsIHVzZXMgbXV4IGNsb2Nrcy4KPiAK
PiBUaGUgRFQgY2xrIGJpbmRpbmdzIGFsbG93IGZvciBwYXJlbnQgaW5pdGlhbGl6YXRpb24sIHNv
IGl0J3MgY2VydGFpbmx5Cj4gcG9zc2libGUgdGhlcmUgYXJlIHNvbWUgRFRzIHdoaWNoIHJlbHkg
b24gdGhpcy4gV2UgcHJvbWlzZWQgdG8gbmV2ZXIKPiBicmVhayB0aGUgYmluZGluZ3MsIHdoaWNo
IGNoYW5naW5nIHRvIDEgY2xvY2sgd291bGQgZG8uIAoKV2hhdCBhYm91dCB0aGlzIHZhcmlhbnQ6
CgogIDEuIEtlZXAgdGhlIG9sZCBDYVIgY29kZSBpbiBwbGFjZS4KCiAgMi4gTWFrZSBDYVIgZHJp
dmVyIHRvIHNjYW4gd2hvbGUgZGV2aWNlLXRyZWUgZm9yIHRoZSBsZWdhY3kgUE1DIGNsb2Nrcy4K
CiAgMy4gSWYgbGVnYWN5IGNsb2NrIGlzIGZvdW5kLCB0aGVuIHJlZ2lzdGVyIFBNQyBjbG9ja3Mg
ZnJvbSBDYVIuCgogIDQuIElmIGxlZ2FjeSBjbG9ja3MgYXJlIG5vdCBmb3VuZCwgdGhlbiBkb24n
dCByZWdpc3RlciBQTUMgY2xvY2tzIGZyb20KQ2FSLgoKICA1LiBBZGQgY2xvY2tzIHN1cHBvcnQg
dG8gdGhlIFBNQyBkcml2ZXIgYW5kIG9ubHkgcmVnaXN0ZXIgdGhlbSBpZgpsZWdhY3kgY2xvY2tz
IGFyZSBub3QgcmVnaXN0ZXJlZCBieSBDYVIuCgpOb3cgYm90aCBvbGQgYW5kIG5ldyBEVEJzIGNh
biBjby1leGlzdCBhbmQgd29yaywgZXZlcnlvbmUgaGFwcHkuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
