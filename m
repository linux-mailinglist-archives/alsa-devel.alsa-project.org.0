Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204261CB40
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 16:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3C4B1686;
	Tue, 14 May 2019 16:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3C4B1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557845993;
	bh=Op2XOcv4d3bmph5Y6mE11XusuhNI1Dp+vLxHXKOGVqI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWPN8nfqaezkxOioXcVvyGQXzfM/0S32WS1svj1SkJbu4CJmk2jJUWxf//x6pQJH4
	 3ssmGoJwIvZa+aJe8Y5i25xYKrx4LbbIbiBULp6O5xQaj/LgNzwF/AA41+6UU9Vmlk
	 a7Tv/Un/UDyeyI4Tm9FTg6qnuu5JlZNLrI/U50L8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D1C2F896B6;
	Tue, 14 May 2019 16:58:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0085EF896B6; Tue, 14 May 2019 16:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55479F806E5
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 16:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55479F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cxi7JwCo"
Received: by mail-lf1-x142.google.com with SMTP id y10so12153989lfl.3
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qypIUwWMaKu/iWmsY+zdEy1tKkaYPm+YhlABaBGIqok=;
 b=cxi7JwCo6bUR5+x/GSQwMTmrZfxtUpQBge3KwcfdpHb/oUet6N6BHkCpHGf8JZwCi2
 EJEobF/eijlDjh4VzlEqhmkdwVCL3jL02k9GWlOZmFnRg6Va/CQYk8DTSCGnWX57UAKa
 d4gZAqDx6oCdWtZG571kpcGGIijD2+d7wtI1QIViKWYbqeNLkE5i0bEyl5YzwVhP9+5p
 77uCPPgGCV6CdSsibaLwmXUoq4WfJOryeFd8kK8JL7zNXqmlsaeFz+nPNtAPHglADztb
 pUvUPl0WgvioC+lykT/oxkxy9+2staIBgvHvAQXvqa6kc+a/RK5kEjO5AH0MEi0QCFla
 H2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qypIUwWMaKu/iWmsY+zdEy1tKkaYPm+YhlABaBGIqok=;
 b=H+Qu4DOwAr0tSy5ODQH4j+LXWwsM6jQGbmrGpmNV6QZIZl9O1AP3NxwY7Jq5BKiibn
 aGsANL+wCLUAQUDW9ueMUrejPYyMLjh0ENwbET7Z6SX43EWr0wuff6IlPPIiKIHLMI33
 NCxjryozKX1s7M+VOym9R/WgpXOU0Wd+NHHL3r+OJj6Mgdg6Qpgpzb8rOZj7TUShXig6
 YtqyXxfAgkkp0LAVaOSP6q1QOq9zWsiR8jpkUL654LYiGdVq0bewNafBV0Iz4TBtQ7cv
 MJ0aKrJanO8aNL8eDSI1rlyPD2qL8owQZlzXB1K2+VevzymK/QMmMlzoL7FvtH/58xh5
 dn0Q==
X-Gm-Message-State: APjAAAVCQ57hgn9c2+qHc5X8Ah2Mwoz3CuoPtamY4iNjPRHRTUXHu3RZ
 fn2gktNotcAJQXoxba/StB5aYu4bYIU=
X-Google-Smtp-Source: APXvYqwd9Pp4yPJ3CbT8o805tPS4Qnhi3T1xG8K7KHFCjFehZxOPjZweZ06kGEUENKLgFwCw2bskPA==
X-Received: by 2002:a19:ee11:: with SMTP id g17mr16501981lfb.5.1557845882732; 
 Tue, 14 May 2019 07:58:02 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id s6sm2139342lje.89.2019.05.14.07.58.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 07:58:01 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <158b63b9-ff73-7f53-de83-5a7b8a21b250@gmail.com>
 <s5h4l5xrxxm.wl-tiwai@suse.de>
 <de267744-b620-ff52-4bbc-696bc74aa789@gmail.com>
 <s5hlfz9qf9u.wl-tiwai@suse.de>
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <50fba461-b791-bfa4-34f9-52cb3d839c71@gmail.com>
Date: Tue, 14 May 2019 16:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hlfz9qf9u.wl-tiwai@suse.de>
Content-Language: pl-PL
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] Fix for Lenovo B50-70 inverted internal
 microphone bug.
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

QWRkIHBhdGNoIGZvciByZWFsdGVrIGNvZGVjIGluIExlbm92byBCNTAtNzAgdGhhdCBmaXhlcyBp
bnZlcnRlZCBpbnRlcm5hbCBtaWNyb3Bob25lIGNoYW5uZWwuCkRldmljZSBJZGVhUGFkIFk0MTBQ
IGhhcyB0aGUgc2FtZSBQQ0kgU1NJRCBhcyBMZW5vdm8gQjUwLTcwLApidXQgZmlyc3Qgb25lIGlz
IGFib3V0IGZpeCB0aGUgbm9pc2UgYW5kIGl0IGRpZG4ndCBzZWVtIGhlbHAgaW4gYSBsYXRlciBr
ZXJuZWwgdmVyc2lvbi4KU28gSSByZXBsYWNlZCBJZGVhUGFkIFk0MTBQIGRldmljZSBkZXNjcmlw
dGlvbiB3aXRoIEI1MC03MCBhbmQgYXBwbHkgaW52ZXJ0ZWQgbWljcm9waG9uZSBmaXguCgpCdWd6
aWxsYTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvYWxzYS1kcml2
ZXIvK2J1Zy8xNTI0MjE1CgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIFdhZG93c2tpIDx3YWRvc21A
Z21haWwuY29tPgotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKaW5kZXggNDJjZDM5NDVlMGRlLi4zNGJjZDcxMWJiNTUgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCkBAIC00OTg3LDcgKzQ5ODcsNyBAQCBzdGF0aWMgdm9pZCBhbGNfZml4dXBfaGVhZHNl
dF9tb2RlX2FsYzI1NV9ub19ocF9taWMoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJCXN0cnVj
dCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOwogCQlzcGVjLT5wYXJzZV9mbGFncyB8PSBI
REFfUElOQ0ZHX0hFQURTRVRfTUlDOwogCQlhbGMyNTVfc2V0X2RlZmF1bHRfamFja190eXBlKGNv
ZGVjKTsKLQl9IAorCX0KIAllbHNlCiAJCWFsY19maXh1cF9oZWFkc2V0X21vZGUoY29kZWMsIGZp
eCwgYWN0aW9uKTsKIH0KQEAgLTY5NzUsNyArNjk3NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDE3
YWEsIDB4MzEzYywgIlRoaW5rQ2VudHJlIFN0YXRpb24iLCBBTEMyOTRfRklYVVBfTEVOT1ZPX01J
Q19MT0NBVElPTiksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzkwMiwgIkxlbm92byBFNTAt
ODAiLCBBTEMyNjlfRklYVVBfRE1JQ19USElOS1BBRF9BQ1BJKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTdhYSwgMHgzOTc3LCAiSWRlYVBhZCBTMjEwIiwgQUxDMjgzX0ZJWFVQX0lOVF9NSUMpLAotCVNO
RF9QQ0lfUVVJUksoMHgxN2FhLCAweDM5NzgsICJJZGVhUGFkIFk0MTBQIiwgQUxDMjY5X0ZJWFVQ
X05PX1NIVVRVUCksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4Mzk3OCwgIkxlbm92byBCNTAt
NzAiLCBBTEMyNjlfRklYVVBfRE1JQ19USElOS1BBRF9BQ1BJKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTdhYSwgMHg1MDEzLCAiVGhpbmtwYWQiLCBBTEMyNjlfRklYVVBfTElNSVRfSU5UX01JQ19CT09T
VCksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4NTAxYSwgIlRoaW5rcGFkIiwgQUxDMjgzX0ZJ
WFVQX0lOVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDUwMWUsICJUaGlua3BhZCBM
NDQwIiwgQUxDMjkyX0ZJWFVQX1RQVDQ0MF9ET0NLKSwKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
