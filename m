Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06433123E97
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 05:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852D9843;
	Wed, 18 Dec 2019 05:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852D9843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576643914;
	bh=pEugxKehF78k7wxD4xOv98aw8fwh6cxBh8Syj1K3j2A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xauy6lsyay3KKX2nsdCjuxhPKEPO1PoyGhqaIpxfutuRcEYHQ+l8/uyxH+riLciuR
	 5KddsmVqcIaRar5APxk84K2nzjIgjcmHWu3KBVL2gKyliy8cLmt4jcsypwLftQKnAP
	 8y6EnYPtOsLqMYZbvyDQADmWI/2TGbfXKwPzMzLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F4DF8015A;
	Wed, 18 Dec 2019 05:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36024F8022C; Wed, 18 Dec 2019 05:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53361F8014C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 05:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53361F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vvdntech-in.20150623.gappssmtp.com
 header.i=@vvdntech-in.20150623.gappssmtp.com header.b="B8V6XMKn"
Received: by mail-ot1-x32d.google.com with SMTP id f71so789423otf.2
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 20:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vvdntech-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xtf+gbb/JpicuV914Ta4pe0cdPTuO5Ym/ue7qS3Kxew=;
 b=B8V6XMKnEzdZ27Xm/lME4vjYbqV4FVwyJrvgNNkSyhgixIim3wTR6pqw3/h89mru8r
 5xa9FVZM5VggLIju7Jfit2wGc8i6nLBPFOdvlA7+9sLumbv64sHo5x6ZEw1Bh6MZhG1C
 VG6a9e/qLJoAbPJfO1StXBxO5R0wOYJuBzZkMH5vD5XNEE20hZ8GvGVkQmH8elA+u6xw
 rixSifHpiCBuzfEtOYkHJn7DaeAid9bgDhVc7eaMxNZxmDH/Ej2COpPpd/OjK8Dq1fya
 FWD7SRofaN0c0uRKDAJFgz5KXLZlNOyoYPA4MAc+LKT/5fkq40Ctz9OlaPLglJSy2gY6
 S54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xtf+gbb/JpicuV914Ta4pe0cdPTuO5Ym/ue7qS3Kxew=;
 b=MYdQcluQMf7gtLO4M3Wb+/0wSepkR3UIkjphmYUlVa/vAIwFDhwdMlzf8iL4QDCvbd
 A7iZpOxr6aeWtYg1bd06n6b1LhjN1q8a/QDe6iH+AZNX25oYLhDEdZBMLMzeTOB+bc7I
 Ot32nSMPdvpnarMIrI9z0lakYRJsXBDAdeVXv9Qh+V0aLnzdEQAIQADYOthjcaW5CeHE
 nsst3BV4ViQ1MUxRv9zzv+xQAItSvtN0Z2C3qM3+Lr9RQW/Zpd25Fvq1IsZ54pv/JdiA
 1em8tq4OLKQjdZVMnLly/RVPUYmf5X5vdhbEWBZqG2nKnbvfVkSAkwiASjsjgUsT+7Ig
 sGZg==
X-Gm-Message-State: APjAAAVVbJK2LcElq4EMye5F0GEPFxhp2EnPyuXhPp2mgDVm4w+GmJfF
 Y2cxa5EEkxy3iQIBOxkux2JP3P05Elw4OhCHhBR2kYZl3H2XuW3tXrSt8DlZTZZJoNBij1JzSI1
 jDBOGp+whCuJ9UCzarMJyimdYFRq/dA1n
X-Google-Smtp-Source: APXvYqwDimbNLmMuHAj1Ico43NGCcP50egPRWAk30QKaVnaMVUDuQ0cJchL3ECv60WFuEYnxCXQDDCh2suq/UWKmkMs=
X-Received: by 2002:a05:6830:109a:: with SMTP id
 y26mr400799oto.227.1576643801594; 
 Tue, 17 Dec 2019 20:36:41 -0800 (PST)
MIME-Version: 1.0
References: <CAMM7-fe=NAH_tEFsE+RV-eA1KLkhaim_3w4YK3wjqDYea_2TtA@mail.gmail.com>
 <d4f21304-d5b0-5acd-2595-4cb7aa684da3@linux.intel.com>
 <CAMM7-ff0m=VZ-neyjt-7xFUmgD-36rULHbLpuf4=L57-HvRo3Q@mail.gmail.com>
In-Reply-To: <CAMM7-ff0m=VZ-neyjt-7xFUmgD-36rULHbLpuf4=L57-HvRo3Q@mail.gmail.com>
From: Mohan Prasath Ramamoorthy <mohan.prasath@vvdntech.in>
Date: Wed, 18 Dec 2019 10:06:30 +0530
Message-ID: <CAMM7-ffqjDqeXpyTWkfmyc5m0pPLsdT0hBAqYNjO_x5cPMhycA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Playback issue while recording simultaneously
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

SGkgUGllcnJlLUxvdWlzLAoKU2hhbGwgd2UgZ2V0IGFuIHVwZGF0ZSBvbiB0aGlzIGlzc3VlPwoK
T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjoyMCBQTSBNb2hhbiBQcmFzYXRoIFJhbWFtb29ydGh5
IDwKbW9oYW4ucHJhc2F0aEB2dmRudGVjaC5pbj4gd3JvdGU6Cgo+IEhpIFBpZXJyZS1Mb3VpcywK
Pgo+IFRoYW5rIHlvdSBmb3IgeW91ciBxdWljayByZXNwb25zZS4KPgo+IFNoYWxsIEkga25vdyB3
aGF0IGRvZXMgdGhlIGJlbG93IGVycm9yIG1lYW4/Cj4KPiBhcGxheTogcGNtX3dyaXRlOjE5NDA6
IHdyaXRlIGVycm9yOiBJbnB1dC9vdXRwdXQgZXJyb3IKPgo+IE9uIEZyaSwgRGVjIDYsIDIwMTkg
YXQgOToyMSBQTSBQaWVycmUtTG91aXMgQm9zc2FydAo+IDxwaWVycmUtbG91aXMuYm9zc2FydEBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+Cj4gPgo+ID4gT24gMTIvNS8xOSAxMToyMiBQ
TSwgTW9oYW4gUHJhc2F0aCBSYW1hbW9vcnRoeSB3cm90ZToKPiA+ID4gRGVhciBBbGwsCj4gPiA+
Cj4gPiA+IFdlIGFyZSB3b3JraW5nIG9uIGV4dGVybmFsIG1vZHVsZXMgb2YgbWljcm9waG9uZSBh
bmQgc3BlYWtlciBhbmQgd2UKPiA+ID4gYXJlIHVzaW5nIHRoZSBrZXJuZWwgdmVyc2lvbiAzLjEw
Ljk2Cj4gPgo+ID4gd293LCB0aGF0IGlzIG9uZSBhbmNpZW50IGtlcm5lbCBFT0wnZWQgaW4gMjAx
Ny4uLgo+ID4KPiA+ID4KPiA+ID4gV2UgYXJlIHJlY29yZGluZyB3aXRoIGNvbW1hbmRzIGxpa2Ug
YXJlY29yZCBhbmQgYXBsYXkgZm9yIHJlY29yZGluZwo+ID4gPiBhbmQgcGxheWJhY2sgcmVzcGVj
dGl2ZWx5Lgo+ID4gPgo+ID4gPiBXaGlsZSBkb2luZyB0aGUgYmVsb3cgZXhwZXJpbWVudHMgd2Ug
Y291bGQgYWJsZSB0byBvYnNlcnZlIGFuIGlzc3VlIGFzCj4gYmVsb3csCj4gPiA+Cj4gPiA+IDEu
IFdpdGggb25seSByZWNvcmRpbmcgYW5kIG5vdCBwbGF5YmFjayB3ZSBoYXZlbid0IGZhY2VkIGFu
eSBpc3N1ZXMuCj4gPiA+IDIuIFdpdGggb25seSBwbGF5YmFjayBhbmQgbm90IHJlY29yZGluZyB3
ZSBoYXZlbid0IGZhY2VkIGFueSBpc3N1ZXMuCj4gPiA+Cj4gPiA+IDMuIEJ5IHN0YXJ0aW5nIGFu
IGluZmluaXRlIHJlY29yZGluZyBpbiB0aGUgYmFja2dyb3VuZCBhbmQgYnkgZG9pbmcgYQo+ID4g
PiBwbGF5YmFjayBvZiB0aGUgYXVkaW8gZmlsZSgzMHNlY29uZHMsIHRoZSBzYW1wbGluZyByYXRl
IG9mIDIyMDUwLCB0aGUKPiA+ID4gY2hhbm5lbCBpcyBzdGVyZW8pLCBhZnRlciBzb21lIGl0ZXJh
dGlvbnMsIHdlIGFyZSBmYWNpbmcgYSBiZWxvdyBlcnJvcgo+ID4gPiBhbmQgd2UgY291bGQgbm90
IGFibGUgdG8gbGlzdGVuIHRvIHRoZSBhdWRpby4KPiA+ID4KPiA+ID4gRXJyb3I6IGFwbGF5OiBw
Y21fd3JpdGU6MTk0MDogd3JpdGUgZXJyb3I6IElucHV0L291dHB1dCBlcnJvcgo+ID4gPgo+ID4g
PiBCZWxvdyBhcmUgdGhlIHJlc3BlY3RpdmUgY29tbWFuZHMgZm9yIHJlY29yZGluZyBhbmQgcGxh
eWJhY2ssCj4gPiA+Cj4gPiA+IDEuIGFyZWNvcmQgLUQgaHc6MCwwIC1jIDIgLWYgczE2X2xlIC1y
IDgwMDAKPiAvaG9tZS91YnVudHUvbWljX3Rlc3Rpbmcud2F2ICYKPiA+ID4gMi4gYXBsYXkgLUQg
aHc6MCwzIGF1ZGlvXzIya19jMi53YXYKPiA+ID4KPiA+ID4gQnV0IHdoZW4gdGhlIGlzc3VlcyBj
b21lLCB3ZSBqdXN0IHN0b3BwZWQgcmVjb3JkaW5nIGFuZCByZXN0YXJ0ZWQgdGhlCj4gPiA+IHJl
Y29yZGluZyBpbiB0aGUgYmFja2dyb3VuZC4gQWZ0ZXIgdGhpcywgdGhlIHBsYXliYWNrIGlzIHdv
cmtpbmcgZmluZS4KPiA+ID4KPiA+ID4gQWxzbywgZHVyaW5nIHRoZSBpc3N1ZSBjYW1lLCB3ZSBo
YXZlIGNoZWNrZWQgZm9yIHRoZSBiZWxvdyBwcm9wZXJ0aWVzLAo+ID4gPgo+ID4gPiAxLiBJMlMg
aGFzIGJlZW4gZW5hYmxlZC4gQ2hlY2tlZCB1bmRlciB0aGUgZmlsZToKPiA+ID4gL3N5cy9rZXJu
ZWwvZGVidWcvY2xvY2svY2xvY2tfdHJlZQo+ID4gPiAyLiBEcml2ZXIgY2FsbGJhY2tzIGhhdmUg
YmVlbiBjYWxsZWQuIChDaGVja2VkIHdpdGggdGhlIGtlcm5lbAo+IGxvZ3NbZG1lc2ddKQo+ID4g
Pgo+ID4gPiBXZSB3b3VsZCBsaWtlIHRvIGtub3cgdGhlIHJlYXNvbiBiZWhpbmQgdGhpcyBlcnJv
ci4/Cj4gPgo+ID4gU291bmRzIHR5cGljYWwgb2YgYW4gaW50ZXJmZXJlbmNlIGJldHdlZW4gdGhl
IHBsYXliYWNrIGFuZCByZWNvcmQKPiA+IHByb2dyYW1taW5nIGZsb3dzLCBlLmcuIHdoZW4gY2hh
bmdpbmcgYSBzaGFyZWQgcmVnaXN0ZXIuIE5vdCBhbGwgSTJTCj4gPiB0b2xlcmF0ZSBkeW5hbWlj
IGNoYW5nZXMgZnJvbSBSWCBvciBUWCBvbmx5IHRvIGZ1bGwtZHVwbGV4Lgo+Cj4KPgo+IC0tCj4K
PiBXaXRoIEJlc3QgUmVnYXJkcywKPgo+IE1vaGFuIFByYXNhdGgKPgo+IFZWRE4gVGVjaG5vbG9n
aWVzIFB2dCBMdGQKPgo+IENlbGw6ICs5MSA5NjI5NzY4OTE5Cj4KPiBXZWI6IHd3dy52dmRudGVj
aC5jb20KPgoKCi0tIAoKKldpdGggQmVzdCBSZWdhcmRzLCoKCipNb2hhbiBQcmFzYXRoKgoKVlZE
TiBUZWNobm9sb2dpZXMgUHZ0IEx0ZAoKKkNlbGw6KiArOTEgOTYyOTc2ODkxOQoKV2ViOiB3d3cu
dnZkbnRlY2guY29tCgotLSAKCgoKX0Rpc2NsYWltZXI6wqBfwqkgMjAxOSBWVkROIFRlY2hub2xv
Z2llcyBQdnQuIEx0ZC4gVGhpcyBlLW1haWwgY29udGFpbnMgClBSSVZJTEVHRUQgQU5EIENPTkZJ
REVOVElBTCBJTkZPUk1BVElPTiBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIAph
ZGRyZXNzZWUocykuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFz
ZSBub3RpZnkgdGhlIApzZW5kZXIgYnkgZS1tYWlsIGFuZCBkZWxldGUgdGhlIG9yaWdpbmFsIG1l
c3NhZ2UuIEZ1cnRoZXIsIHlvdSBhcmUgbm90IHRvIApjb3B5LCBkaXNjbG9zZSwgb3IgZGlzdHJp
YnV0ZSB0aGlzIGUtbWFpbCBvciBpdHMgY29udGVudHMgdG8gYW55IG90aGVyIApwZXJzb24gYW5k
IGFueSBzdWNoIGFjdGlvbnMgYXJlIHVubGF3ZnVsLl8KXwpfCl8KX18KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
