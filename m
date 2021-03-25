Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5D3499FB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 20:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D6C1669;
	Thu, 25 Mar 2021 20:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D6C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616699459;
	bh=9teo4qQwNno98ieyMEx3NdugYeMgzlAO8KKf/HtAn9M=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NO9r3s4JvZH9hV8ykD8xxZY7CIBSofJx4DvknEzSYghqZDSJiLGJW3qSqL9MTR26+
	 7i8soYuToNYyz9RJDhZOlCLyD2jISP2XxTKPoM8T1D6GaqVtVi247px5JsxDIjCU/h
	 7hnVpvICPPXN+Ky7VMND3eyqGxkNgORD5YkL7wuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60162F80268;
	Thu, 25 Mar 2021 20:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AACA3F8025F; Thu, 25 Mar 2021 20:09:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36DECF800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 20:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DECF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hhFL+GKQ"
Received: by mail-ed1-x52c.google.com with SMTP id dm8so3678726edb.2
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5frNTrcV2pWMlzUjO6s28wDy4b8gnTeOinMGfC73Qtc=;
 b=hhFL+GKQbUsnf1Ya4LptU6qhq+iPjW/k9CWOxcqTggDHzIrWBn8z75faZ75X5x9Qie
 KgnQoAUA4N9/WNS2GOgi752hF4Ibpu+L2uqP2D6LoJ8T2oaH+qwaiwEX3szv+UWcYXMx
 fktPCTkhav9K6CDt7PrcQgJoAm78g1fSidK7nafRTyOP6GXWDryGjEp2QfXNXUUc92sG
 ZhpDoKoTIf01DRyeyWwIplkoLGe/3zNVpG+KLaahd7DRN6DRuD8L49NKqY7A/pXkqm0e
 j9ZGxekYBUFp/fJHgMHipSVhPTXTXqS+g+8CxbQSR4IoF0IjLpzvQSxWD2rNQ3grKMTd
 mipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5frNTrcV2pWMlzUjO6s28wDy4b8gnTeOinMGfC73Qtc=;
 b=dLjF1NUU1S2y/korV1xmiQfLEcnjKp+WlGyafj6KOz05/bzUwe3b6FXD/FXft9yAQ8
 M53wNQJhyjMk9Xip+bd4B/m2p8aZJcsVdc+ZlLCQcrUg/YhDcNEJLCMyle5FuVJvJc2r
 lUSE9ov/6MYe2IT3cXV5Mg2WhTZiQ44j/MUAFz4aCFEucr7EFVo4zBg18sV1j3ggqIFy
 nFg0N0yrkWngnq1S0Ey0sZLlyDQJ4iGWpZd+CVqDFaPdLIL6Ly9BnqcjH1vZEhhM91FD
 zUfUfWDyhcM6N9gXKpCRJQ7LEXM6tDyNxuXH3ZSh4ZM/KlvKbu+i/FTs3eNPc9x3CUIo
 EAUg==
X-Gm-Message-State: AOAM531YKP8g5+H8xyT+FeA8vT28kAf2f3E532ChNvHJkDrmI0wi13bt
 YY3MFADMR6d9wEfB04qcF29Xpn3Vg63SYQ2HayNT1rCqnxA=
X-Google-Smtp-Source: ABdhPJytRPO3OmRYpmNYdA4Tk2pUEBFcaUAYMooecu++hEMIE+pSfBJE6AGMGM2D3Qk9y22QGAOEl/FXmXsBjHwhiHA=
X-Received: by 2002:aa7:d416:: with SMTP id z22mr10634934edq.239.1616699361964; 
 Thu, 25 Mar 2021 12:09:21 -0700 (PDT)
MIME-Version: 1.0
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 25 Mar 2021 14:09:10 -0500
Message-ID: <CAOsVg8psuOkQRoccDs7AZzUO=4ffOm=XfXoY_G0iTqRXHtqu4A@mail.gmail.com>
Subject: Patch for some Roland devices' USB digital audio
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000002e248305be612778"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--0000000000002e248305be612778
Content-Type: text/plain; charset="UTF-8"

A couple days ago, I found this excellent informational post, and that Mike
Oliphant's patch is in mainline now:
http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html

Since I was fairly certain it applies to the Roland devices I own, I added
my USB IDs.  Wonderfully, now USB audio capture seems to be working
perfectly from the three devices I can test: the INTEGRA-7, Boutique D-05,
& VG-99!

I don't know if the D-05 and VG-99 have digital audio playback/output, as I
only tried it with the INTEGRA-7.  It does work, but only when the
INTEGRA-7's "Sampling Rate" is set to "44.1 kHz" and "Ext Part Source
Select" is set to "USB AUDIO".

I searched a bit for other Roland devices people have had USB digital audio
issues with over the years, and took the liberty of adding them to the
patch too.  Likely there are still many more, especially in the Boutique
line, but I couldn't find their USB IDs.

I hope this can be added to the mainline kernel too, as this support should
help many that have struggled.  I, certainly, have been hoping somebody
would figure this out for quite a while, and even bought a USB
through/monitoring device to try to develop it myself (sadly, the software
supporting that has its own bugs, so I probably should've just used
wireshark).  Suffice it to say, I'm quite happy to have this figured out,
and to not have to delve into stuff I know nothing about! :)

Thanks,

  Lucas

--0000000000002e248305be612778
Content-Type: text/x-patch; charset="US-ASCII"; name="linux-5.11.9-roland.patch"
Content-Disposition: attachment; filename="linux-5.11.9-roland.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kmp8sw4t0>
X-Attachment-Id: f_kmp8sw4t0

ZGlmZiAtTnVyIC4vbGludXgtNS4xMS45Lm9yaWcvc291bmQvdXNiL2ltcGxpY2l0LmMgLi9saW51
eC01LjExLjkucm9sYW5kL3NvdW5kL3VzYi9pbXBsaWNpdC5jCi0tLSAuL2xpbnV4LTUuMTEuOS5v
cmlnL3NvdW5kL3VzYi9pbXBsaWNpdC5jCTIwMjEtMDMtMjQgMDU6NTQ6MTkuMDAwMDAwMDAwIC0w
NTAwCisrKyAuL2xpbnV4LTUuMTEuOS5yb2xhbmQvc291bmQvdXNiL2ltcGxpY2l0LmMJMjAyMS0w
My0yNSAwMzowNTozMy40MTQ4NzA0MDQgLTA1MDAKQEAgLTcxLDEzICs3MSwyNyBAQAogCSAgLmVw
X251bSA9IDB4ODQsIC5pZmFjZSA9IDAgfSwJCS8qIE1PVFUgTWljcm9Cb29rIElJICovCiAKIAkv
KiBObyBxdWlyayBmb3IgcGxheWJhY2sgYnV0IHdpdGggY2FwdHVyZSBxdWlyayAoc2VlIGJlbG93
KSAqLworCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMGE2KSwJLyogUm9sYW5kIEpV
Tk8tRyAqLworCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMGFkKSwJLyogUm9sYW5k
IFNILTIwMSAqLworCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMGIyKSwJLyogUm9s
YW5kIFZHLTk5ICovCisJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAwYzcpLAkvKiBS
b2xhbmQgVi1TeW50aCBHVCAqLworCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMTEx
KSwJLyogUm9sYW5kIEdBSUEgU0gtMDEgKi8KKwlJTVBMSUNJVF9GQl9TS0lQX0RFVigweDA1ODIs
IDB4MDEyMCksCS8qIFJvbGFuZCBPQ1RBLUNBUFRVUkUgKi8KKwlJTVBMSUNJVF9GQl9TS0lQX0RF
VigweDA1ODIsIDB4MDEyYiksCS8qIFJvbGFuZCBEVU8tQ0FQVFVSRSAqLworCUlNUExJQ0lUX0ZC
X1NLSVBfREVWKDB4MDU4MiwgMHgwMTJmKSwJLyogUm9sYW5kIFFVQUQtQ0FQVFVSRSAqLwogCUlN
UExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMTMwKSwJLyogQk9TUyBCUi04MCAqLworCUlN
UExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMTM4KSwJLyogQk9TUyBSQy0zMDAgKi8KKwlJ
TVBMSUNJVF9GQl9TS0lQX0RFVigweDA1ODIsIDB4MDEzZSksCS8qIFJvbGFuZCBSLTI2ICovCisJ
SU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxNWIpLAkvKiBSb2xhbmQgSU5URUdSQS03
ICovCiAJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxNzEpLCAgIC8qIEJPU1MgUkMt
NTA1ICovCisJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxN2MpLCAgIC8qIFJvbGFu
ZCBUUi04ICovCiAJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxODUpLAkvKiBCT1NT
IEdQLTEwICovCiAJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxODkpLAkvKiBCT1NT
IEdULTEwMHYyICovCisJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxYjUpLAkvKiBS
b2xhbmQgSlAtMDggKi8KIAlJTVBMSUNJVF9GQl9TS0lQX0RFVigweDA1ODIsIDB4MDFkNiksCS8q
IEJPU1MgR1QtMSAqLwogCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMWQ4KSwJLyog
Qk9TUyBLYXRhbmEgKi8KIAlJTVBMSUNJVF9GQl9TS0lQX0RFVigweDA1ODIsIDB4MDFlNSksCS8q
IEJPU1MgR1QtMDAxICovCisJSU1QTElDSVRfRkJfU0tJUF9ERVYoMHgwNTgyLCAweDAxZmYpLAkv
KiBSb2xhbmQgRC0wNSAqLwogCUlNUExJQ0lUX0ZCX1NLSVBfREVWKDB4MDU4MiwgMHgwMjAzKSwg
ICAvKiBCT1NTIEFELTEwICovCiAKIAl7fSAvKiB0ZXJtaW5hdG9yICovCkBAIC04NSwxMyArOTks
MjcgQEAKIAogLyogSW1wbGljaXQgZmVlZGJhY2sgcXVpcmsgdGFibGUgZm9yIGNhcHR1cmU6IG9u
bHkgRklYRUQgdHlwZSAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfdXNiX2ltcGxpY2l0X2Zi
X21hdGNoIGNhcHR1cmVfaW1wbGljaXRfZmJfcXVpcmtzW10gPSB7CisJSU1QTElDSVRfRkJfRklY
RURfREVWKDB4MDU4MiwgMHgwMGE2LCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEpVTk8tRyAqLwor
CUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDBhZCwgMHgwZCwgMHgwMSksIC8qIFJv
bGFuZCBTSC0yMDEgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAwYjIsIDB4
MGQsIDB4MDEpLCAvKiBSb2xhbmQgVkctOTkgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgw
NTgyLCAweDAwYzcsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgVi1TeW50aCBHVCAqLworCUlNUExJ
Q0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDExMSwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBH
QUlBIFNILTAxICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTIwLCAweDBk
LCAweDAxKSwgLyogUm9sYW5kIE9DVEEtQ0FQVFVSRSAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RF
VigweDA1ODIsIDB4MDEyYiwgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBEVU8tQ0FQVFVSRSAqLwor
CUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDEyZiwgMHgwZCwgMHgwMSksIC8qIFJv
bGFuZCBRVUFELUNBUFRVUkUgKi8KIAlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAx
MzAsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEJSLTgwICovCisJSU1QTElDSVRfRkJfRklYRURfREVW
KDB4MDU4MiwgMHgwMTM4LCAweDBkLCAweDAxKSwgLyogQk9TUyBSQy0zMDAgKi8KKwlJTVBMSUNJ
VF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAxM2UsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgUi0y
NiAqLworCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDE1YiwgMHgwZCwgMHgwMSks
IC8qIFJvbGFuZCBJTlRFR1JBLTcgKi8KIAlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAw
eDAxNzEsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIFJDLTUwNSAqLworCUlNUExJQ0lUX0ZCX0ZJWEVE
X0RFVigweDA1ODIsIDB4MDE3YywgMHgwZCwgMHgwMSksIC8qIFJvbGFuZCBUUi04ICovCiAJSU1Q
TElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgwMTg1LCAweDBkLCAweDAxKSwgLyogQk9TUyBH
UC0xMCAqLwogCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDE4OSwgMHgwZCwgMHgw
MSksIC8qIEJPU1MgR1QtMTAwdjIgKi8KKwlJTVBMSUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAw
eDAxYjUsIDB4MGQsIDB4MDEpLCAvKiBSb2xhbmQgSlAtMDggKi8KIAlJTVBMSUNJVF9GQl9GSVhF
RF9ERVYoMHgwNTgyLCAweDAxZDYsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEdULTEgKi8KIAlJTVBM
SUNJVF9GQl9GSVhFRF9ERVYoMHgwNTgyLCAweDAxZDgsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEth
dGFuYSAqLwogCUlNUExJQ0lUX0ZCX0ZJWEVEX0RFVigweDA1ODIsIDB4MDFlNSwgMHgwZCwgMHgw
MSksIC8qIEJPU1MgR1QtMDAxICovCisJSU1QTElDSVRfRkJfRklYRURfREVWKDB4MDU4MiwgMHgw
MWZmLCAweDBkLCAweDAxKSwgLyogUm9sYW5kIEQtMDUgKi8KIAlJTVBMSUNJVF9GQl9GSVhFRF9E
RVYoMHgwNTgyLCAweDAyMDMsIDB4MGQsIDB4MDEpLCAvKiBCT1NTIEFELTEwICovCiAKIAl7fSAv
KiB0ZXJtaW5hdG9yICovCg==
--0000000000002e248305be612778--
