Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC56CFDAC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 17:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5A61654;
	Tue,  8 Oct 2019 17:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5A61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570548685;
	bh=56I03TSdASoojg6QFDRvc0V+Z2/EahagKSeQkteNjfY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mkw9BACwo1i8ggy2WjwJDbeododLG/jcYRf2i6QFzPEwO0QfzjKDgUBIIU0vacSsO
	 UH3lZ8uHPNVWICv5Vqc66YiSG2+Kif+FE3+7kk3aVcB5i9aXUpltED75AQishVqX0D
	 RMYWnwqHI8YEH1YvnGs+kwL5kBvrEkdX56/DDAjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D4AF80322;
	Tue,  8 Oct 2019 17:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48CD3F8038F; Tue,  8 Oct 2019 17:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFF8FF800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 17:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF8FF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g+atH4RR"
Received: by mail-lf1-x143.google.com with SMTP id t8so12247538lfc.13
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EoX9RU7OCgSyJHiOI8NfYUW65KmpDnDk4jkS5zSGB9s=;
 b=g+atH4RR+l46NAMJ3DqRlKJUAMis6AcCZ1tJMS5RVuFp5DTe94KtqVXhvq9mtoNqco
 6ChZ/TEBoMsReXuVJrQG41hqDlh7+g28w8vcLD3EhvpkbNdTRYWjezUmKp73knV0U7TR
 js+OEI0AHB3DBYLFsB/WBYudQAiJzum63PeU0Wb2wpIqkR4C44nZ2y3hx6vmliOKKA2d
 G3jKLJY63PMGYTyXHygSqe0J28VwCH3gzM7qWFYDKAwh2WAczejyCGWsoQrN+Vbn9PEZ
 wsTn7IFPikBI82v1ka6TTu0rx1T+NZ2UKPF1Iwod7izBSeVtIHh8YUu4LSFh9+c1yDLN
 HX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EoX9RU7OCgSyJHiOI8NfYUW65KmpDnDk4jkS5zSGB9s=;
 b=tgWoRl+lZFJme+Vx9ZEVsAUVzOMIbf5yn/vSEMtuiiyw2RybA6cXY6IQ71JAv2DdDx
 0rdzJZJDTkuRPgOuxoQ+bJD5TdekkDzYTAbmbujb+U2SbsyIVIt3v72rnMRixGbaefOy
 fpsN0FQHvJ4o8xuaE6UEvpJQnqG8e0lBUPMi2bq76goZxwnZ3ytgrNuS39p5hzNOd6UL
 SsQyeuScePMqcx6LyWgjaU/NpEgHbE4XPFa88s9SWUJYHgb+mPrShLuN4NzsjU1bwTes
 Y4aIeypuHXpsEaDS7Zm9AWUJ/uW+0GLWc7A+Hr+/WGQs9WftbFfs7X8HUSx+WcwRm2hC
 aW1A==
X-Gm-Message-State: APjAAAVGRZ3xQoNRekHETbSHR+stKOLN/ggOCoIHMmpH0r6FJmD32R9U
 bhFp70taD8p7emDXGahi5FI=
X-Google-Smtp-Source: APXvYqwv1K851gyM8g3svkjPhroLjas4RSV8Eg6gjfULB12mo5/kTVn0KV7uCHyj3I5OYwKZr12wKA==
X-Received: by 2002:ac2:5a19:: with SMTP id q25mr11525365lfn.178.1570548573599; 
 Tue, 08 Oct 2019 08:29:33 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
 by smtp.googlemail.com with ESMTPSA id j5sm3745231lfj.77.2019.10.08.08.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 08:29:32 -0700 (PDT)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
Date: Tue, 8 Oct 2019 18:29:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007153136.4920-4-ben.dooks@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v4 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
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

SGVsbG8gQmVuLAoKMDcuMTAuMjAxOSAxODozMSwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gRnJv
bTogRWR3YXJkIENyYWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+IAo+IFRoZSBD
SUYgY29uZmlndXJhdGlvbiBhbmQgY2xvY2sgc2V0dGluZyBpcyBjdXJyZW50bHkgaGFyZCBjb2Rl
ZCBmb3IgMgo+IGNoYW5uZWxzLiBTaW5jZSB0aGUgaGFyZHdhcmUgaXMgY2FwYWJsZSBvZiBzdXBw
b3J0aW5nIDEtOCBjaGFubmVscyBhZGQKPiBzdXBwb3J0IGZvciByZWFkaW5nIHRoZSBjaGFubmVs
IGNvdW50IGZyb20gdGhlIHN1cHBsaWVkIHBhcmFtZXRlcnMgdG8KPiBhbGxvdyBmb3IgYmV0dGVy
IFRETSBzdXBwb3J0LiBJdCBzZWVtcyB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YgdGhp
cwo+IGRyaXZlciB3YXMgZml4ZWQgYXQgMiBjaGFubmVscyBmb3Igc2ltcGxpY2l0eSwgYW5kIG5v
dCBpbXBsZW1lbnRpbmcgVERNLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3
YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51azog
YWRkZWQgaXNfdGRtIGFuZCBjaGFubmVsIG5yIGNoZWNrXQo+IFtiZW4uZG9va3NAY29kZXRoaW5r
LmNvLnVrOiBtZXJnZSBlZGdlIGNvbnRyb2wgaW50byBzZXQtZm9ybWF0XQo+IFtiZW4uZG9va3NA
Y29kZXRoaW5rLmNvLnVrOiByZW1vdmVkIGlzX3RkbSBhbmQgbW92ZWQgZWRnZSB0byBod19wYXJh
bXNdCj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
Pgo+IC0tLQo+ICBzb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyB8IDIxICsrKysrKysrKysr
KystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgYi9z
b3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+IGluZGV4IDA2M2YzNGM4ODJhZi4uNzM4MmY3
OTQ5YmY0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4gKysr
IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPiBAQCAtNjcsNiArNjcsNyBAQCBzdGF0
aWMgaW50IHRlZ3JhMzBfaTJzX3NldF9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4gIHsK
PiAgCXN0cnVjdCB0ZWdyYTMwX2kycyAqaTJzID0gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoZGFp
KTsKPiAgCXVuc2lnbmVkIGludCBtYXNrID0gMCwgdmFsID0gMDsKPiArCXVuc2lnbmVkIGludCBj
aF9tYXNrLCBjaF92YWwgPSAwOwo+ICAKPiAgCXN3aXRjaCAoZm10ICYgU05EX1NPQ19EQUlGTVRf
SU5WX01BU0spIHsKPiAgCWNhc2UgU05EX1NPQ19EQUlGTVRfTkJfTkY6Cj4gQEAgLTc1LDYgKzc2
LDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19zZXRfZm10KHN0cnVjdCBzbmRfc29jX2RhaSAq
ZGFpLAo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiArCWNoX21hc2sgPSBURUdSQTMw
X0kyU19DSF9DVFJMX0VHREVfQ1RSTF9NQVNLOwo+ICAJbWFzayB8PSBURUdSQTMwX0kyU19DVFJM
X01BU1RFUl9FTkFCTEU7Cj4gIAlzd2l0Y2ggKGZtdCAmIFNORF9TT0NfREFJRk1UX01BU1RFUl9N
QVNLKSB7Cj4gIAljYXNlIFNORF9TT0NfREFJRk1UX0NCU19DRlM6Cj4gQEAgLTkwLDEwICs5Miwx
MiBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX3NldF9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpk
YWksCj4gIAkJVEVHUkEzMF9JMlNfQ1RSTF9MUkNLX01BU0s7Cj4gIAlzd2l0Y2ggKGZtdCAmIFNO
RF9TT0NfREFJRk1UX0ZPUk1BVF9NQVNLKSB7Cj4gIAljYXNlIFNORF9TT0NfREFJRk1UX0RTUF9B
Ogo+ICsJCWNoX3ZhbCA9IFRFR1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJMX05FR19FREdFOwo+
ICAJCXZhbCB8PSBURUdSQTMwX0kyU19DVFJMX0ZSQU1FX0ZPUk1BVF9GU1lOQzsKPiAgCQl2YWwg
fD0gVEVHUkEzMF9JMlNfQ1RSTF9MUkNLX0xfTE9XOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBTTkRf
U09DX0RBSUZNVF9EU1BfQjoKPiArCQljaF92YWwgPSBURUdSQTMwX0kyU19DSF9DVFJMX0VHREVf
Q1RSTF9ORUdfRURHRTsKCkRvd25zdHJlYW0gY29kZSBzZXRzIERTUF9CIHRvIFBPU19FREdFLCBs
b29rcyBsaWtlIHlvdSBoYXZlIGEgdHlwbyBoZXJlLgpPciBkb2VzIERTUF9CIGhhcHBlbiB0byB3
b3JrIHdpdGggdGhlIE5FR19FREdFPwoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
