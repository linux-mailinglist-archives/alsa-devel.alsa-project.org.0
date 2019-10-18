Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFFDC339
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 12:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC529F6;
	Fri, 18 Oct 2019 12:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC529F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571396312;
	bh=sOleNM80ahT6pVw9jzeh1s5P2L26Fa9/gkhHG9k5EFk=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=AeeJZCr1KKXE9M6zY2TK2eDF4RMNQM5ixGEFOQT9FBNgxbAYo2+2iPEogLFrFyePg
	 il2W1M0H3LscGwldTmqy6Zk6U4HTvwHtOUDBPTyhb5i2h3HffjeMiOvDTsvXcI/IBI
	 crICLjBT84iMfPYoJrfZyYEEUTaR0tJHphmXYcXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179B9F80323;
	Fri, 18 Oct 2019 12:56:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B81DEF80362; Fri, 18 Oct 2019 12:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic305-19.consmr.mail.ir2.yahoo.com
 (sonic305-19.consmr.mail.ir2.yahoo.com [77.238.177.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC89F800F3
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 12:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC89F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="ZGsQRPg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571396202; bh=FXdqkrd9fYOqlccPw1897O8RypybK0YXJbflipfZ8MU=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=ZGsQRPg2hlUzf6USYDUwlWh64hPGJGPm4Vi5TBo8X0C7jADTFjzVyYUjVl+oZ3cZgfVi/jk+aJNAdZx5oon2gUOpoOkL3G0D+aftljVBNoi/93Wj71HcRoj+/KcHE9pymzZL4/nprFSoEHTnA9QRzAgUc1JEA65kD5oKvyERjfjfJDlvrJbhkNZ8Qz0qlRmq6FDCN3DfN4qBc5FCo6uWHFSgJzL242tSbxAF9DEt7SjNj+nycFMFxwaWrOAWM1AIkg0uNrPjDLvfH766OUyCNSQIJUtrJxlei8bzNV1KM5aqC5D40PJkj6JwFfwQV0wQIGUQSjY9S0osilYh8aItLQ==
X-YMail-OSG: CCTYwaMVM1m_40r85QSM3iNZqnT1YL7C_AG0LJIsQnMFhEGkX2AlQg_SLNmHr6n
 f0Vm4R1BX45lvlT8npm3BwTP516G0cBjAXKYxeUfJ6TIOvvmFVNM9bNzCLIPGARwyLHZQClTs7Wm
 jTPmRnGLdvFmFccELrTPz0crtcppELHIV9dQ9JaKonlaCZH52pBVLRJepjsjZb_AS6trpJo7419e
 SybjWJvywaGnHcoN0LNwm8hWEYcmpGvsogYZ0J2bOp3L173d8khWnTU9B.L9wCkrtrbCcFi4YOBD
 S2z5OajIOSZTuYuqd.msHqDN2QFk4CZknlYVXVccBdUleMJFp7MCbfUFJfXZUlTdS6RCAweZ4fHc
 TEo1AXOlYZH2TAK_3brVIg7JnEmqJL5ORUmXYZGt1yDET.RR0_iQKhV.kbnpsCRL7mHkf7RsFkKS
 v20YNTSE4JhoEkbpQ0j0aggCc3eFO1behp7HV4dGRUOG_U8F.qwUTXpoDm4y3g0iOQs.f4RB5mCe
 ddti9NLRDOiECbqQpIv9IHMDqQS6iTqgLAdCcnWHX8_KkOosdoiaQ.HvxoTySmUBW3r8iNeAYB_p
 L6TwNw0cA4tzizVNaNIG6tyUTP23HEuK5W7QFBc5VuuCt4xyuTflr0RQgqnmtztF6vEi3P6xNuOZ
 AkKQIyWJdJIksbzyDAxAdR2bXJJW9BIONSUjvb3AqZDu2_47OY75lBSFHt1E4VqMrRir3baRJMj3
 tMWQOBvqYWg.WQQ8GirInSOICcS0QWkgatJUbTCJuFP0AR1LTbE5iqPVHGEK_Qsp9ZFSCOUMrF7S
 RQW1lgL_Z6e2Z.iq9m6IE6wWowYQ2OvENiyLJsRbuqpm1t7QPtGvy5eTa.9c_nKEPUL5SDDBzEuH
 O8QG.l9IV88OCoID9n2SoDO6iHAox9irAgXoGABMRo_srJOtIqTzIp8tzgttlRv8CgsAtau77.BQ
 4MALra4s6usnHmm7r7aFSD08TZk5ay2riY6sNcStXlQgs2gwGmks88QFe9YVuNUjjd0zMSkUo4gT
 7o2_L_omG_ip8GDeBj2vIy1NSiSJnNoIHBgRVRI4SGJfNoQYuTnStSh2I7OtHUB8yRcl9D8pX7Fa
 8gh4wYNAGV8SbM.p5MzXpENZBQswa32xPJvqgu_2aPhF0SpaKRsC7qBOazvPhaWfsgMILw3AsIB5
 PbjTC0nUIbUEZ4d3o1Qz8kkDJmWT6WNtsDPEyTXKTBTFU8hDyJ24FObpS9o.uN5geT4JDlcj3mIA
 uLNWkKCI2.fwX1MQ5HVKEyJ0dSS3X.TO1laoP3ct_3vhYCh4e4mGBn5K9EUjq_gb3i.8WAJGWgfm
 9uelr2Hjz0rFzdS6usaFEnChFP_iZjjZZEIrTZMUQHV2.hs_EWwS0B.YEkxUBgfDbm.C44xOUzr0
 XjLYzArbWpPzmSFPq2Dml65aDIHZM0gOxs6MDew_4ZUWJuF.pYKooF7xI7crhbPyp66.VWRPDDg-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Fri, 18 Oct 2019 10:56:42 +0000
Date: Fri, 18 Oct 2019 10:56:37 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Yu-hsuan Hsu <yuhsuan@google.com>
Message-ID: <572375501.5493214.1571396197926@mail.yahoo.com>
In-Reply-To: <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
 (and works for capture)
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ID4gT24gRnJpZGF5LCAxOCBPY3RvYmVyIDIwMTksIDA0OjI3OjI5IEJTVCwgWXUtaHN1YW4gSHN1
IDx5dWhzdWFuQGdvb2dsZS5jb20+IHdyb3RlOgoKPiBIb3cgYWJvdXQgdXNpbmcgaW5kZXggaW5z
dGVhZD8gWW91IHNob3VsZCBmaW5kIHRoZSBjYXJkIGluZGV4IGFuZCBkZXZpY2UgaW5kZXggYnkg
cnVubmluZyAiYXBsYXkgLWwiIGNvbW1hbmQuIFRoZSBwY20gZm9ybWF0IGlzwqBodzp7Q0FSRF9J
TkRFWH0se0RFVklDRV9JTkRFWH0uCj4gU2VlIGV4YW1wbGUgcGFydCBpbsKgaHR0cHM6Ly9jaHJv
bWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvcGxhdGZvcm0vYXVkaW90ZXN0LysvcmVm
cy9oZWFkcy9tYXN0ZXIvYWxzYV9jb25mb3JtYW5jZV90ZXN0Lm1kwqBmb3IgbW9yZcKgaW5mb3Jt
YXRpb24uCgpEZWFyIFl1LUhzdWFuLAoKWWVzLCB1c2luZyBjYXJkIGluZGV4IGFuZCBkZXZpY2Ug
aW5kZXggd29ya3MuIEhlcmUgaXMgdGhlIG91dHB1dDoKCiQgYXBsYXkgLWwKKioqKiBMaXN0IG9m
IFBMQVlCQUNLIEhhcmR3YXJlIERldmljZXMgKioqKgpjYXJkIDA6IEFMU0EgW2JjbTI4MzUgQUxT
QV0sIGRldmljZSAwOiBiY20yODM1IEFMU0EgW2JjbTI4MzUgQUxTQV0KIFN1YmRldmljZXM6IDcv
NwogU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKIFN1YmRldmljZSAjMTogc3ViZGV2aWNlICMx
CiBTdWJkZXZpY2UgIzI6IHN1YmRldmljZSAjMgogU3ViZGV2aWNlICMzOiBzdWJkZXZpY2UgIzMK
IFN1YmRldmljZSAjNDogc3ViZGV2aWNlICM0CiBTdWJkZXZpY2UgIzU6IHN1YmRldmljZSAjNQog
U3ViZGV2aWNlICM2OiBzdWJkZXZpY2UgIzYKY2FyZCAwOiBBTFNBIFtiY20yODM1IEFMU0FdLCBk
ZXZpY2UgMTogYmNtMjgzNSBJRUM5NTgvSERNSSBbYmNtMjgzNSBJRUM5NTgvSERNSV0KIFN1YmRl
dmljZXM6IDEvMQogU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAwOiBBTFNBIFtiY20y
ODM1IEFMU0FdLCBkZXZpY2UgMjogYmNtMjgzNSBJRUM5NTgvSERNSTEgW2JjbTI4MzUgSUVDOTU4
L0hETUkxXQogU3ViZGV2aWNlczogMS8xCiBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJk
IDE6IHNlZWVkOG1pY3ZvaWNlYyBbc2VlZWQtOG1pYy12b2ljZWNhcmRdLCBkZXZpY2UgMDogYmNt
MjgzNS1pMnMtYWMxMHgtY29kZWMwIGFjMTB4LWNvZGVjLjEtMDAzNS0wIFtdCiBTdWJkZXZpY2Vz
OiAxLzEKIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCgpBcyBJIG1lbnRpb25lZCBlYXJsaWVy
IEkgYW0gaW50ZXJlc3RlZCBpbiBjYXJkIDEsIHRoZSBzZWVlZDhtaWN2b2ljZWMgZW50cnkuIEhl
cmUgaXQgaXMgdGhlIGNvbmZvcm1hbmNlIHRlc3Qgb3V0cHV0OiAKCgoyMCBwYXNzZWQsIDAgZmFp
bGVkCkRldmljZSBJbmZvcm1hdGlvbgogTmFtZTogaHc6Q0FSRD0xLDAKIFN0cmVhbTogUExBWUJB
Q0sKIEZvcm1hdDogWydTMzJfTEUnXQogQ2hhbm5lbHM6IFs4XQogUmF0ZTogWzgwMDAsIDExMDI1
LCAxNjAwMCwgMjIwNTAsIDQ0MTAwLCA0ODAwMF0KIFBlcmlvZF9zaXplIHJhbmdlOiBbOCwgODE5
Ml0KIEJ1ZmZlcl9zaXplIHJhbmdlOiBbMTYsIDE2Mzg0XQpUZXN0IFBhcmFtcwogU2V0IGNoYW5u
ZWxzIDg6IHBhc3MKIFNldCBmb3JtYXQgUzMyX0xFOiBwYXNzCiBTZXQgcmF0ZSA4MDAwOiBwYXNz
CiBTZXQgcmF0ZSAxMTAyNTogcGFzcwogU2V0IHJhdGUgMTYwMDA6IHBhc3MKIFNldCByYXRlIDIy
MDUwOiBwYXNzCiBTZXQgcmF0ZSA0NDEwMDogcGFzcwogU2V0IHJhdGUgNDgwMDA6IHBhc3MKVGVz
dCBSYXRlcwogU2V0IHJhdGUgODAwMDogcGFzcwogU2V0IHJhdGUgMTEwMjU6IHBhc3MKIFNldCBy
YXRlIDE2MDAwOiBwYXNzCiBTZXQgcmF0ZSAyMjA1MDogcGFzcwogU2V0IHJhdGUgNDQxMDA6IHBh
c3MKIFNldCByYXRlIDQ4MDAwOiBwYXNzClRlc3QgQWxsIFBhaXJzCiBTZXQgY2hhbm5lbHMgOCwg
Zm9ybWF0IFMzMl9MRSwgcmF0ZSA4MDAwOiBwYXNzCiBTZXQgY2hhbm5lbHMgOCwgZm9ybWF0IFMz
Ml9MRSwgcmF0ZSAxMTAyNTogcGFzcwogU2V0IGNoYW5uZWxzIDgsIGZvcm1hdCBTMzJfTEUsIHJh
dGUgMTYwMDA6IHBhc3MKIFNldCBjaGFubmVscyA4LCBmb3JtYXQgUzMyX0xFLCByYXRlIDIyMDUw
OiBwYXNzCiBTZXQgY2hhbm5lbHMgOCwgZm9ybWF0IFMzMl9MRSwgcmF0ZSA0NDEwMDogcGFzcwog
U2V0IGNoYW5uZWxzIDgsIGZvcm1hdCBTMzJfTEUsIHJhdGUgNDgwMDA6IHBhc3MKClRoZXJlIGlz
IHByb2JhYmx5IGEgYnVnIHNvbWV3aGVyZSBvbiBub3QgYmVpbmcgYWJsZSB0byB1c2UgdGhlIGNh
cmQgbmFtZT8KClJlZ2FyZHMsCkhpbi1UYWsKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
