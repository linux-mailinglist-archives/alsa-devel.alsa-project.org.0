Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCE1508B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E811698;
	Mon,  6 May 2019 17:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E811698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157458;
	bh=9WfQUJJjRRCjjJ3R3byf7B6fawwpzheUYX5504F/qY0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/HDEHmA+XbQvLYEOSvnDoTSvESt1O2lowO+EKnfwNahPOkTwAe2xiGkcmT/5q4JF
	 YSwvkL0vMK6bufvZs176mBGbuNMhqsB6gvmW7ILte4m/qIMBC5QGVrkSqNGPtpXsLv
	 Ry/eeqVMUKBKsxRcWuryQrncQbW7kmyDzZFWdQMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8D5F89701;
	Mon,  6 May 2019 17:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58B6AF896FD; Mon,  6 May 2019 17:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A928AF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A928AF80C07
Received: by mail-ed1-f68.google.com with SMTP id n17so15815123edb.0
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 08:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vhfg5FTHcJXptS1Kd8NC0qr6EcLPankfuQ5lBm93OT4=;
 b=AT0rsHIGkzDVOAbubQk7CNGbfNUj7UANm49bNuSmZVXWOhevDBwBjt2SzIK5ncd1+5
 yDcpSoEc1ZpuY3pojbjIoNWgud2cOeohLmk8Cxto8cK7rQZvZwcAtYfNTJaKrMndT79y
 ZaS78Nq1pi3sr2VgFEQiCN7bnxGkbwZNI9Qo8xPfwhQdIE29dU9BA7SQ9SnOHUHoT6S3
 vjbMdPu29qj5XY6YWGZYahL2QtfKaurKxP9x3FcLCHkbQGuXGuCLNMJV2dnJchbvv7j9
 cFyCOxGNz/29wPDQjACqVcRJaMIHN9W7c0tYFRnSwltS6OnN8G+MqQtFqTMXoFPw41bE
 DnpA==
X-Gm-Message-State: APjAAAUceBnQgTE3aKXV2JBMnfl8W5Q0gBA8T8XSSp1VRN6kPLtOUIPA
 0tlZTQwN7PSPjFkPwzoAjmPaWg==
X-Google-Smtp-Source: APXvYqwXCBhoco5TfV/LKqKF2GjuaDlY1Zrwaobpd214BL73BryIc/p9LIhnXqfmRbeA61sMkjvUXQ==
X-Received: by 2002:a50:be01:: with SMTP id a1mr21259711edi.12.1557157398110; 
 Mon, 06 May 2019 08:43:18 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id m27sm1667360eje.67.2019.05.06.08.43.17
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 08:43:17 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nariman <narimantos@gmail.com>, linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
 <423c7b83-abd6-4f75-ad3a-7c650b76e8bb@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6b7111b1-2387-5366-3536-f369a9b0982a@redhat.com>
Date: Mon, 6 May 2019 17:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <423c7b83-abd6-4f75-ad3a-7c650b76e8bb@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, yang.jie@linux.intel.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c:Refactored if
 statement and removed buffer
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

SGkgUGllcnJlLUxvdWlzLAoKTmFyaW1hbiBhbmQgdGhlIGF1dGhvciBhdXRob3JzIG9mIHRoZXNl
IHBhdGNoZXMgYXJlIGEgZ3JvdXAgb2Ygc3R1ZGVudHMgZG9pbmcKc29tZSBrZXJuZWwgd29yayBm
b3IgbWUgYW5kIHRoaXMgaXMgYSB3YXJtLXVwIGFzc2lnbm1lbnQgZm9yIHRoZW0gdG8gZ2V0IHVz
ZWQKdG8gdGhlIGtlcm5lbCBkZXZlbG9wbWVudCBwcm9jZXNzLgoKT24gMDYtMDUtMTkgMTc6MjEs
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IAo+PiDCoCBzdGF0aWMgaW50IGJ5dF9ydDU2
NDBfc3VzcGVuZChzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQo+PiBAQCAtMTI2OCwyOCArMTI2
NiwxMiBAQCBzdGF0aWMgaW50IHNuZF9ieXRfcnQ1NjQwX21jX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqAgbG9nX3F1aXJrcygmcGRldi0+ZGV2KTsKPj4g
wqDCoMKgwqDCoCBpZiAoKGJ5dF9ydDU2NDBfcXVpcmsgJiBCWVRfUlQ1NjQwX1NTUDJfQUlGMikg
fHwKPj4gLcKgwqDCoMKgwqDCoMKgIChieXRfcnQ1NjQwX3F1aXJrICYgQllUX1JUNTY0MF9TU1Aw
X0FJRjIpKSB7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIC8qIGZpeHVwIGNvZGVjIGFpZiBuYW1l
ICovCj4+IC3CoMKgwqDCoMKgwqDCoCBzbnByaW50ZihieXRfcnQ1NjQwX2NvZGVjX2FpZl9uYW1l
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoYnl0X3J0NTY0MF9jb2RlY19haWZf
bmFtZSksCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlcyIsICJydDU2NDAtYWlmMiIpOwo+
PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBieXRfcnQ1NjQwX2RhaXNbZGFpX2luZGV4XS5jb2RlY19k
YWlfbmFtZSA9Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ5dF9ydDU2NDBfY29kZWNfYWlm
X25hbWU7Cj4+IC3CoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgKGJ5dF9ydDU2NDBfcXVpcmsg
JiBCWVRfUlQ1NjQwX1NTUDBfQUlGMikpCj4+ICvCoMKgwqDCoMKgwqDCoCBieXRfcnQ1NjQwX2Rh
aXNbZGFpX2luZGV4XS5jb2RlY19kYWlfbmFtZSA9ICJydDU2NDAtYWlmMiI7Cj4gCj4gVGhpcyBp
cyBub3QgZXF1aXZhbGVudCwgeW91IGRvbid0IGRlYWwgd2l0aCB0aGUgKGJ5dF9ydDU2NDBfcXVp
cmsgJiBCWVRfUlQ1NjQwX1NTUDJfQUlGMikgY2FzZS4gVGhlIGRlZmF1bHQgaXMgU1NQX0FJRjEK
CkkgbWlnaHQgYmUgbWlzdGFrZW4gaGVyZSwgYnV0IGxvb2sgY2xvc2VyLCB0aGUgb3JpZ2luYWw6
CglpZiAoKGJ5dF9ydDU2NDBfcXVpcmsgJiBCWVRfUlQ1NjQwX1NTUDJfQUlGMikgfHwKCkxpbmUg
aXMga2VwdCwgc28gdGhlIG5ldyBjb2RlIGJsb2NrIGlzOgoKCWlmICgoYnl0X3J0NTY0MF9xdWly
ayAmIEJZVF9SVDU2NDBfU1NQMl9BSUYyKSB8fAoJICAgIChieXRfcnQ1NjQwX3F1aXJrICYgQllU
X1JUNTY0MF9TU1AwX0FJRjIpKQoJCWJ5dF9ydDU2NDBfZGFpc1tkYWlfaW5kZXhdLmNvZGVjX2Rh
aV9uYW1lID0gInJ0NTY0MC1haWYyIjsKCldoaWNoIGRvZXMgdGFrZSB0aGUgQllUX1JUNTY0MF9T
U1AyX0FJRjIgaW50byBhY2NvdW50LgoKPj4gwqDCoMKgwqDCoCBpZiAoKGJ5dF9ydDU2NDBfcXVp
cmsgJiBCWVRfUlQ1NjQwX1NTUDBfQUlGMSkgfHwKPj4gLcKgwqDCoMKgwqDCoMKgIChieXRfcnQ1
NjQwX3F1aXJrICYgQllUX1JUNTY0MF9TU1AwX0FJRjIpKSB7Cj4+IC0KPj4gLcKgwqDCoMKgwqDC
oMKgIC8qIGZpeHVwIGNwdSBkYWkgbmFtZSBuYW1lICovCj4+IC3CoMKgwqDCoMKgwqDCoCBzbnBy
aW50ZihieXRfcnQ1NjQwX2NwdV9kYWlfbmFtZSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2l6ZW9mKGJ5dF9ydDU2NDBfY3B1X2RhaV9uYW1lKSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIiVzIiwgInNzcDAtcG9ydCIpOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBieXRfcnQ1NjQw
X2RhaXNbZGFpX2luZGV4XS5jcHVfZGFpX25hbWUgPQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBieXRfcnQ1NjQwX2NwdV9kYWlfbmFtZTsKPj4gLcKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDC
oCAoYnl0X3J0NTY0MF9xdWlyayAmIEJZVF9SVDU2NDBfU1NQMF9BSUYyKSkKPj4gK8KgwqDCoMKg
wqDCoMKgIGJ5dF9ydDU2NDBfZGFpc1tkYWlfaW5kZXhdLmNwdV9kYWlfbmFtZSA9ICJzc3AwLXBv
cnQiOwo+IAo+IFNhbWUgaGVyZSwgdGhpcyBpcyBub3QgZXF1aXZhbGVudC4gdGhlIFNTUDBfQUlG
MSBjYXNlIGlzIG5vdCBoYW5kbGVkLgo+IGl0J3MgZmluZSB0byByZW1vdmUgdGhlIGludGVybWVk
aWF0ZSBidWZmZXJzLCBidXQgeW91IGNhbid0IHJlbW92ZSBzdXBwb3J0IGZvciAyIG91dCBvZiB0
aGUgNCBjb21iaW5hdGlvbnMgc3VwcG9ydGVkLgoKU2FtZSByZW1hcmsgaGVyZSBmcm9tIG1lIHRv
byA6KQoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
