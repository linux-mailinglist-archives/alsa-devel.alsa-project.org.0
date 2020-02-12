Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4715A8D2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 13:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE58167A;
	Wed, 12 Feb 2020 13:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE58167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581509390;
	bh=FJWMU1z6SXBYCYwlDgvOLTHs/F2IEYg/cIZSvor8YmA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dn0UQvdtM09h8mwzd1pKiuYRkay/hijICXEWciXBzo/x+yOjVk/wgTa6jsKGeUxvi
	 sqv/JjtacpvgUbe4hFCh5Z0XtZJP7GrCmeQ91GQ34EnGSLdGNuNzIXWEtJ0iZsjIwx
	 BOKsni4hHOL1rADZQA9jT1/w9b/KBfqnhl8mPeuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 939B8F80158;
	Wed, 12 Feb 2020 13:08:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C6BF80125; Wed, 12 Feb 2020 13:08:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3832EF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 13:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3832EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="nqRz0MyG"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 466BDD006F9;
 Wed, 12 Feb 2020 12:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deXudkH907vE; Wed, 12 Feb 2020 07:07:56 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 83312D00693;
 Wed, 12 Feb 2020 07:07:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 83312D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581509276;
 bh=X01imo3rNxuo1cF/d14QGPIrzjN/5R3N1tchGdwIcuM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nqRz0MyG1yj3DNcgdIf2qJfu1oOkEQn7Ym3BuVi5yhlRzpQQPtL2jW93ZI/8XnaQ5
 0bW0hvRbhDsG4mbB20QDLJ1/y0hq+puU4mrVmkUsBcdr5vIkxnwTVaxXlVwJVwZd3X
 jA0EUmFJmqQNNUYc0zU07mVp7isl1EeaMGKNqWwI=
MIME-Version: 1.0
Date: Wed, 12 Feb 2020 07:07:56 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
 <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
 <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
 <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <d4e16b7944adbd8859c8287673da3417@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe
 pcm dt binding documentation
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

T24gMjAyMC0wMi0xMiAwNjo0MywgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiBPbiAxMi8w
Mi8yMDIwIDExOjAxLCBBZGFtIFNlcmJpbnNraSB3cm90ZToKPj4+PiAKPj4+PiArCj4+Pj4gKyAt
IHFjb20scGNtLXNsb3QtbWFwcGluZwo+Pj4+ICvCoMKgwqAgVXNhZ2U6IHJlcXVpcmVkIGZvciBw
Y20gaW50ZXJmYWNlCj4+PiAKPj4+IEFyZSB0aGVzZSBub3Qgc3BlY2lmaWMgdG8gOGsgYW5kIDE2
ayBtb2RlID8KPj4+IFdlIHNob3VsZCBwcm9iYWJseSBsaXN0IHZhbHVlcyBmb3IgYm90aCBtb2Rl
cyBoZXJlLgo+PiAKPj4gTm8sIHRoaXMgaXMganVzdCB0aGUgb2Zmc2V0IHRoYXQgdGhlIGF1ZGlv
IHNhbXBsZSBpcyBwbGFjZWQgaW4gd2l0aCAKPj4gcmVzcGVjdCB0byBhIG1heGltdW0gb2YgNCBz
bG90cywgMTYgYml0cyB3aWRlLCBiZWdpbm5pbmcgd2l0aCB0aGUgc3luYyAKPj4gcHVsc2UuCj4g
Cj4gCj4gVGhhdCdzIG5vdCB0cnVlIGF0bGVhc3QgYnkgdGhlIFFEU1AgZG9jdW1lbnRhdGlvbiwK
PiBhY2NvcmRpbmcgdG8gaXQgd2Ugd2lsbCB1c2UgbW9yZSBzbG90cyB0byB0cmFuc2ZlciBhdCBo
aWdoZXIgc2FtcGxlIAo+IHJhdGUuIGV4Ogo+IDE2IGtIeiBkYXRhIGNhbiBiZSB0cmFuc2ZlcnJl
ZCB1c2luZyA4IGtIeiBzYW1wbGVzIGluIHR3bwo+IHNsb3RzLgo+IAo+IEFsc28gdGhlcmUgYXJl
IDMyIHNsb3RzIGZvciBlYWNoIG9mIDQgc3VwcG9ydGVkIGNoYW5uZWxzIGZvciBQQ00gQUZFIAo+
IHBvcnQuCgpPaywgaWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIGl0IHNvdW5kcyBsaWtlIHNvbWVv
bmUgZWxzZSBpcyBnb2luZyB0byAKaGF2ZSB0byBpbXBsZW1lbnQgaXQuIEkgaGF2ZSBubyB3YXkg
dG8gdGVzdCB0aGF0IGtpbmQgb2YgYSAKY29uZmlndXJhdGlvbiwgc28gYXR0ZW1wdGluZyB0byBp
bXBsZW1lbnQgaXQgd291bGQgYmUgZnV0aWxlLgoKPiAKPiAKPj4gCj4+IFdoZW4gc3dpdGNoaW5n
IGJldHdlZW4gOCBhbmQgMTZrIHNhbXBsZSByYXRlLCBpdCBpcyBqdXN0IHRoZSBzeW5jIAo+PiBw
dWxzZSByYXRlIHRoYXQgaXMgY2hhbmdlZC4gVGhlIGF1ZGlvIHNhbXBsZSB3aWxsIGJlIGRlbGl2
ZXJlZCBpbiB0aGUgCj4+IHNhbWUgc2xvdCwganVzdCBhdCBhIGRpZmZlcmVudCBmcmVxdWVuY3ku
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
