Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB253D5BD6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 09:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14DC21666;
	Mon, 14 Oct 2019 09:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14DC21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571036712;
	bh=BBJ9J08HMvWeM0F6mKqUlZdTt//iok0B21DWvrB4pZU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTUJlB4lw73vd5r2Up/gEgWIwAyqW30jgztladobPbnMNI5uKEQN7c2ocRwyOIB9F
	 q95l8K3zX5sCos+Dik07PeM4kftdvA0/KRQKgK0csm5XSVxL0ryPm6E2E/li+cxzTs
	 SGGGaTg2MuN7cqamjHYnvclyo7EJ6jYZtDYSqy9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72290F80322;
	Mon, 14 Oct 2019 09:03:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A90F80362; Mon, 14 Oct 2019 09:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17260F8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 09:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17260F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QclHqXW6"
Received: by mail-wr1-x441.google.com with SMTP id y19so18297409wrd.3
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=kARX9+0BKAD7qk3BjARPSF4hECeeh6Sx7CLH7T+oTb0=;
 b=QclHqXW6ZKzWj9AvwDjjpURbYYwL2ehXvGg3U3vqXoz2YaRjsROg0JGyTwNk9g54Zv
 i3LukqN94drT2bwK8oQISHzBug4ZZWS4VT9Qn1fuzrxXgFZTgCki5XLSh/Cj0ateWNpx
 ffCsL9UWjm+ECWErvYzruTNMykHx639hORyyVVYP3O4vrFdFh27UZikVmP8b5xOE/b/I
 Tksm6CH991VoJXwUi1GbASr/4TIHNxj5jwv7g1Cu512PvGVfxwESX+puUNCe5+WtXIZs
 i7lDirHUD87ahyjWEqfbY+NoRne58RmejCjpyTnOAa/PBCJDtIGBf7vrS6ZRu+q0G2me
 JG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kARX9+0BKAD7qk3BjARPSF4hECeeh6Sx7CLH7T+oTb0=;
 b=G7svXPfkoYGyfeMyJhIw0PPKYHDBDs33prMbipf/A+kJbd4vsk3I1sbn+IHViPcuHD
 uo8S7S6qSCK0JlHh9djW2eieB0XVFLnI0Urj/9Mebjo3p/jNp50llQ/QkX500OZa2LZ2
 WJyG5PlVNqZzdvh9seN89wwKa4qIDNTE4O9MezXQRxuHo+In3lbGgMuyDi/HMKr0L0xK
 Hope3VBj6cR8/E0HKBhzBofQ7ekGpDLL6kGFDNdyFy1jlKBBTcqHwM/o99cFdqwYJ4OM
 vNMcoMR+Zy1gt+R2IJiNKjt8ioIM++jhmzBbj4YOsbs6DtDypVjvvil/9h4r2csEnwLB
 YusA==
X-Gm-Message-State: APjAAAX9Rx8sfr0SOh+tr2RpFaJF7bHMsDB0WCvdAnMR/NMP+ZT7QnX+
 01MJUNpxrN0yBLNdqbsClqofhA==
X-Google-Smtp-Source: APXvYqzYx84rDsCIL+mfTwQbJ8TVHerC4FF8I0+AOYTGhsCPHzwLJ/Hj+UoebQyNvEYHO7chm9im1w==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr8881658wro.253.1571036601043; 
 Mon, 14 Oct 2019 00:03:21 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id g185sm23439606wme.10.2019.10.14.00.03.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:03:20 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:03:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191014070318.GC4545@dell>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell>
 <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002123759.GD11769@dell>
 <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002133553.GA21172@dell>
 <DM6PR12MB3868561CDEEF9D21940E8F57E7940@DM6PR12MB3868.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR12MB3868561CDEEF9D21940E8F57E7940@DM6PR12MB3868.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

T24gVGh1LCAxMCBPY3QgMjAxOSwgUkFWVUxBUEFUSSwgVklTSE5VIFZBUkRIQU4gUkFPIHdyb3Rl
OgoKPiBIaSBMZWUsCj4gCj4gV2UgaGF2ZSB0d28gaW5zdGFuY2VzIEJUIGFuZCBJMlMuCj4gV2Ug
bmVlZCB0byBjcmVhdGUgZGV2aWNlcyB3aXRoIHNhbWUgbmFtZSBhZGRlZCB3aXRoIG51bWJlciBv
ZiBkZXZpY2UKPiBsaWtlIGV4YW1wbGU6Cj4gYWNwM3hfaTJzX3BsYXljYXAuMS5hdXRvPGh0dHA6
Ly8xLmF1dG8+Cj4gYWNwM3hfaTJzX3BsYXljYXAuMi5hdXRvPGh0dHA6Ly8yLmF1dG8+Cj4gCj4g
YnkgdXNpbmcgTUZEIHdlIGNhbiBtYWtlIGl0IGhhcHBlbiBhdXRvbWF0aWNhbGx5IGJ5IGdpdmlu
Zwo+ICJhY3AzeF9pMnNfcGxheWNhcCIgYW5kIG90aGVyIGV4dGVuc2lvbiB3aWxsIGJlIGFkZGVk
IGJ5IE1GRCBhZGQgZGV2aWNlIEFQSS4KClRoZSBhdXRvIGV4dGVuc2lvbiBpcyBoYW5kZWQgYnkg
dGhlIHBsYXRmb3JtX2RlaXZjZV9hbGxvYygpIEFQSS4KCiAgcGxhdGZvcm1fZGV2aWNlX2FsbG9j
KCJhY3AzeF9pMnNfcGxheWNhcCIsIFBMQVRGT1JNX0RFVklEX0FVVE8pOwoKPiBUaGlzIGhlbHBz
IHVzIGJ5IHJlY3RpZnlpbmcgdGhlIHJlbmFtaW5nIGlzc3VlIHdoaWNoIHdlIGdldCBieSB1c2lu
Zwo+IFBsYXRmb3JtX2Rldl9jcmVhdGUgQVBJYHMuSWYgd2UgaGF2ZSB0byB1c2UgcGxhdGZvcm0g
cmVsYXRlZCBBUElzIHRoZW4KPiB3ZSBuZWVkIHRvIGdpdmUgZGlmZmVyZW50IG5hbWluZyBjb252
ZW50aW9ucyB3aGlsZSBjcmVhdGluZyB0aGUgZGV2aWNlcwo+IGFuZCBjYW50IHVzZSBpdCBpbiBs
b29wIGFzIHdlIGhhdmUgMyBkZXZpY2VzIHdlIG5lZWQgdG8gY2FsbCB0aHJlZQo+IGV4cGxpY2l0
bHkuVGhpcyBtYWtlIG91ciBjb2RlIGxlbmd0aHkuCj4gSWYgd2UgdXNlIE1GRCBpdCB3b3VsZCBo
ZWxwIHVzIGEgbG90Lgo+IAo+IFBsZWFzZSBzdWdnZXN0IHVzIGhvdyBjYW4gd2UgcHJvY2VlZC4K
CllvdSBoYXZlIDIgY2hvaWNlcyBhdmFpbGFibGUgdG8geW91IGJhc2VkIG9uIHdoZXRoZXIgeW91
ciBkZXZpY2UgaXMgYW4KTUZEIG9yIG5vdDoKCklmIHllcywgbW92ZSBpdCAob3IgYSBwYXJ0IG9m
IGl0KSB0byBkcml2ZXJzL21mZC4KSWYgbm8sIHRoZW4gdXNlIHRoZSBwbGF0Zm9ybV9kZXZpY2Vf
KigpIEFQSS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
