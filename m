Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66024125A5E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 05:58:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E1D886;
	Thu, 19 Dec 2019 05:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E1D886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576731481;
	bh=ZTH0VJsYKLDq+h5vfP2bVNy2IAbRjYBHWt4f+WdRGTA=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxbr+h+8EErcAeJb1NQQg4sqno05W2TqxHKi+rsPlUSUvwvz8oS+HP9nz0nvklocS
	 26lTcjnljXrht3GqN+lPi/i/RNDNBIMPKyNZH5NXTI7XZEiT8ImLP56SaXkOZWqvW/
	 5qUE2f8naod19BCe2cQrb47sCVHrA0qhWhaYv6GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF06F80253;
	Thu, 19 Dec 2019 05:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E174DF80234; Thu, 19 Dec 2019 05:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EF60F80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 05:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF60F80059
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ihnqB-0007EC-Jx
 for alsa-devel@alsa-project.org; Thu, 19 Dec 2019 04:55:11 +0000
Received: by mail-pf1-f198.google.com with SMTP id c23so2885381pfn.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 20:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/VKKwmKsPBYOgr+iqOChYYLsvE4o33pA/uIS+AV6hnE=;
 b=tuxQrtD4lLkAbte1Uc3Zti5NGpFfvCxEG3srY/Iozr74hsEec5pMuEN+C2kjAioZpD
 mG2/M8nMjLfhJNPZku9Nysrc6GYsfoEmFLMMhfav0pHaEJdIRlAKO3qo8AziyNsj2XBh
 TFamou6qhwPS77OtIqEZncJh+fUKMgSANpRLRQbIumRSJE9ddqFP0YJqd1r0SKzjkKYm
 nlQKAwbnEf5ii4FZu5VupMf+5111z7EkjmyfvhVhpBE9v9SwxO4HeAglq04alwNbj092
 sJmsxgrDIRh/OnZSrDoj/hj28h1iRJOvXFp6EVPeKObvS8ABOYWp+qiJbmD4tbj2EwjI
 Q8ZQ==
X-Gm-Message-State: APjAAAWuru7J7uhXODoyulUCIQP67KrXtDN5LZ38aOipxYFriDpV5goc
 n8asXRJ8YLaT9t7VVVtdyDss+IvfusyN7ri2TqWtoVOOd3n6/Mffi/0XeEZy/NeL1kQQ22s4Cp8
 4FS6FWIdcWNPhAgiq+BRlYyQ6zC9B7QPh92isUpGa
X-Received: by 2002:a63:5f45:: with SMTP id t66mr6877197pgb.198.1576731309812; 
 Wed, 18 Dec 2019 20:55:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyU2hN6HO0OvgyCME+IJ17gZDg1VObGwiuTsetBU8YgylXozI3taVml/58e7JyIRGp982vKYg==
X-Received: by 2002:a63:5f45:: with SMTP id t66mr6877154pgb.198.1576731309291; 
 Wed, 18 Dec 2019 20:55:09 -0800 (PST)
Received: from [10.101.46.91] (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id p4sm5846716pfb.157.2019.12.18.20.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 20:55:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hlfr9zc67.wl-tiwai@suse.de>
Date: Thu, 19 Dec 2019 12:55:05 +0800
Message-Id: <EB061C4E-72BE-491B-ABAE-DFB96BEB7D7C@canonical.com>
References: <20191218132650.6303-1-hui.wang@canonical.com>
 <s5hlfr9zc67.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3594.4.19)
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: set the interface format
 after resume on Dell WD19
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

SGkgSHVpIGFuZCBUYWthc2hpLAoKPiBPbiBEZWMgMTksIDIwMTksIGF0IDM6MDYgQU0sIFRha2Fz
aGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4gd3JvdGU6Cj4gCj4gT24gV2VkLCAxOCBEZWMgMjAxOSAx
NDoyNjo1MCArMDEwMCwKPiBIdWkgV2FuZyB3cm90ZToKPj4gCj4+IFJlY2VudGx5IHdlIGZvdW5k
IHRoZSBoZWFkc2V0LW1pYyBvbiB0aGUgRGVsbCBEb2NrIFdEMTkgZG9lc24ndCB3b3JrCj4+IGFu
eW1vcmUgYWZ0ZXIgczMgKHMyaSBvciBkZWVwKSwgdGhpcyBwcm9ibGVtIGNvdWxkIGJlIHdvcmth
cm91bmRlZCBieQo+PiBjbG9zZWluZyAocGNtX2Nsb3NlKSB0aGUgYXBwIGFuZCB0aGVuIHJlb3Bl
bmluZyAocGNtX29wZW4pIHRoZSBhcHAsIHNvCj4+IHRoaXMgYnVnIGlzIG5vdCBlYXN5IHRvIGJl
IGRldGVjdGVkIGJ5IHVzZXJzLgo+PiAKPj4gV2hlbiBwcm9ibGVtIGhhcHBlbnMsIHJldGlyZV9j
YXB0dXJlX3VyYigpIGNvdWxkIHN0aWxsIGJlIGNhbGxlZAo+PiBwZXJpb2RpY2FsbHksIGJ1dCB0
aGUgc2l6ZSBvZiBjYXB0dXJlZCBkYXRhIGlzIGFsd2F5cyAwLCBpdCBjb3VsZCBiZQo+PiBhIGZp
cm13YXJlIGJ1ZyBvbiB0aGUgZG9jay4gQW55d2F5IEkgZm91bmQgYWZ0ZXIgcmVzdW1pbmcsIHRo
ZQo+PiBzbmRfdXNiX3BjbV9wcmVwYXJlKCkgd2lsbCBiZSBjYWxsZWQsIGFuZCBpZiB3ZSBmb3Jj
aWJseSBydW4KPj4gc2V0X2Zvcm1hdCgpIHRvIHNldCB0aGUgaW50ZXJmYWNlIGFuZCBpdHMgZW5k
cG9pbnQsIHRoZSBjYXB0dXJlCj4+IHNpemUgd2lsbCBiZSBub3JtYWwgYWdhaW4uIFRoaXMgcHJv
YmxlbSBhbmQgd29ya2FvdW5kIGFsc28gYXBwbHkgdG8KPj4gcGxheWJhY2suCj4+IAo+PiBUbyBm
aXggaXQgaW4gdGhlIGtlcm5lbCwgYWRkIGEgcXVpcmsgdG8gbGV0IHNldF9mb3JtYXQoKSBydW4K
Pj4gZm9yY2libHkgb25jZSBhZnRlciByZXN1bWUuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBIdWkg
V2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGFua3MsIHRoZSB3b3JrYXJvdW5k
IGxvb2tzIHJlYXNvbmFibGUuCj4gSSBhcHBsaWVkIGl0IG5vdyB3aXRoIENjIHRvIHN0YWJsZS4K
CkkgYW0gbm90IGVudGlyZWx5IHN1cmUgaXTigJlzIGEga2VybmVsIGJ1Zy4gWzFdIFsyXSBjYW4g
YWxzbyBmaXggdGhlIGlzc3VlLgoKU2luY2UgVVNCIGF1ZGlvIGRvZXNu4oCZdCBoYXZlIFNORFJW
X1BDTV9JTkZPX1JFU1VNRSBjYXBhYmlsaXR5LAp1c2Vyc3BhY2Ugc2hvdWxkbuKAmXQgdHJ5IHRv
IHVzZSBzbmRfcGNtX3Jlc3VtZSgpLiBDb21taXQgWzFdIHVzZXMgCnNuZF9wY21fZHJvcCgpIHRv
IG1ha2UgdGhlIGRldmljZSBsZWF2ZSBzdXNwZW5kZWQgc3RhdGUgYW5kIHRoZSBkZXZpY2UKYmVo
YXZlcyBjb3JyZWN0bHkgd2l0aCB0aGUgZml4LgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vY29tbWl0L2Y3YjM1MzdiYmY5YTY5MTZlZTNm
ZDcyYTgyMDI1NTE5YjRjMzQ2ZjUKWzJdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9w
dWxzZWF1ZGlvL3B1bHNlYXVkaW8vY29tbWl0LzczNGEwMGM4NDk4MTVhNDU2OTc5NzBkNTkzMDY4
YzMwMWEwNGViYmIKCkthaS1IZW5nCgo+IAo+IAo+IFRha2FzaGkKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
