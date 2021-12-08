Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E406471942
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 09:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3166E1AB0;
	Sun, 12 Dec 2021 09:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3166E1AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639297509;
	bh=id4G4/GQvMs6lFBqo9CcwOmvZFjcf8ibV6ZZSxGj7gc=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ff+qkWPlof6A6NZLHQkqlh3D9rg18VzKYBtstCEKfDI8U565uhTDsJqknLXXw89Ow
	 bbdWIjml8iewLfAgpXJrkc3AarXfagQ0br96e+5mglIzf0tcJMyQFiCoxHfWcr8y0x
	 KnKkligvOub/hgvES22aC5uyXy9SYBFvpjxyiztQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C07F8025A;
	Sun, 12 Dec 2021 09:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 476DAF804CC; Wed,  8 Dec 2021 13:04:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from vsmx002.mijndomein.xion.oxcs.net
 (vsmx002.mijndomein.xion.oxcs.net [157.97.79.37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A7F3F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7F3F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tarmack.eu header.i=@tarmack.eu
 header.b="IYieX0sX"
Received: from vsmx002.mijndomein.xion.oxcs.net (unknown [10.93.2.2])
 by mx-out.mijndomein.xion.oxcs.net (Postfix) with ESMTP id 75175159DA7D
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:04:28 +0000 (UTC)
Received: from proxy-1.proxy.shared.ns.xion.oxcs.net
 (proxy-1.proxy.shared.ns.xion.oxcs.net [77.167.248.94])
 by mx-out.mijndomein.xion.oxcs.net (Postfix) with ESMTPA id 19202A40367
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tarmack.eu; s=mail1;
 t=1638965068; bh=ORnkfT0x247iuZDsMdi2JVlP+buojhYJUu9pgB2+w9M=;
 h=Date:From:Subject:To:From;
 b=IYieX0sXN/jFl4yxZFm/D6vuzOf6RkALPUIYhPDjc6Me/uG/Ztj2GRRjBScZx/I/m
 hcq+2wsH4nnhSiEC/cPJbNsrd6E6GT0sf89kn56iUXvHgPi6jK40LJHJzkmabwx7z3
 mAXW9cR+pbfGHSYSF7L1POI+1/tHMMSTkL+/44/U=
Received: from [192.168.3.35] (unknown [192.168.3.35])
 by postoffice.localdomain (Postfix) with ESMTP id DA2DDC02EA
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:04:23 +0000 (UTC)
Date: Wed, 08 Dec 2021 13:04:20 +0100
From: Bart Kroon <bart@tarmack.eu>
Subject: Add ALC287 speaker fixup for Lenovo IdeaPad Slim 9i 14ITL5
To: alsa-devel@alsa-project.org
Message-Id: <8JPS3R.V4DH56Z9XIPS3@tarmack.eu>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-te4Mluf+jgQqDJhNxd1E"
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
X-Mailman-Approved-At: Sun, 12 Dec 2021 09:23:26 +0100
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

--=-te4Mluf+jgQqDJhNxd1E
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

The speaker fixup that is used for the Yoga 7 14ITL5 also applies to 
the IdeaPad Slim 9i 14ITL5. The attached patch applies the quirk.

The attached patch is validated on my laptop.

Regards,
Bart




--=-te4Mluf+jgQqDJhNxd1E
Content-Type: text/x-patch
Content-Disposition: attachment; filename=snd-ideapad-slim-9i.patch
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggOGEzZTJmZTQyMTA2Li5kZThmNGU5YzI4OWQgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC04ODUxLDYgKzg4NTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDM4MjcsICJJZGVhcGFkIFM3NDAiLCBBTEMyODVfRklYVVBfSURFQVBBRF9TNzQwX0NP
RUYpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4NDMsICJZb2dhIDlpIiwgQUxDMjg3X0ZJ
WFVQX0lERUFQQURfQkFTU19TUEtfQU1QKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzODEz
LCAiTGVnaW9uIDdpIDE1SU1IRzA1IiwgQUxDMjg3X0ZJWFVQX0xFR0lPTl8xNUlNSEcwNV9TUEVB
S0VSUyksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzgzNCwgIkxlbm92byBJZGVhUGFkIFNs
aW0gOWkgMTRJVEw1IiwgQUxDMjg3X0ZJWFVQX1lPR0E3XzE0SVRMX1NQRUFLRVJTKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTdhYSwgMHgzODUyLCAiTGVub3ZvIFlvZ2EgNyAxNElUTDUiLCBBTEMyODdf
RklYVVBfWU9HQTdfMTRJVExfU1BFQUtFUlMpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4
NTMsICJMZW5vdm8gWW9nYSA3IDE1SVRMNSIsIEFMQzI4N19GSVhVUF9ZT0dBN18xNElUTF9TUEVB
S0VSUyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzgxOSwgIkxlbm92byAxM3MgR2VuMiBJ
VEwiLCBBTEMyODdfRklYVVBfMTNTX0dFTjJfU1BFQUtFUlMpLAo=

--=-te4Mluf+jgQqDJhNxd1E--

