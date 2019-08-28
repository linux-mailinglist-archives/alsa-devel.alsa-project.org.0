Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F8A1CE5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD14C16A9;
	Thu, 29 Aug 2019 16:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD14C16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089318;
	bh=/2hKo8NrQKdRR//cFYr2BnVKwbp8GpUj/M7bpvnhae4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clFkSqjUy2GutoEwy7Qgg8tDgwxHlset3WMZpSwNsWobSIxGn5V5sWiUhbYqSHbzt
	 6kzOeGEUKnm5sdrXloOrwN3KUt3v/vJSg453BXFaWmsnWHGJo/2FFNwHReCfLX/q5H
	 O6A7T3ZY9RYto9lHKW0I2uqAcWM5uF/HnEMvgTPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3FBF8980B;
	Thu, 29 Aug 2019 00:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEF85F89809; Thu, 29 Aug 2019 00:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF531F89807
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 00:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF531F89807
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="apGZ0790"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T68LB0FXO/suGbld1wN+JgjhePzUkb8K5QqC/l1w5Tc=; b=apGZ0790F2Byb5ula3d4xEfxr
 vCjo6bsgtwe4WgjOKnRvMWgsodT4X3lpKavbp9MiQzkPtDOnTFrchnEeMdw+Vx2MIZVjEEf23oowl
 DISybElP+QbxZq7nPWML9lidFMVgoH+7M0GKhghLYX0bbTSUmsJ+jH6WgG8AuU9AvAXrOLr0jI1/e
 WE1nOt7XvbJU0oergHsoRQgLPB0QgAPECF2R7WGoZVRCeqVMSpJ0Mgvf6TC7br7r2Ol7mgHVQbUN3
 otmWsubVT7rRRfi3SVZFpXRx46nTGP4EJ5bmQ4Z9G1u7FCzA9cXDCMJ8guvpQvsbdeoS0UMJdrCOU
 sv/Vl4I4A==;
Received: from [2601:1c0:6200:6e8::4f71]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i36uA-00017t-VK; Wed, 28 Aug 2019 22:59:07 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <20190828034012.sBvm81sYK%akpm@linux-foundation.org>
 <274054ef-8611-2661-9e67-4aabae5a7728@infradead.org>
 <5ac8a7a7-a9b4-89a5-e0a6-7c97ec1fabc6@linux.intel.com>
 <98ada795-4700-7fcc-6d14-fcc1ab25d509@infradead.org>
 <f0a62b08-cba9-d944-5792-8eac0ea39df1@linux.intel.com>
 <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4725bbed-81e1-9724-b51c-47eba8e414d0@infradead.org>
Date: Wed, 28 Aug 2019 15:59:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] mmotm 2019-08-27-20-39 uploaded
	(sound/hda/intel-nhlt.c)
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

T24gOC8yOC8xOSAzOjQ1IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4+PiBJ
IGp1c3QgY2hlY2tlZCB3aXRoIE1hcmsgQnJvd24ncyBmb3ItbmV4dCB0cmVlIDhhY2VmZmEwOWI0
Yjk4NjcxNTNiZmUwZmY2ZjQwNTE3MjQwY2VlMTIKPj4+PiBhbmQgdGhpbmdzIGFyZSBmaW5lIGlu
IGkzODYgbW9kZSwgc2VlIGJlbG93Lgo+Pj4+Cj4+Pj4gbmV4dC0yMDE5MDgyOCBhbHNvIHdvcmtz
IGZpbmUgZm9yIG1lIGluIGkzODYgbW9kZS4KPj4+Pgo+Pj4+IGlmIHlvdSBjYW4gcG9pbnQgbWUg
dG8gYSB0cmVlIGFuZCBjb25maWd1cmF0aW9uIHRoYXQgZG9uJ3Qgd29yayBJJ2xsIGxvb2sgaW50
byB0aGlzLCBJJ2QgbmVlZCBtb3JlIGluZm8gdG8gcHJvZ3Jlc3MuCj4+Pgo+Pj4gUGxlYXNlIHRy
eSB0aGUgYXR0YWNoZWQgcmFuZGNvbmZpZyBmaWxlLgo+Pj4KPj4+IFRoYW5rcyBmb3IgbG9va2lu
Zy4KPj4KPj4gQWNrLCBJIHNlZSBzb21lIGVycm9ycyBhcyB3ZWxsIHdpdGggdGhpcyBjb25maWcu
IExpa2VseSBhIG1pc3NpbmcgZGVwZW5kZW5jeSBzb21ld2hlcmUsIHdvcmtpbmcgb24gdGhpcyBu
b3cuCj4gCj4gTXkgYmFkLCBJIGFkZGVkIGEgZmFsbGJhY2sgd2l0aCBzdGF0aWMgaW5saW5lIGZ1
bmN0aW9ucyBpbiB0aGUgLmggZmlsZSB3aGVuIEFDUEkgaXMgbm90IGRlZmluZWQsIGJ1dCB0aGUg
LmMgZmlsZSB3YXMgc3RpbGwgY29tcGlsZWQuCj4gCj4gVGhlIGRpZmYgYmVsb3cgbWFrZXMgbmV4
dC0yMDE5MDgyOCBjb21waWxlIHdpdGggUmFuZHkncyBjb25maWcuCj4gCj4gSXQgbG9va3MgbGlr
ZSB0aGUgYWxzYS1kZXZlbCBzZXJ2ZXIgaXMgZG93biBidHc/Cj4gCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL2hkYS9NYWtlZmlsZSBiL3NvdW5kL2hkYS9NYWtlZmlsZQo+IGluZGV4IDg1NjBmNmVmMWIx
OS4uYjNhZjA3MWNlMDZiIDEwMDY0NAo+IC0tLSBhL3NvdW5kL2hkYS9NYWtlZmlsZQo+ICsrKyBi
L3NvdW5kL2hkYS9NYWtlZmlsZQo+IEBAIC0xNCw1ICsxNCw3IEBAIG9iai0kKENPTkZJR19TTkRf
SERBX0NPUkUpICs9IHNuZC1oZGEtY29yZS5vCj4gwqAjZXh0ZW5kZWQgaGRhCj4gwqBvYmotJChD
T05GSUdfU05EX0hEQV9FWFRfQ09SRSkgKz0gZXh0Lwo+IAo+ICtpZmRlZiBDT05GSUdfQUNQSQo+
IMKgc25kLWludGVsLW5obHQtb2JqcyA6PSBpbnRlbC1uaGx0Lm8KPiDCoG9iai0kKENPTkZJR19T
TkRfSU5URUxfTkhMVCkgKz0gc25kLWludGVsLW5obHQubwo+ICtlbmRpZgo+IAoKd29ya3MgZm9y
IG1lLiAgVGhhbmtzLgpBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+ICMgYnVpbGQtdGVzdGVkCgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
