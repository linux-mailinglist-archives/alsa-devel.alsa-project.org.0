Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1AC11F0E6
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 09:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651101662;
	Sat, 14 Dec 2019 09:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651101662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576311967;
	bh=V38nJUeBv7gt4zsSUEDK8A95+Fj5WT7Af4bv3A4onUQ=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nXg2WyUUb7CiKyZ4HnUmmcwhBsBYkcbqfY2P+nxjlL+C4mvunTwlc9D9b3+4HhOb/
	 MW5nw6rkRrCLCh/AllDuYgd3HXm9SIvBVWs9mo2JpbD3H1xkrYR/bQSVKrNntmVV8x
	 4zslpZFAhOBDuhApsno+D4sAruvtf5NcnhJYPzSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC0DF8020C;
	Sat, 14 Dec 2019 09:24:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D31F8020C; Sat, 14 Dec 2019 09:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic314-21.consmr.mail.ir2.yahoo.com
 (sonic314-21.consmr.mail.ir2.yahoo.com [77.238.177.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 288C1F8014F
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 09:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288C1F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="jR9O8YIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1576311856; bh=7dgvX+x1Ob96W5M9WpgJO7KIJ2+TrBWA/0w/NVpocaw=;
 h=To:From:Subject:Date:References:From:Subject;
 b=jR9O8YIzaSaTOZfUDiP+wFdG057Hd0e5OWSGpdlquDp7a4l6H31vQu5UU3VPa0oqmG5Y0r19mmj+4vesLnWrOA/wF+Sa1XSOlqvWDxgd6DABDN89urVXRxJftSvSlDZ6vqrq4M4/LvpUsLyleT6ebs1nrRmvm2Hc2HznCmEldbJT3KgFks97Wqp9rZep43VJEX4YC1hXUYjCZJzEdL/rWmKuiskG0fN+Dq/9K+J7J2mcZEhI2C+649CHMO/heC+bulFJjWGWNgHtxV/JhL7NcFCxoiRL7ImaU+JDUFexpqeiq+ZsFWF2nFCJlNL98GMS/iclAxX/NL1+RwxiX0yMHQ==
X-YMail-OSG: WTiYRdgVM1nwHDzKuIJ6qqMwqFWT1ni.qqlzxYtD8n5muheSm9sPlZdFw2_qEKs
 tq.QQUdNPkS2ZUahC388tewYuMM0dOYNevGzAaZfy0uXC85_ccTU9zOSjhFaO3rfx_PFP0sZG9OD
 fS7oe.zfF5Ojug8LKtefvHeSD7M374vMTvVBB9IxfohS_dKFZJbJOu5lcHhkzAg1bnLCMVHY9ymx
 eEIMNy19mK5gIiom_VDrwhttRJa7VEK9Ajcjta9f..g1LJIPb6iCCpw3frjsBjRQbsCu5DUeNMtU
 9oYYkS2TxedD3V3NtNsOOtA0Z_asSLPghNOMQANbsMA.OQjsacWRIL.cxxZ5FFSTKWwhQYqEC.rj
 1kuSHsPMdtiHeWiLLz.MJN3PLs9lzFIgKNfiDmiIQVAiE1mkbq9CsvjKMHSKOCS20NkFmy4y9T9y
 br0e5_tDgHbrVITHu0oxavSf_IYgkV95yAzHIVgqcVaax9OMTqVrVi2s_k48h3BnyC_wBnJtacoI
 Sw0FHt1yFQ1du9cppErD28blxdUvO.psmzmQju65LrdYCvx45udmyz1pcsUDNxSm9wx0aTv1ig12
 t8Ul44umqUDa1FZpinFGx_s2WrPiwMs1yOfDiJ9iZ3KPL95cpS16d8BlSmu77V0aP.zPL4nLxMTW
 k76Oqo5Kh5HHKCbGNUOD2aqfxsVAYGBoNdk063igCSqNQe1LSe8EIhTzZh1KsbeHDpSae7dX0dDn
 BbuDCB0OqVKLF_xMVBVhtnv8co3yhNejJeEWudH_kyarid4n_FdNd42kJkeZJNtQflkY.hYwCBB4
 FIs.cQ85M7MIyX2BB4pTqJCeiCxhqDNitCagW28wV21j94lptfckjYTjjVoUQgAwVaAeeBd.9NVB
 SBXHisqnPvMk10ZmHtA13LGr4lzqBPRp04SkfRxX93_tKUpLCLw5vIug9xzPhnjdy0_SRetbaRcZ
 2qfSC8Kx08v9EY_luqdoFMtkGAsgp0UuZC.tzzR4j0QNSbRPmgqmD7LGKC7C8NzNBXI09MwPM4__
 ScBy_YpA1rnGaTvjfjPaCLNm_WNkiRJdmPR_giwC_MU0TX.ZQ.6kbUWKFszzkYCKoUZ_VuyIft6u
 GjBtAD_akYjqBA8nAkcX17UaKt1p3jR_vlCfNiPRANRHqMIVQNoMABMCIc1TziHpXQrXjbTsmcIe
 CtxMTt.hWdGS0Z0RlTlnnrYw4_IUSUzNAg_XxTv92H0Fu5DO_GUor0ym2fe5gMHFobLzhV_ZcIbS
 ILFhdUIxFYGIRfFoO7SoWcI4wrdGGVuXlNJVv2uSi1zVERgaMuRXjec1XTv33c.YhJtzaityUM7Z
 skDGpyHg7GT2sJPSm5YlXPpfhovsMdi2TsaVhfBfKmTOoPDK66CE4IMg56AfzvJQDXK6v_HYmBGr
 TybY-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Sat, 14 Dec 2019 08:24:16 +0000
Received: by smtp406.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 09e66b0b49fcac7b395286b68a0496ed; 
 Sat, 14 Dec 2019 08:24:15 +0000 (UTC)
To: alsa-devel@alsa-project.org
From: Tobias <toszlanyi@yahoo.de>
Message-ID: <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
Date: Sat, 14 Dec 2019 09:24:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Subject: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
	controller
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

SGVsbG8gZGVhciBBTFNBIGRldmVsb3BlcnMuCgpJIGhhdmUgcHVyY2hhc2VkIGEgTUM3MDAwIGNv
bnRyb2xsZXIgaW4gb3JkZXIgdG8gY29udHJvbCBNSVhYWCBvbiBVYnVudHUgCjE2LjA0LiBBY2Nv
cmRpbmcgdG8gdGhlIERlbm9uIHNwZWNpZmljYXRpb24gdGhlIGNvbnRyb2xsZXIgc2hvdWxkIGhh
dmUgCmJlZW4gY2xhc3MgY29tcGxpYW50IGJ1dCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHRoZSBB
dWRpbyBpbnRlcmZhY2UgdG8gCndvcmsgcHJvcGVybHkgZ2l2aW5nIGZvbGxvd2luZyBtZXNzYWdl
IC4uLgoKJCBkbWVzZwouLi4KfFvCoCDCoDc0LjUyMjgzMV0gdXNiIDEtMS4zOiBuZXcgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2lfaGNkClvCoCDCoDc0LjYyMzc4NF0g
dXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MTVlNCwgCmlkUHJvZHVj
dD04MDA0ClvCoCDCoDc0LjYyMzc4OV0gdXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdz
OiBNZnI9MSwgUHJvZHVjdD0yLCAKU2VyaWFsTnVtYmVyPTMKW8KgIMKgNzQuNjIzNzkzXSB1c2Ig
MS0xLjM6IFByb2R1Y3Q6IERFTk9OIERKIE1DNzAwMApbwqAgwqA3NC42MjM3OTZdIHVzYiAxLTEu
MzogTWFudWZhY3R1cmVyOiBERU5PTiBESgpbwqAgwqA3NC42MjM3OThdIHVzYiAxLTEuMzogU2Vy
aWFsTnVtYmVyOiAyMDE2MDMKW8KgIMKgNzQuNjI1MTM0XSB1c2IgMS0xLjM6IGNsb2NrIHNvdXJj
ZSA2NSBpcyBub3QgdmFsaWQsIGNhbm5vdCB1c2UKCiJ8fHxjbG9jayBzb3VyY2UgNjUgaXMgbm90
IHZhbGlkLCBjYW5ub3QgdXNlIiBpcyByZXBlYXRlZCB1bmNvdW50YWJsZSAKdGltZXMgdGhlbgoK
CnxJIGZvdW5kIGEgZGlzY3Vzc2lvbiBoZXJlIGZvciB0aGUgTUM4MDAwIEF1ZGlvIGludGVyZmFj
ZSB3aGljaCB3YXMgbm90IAp3b3JraW5nIGFuZCBzaG93aW5nIHRoZSBzYW1lIGVycm9yIG1lc3Nh
Z2U6CgpodHRwczovL2Fsc2EtdXNlci5uYXJraXZlLmNvbS8ydERBTzg3Zi90cm91Ymxlc2hvb3Rp
bmctbmV3LXVzYi1hdWRpby1kZXZpY2UjcG9zdDgKClRoZSBzb2x1dGlvbiB3YXMgdG8gY2hhbmdl
IHNvdW5kL3VzYi9jbG9jay5jIGFuZCByZWNvbXBpbGUgdGhlIGtlcm5lbC4KVGhpcyBpcyBub3Qg
cHJhY3RpY2FsIGZvciBkYWlseSB1c2UgY2FzZSBzbyBJIHdvdWxkIGxpa2UgdG8gYXNrIGlmIHRo
ZSAKQUxTQSB0ZWFtIGNvdWxkIHBvc3NpYmx5IGZpbmQgYSBwZXJtYW5lbnQgZml4IGZvciBvcmRp
bmFyeSB1c2Vycy4KClRvIGdldCBteSBvdXRwdXRzIGZvcgoKYXBsYXkgLWwKYXBsYXkgLUwKfHx8
YXBsYXkgLUQgcGx1Z2h3OkNBUkQ9TUM3MDAwLERFVj0wIEdyaW1tYWxkaWthLU1ha2VCZWxpZXZl
Lndhdgp8bHN1c2IgLXYKbWl4eHggLS1jb250cm9sbGVyRGVidWd8fApKYWNrU2VydmVyIGVycm9y
IG1lc3NhZ2V8Cgp5b3UgbWF5IGhhdmUgYSBsb29rIGF0IHRoZSBNaXh4eCBDb21tdW5pdHkgRm9y
dW1zIGhlcmUoanVzdCBvbiBwYWdlLCB5b3UgCmRvbid0IG5lZWQgdG8gZmluZCBhbmQgcmVhZCBv
biBtdWx0aXBsZSBwYWdlcykKCmh0dHBzOi8vd3d3Lm1peHh4Lm9yZy9mb3J1bXMvdmlld3RvcGlj
LnBocD9mPTcmdD0xMjk2MiZzdGFydD0xMAoKSWYgeW91IG5lZWQgYW55IG1vcmUgaW5mb3JtYXRp
b24gdGhlbiBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgc3VwcG9y
dCBvbiB0aGlzIG1hdHRlci4KCkNoZWVycyEKT3NaCnx8Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
