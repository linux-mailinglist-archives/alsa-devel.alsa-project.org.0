Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BD126FAD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 22:23:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D074615E5;
	Thu, 19 Dec 2019 22:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D074615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576790581;
	bh=WnDfLoQLPuj/GSnYrDlQmFzaoukoT2sOB9uU8c+YUQg=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pf3EduA4axZgafuPT1zupfmE/CUM57Fn+29komgpN0+JFMWn5lP+WuEwdFit/sZQB
	 CoElqZBtEQKKs/ufFoVorxazkt8WLdtNgTCOnirQ5mtwi/IxODyLG9DD3rRs3h/AqH
	 wBjGrvjRZN1wqOM11g21cf5avT1AsxBUz1lLc2eI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B11F80253;
	Thu, 19 Dec 2019 22:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1B3F80218; Thu, 19 Dec 2019 22:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F10AF80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 22:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F10AF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VDMQA50b"
Received: by mail-lj1-x243.google.com with SMTP id j1so418290lja.2
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hrHBkQaep6JoKVoAjFMFBIJdnw7horgDntnw6g1jYnQ=;
 b=VDMQA50bZy2cHHQqXOEijfydyzoFBRM8y/7tAdV90QziNqm/2jgHYTOFoPVjsEMrO5
 qo34gchWToB9/soqHX3sR5PvUFiXfdCY9UIR+b3ihTgb43MK39+fi3wLBHBgSKXgfyS7
 16rrUuLrrvSY/QV+VTF4h6S9TnB948toCeU8uektmjEECR02mn6Lxb1J+8L+MOXC0ajT
 HqmrI1Ngcgb+Epsjj8qIhFCQUWF28ZxDc0811bBA0JKudDGNhqJsr2tBMWoTm8aUlQK5
 A2dawVHfg12SaZrboJQSJQ968+FM+45erzSLUqpCJGxNq0F92ws+T1bKS0kqinqb0+J5
 jF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrHBkQaep6JoKVoAjFMFBIJdnw7horgDntnw6g1jYnQ=;
 b=pYLnaHsNuTbtAhnRfCOghBndQK3oHnwT+ICKI4X040m9gozolU1iSejITPMqbfoG1P
 jGicqUlELBhTd7TiBJEUdYRGsFZWrMOuH7BcZvO3C4NcU+jxygH76aylZmOpIZSp7FVy
 H6EeQWU5W2KRwjA3s7fb4sDUJ7PwkpAyqqskIU6o5A+wIpaQBR6thjyLkKVCgTlY0Mni
 tGvRXMPYbMigZLdFh5uAaCCQKjotdMmUJqDSjoraqlJMIf4LJMTio7Bal2vIPCRvgZk7
 kW/qpM52YQXTte1w1tGCkbYt3lyMeOXZH+p/RYYB1es70lqnpcaQBBXcQAesEBjMLtoF
 U1RA==
X-Gm-Message-State: APjAAAW3d/MRft1Q2Vd05GaurOlBAb1o9eeunc5t6NJ5P1+v3fpBzVWw
 WK2pQxk6H1qNv5Wrnzxe5XM=
X-Google-Smtp-Source: APXvYqxPhvgktTxBr6AhuaKKP/a2PG+9IY6Ut3VgNnkDlDUjUYX5Qvhrag0lrl6g+VI+k6TtCloZ5A==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr7778245ljg.196.1576790470304; 
 Thu, 19 Dec 2019 13:21:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d20sm336609ljg.95.2019.12.19.13.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 13:21:09 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Message-ID: <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
Date: Fri, 20 Dec 2019 00:21:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

MjUuMTEuMjAxOSAyMDoyOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjUuMTEuMjAx
OSAyMDoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDI1LjExLjIwMTkgMTM6Mzcs
IEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4gT24gMjMvMTEvMjAxOSAyMTowOSwgRG1pdHJ5IE9z
aXBlbmtvIHdyb3RlOgo+Pj4+IDE4LjEwLjIwMTkgMTg6NDgsIEJlbiBEb29rcyDQv9C40YjQtdGC
Ogo+Pj4+PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+
Cj4+Pj4+Cj4+Pj4+IFRoZSB0ZWdyYTMgYXVkaW8gY2FuIHN1cHBvcnQgMjQgYW5kIDMyIGJpdCBz
YW1wbGUgc2l6ZXMgc28gYWRkIHRoZQo+Pj4+PiBvcHRpb24gdG8gdGhlIHRlZ3JhMzBfaTJzX2h3
X3BhcmFtcyB0byBjb25maWd1cmUgdGhlIFMyNF9MRSBvciBTMzJfTEUKPj4+Pj4gZm9ybWF0cyB3
aGVuIHJlcXVlc3RlZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIENyYWdnIDxl
ZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5j
by51azogZml4dXAgbWVyZ2Ugb2YgMjQgYW5kIDMyYml0XQo+Pj4+PiBbYmVuLmRvb2tzQGNvZGV0
aGluay5jby51azogYWRkIHBtIGNhbGxzIGFyb3VuZCB5dGRtIGNvbmZpZ10KPj4+Pj4gW2Jlbi5k
b29rc0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcgdG8gZGV2X2RiZ10KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+
Pj4+PiAtLS0KPj4+Pj4gc3F1YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdyYTogaTJzOiBwbV9y
dW50aW1lX2dldF9zeW5jKCkgaXMgbmVlZGVkCj4+Pj4+IGluIHRkbSBjb2RlCj4+Pj4+Cj4+Pj4+
IEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBpcyBuZWVkZWQgaW4gdGRt
IGNvZGUKPj4+Pj4gLS0tCj4+Pj4+IMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIHwg
MjUgKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3Jh
MzBfaTJzLmMKPj4+Pj4gaW5kZXggNzNmMGRkZGVhZWYzLi4wNjNmMzRjODgyYWYgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+ICsrKyBiL3NvdW5k
L3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+IEBAIC0xMjcsNyArMTI3LDcgQEAgc3RhdGlj
IGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFt
ICpzdWJzdHJlYW0sCj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gZGFpLT5k
ZXY7Cj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfaTJzICppMnMgPSBzbmRfc29jX2Rh
aV9nZXRfZHJ2ZGF0YShkYWkpOwo+Pj4+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrLCB2
YWwsIHJlZzsKPj4+Pj4gLcKgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGkyc2Ns
b2NrLCBiaXRjbnQ7Cj4+Pj4+ICvCoMKgwqAgaW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRlLCBp
MnNjbG9jaywgYml0Y250LCBhdWRpb19iaXRzOwo+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdy
YTMwX2FodWJfY2lmX2NvbmYgY2lmX2NvbmY7Cj4+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKHBhcmFt
c19jaGFubmVscyhwYXJhbXMpICE9IDIpCj4+Pj4+IEBAIC0xMzcsOCArMTM3LDE5IEBAIHN0YXRp
YyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+Pj4+PiBzbmRfcGNtX3N1YnN0cmVh
bSAqc3Vic3RyZWFtLAo+Pj4+PiDCoMKgwqDCoMKgIHN3aXRjaCAocGFyYW1zX2Zvcm1hdChwYXJh
bXMpKSB7Cj4+Pj4+IMKgwqDCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRToKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMTY7
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRT
XzE2Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAxNjsKPj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1B
VF9TMjRfTEU6Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJ
VF9TSVpFXzI0Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVE
SU9DSUZfQklUU18yNDsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMjQ7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gK8KgwqDCoCBjYXNlIFNORFJWX1BDTV9G
T1JNQVRfUzMyX0xFOgo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RS
TF9CSVRfU0laRV8zMjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMw
X0FVRElPQ0lGX0JJVFNfMzI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDMy
Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+IMKgwqDCoMKgwqAgZGVmYXVsdDoK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiDCoMKgwqDCoMKg
IH0KPj4+Pj4gQEAgLTE3MCw4ICsxODEsOCBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3Bh
cmFtcyhzdHJ1Y3QKPj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4+Pj4gwqDC
oMKgwqDCoCBjaWZfY29uZi50aHJlc2hvbGQgPSAwOwo+Pj4+PiDCoMKgwqDCoMKgIGNpZl9jb25m
LmF1ZGlvX2NoYW5uZWxzID0gMjsKPj4+Pj4gwqDCoMKgwqDCoCBjaWZfY29uZi5jbGllbnRfY2hh
bm5lbHMgPSAyOwo+Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2JpdHMgPSBURUdSQTMwX0FV
RElPQ0lGX0JJVFNfMTY7Cj4+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBURUdS
QTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9
IGF1ZGlvX2JpdHM7Cj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBhdWRpb19i
aXRzOwo+Pj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmV4cGFuZCA9IDA7Cj4+Pj4+IMKgwqDCoMKg
wqAgY2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLnJl
cGxpY2F0ZSA9IDA7Cj4+Pj4+IEBAIC0zMDYsMTQgKzMxNywxOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+Pj4+PiB0ZWdyYTMwX2kyc19kYWlfdGVtcGxhdGUgPSB7
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWluID0gMiwKPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC5jaGFubmVsc19tYXggPSAyLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
LnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4gwqDC
oMKgwqDCoCB9LAo+Pj4+PiDCoMKgwqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLnN0cmVhbV9uYW1lID0gIkNhcHR1cmUiLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNf
bWF4ID0gMiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRF
XzgwMDBfOTYwMDAsCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9G
TVRCSVRfUzE2X0xFLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01f
Rk1UQklUX1MzMl9MRSB8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJW
X1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+IMKgwqDCoMKgwqAgfSwKPj4+Pj4gwqDCoMKg
wqDCoCAub3BzID0gJnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4+Pj4+IMKgwqDCoMKgwqAgLnN5bW1l
dHJpY19yYXRlcyA9IDEsCj4+Pj4+Cj4+Pj4KPj4+PiBIZWxsbywKPj4+Pgo+Pj4+IFRoaXMgcGF0
Y2ggYnJlYWtzIGF1ZGlvIG9uIFRlZ3JhMzAuIEkgZG9uJ3Qgc2VlIGVycm9ycyBhbnl3aGVyZSwg
YnV0Cj4+Pj4gdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNoIGhlbHBz
LiBQbGVhc2UgZml4IGl0Lgo+Pj4KPj4+IFdoYXQgaXMgdGhlIGZhaWx1cmUgbW9kZT8gSSBjYW4g
dHJ5IGFuZCB0YWtlIGEgbG9vayBhdCB0aGlzIHNvbWUgdGltZQo+Pj4gdGhpcyB3ZWVrLCBidXQg
SSBhbSBub3Qgc3VyZSBpZiBJIGhhdmUgYW55IGJvYXJkcyB3aXRoIGFuIGFjdHVhbCB1c2VmdWwK
Pj4+IGF1ZGlvIG91dHB1dD8KPj4KPj4gVGhlIGZhaWx1cmUgbW9kZSBpcyB0aGF0IHRoZXJlIG5v
IHNvdW5kLiBJIGFsc28gbm90aWNlZCB0aGF0IHZpZGVvCj4+IHBsYXliYWNrIHN0dXR0ZXJzIGEg
bG90IGlmIG1vdmllIGZpbGUgaGFzIGF1ZGlvIHRyYWNrLCBzZWVtcyBzb21ldGhpbmcKPj4gdGlt
ZXMgb3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2suIEZvciBub3cgSSBkb24ndCBoYXZl
IGFueSBtb3JlIGluZm8uCj4+Cj4gCj4gT2gsIEkgZGlkbid0IHNheSBob3cgdG8gcmVwcm9kdWNl
IGl0Li4gZm9yIGV4YW1wbGUgc2ltcGx5IHBsYXlpbmcKPiBiaWdfYnVja19idW5ueV83MjBwX2gy
NjQubW92IGluIE1QViBoYXMgdGhlIGF1ZGlvIHByb2JsZW0uCj4gCj4gaHR0cHM6Ly9kb3dubG9h
ZC5ibGVuZGVyLm9yZy9wZWFjaC9iaWdidWNrYnVubnlfbW92aWVzL2JpZ19idWNrX2J1bm55Xzcy
MHBfaDI2NC5tb3YKPiAKCkhlbGxvIEJlbiwKCkRvIHlvdSBoYXZlIGFueSB1cGRhdGVzPyBJIGp1
c3QgcmUtY2hlY2sgd2hldGhlciBwcm9ibGVtIHBlcnNpc3RzIGFuZAppdCdzIHN0aWxsIHRoZXJl
IHVzaW5nIGEgcmVjZW50IGxpbnV4LW5leHQuCgpJbnRlcmVzdGluZ2x5LCBJIGNhbiBoZWFyIHNv
bWUgc291bmQgbm93LCBidXQgaXQncyB2ZXJ5IGRpc3RvcnRlZC4KCklmIHlvdSBkb24ndCBoYXZl
IGEgc29sdXRpb24sIHRoZW4gd2hhdCBhYm91dCB0byByZXZlcnQgdGhlIHBhdGNoZXMgZm9yCm5v
dyBhbmQgdHJ5IGFnYWluIGxhdGVyIG9uPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
