Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF2138CC1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 09:22:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8376E9F6;
	Mon, 13 Jan 2020 09:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8376E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578903746;
	bh=BfGVhzIrlenT480Gc3CpMPsuqTOQh/eXvPP7I+6kIvo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2vvbYLmOkhMIvluvbE0evqL7CrKcA8+z9m/vakYLYpP+Wh/66XbBZlch7OGrU/SN
	 YK2U/ZFAtKhgh2h2Y9Ov1+hCrjkqmrbBOM4GBDGqyYQ2gA7sXsdKp5xXEue9q6b5iE
	 UA0lKY1qWalTm6atnhaPL2XfFWZOAToWyheI4AQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC12F801EB;
	Mon, 13 Jan 2020 09:20:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 221F5F801EB; Mon, 13 Jan 2020 09:20:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B8BF80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B8BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fpUiy3Xg"
Received: by mail-pj1-x1044.google.com with SMTP id r67so3844504pjb.0
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 00:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bMqucdvwW4DxJLa5hqSQSlZ+HKdfxlLmr5IwDINyABs=;
 b=fpUiy3Xg2sDv9bf5OvF1hAah/1QRfWGgnppILok/K04EQDtG9R8vzvFWp4cJJKwGLz
 NAKUewD9PkneM7K0lq/XVUrVVe2YZj3FXxwyi2gJMFc/Tu1EctP5uhoFSWDxgoxt/awA
 mtI01TvYQOh3VqyTmS7ku9hk1TVXft8kUl1Fg48XO4QTe5wThfSIPsKwX17AlW9qmKSC
 e4FKuRVBJFjWZKAvtU/pe3rGvgIarYB8fz0A/Z+k8gy9XjZO+lg0VM56D2D21k+fiq7+
 kpeBO8Hg2XKDGFX82AXVVoq58alG+dpAO45W2ZKvWvKM8jWCDWB5ujkDx1ThFoiiQjdW
 hYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bMqucdvwW4DxJLa5hqSQSlZ+HKdfxlLmr5IwDINyABs=;
 b=k5qCNGmCdnHKqCOg2bRvjRcaqjhhfN/T9OdEYhrC/Esa9tjBr6OXGod9uJfjPICcyb
 dzIH+SN+9ccucLw2YoVYnLBxsrcC9y9V5Epo8louW7t5rLqsX6vmcEr5VttOx93Vp0ru
 ikQEBpzIzTFBwJK5Oa2vrrAwUNvqYh+2BI2z3vNhDMC8ZsIXaLYJEdR0beyXW9IPIlJ/
 xUEZvIvAkORGSZ48jWZEMADlnV+wNoPJBfHNEDOQjxDYP0zqQMfNiqlr1CUVhDL4I/7i
 grj08IP//MLPARsltu0uVAXENWmAfXhZPKlKsaE0biYf//Xvw1/hDC+K3hc5R2DDyyFD
 O0hA==
X-Gm-Message-State: APjAAAW3i2/c4TPL4liTjkcmRqd0iifZin+u1+C1mgy99iEMDgieUh7o
 Za3CpXwR/Vl1r9RG7sv0qv0=
X-Google-Smtp-Source: APXvYqzq8v/enDDBDTkt0OxdeBhm2NzezTQsHz2JVtReupHvyt0kSjM1nkMx9CUwKaZZe9bfqalBTQ==
X-Received: by 2002:a17:902:694c:: with SMTP id
 k12mr12673527plt.329.1578903635888; 
 Mon, 13 Jan 2020 00:20:35 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.115?
 ([2402:f000:1:1501:200:5efe:a66f:8b73])
 by smtp.gmail.com with ESMTPSA id c22sm12668511pfo.50.2020.01.13.00.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 00:20:35 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>
References: <20200111163027.27135-1-baijiaju1990@gmail.com>
 <s5h5zhhkrwe.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <de859611-4bd0-647f-61e9-7138425ed736@gmail.com>
Date: Mon, 13 Jan 2020 16:20:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <s5h5zhhkrwe.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 rfontana@redhat.com, tglx@linutronix.de, allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH] ALSA: cmipci: Fix possible a data race in
 snd_cmipci_interrupt()
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

CgpPbiAyMDIwLzEvMTIgMTY6MjAsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBTYXQsIDExIEph
biAyMDIwIDE3OjMwOjI3ICswMTAwLAo+IEppYS1KdSBCYWkgd3JvdGU6Cj4+IFRoZSBmdW5jdGlv
bnMgc25kX2NtaXBjaV9pbnRlcnJ1cHQoKSBhbmQgc25kX2NtaXBjaV9jYXB0dXJlX3RyaWdnZXIo
KQo+PiBtYXkgYmUgY29uY3VycmVudGx5IGV4ZWN1dGVkLgo+Pgo+PiBUaGUgZnVuY3Rpb24gc25k
X2NtaXBjaV9jYXB0dXJlX3RyaWdnZXIoKSBjYWxscwo+PiBzbmRfY21pcGNpX3BjbV90cmlnZ2Vy
KCkuIEluIHNuZF9jbWlwY2lfcGNtX3RyaWdnZXIoKSwgdGhlIHZhcmlhYmxlCj4+IHJlYy0+cnVu
bmluZyBpcyB3cml0dGVuIHdpdGggaG9sZGluZyBhIHNwaW5sb2NrIGNtLT5yZWdfbG9jay4gQnV0
IGluCj4+IHNuZF9jbWlwY2lfaW50ZXJydXB0KCksIHRoZSBpZGVudGljYWwgdmFyaWFibGUgY20t
PmNoYW5uZWxbMF0ucnVubmluZwo+PiBvciBjbS0+Y2hhbm5lbFsxXS5ydW5uaW5nIGlzIHJlYWQg
d2l0aG91dCBob2xkaW5nIHRoaXMgc3BpbmxvY2suIFRodXMsCj4+IGEgcG9zc2libGUgZGF0YSBy
YWNlIG1heSBvY2N1ci4KPj4KPj4gVG8gZml4IHRoaXMgZGF0YSByYWNlLCBpbiBzbmRfY21pcGNp
X2ludGVycnVwdCgpLCB0aGUgdmFyaWFibGVzCj4+IGNtLT5jaGFubmVsWzBdLnJ1bm5pbmcgYW5k
IGNtLT5jaGFubmVsWzFdLnJ1bm5pbmcgYXJlIHJlYWQgd2l0aCBob2xkaW5nCj4+IHRoZSBzcGlu
bG9jayBjbS0+cmVnX2xvY2suCj4+Cj4+IFRoaXMgZGF0YSByYWNlIGlzIGZvdW5kIGJ5IHRoZSBy
dW50aW1lIHRlc3Rpbmcgb2Ygb3VyIHRvb2wgRElMUC0yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
aWEtSnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21haWwuY29tPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
Lgo+Cj4gVGhhdCdzIGluZGVlZCBhIGtpbmQgb2YgcmFjZSwgYnV0IHRoaXMgY2hhbmdlIHdvbid0
IGZpeCBhbnl0aGluZyBpbgo+IHByYWN0aWNlLCB0aG91Z2guICBUaGUgaW5jb25zaXN0ZW50IHJ1
bm5pbmcgZmxhZyBiZXR3ZWVuIHRob3NlIHBsYWNlcywKPiB0aGVyZSBhcmUgdHdvIGNhc2VzOgo+
Cj4gLSBydW5uaW5nIGJlY2FtZSAwIHRvIDE7IHRoaXMgY2Fubm90IGhhcHBlbiwgYXMgdGhlIGly
cSBpc24ndCBpc3N1ZWQKPiAgICBiZWZvcmUgdGhlIHN0cmVhbSBnZXRzIHN0YXJ0ZWQKPgo+IC0g
cnVubmluZyBiZWNhbWUgMSB0byAwOyB0aGlzIG1lYW5zIHRoYXQgdGhlIHN0cmVhbSBnZXRzIHN0
b3BwZWQKPiAgICBiZXR3ZWVuIHR3byBwb2ludHMsIGFuZCBpdCdzIG5vdCBiZXR0ZXIgdG8gY2Fs
bAo+ICAgIHNuZF9wY21fcGVyaW9kX2VsYXBzZWQoKSBmb3IgYW4gYWxyZWFkeSBzdG9wcGVkIHN0
cmVhbS4KClRoYW5rcyBmb3IgdGhlIHJlcGx5IDopCgpJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3Rh
bmQgeW91ciB3b3Jkcy4KCkRvIHlvdSBtZWFuIHRoYXQgdGhpcyBjb2RlIHNob3VsZCBiZSBhbHNv
IHByb3RlY3RlZCBieSB0aGUgc3BpbmxvY2s/CiDCoMKgwqAgaWYgKGNtLT5wY20pIHsKIMKgwqDC
oCDCoMKgwqAgaWYgKChzdGF0dXMgJiBDTV9DSElOVDApICYmIGNtLT5jaGFubmVsWzBdLnJ1bm5p
bmcpCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBzbmRfcGNtX3BlcmlvZF9lbGFwc2VkKGNtLT5jaGFu
bmVsWzBdLnN1YnN0cmVhbSk7CiDCoMKgwqAgwqDCoMKgIGlmICgoc3RhdHVzICYgQ01fQ0hJTlQx
KSAmJiBjbS0+Y2hhbm5lbFsxXS5ydW5uaW5nKQogwqDCoMKgIMKgwqDCoCDCoMKgwqAgc25kX3Bj
bV9wZXJpb2RfZWxhcHNlZChjbS0+Y2hhbm5lbFsxXS5zdWJzdHJlYW0pOwogwqDCoMKgIH0KCgpC
ZXN0IHdpc2hlcywKSmlhLUp1IEJhaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
