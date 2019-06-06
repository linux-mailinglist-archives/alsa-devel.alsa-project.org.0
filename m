Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE0372CE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657351662;
	Thu,  6 Jun 2019 13:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657351662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559820466;
	bh=XuBAPF9N5TtyLgAiWbmmyC/w7RAQMDBclzcPm7xoXKg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mu+TUbvCom69uJPYOlC+oqleo111qaSopLkuoqPJ/rFXHd2Z2RQ/7bW8cY90VHOG6
	 wcBmvj9TxVyA7emA2/bC7gTDBCpvXCGiYreXHUEpIFC83XrTE0/cIvNXyx2Mby5/GK
	 bzSf6BL8Sryeb+/83/+U1ZaucXZUBfqGMw7fDXzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A27F896EF;
	Thu,  6 Jun 2019 13:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72975F896EF; Thu,  6 Jun 2019 13:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0953EF80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0953EF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PfJA17hV"
Received: by mail-qt1-x842.google.com with SMTP id z24so2101703qtj.10
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5dNsy9b7wSo0PojyEFmG8hPYvRxvl4pE0j/UUGtnkT4=;
 b=PfJA17hV5DxfAedjpGZ9hI2xgFiAXw5rZ2cDbI2LVufOOBGUWNCzM9PTOgW38P91bX
 Hhd+Z1cV3gDc61Vn0HObvmU5cRH13KhcUe+YRqDR3SVM2MQWSfiKxZYRy/uhJEvdabg2
 FPbzUW8FX8oKwH86dsxSySwjPkeDO08FFqXPNIDdceu7+Mzzxkp5gvMRebpB9fVHPUYB
 Gt4Ur2wu4pxXwF3qTEGZh2VRlsOWpQtwFzWQiQsOmfvWlwMoC4X59eBPca9s69or1aNs
 1wkM3xuSIZizUSxijaHtZgxJCcpqBm/Ec+EJzJFQPaWIhxqR8a13wrwkZrjTy74DXFaK
 cT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5dNsy9b7wSo0PojyEFmG8hPYvRxvl4pE0j/UUGtnkT4=;
 b=XuMaSKfTB8Ta1bdBzgisH+AmVrgWKOzf8rcxpwR7GSQ9alnQZKNMgsCtTNUgxfoAcD
 cXyS548FH+CKZ2HrLySpXTQUoOIXHDSD+LTSESfOtvpNEIVSFHRLLqBNwCnbvRyvQ1G0
 HhAS5rp9XxNfRetAgT9Xdy2KrzFimIHRfslqslzd2IXU0IDcS6oDFFfJbNDHrCP0SZOJ
 s6p5QV++1xouKMA094qgaSLh0uQjexHIhY6k89Rhu5A8KppBlSw1I1ks2shrMHMUxebl
 QDCIuRC/8ZkiuWjx4NlEWFj5Dr2aA5i3xKR0KqGe7ULAfSMbKXWeKwllp5uV7sWFOFtE
 eiLQ==
X-Gm-Message-State: APjAAAX67AYq8plP0maDQ8KMNIy07+syZWWj5bIpDy72Dw6lpZZeKKYa
 qsEEnKPz14RAtuCbUrhHfQyuyg6FzHik8Axvgbw=
X-Google-Smtp-Source: APXvYqxI4DVrPMjWmEMhMewy/0MU4rt1SR7d41hBlwI1sK4buOiQ0PwUYfkjIRaPn7qU9VQJcA8j/66jTPavg7CNUJs=
X-Received: by 2002:a0c:d163:: with SMTP id c32mr39262393qvh.139.1559820352349; 
 Thu, 06 Jun 2019 04:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190603183401.151408-1-gwendal@chromium.org>
 <20190604055908.GA4797@dell>
In-Reply-To: <20190604055908.GA4797@dell>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 6 Jun 2019 13:25:40 +0200
Message-ID: <CAFqH_51gMu81f=VFQaF4u9-tAWDMocGAwM_fOPT3Cctv6KWniw@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 fabien.lahoudere@collabora.com, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [RESEND PATCH v3 00/30] Update cros_ec_commands.h
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

SGkgTGVlLAoKTWlzc2F0Z2UgZGUgTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gZGVs
IGRpYSBkdC4sIDQgZGUganVueQoyMDE5IGEgbGVzIDg6MDA6Cj4KPiBPbiBNb24sIDAzIEp1biAy
MDE5LCBHd2VuZGFsIEdyaWdub3Ugd3JvdGU6Cj4KPiA+IFRoZSBpbnRlcmZhY2UgYmV0d2VlbiBD
cm9zRUMgZW1iZWRkZWQgY29udHJvbGxlciBhbmQgdGhlIGhvc3QsCj4gPiBkZXNjcmliZWQgYnkg
Y3Jvc19lY19jb21tYW5kcy5oLCBhcyBkaXZlcmdlZCBmcm9tIHdoYXQgdGhlIGVtYmVkZGVkCj4g
PiBjb250cm9sbGVyIHJlYWxseSBzdXBwb3J0Lgo+ID4KPiA+IFRoZSBzb3VyY2Ugb2YgdGhydXRo
IGlzIGF0Cj4gPiBodHRwczovL2Nocm9taXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy9w
bGF0Zm9ybS9lYy8rL21hc3Rlci9pbmNsdWRlL2VjX2NvbW1hbmRzLmgKPiA+Cj4gPiBUaGF0IGlu
Y2x1ZGUgZmlsZSBpcyBjb252ZXJ0ZWQgdG8gcmVtb3ZlIEFDUEkgYW5kIEVtYmVkZGVkIG9ubHkg
Y29kZS4KPiA+Cj4gPiBGcm9tIG5vdyBvbiwgY3Jvc19lY19jb21tYW5kcy5oIHdpbGwgYmUgYXV0
b21hdGljYWxseSBnZW5lcmF0ZWQgZnJvbQo+ID4gdGhlIGZpbGUgYWJvdmUsIGRvIG5vdCBtb2Rp
ZnkgZGlyZWN0bHkuCj4gPgo+ID4gRmVsbCBmcmVlIHRvIHNxdWFzaCB0aGUgY29tbWl0cyBiZWxv
dy4KPiA+Cj4gPiB2MyByZXNlbnQ6IEFkZCBGYWJpZW4ncyBhY2suCj4KPiBUaGFua3MgZm9yIGRv
aW5nIHRoYXQuCj4KPiBJbiBmdXR1cmUsIHBsZWFzZSBlbnN1cmUgKi1ieXMgdGFncyBhcmUgaW4g
Y2hyb25vbG9naWNhbCBvcmRlciB3aXRoCj4gdGhlIGZpcnN0IG9uZSBlaXRoZXIgYmVpbmcgYSBT
dWdnZXN0ZWQtYnkgb3IgeW91ciBTb0IuICBSZXZpZXdzLCB0ZXN0cwo+IGV0YyB1c3VhbGx5IGNv
bWUgKmFmdGVyKiBmaXJzdCBzdWJtaXNzaW9uLgo+Cj4gSSd2ZSBjaGFuZ2VkIHRoaXMgZm9yIHlv
dSB0aGlzIHRpbWUsIHllcyBpbiBhbGwgMzAgcGF0Y2hlcyEgIDopCj4KPiBBbnl3YXksIGFsbCBh
cHBsaWVkLCB0aGFua3MuCj4KCkNvdWxkIHlvdSBkbyBhbiBpbW11dGFibGUgYnJhbmNoIHdpdGgg
dGhvc2U/IEkndmUgZmV3IHBhdGNoZXMgdGhhdApkZXBlbmRzIG9uIHRob3NlIGNoYW5nZXMgYW5k
IHByb2JhYmx5IEknbGwgaGF2ZSBtb3JlLiBPdGhlcndpc2UsIEknbGwKd2FpdCBmb3IgdGhvc2Ug
dG8gbGFuZC4KClRoYW5rcywKIEVucmljCgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4g
TGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
